# Detecting changed files
has_source_changes = !git.added_files.grep(/Source/).empty?
has_test_changes = !git.modified_files.grep(/Tests/).empty?

warn("This is a large pull request! Can you break it up into multiple smaller ones instead?") if git.lines_of_code > 500

# Changelog entries are required for changes to library files
no_changelog_entry = !git.modified_files.include?("CHANGELOG.md")

if has_source_changes && no_changelog_entry
    warn("There's no changelog entry. Do you need to add one?.")
end

if has_source_changes && !has_test_changes
    warn("Library files were updated without test coverage. Please update or add tests, if needed.")
end

# Milestones are required for all PRs to track what's included in each release
has_milestone = !github.pr_json['milestone'].nil?
warn('All pull requests should have a milestone attached.', sticky: false) unless has_milestone

# Docs are regenerated when releasing
has_doc_changes = !git.modified_files.grep(/docs\//).empty?
has_doc_gen_title = github.pr_title.include? "#docgen"
if has_doc_changes && !has_doc_gen_title
    fail("Docs are regenerated when creating new releases.")
    message("Docs are generated by using [Jazzy](https://github.com/realm/jazzy). If you want to contribute, please update the markdown files or doc comments directly.")
end

# Look through all changed Markdown files
markdown_files = (git.added_files.grep(%r{.*\.md/}) + git.modified_files.grep(%r{.*\.md/}))

unless markdown_files.empty?
    # Run proselint to lint and check spelling
    prose.language = "en-us"
    prose.ignored_words = ["JSQDataSourcesKit", "jessesquires", "enum", "enums", "CocoaPods"]
    prose.ignore_acronyms = true
    prose.ignore_numbers = true
    prose.lint_files markdown_files
    prose.check_spelling markdown_files
end

# Run SwiftLint
swiftlint.verbose = true
swiftlint.config_file = './.swiftlint.yml'
swiftlint.lint_files(inline_mode: true, fail_on_error: true)