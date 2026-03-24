function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)

    // align origin
    k = x1origin - x2origin;

    if k > 0 then
        x2n = [zeros(1,k) x2n];
    elseif k < 0 then
        x1n = [zeros(1,-k) x1n];
    end

    // align length
    len_diff = length(x1n) - length(x2n);

    if len_diff > 0 then
        x2n = [x2n zeros(1,len_diff)];
    elseif len_diff < 0 then
        x1n = [x1n zeros(1,-len_diff)];
    end

    // nhân tín hiệu (điểm theo điểm)
    yn = x1n .* x2n;

    // origin mới
    yorigin = max(x1origin, x2origin);

    // trục n
    nx1 = (1:length(x1n)) - yorigin;
    nx2 = (1:length(x2n)) - yorigin;
    ny  = (1:length(yn))  - yorigin;

    clf;

    subplot(3,1,1);
    plot2d3(nx1,x1n);
    title("x1(n)");

    subplot(3,1,2);
    plot2d3(nx2,x2n);
    title("x2(n)");

    subplot(3,1,3);
    plot2d3(ny,yn);
    title("y(n) = x1(n) * x2(n)");

endfunction
