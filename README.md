# pages-template

GitHub template for Cloudflare Pages projects.

## Use

1. "Use this template" on GitHub → clone
2. `curl -sL https://raw.githubusercontent.com/JakobMelchard/core/main/install.sh | bash`
3. Edit `.pages-name` with your CF Pages project name
4. Add `scripts/{dev,validate,build,test}` as needed
5. `make dev` to develop, `make deploy` to ship

## Structure

```
.pages-name             # Cloudflare Pages project name (edit me!)
Makefile                # dev|validate|build|test|deploy
.core/                  # submodule (added by install.sh)
scripts/{dev,validate,build,test}  # project-defined (optional)
.github/workflows/release.yml  # seeded by install.sh
```
