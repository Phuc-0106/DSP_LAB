clf();

// 1. Define signal  (N = 5)
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1]; 
nx = 0:4;
N = length(x);

// --- Method 1: Folding and Shifting ---
// Formula: y(n) = sum_{k=0}^{N-1} h(k) * x((n-k) mod N)
y_fold = zeros(1, N);
for n = 0:N-1
    s = 0;
    for k = 0:N-1
        // (n-k) modulo N trong Scilab (index start from 1)
        idx = pmodulo(n - k, N); 
        s = s + h(k+1) * x(idx+1);
    end
    y_fold(n+1) = s;
end

// --- Methos 2: Matrix Method using Circulant Matrix) ---
// create circular matrix from x
H_circ = zeros(N, N);
for i = 1:N
    // every idx is one circular shifting of x
    for j = 1:N
        idx = pmodulo(i - j, N);
        H_circ(i, j) = x(idx + 1);
    end
end
y_matrix = (H_circ * h')'; // y = H * h

// --- Calculate energy ---
E_x = sum(abs(x).^2);
E_y = sum(abs(y_fold).^2);

// --- sketch graph ---
// sketch x(n)
subplot(3,1,1);
plot2d3(nx, x, 2);
scatter(nx, x, "fill");
xtitle("Input Signal x(n) (Energy: " + string(E_x) + ")", "n", "x(n)");

// sketch h(n)
subplot(3,1,2);
plot2d3(nx, h, 3);
scatter(nx, h, "fill");
xtitle("Impulse Response h(n)", "n", "h(n)");

// sketch results y(n)
subplot(3,1,3);
plot2d3(nx, y_fold, 5);
scatter(nx, h, "fill");
xtitle("Circular Convolution y(n) (Energy: " + string(E_y) + ")", "n", "y(n)");

// print
printf("Result of y(n) use Folding/Shifting:\n");
disp(y_fold);
printf("Result y(n) use Matrix Method:\");
disp(y_matrix)

printf("Result E_x");

disp(E_x);
printf("Result E_");
disp(E_y);

