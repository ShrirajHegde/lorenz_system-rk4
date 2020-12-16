rm -f out.mp4;rm -f lorenz_attractor.mp4;
gnuplot plot_lorenz_attractor_dat.gnu | ffmpeg -f png_pipe -s:v 800x600 -i pipe: out.mp4 && \
ffmpeg -itsscale 0.83 -i out.mp4 -c copy lorenz_attractor.mp4 && rm -f out.mp4;