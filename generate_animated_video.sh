rm -f *.mp4;
gnuplot animate_lorenz_attractor_dat.gnu | ffmpeg -f png_pipe -s:v 800x600 -i pipe: out.mp4 && \
ffmpeg -itsscale 0.83 -i out.mp4 -c:v libx264 -preset slow -crf 22 \
        -profile:v baseline -level 3.0 \
        -movflags +faststart -pix_fmt yuv420p \
        -c:a libfdk_aac -b:a 128k \ lorenz_attractor.mp4 \
        && rm -f out.mp4