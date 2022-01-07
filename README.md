# docker-jnethack
JNethack 用の Dockerfile です。

## ゲームの遊び方

```
$ git clone https://github.com/shihashi/docker-jnethack
$ cd docker-jnethack
$ ./jnethack
```
このようにするとログファイルとセーブファイルが
`~/jnethackdir` 以下に作成されます。
ゲームの設定ファイルは `~/.nethackrc` です。

## チートする方法

*おすすめしません。*

### モンスターを造る

パッチを適用してビルドしてください。
```
$ git clone https://github.com/shihashi/docker-jnethack
$ cd docker-jnethack/docker
$ ln -sf ../patches/monster.patch NetHack.patch
$ docker build -t jnethack-monster .
```
そして新しくできたイメージで `jnethack` を起動してください。
```
$ cd ..
$ ./jnethack --image jnethack-monster
```

## 参照
- [Docker Hub shihashi/jnethack](https://hub.docker.com/repository/docker/shihashi/jnethack)
- [GitHub shihashi/docker-nethack](https://github.com/shihashi/docker-nethack)
