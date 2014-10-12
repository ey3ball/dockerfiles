This is an attempt at building a clean nzbget image.

Clean as in : no apt-get leftovers, no buildtime dependencies either on disk or
within the image's history.

This is mostly an experiment, it appears that docker makes it especially hard
to produce lightweight images. Forget about having a simple Dockerfile with an
automated build on docker hub.

My main purpose here is to explore the current limitations of docker /
Dockerfiles / docker hub.
