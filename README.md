# pages-template

Quick-start for Cloudflare Pages projects.

## Use

```sh
curl -sL https://raw.githubusercontent.com/JakobMelchard/cloudflare-core/main/install.sh | bash
```

Edit `.pages-name` with your CF Pages project name.
Add `scripts/{dev,validate,build,test}` as needed.

```sh
make dev      # develop
make deploy   # ship
```

## Structure

```
.pages-name             # CF Pages project name (edit me!)
Makefile                # dev|validate|build|test|deploy
hooks/                  # git hooks
.github/workflows/      # CI
```
