sudo rmmod v4l2loopback # remove the module if it's already loaded
sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 card_label="Canon M50" # load the module with the needed parameters
sudo pkill -9 gphoto # kill any gphoto process that may be running
gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -af "hqdn3d" -pix_fmt yuv420p -threads 0 -s:v 1920x1080 -f v4l2 /dev/video2 # start the camera
