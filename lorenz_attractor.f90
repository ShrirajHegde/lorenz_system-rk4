program main
    implicit none
    real*8::h,y,x,z,K,L,u_limit,M,t
    real*8::sigma,rho,beta

    !================================
    !constants
    sigma=10.0
    rho=28.0
    beta=8.0D0/3
    
    t=0
    h=0.003333
    u_limit=200
    ! initial conditions
    x=10.0
    y=-0.01                 
    z=9.0  

    OPEN(20,file='lorenz_attractor.dat')
    do while(t<=u_limit)
        CALL KLM(x,y,f,g,h,K,L,M)
        x=x+M
        y=y+K
        z=z+L
        t=t+h
        write(20,*)x,y,z
    enddo
    CLOSE(20)

    contains
    real*8 function f2(x,y,z) !derivative of x
        real*8::x,y,z
        f2 = sigma*(y-x)
    end function f2

    real*8 function f(x,y,z) !derivative of y
        real*8::x,y,z
        f = rho*x-x*z-y
    end function f

    real*8 function g(x,y,z) !derivative of z
        real*8::x,y,z
        g = x*y-beta*z
    end function g


    subroutine KLM(x,y,f,g,h,K,L,M) !subroutine for Runge Kutta (order 4)
        real*8::x,f,g,y,k1,k2,k3,k4,h,K,L,l1,l2,l3,l4,M,m1,m2,m3,m4
        m1=h*f2(x,y,z)
        k1=h*f(x,y,z)
        l1=h*g(x,y,z)

        m2=h*f2(x+h/2,y+k1/2,z+l1/2)
        k2=h*f(x+h/2,y+k1/2,z+l1/2)
        l2=h*g(x+h/2,y+k1/2,z+l1/2)

        m3=h*f2(x+h/2,y+k2/2,z+l2/2)
        k3=h*f(x+h/2,y+k2/2,z+l2/2)
        l3=h*g(x+h/2,y+k2/2,z+l2/2)

        m4 = h*f2(x+h,y+k3,z+l3)
        k4 = h*f(x+h,y+k3,z+l3)
        l4 = h*g(x+h,y+k3,z+l3)

        K = (k1+k4)/6  + (k2+k3)/3 
        L = (l1+l4)/6 + (l2+l3)/3
        M = (m1+m4)/6 + (m2+m3)/3

    end subroutine KLM
end program main