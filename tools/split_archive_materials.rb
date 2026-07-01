# frozen_string_literal: true

require "fileutils"

ROOT = File.expand_path("..", __dir__)
SOURCE = File.join(ROOT, "archive", "农业AI技术咨询_资料库与报告底稿.md")
MATERIALS = File.join(ROOT, "materials")

CATEGORY_BY_PREFIX = {
  "POL" => ["policy", "政策与监管"],
  "MKT" => ["market", "市场与宏观"],
  "DATA" => ["data", "数据源与数据治理"],
  "STD" => ["standards", "标准与互操作"],
  "TECH" => ["technology", "技术路线"],
  "CASE" => ["cases", "标杆案例"],
  "SCN" => ["scenarios", "应用场景"],
  "ROI" => ["roi", "ROI 与价值测算"],
  "RISK" => ["risks", "风险与反方观点"],
  "COPY" => ["copywriting", "可改写话术"],
  "VIS" => ["visuals", "图表与 PPT 页面素材"],
  "OPS" => ["operations", "落地运营"],
  "SRC" => ["sources", "来源索引"]
}.freeze

def normalize_body(body)
  body.join.rstrip + "\n"
end

def parse_entries(lines)
  entries = []
  current = nil

  lines.each_with_index do |line, index|
    if (match = line.match(/^#### ([A-Z]+-\d+)：(.+?)\s*$/))
      entries << current if current
      id = match[1]
      prefix = id.split("-").first
      current = {
        id: id,
        prefix: prefix,
        title: match[2],
        start_line: index + 1,
        body: []
      }
    elsif line.start_with?("### ") && current
      entries << current
      current = nil
    elsif current
      current[:body] << line
    end
  end

  entries << current if current
  entries
end

def write_material(entry)
  dir_name, category_name = CATEGORY_BY_PREFIX.fetch(entry[:prefix])
  dir = File.join(MATERIALS, dir_name)
  FileUtils.mkdir_p(dir)

  file_name = "#{entry[:id].downcase}.md"
  path = File.join(dir, file_name)
  body = normalize_body(entry[:body])

  content = <<~MARKDOWN
    ---
    id: "#{entry[:id]}"
    title: "#{entry[:title]}"
    category: "#{category_name}"
    source_document: "archive/农业AI技术咨询_资料库与报告底稿.md"
    source_line: #{entry[:start_line]}
    migrated_at: "2026-07-01"
    ---

    # #{entry[:id]}：#{entry[:title]}

    #{body}
  MARKDOWN

  File.write(path, content)
  [path, category_name]
end

def write_category_readmes(grouped)
  grouped.each do |dir_name, entries|
    readme_path = File.join(MATERIALS, dir_name, "README.md")
    title = CATEGORY_BY_PREFIX.values.find { |dir, _| dir == dir_name }
    category_name = title ? title[1] : dir_name
    rows = entries.map do |entry|
      "- [#{entry[:id]}：#{entry[:title]}](./#{entry[:id].downcase}.md)"
    end.join("\n")

    File.write(readme_path, <<~MARKDOWN)
      # #{category_name}

      本目录由 `archive/农业AI技术咨询_资料库与报告底稿.md` 的旧素材拆分生成。每个文件是一条可独立维护、可检索、可改写的素材卡片。

      ## 素材列表

      #{rows}
    MARKDOWN
  end
end

def write_index(written_entries)
  rows = written_entries.map do |entry|
    relative = entry[:path].sub("#{ROOT}/", "")
    "| #{entry[:id]} | #{entry[:category]} | [#{entry[:title]}](../#{relative}) |"
  end

  File.write(File.join(MATERIALS, "index.md"), <<~MARKDOWN)
    # Materials Index

    本索引列出从旧长文档拆分出来的素材卡片。旧文档仍保留在 `archive/`，但后续维护应优先编辑 `materials/` 下的独立卡片。

    ## 素材总表

    | 编号 | 分类 | 文件 |
    |---|---|---|
    #{rows.join("\n")}
  MARKDOWN
end

unless File.exist?(SOURCE)
  warn "Source file not found: #{SOURCE}"
  exit 1
end

lines = File.readlines(SOURCE)
entries = parse_entries(lines).select { |entry| CATEGORY_BY_PREFIX.key?(entry[:prefix]) }

written = []
grouped = Hash.new { |hash, key| hash[key] = [] }

entries.each do |entry|
  path, category = write_material(entry)
  dir_name = File.basename(File.dirname(path))
  grouped[dir_name] << entry
  written << entry.merge(path: path, category: category)
end

write_category_readmes(grouped)
write_index(written)

puts "Migrated material cards: #{written.length}"
puts grouped.sort.map { |dir, rows| "#{dir}: #{rows.length}" }.join("\n")
