# freezer

This is the repository to use with [`brrr`](https://github.com/SiegfriedEhret/brrr).

## Package definition

An example can help, right ?

```
brrr: "https://nyrst.github.io/freezer/exa.yaml"
latest_version: 0.9.0
name: "exa"
releases_feed: "https://github.com/ogham/exa/releases.atom"
tags:
  - rust
  - ls
  - command-line
url: "https://github.com/ogham/exa"
versions:
  "0.9.0":
    linux:
      post_install:
        - 
          type: "symlink"
          source: "exa-linux-x86_64"
          target: "exa"
      binary_type: "zip"
      hash_sha1: "a9a384d8e462a78af6dd14ad80cebc67e674100f"
      url: "https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip"
    macos:
      post_install:
        - 
          type: "symlink"
          source: "exa-macos-x86_64"
          target: "exa"
      binary_type: "zip"
      hash_sha1: "9c21c7c4e4ba5dc8c29a5d883a80efebd17843dc"
      url: "https://github.com/ogham/exa/releases/download/v0.9.0/exa-macos-x86_64-0.9.0.zip"
```

A package is a yaml file with the following properties:

- `brrr` (`String`, mandadory): the url of the definition file.
- `latest_version` (`String`, mandatory): the latest available version (used later in `versions`).
- `name` (`String`, mandatory): the name of the package.
- `releases_feed` (`String`, optional): the rss feed to get new versions information. Useful to update the content of this repository.
- `tags` (`Array(String)`, mandatory): an array of tags related to the project.
- `url` (`String`, mandatory): the url of the package repository.
- `versions` (`Hash(version: String, Hash(arch: String, version: Binary))`, mandatory): a map with versions as keys, and as value a map with architecture (`linux`, `macos`) as keys, and a Binary as value, see below.

A Binary has the following properties:

- `binary_type` (`String`, mandatory): the type of binary file. Supported values: `binary`, `tar`, `zip`.
- `url` (`String`, mandatory): the url of the binary to download.
- `hash_<hash type>` (`String?`, optional): the hash for the file from the `url`. Supported values for `<hash type>` are: `md5`,`sha1`.
- `post_install` (`Array(PostInstall)`, mandatory): see what is a `PostInstall` just below.

A PostInstall has the following properties:

- `type` (`String`, mandatory): the type of the post install thing to run. Supported values: `symlink` and `move`.

For the `symlink` type, use the following extra properties:

- `source`: the path to the executable.
- `target`: the name of the symlink (see the exa example).

For the `move` type, use the following extra properties:

- `source`: the path to the binary/folder to move.
- `target`: the target folder to move the source into.

## Development

### Contributing

1. Fork it (<https://github.com/SiegfriedEhret/freezer/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Contributors

- [Siegfried Ehret](https://github.com/SiegfriedEhret) - creator and maintainer

### License

This library is distributed under the MIT license. Please see the [LICENSE](./LICENSE) file.