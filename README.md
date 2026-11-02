# Beepgrid Homebrew tap

Install the Beepgrid engine, community workspace, CLI and MCP server on macOS or Linux:

```sh
brew install beepgrid/tap/beepgrid
beepgrid version
```

[Website](https://beepgrid.com) · [Setup guide](https://github.com/beepgrid/beepgrid/blob/main/docs/PACKAGING.md) · [Documentation](https://beepgrid.com/docs/) · [Source](https://github.com/beepgrid/beepgrid) · [Releases](https://github.com/beepgrid/beepgrid/releases)

The formula uses versioned prebuilt binaries with SHA256 verification. It does not install a database or start background services. PostgreSQL is required when hosting the engine. CLI and MCP clients can connect to an existing server.

For manual installation, Windows or the asset-free headless binary, use the release archives.

## Maintainers

After publishing a new immutable engine release, update the version, archive URLs and four matching SHA256 hashes in `Formula/beepgrid.rb`. Run `brew audit --strict --online beepgrid/tap/beepgrid` and `brew test beepgrid/tap/beepgrid`, then commit. Never replace files behind an existing version URL.
