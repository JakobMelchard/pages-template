# pages-template — CF Pages project

```sh
curl -sL https://raw.githubusercontent.com/JakobMelchard/cloudflare-core/main/install.sh | bash
```

Edit `.pages-name` with your CF Pages project name.
Add `scripts/{dev,validate,build,test}` as needed.

## Commands

```sh
make dev        # dev server
make validate   # run scripts/validate
make build      # run scripts/build
make test       # run scripts/test
make deploy     # pages deploy
```
