# pages-template

Quick-start for Cloudflare Pages projects.

## Use

```sh
git clone --depth 1 https://github.com/JakobMelchard/cloudflare-core.git my-site
cd my-site
rm -rf .git
git init
echo "my-project-name" > .pages-name
```

Or use the local install script in an existing dir:

```sh
bash install.sh
touch .pages-name
```

## Structure

```
.pages-name             # Cloudflare Pages project name (edit me!)
Makefile                # dev|validate|build|test|deploy
hooks/                  # git hooks (pre-commit, pre-push)
.github/workflows/      # CI (release-please)
```

See [cloudflare-core](https://github.com/JakobMelchard/cloudflare-core).
