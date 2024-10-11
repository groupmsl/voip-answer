# Simple VoIP answer and playback

Copyright (c) 2019 Adrian Kennard, Andrews & Arnold Limited, see LICENSE file (GPL)

## Docker information

To build container:

```bash
docker build -t voip-answer --progress=plain  .
```

When you are debugging it can be useful to run with no cache:

```bash
docker build -t voip-answer --progress=plain --no-cache .
```
