function [yn, yorigin] = add(x1n, x1origin, x2n,x2origin)
    k = x1origin - x2origin;
    if k > 0 then
        x2n = [zeros(1,k) x2n];
    elseif k < 0 then
        x1n = [zeros(1,-k) x1n];
    end
    len_diff = length(x1n) - length(x2n);
    if len_diff > 0 then
        x2n = [x2n zeros(1,len_diff)]
    elseif len_diff < 0 then
        x1n = [x1n zeros(1,-len_diff)]
    end
    yn = x1n + x2n;
    yorigin = max(x1origin,x2origin);
    nx1 = (1:length(x1n)) - yorigin;
    nx2 = (1:length(x2n)) - yorigin;
    ny = (1:length(yn)) - yorigin;
    clf;
    subplot(3,1,1);
    plot2d3(nx1,x1n);
    title("x(n)");
    xlabel("n");
    ylabel("Amplitude");

    subplot(3,1,2);
    plot2d3(nx2,x2n);
    title("x2(n)");
    xlabel("n");
    ylabel("Amplitude");
    
    subplot(3,1,3);
    plot2d3(ny,yn);
    title("y(n) = x1(n) + x2(n)");
    xlabel("n");
    ylabel("Amplitude");
endfunction
