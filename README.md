# pages-template

GitHub template for Cloudflare Pages projects. Provides shared hooks, Makefile targets, and release-please CI via [pages-core](https://github.com/JakobMelchard/pages-core).

## Usage

1. **Create project**: "Use this template" on GitHub, then clone
2. **Install**: `bash install.sh`
   - Adds `pages-core` as `.core` submodule
   - Sets `core.hooksPath` to `.core/hooks/`
   - Seeds `.gitignore`, `.gitleaks.toml`, `_exclude`
3. **Develop**: `git commit` runs pre-commit (gitleaks + validate + build + test)
4. **Deploy**: `git push` runs pre-push (deploy to Pages)
5. **Update**: `bash update.sh` pulls latest `pages-core`

## Project structure after install

```
project/
├── install.sh               # from template (committed)
├── update.sh                # from template (committed)
├── .core/                   # submodule → pages-core
│   ├── Makefile             # dev|validate|build|test|deploy
│   └── hooks/               # pre-commit, pre-push
├── .gitignore               # seeded from .core
├── .gitleaks.toml           # seeded from .core
├── _exclude                 # seeded from .core
├── scripts/
│   ├── dev                  # project-defined (optional)
│   ├── validate             # project-defined (optional)
│   ├── build                # project-defined (optional)
│   └── test                 # project-defined (optional)
├── static/
└── .github/workflows/
    └── release.yml
```

## Adding project-specific scripts

| File | Called by | Purpose |
|---|---|---|
| `scripts/validate` | `make validate` | Schema validation, linting |
| `scripts/build` | `make build` | Generate site assets |
| `scripts/test` | `make test` | Run tests |
| `scripts/dev` | `make dev` | Custom dev server |
