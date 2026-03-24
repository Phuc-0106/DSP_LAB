function [yn, yorigin] = conv_signal(xn, xorigin, hn, horigin)

    // convolution
    Nx = length(xn);
    Nh = length(hn);
    Ny = Nx + Nh - 1;
    yn = zeros(1,Ny);
    for n=1:Ny
        for k=1:Nx
            if (n-k+1 >= 1 & n-k+1 <= Nh) then
                yn(n) = yn(n) + xn(k)*hn(n-k+1)
            end
        end
    end
    // origin
    yorigin = xorigin + horigin - 1;

    // trục
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;

    clf;

    subplot(3,1,1);
    plot2d3(nx, xn);
    title("x(n)");

    subplot(3,1,2);
    plot2d3(nh, hn);
    title("h(n)");

    subplot(3,1,3);
    plot2d3(ny, yn);
    title("y(n) = x(n) * h(n)");

endfunction
