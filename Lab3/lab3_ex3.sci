function [yn, yorigin] = fold(xn, xorigin)

    // lật tín hiệu
    yn = xn($:-1:1);

    // tính origin mới
    yorigin = length(xn) - xorigin + 1;

    // tạo trục n
    n = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    clf;

    subplot(2,1,1);
    plot2d3(n,xn);
    title("x(n)");
    xlabel("n");
    ylabel("Amplitude");

    subplot(2,1,2);
    plot2d3(ny,yn);
    title("y(n) = x(-n)");
    xlabel("n");
    ylabel("Amplitude");

endfunction
