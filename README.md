# Homebrew Installation Guide

## Quick Install

```bash
brew tap noetl/tap
brew trust noetl/tap
brew install noetl
```

`brew trust noetl/tap` is required on current Homebrew: on Homebrew
7.0.11, `brew install noetl` refuses a formula from a third-party tap
that has not been trusted. Run it once, after `brew tap`.

The formula builds from source, so the first install also pulls in
Rust and LLVM and can take several minutes (about 16 minutes on a
clean macOS runner for 6.4.0).

## What Gets Installed

The `noetl` CLI tool provides:
- **Local playbook execution** - Run workflows without server infrastructure
- **Server/worker management** - Start/stop NoETL services
- **Resource management** - Register playbooks and credentials
- **Kubernetes operations** - Deploy to K8s clusters

## Verify Installation

```bash
noetl --version
noetl --help
```

## Quick Start

Create a simple playbook:

```yaml
# hello.yaml
apiVersion: noetl.io/v2
kind: Playbook
metadata:
  name: hello_world

workflow:
  - step: start
    tool:
      kind: shell
      cmds:
        - "echo 'Hello from NoETL!'"
    next:
      - step: end
  - step: end
```

Run it:

```bash
noetl run hello.yaml
```

## Features

### Local Execution
```bash
# Run entire playbook
noetl run automation/tasks.yaml

# Run specific step/target
noetl run automation/deploy.yaml production

# Pass variables
noetl run tasks.yaml --set env=prod --set version=v2.5.3 --verbose
```

### Server Management
```bash
# Start NoETL server
noetl server start --init-db

# Start worker
noetl worker start

# Stop services
noetl server stop
noetl worker stop
```

### Kubernetes Operations
```bash
# Deploy to kind cluster
noetl k8s deploy

# Redeploy with rebuild
noetl k8s redeploy

# Full reset
noetl k8s reset
```

## Building from Source

If you prefer to build from source:

```bash
git clone https://github.com/noetl/cli.git
cd cli
cargo build --release --bins
cp target/release/noetl /usr/local/bin/
```

## Documentation

- **Homepage**: https://noetl.io
- **Documentation**: https://noetl.io/docs
- **CLI GitHub**: https://github.com/noetl/cli

## Support

- **Issues**: https://github.com/noetl/noetl/issues
- **Discussions**: https://github.com/noetl/noetl/discussions

## License

MIT License - see [LICENSE](https://github.com/noetl/noetl/blob/master/LICENSE)
