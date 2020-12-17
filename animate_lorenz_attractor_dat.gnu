file='lorenz_attractor.dat'
end_time=200 #end time set in fortran program
step=0.003333 #h variable in FORTRAN program
speed=20 #animation speed (no of points to plot every loop)

set terminal pngcairo


unset colorbox
unset border ; #uncomment to hide borders (axis lines)
unset xtics ; unset ztics ; unset ytics
set zrange [-10:50] ;set yrange [-30:30] ;set xrange [-30:30]
# set xlabel "x-axis" ; set ylabel "y-axis" ;set zlabel "z-axis"
set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#111111" behind
angle=60
no_points=end_time/step
do for [iter=1:no_points:speed] {
    splot file every ::iter - 4000::iter using 1:2:3 w l ls 1 lc rgb 'green' notitle,file every ::iter-4000::iter using 4:5:6 w l ls 1 lc rgb 'red' notitle, \
          file every ::iter::iter using 1:2:3 w p ls 1 pt 7 ps 3 lc rgb "green" notitle,file every ::iter::iter using 4:5:6 w p ls 1 pt 7 ps 3 lc rgb "red" notitle
    # comment/uncomment to disable/enable autorotation
    # set view 45, angle, 2, 1
    # angle=angle+1*0.3
    # if(angle>360){angle=0}


    # print "Point " ,iter," of ",floor(no_points)," (",100.0*iter/no_points," %)" 
    # pause 0.01 #makes rotating axis responsive after high point count, if still non-responsive,resize window to smaller size
}
set output
