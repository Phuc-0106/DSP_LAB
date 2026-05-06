// DSP Lab 6 - Exercise 5
// h(n) = delta(n) + delta(n-1),  x(n) = 0.5^n u(n)
// Y(omega) = H(omega)*X(omega);  y(n) = x(n) + x(n-1)

clear; clf;

N = 2048;
omega = linspace(-%pi, %pi, N);

H = 1 + exp(-%i*omega);
X = 1 ./ (1 - 0.5*exp(-%i*omega));
Y = H .* X;

scf(0); clf();
subplot(3,2,1);
plot(omega/%pi, abs(H));
xlabel("omega / pi"); ylabel("|H|"); xtitle("|H(omega)|");

subplot(3,2,2);
plot(omega/%pi, atan(imag(H), real(H)));
xlabel("omega / pi"); ylabel("Phase (rad)"); xtitle("Phase of H(omega)");

subplot(3,2,3);
plot(omega/%pi, abs(X));
xlabel("omega / pi"); ylabel("|X|"); xtitle("|X(omega)|");

subplot(3,2,4);
plot(omega/%pi, atan(imag(X), real(X)));
xlabel("omega / pi"); ylabel("Phase (rad)"); xtitle("Phase of X(omega)");

subplot(3,2,5);
plot(omega/%pi, abs(Y));
xlabel("omega / pi"); ylabel("|Y|"); xtitle("|Y(omega)|");

subplot(3,2,6);
plot(omega/%pi, atan(imag(Y), real(Y)));
xlabel("omega / pi"); ylabel("Phase (rad)"); xtitle("Phase of Y(omega)");

// Time domain: y(n) = 0.5^n u(n) + 0.5^(n-1) u(n-1)
Nm = 30;
n = 0:Nm-1;
y_dir = 0.5.^n;
y_dir(2:$) = y_dir(2:$) + 0.5.^(n(2:$)-1);

x = 0.5.^n;
y_rec = zeros(1, Nm);
for k = 1:Nm
    xm1 = 0;
    if k > 1 then xm1 = x(k-1); end
    y_rec(k) = x(k) + xm1;
end

disp("max |y_dir - y_rec| = " + string(max(abs(y_dir - y_rec))));

scf(1); clf();
plot2d3(n, y_dir);
xtitle("Exercise 5: y(n) = h(n)*x(n)"); xlabel("n"); ylabel("y(n)");
