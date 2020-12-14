file='lorenz_attractor.dat'
end_time=200 #end time set in fortran program
step=0.003333 #h variable in FORTRAN program
speed=10      #animation speed (no of points to plot every loop)

# ######### uncomment following lines to generate GIF animation ####################
# set terminal gif animate medium size 500,500
# set output 'lorenz_attractor.gif' 

unset colorbox
#unset border ;
 unset xtics ; unset ztics ; unset ytics
set zrange [-10:50] ;set yrange [-30:30] ;set xrange [-30:30]
set xlabel "x-axis" ; set ylabel "y-axis" ;set zlabel "z-axis"
set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#111111" behind

no_points=end_time/step
do for [iter=1:no_points:speed] {
    splot file every ::1::iter w l ls 1 lc rgb 'yellow' notitle, \
          file every ::iter::iter w p ls 1 pt 7 ps 2 lc rgb 0xFF0000 notitle
          
    print "Point " ,iter," of ",floor(no_points)," (",100.0*iter/no_points," %)" 
    pause 0.01 #makes rotating axis responsive after high point count, if still non-responsive,resize window to smaller size
}
set output
