docker stop voip-answer
docker rm voip-answer

# We need to run in host networking mode, as SIP is just
# a control protocol that uses an SDP to specify which
# ports the audio will come in on (which will be different
# every time, so we can't map them)
docker run \
	--name voip-answer \
	--restart always \
	--network=host \
	--volume /data/calls:/tmp \
	--detach \
	-it \
	voip-answer
