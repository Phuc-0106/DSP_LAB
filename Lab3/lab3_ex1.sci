function [yn, yorigin]= delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
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
    title("y(n)");
    xlabel("n")
    ylabel("Amplitude");
    disp("yn = ");
    disp(yn);
    disp("yorigin = ");
    disp(y_o);
endfunction
