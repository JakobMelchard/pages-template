# pages-template — CF Pages project template

Template repo. Consumer projects are created via "Use this template".

## Setup in consumer project

```sh
bash install.sh
```

Adds [pages-core](https://github.com/JakobMelchard/pages-core) as `.core` submodule, sets hooks path, seeds config.

## Update

```sh
bash update.sh
```

## CI

Release-please only. Deploy is local via pre-push hook.
