# a Discord MusicBot template

[![on quay.io](https://quay.io/repository/awaxa/musicbot/status "on quay.io")](https://quay.io/repository/awaxa/musicbot)

quay.io should build conveniently runnable Discord MusicBot images from this.
rebuild more rapidly with this image `FROM quay.io/awaxa/musicbot`

these branches contain personalized defaults and various `autoplaylist.txt` sets

I WANT PULL REQUESTS featuring your favorite songs in `autoplaylist.txt` and
ANYTHING else you would suggest.  This means you!

## developer notes

macOS specific tricks

### appending a song to `autoplaylist.txt`

from clipboard:

```shell
echo $(pbpaste) | tee -a config/autoplaylist.txt && git commit -m "$(youtube-dl --get-title "$(pbpaste)")" -- config/autoplaylist.txt
```

from `docker logs`:

```shell
for id in $(cat ~/tmp/playlist-append.txt | grep -o v=.* --color=never | cut -b3- | sort | uniq | tr \\n \  ) ; do echo $id | tee -a config/autoplaylist.txt && git add config/autoplaylist.txt && git commit -m "$(youtube-dl --get-title $id)" ; done

```

### deploying

```shell
docker pull quay.io/awaxa/musicbot:latest
docker run -d --name musicbot --restart always --env token='abc123' quay.io/awaxa/musicbot:latest
```

- [Docker Tutorial](https://github.com/SexualRhinoceros/MusicBot/wiki/Installation-guide-for-Docker)

## Further reading

Some frequently asked questions are listed on the wiki [here](https://github.com/SexualRhinoceros/MusicBot/wiki/FAQ "Wiki").

Commands are listed [here](https://github.com/SexualRhinoceros/MusicBot/wiki/Commands-list "Commands list").

[Rhino Help Server](http://discord.me/rhinohelp "Discord link")

