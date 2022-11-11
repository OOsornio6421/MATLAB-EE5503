format short
clearvars
clc

a = 10^-10;         % mesh spacing (delta x)
N = 100;            % # of mesh or sampling
L = (N + 1) * a;    % length of space
x = linspace(0, N);% x-scale

h_bar = 1.0546 * 10 ^ -27;  % reduced planck's constant (m^2 kg / s)
m = 9.1094 * 10 ^ -31;      % mass of electron (kg)

t0 = - h_bar ^ 2 / (2 * m * a ^ 2);         % t0 value calculated
H = t0 * (diag(ones((N - 1), 1), -1) ...    % hamiltonian
    - 2 * diag(ones(N, 1), 0) ...
    + diag(ones((N - 1), 1), 1));

%H(1, 1) = 0; H(1, 2) = 0; H(2, 1) = 0;      % psi(0) = 0 condition
%H(N, N-1) = 0; H(N-1, N) = 0; H(N, N) = 0;  % psi(N) = 0 condition

En = zeros(1,100);                      % create En matrix
for n = 1:100                           % for loop for filling matrix
    En(n) = (h_bar * pi * n) ^ 2 ...    % part (b) analytical eig
        / (2 * m * L ^ 2);
end

[V, E] = eig(H);            % eigenvalue & eigenvector

plot(x, diag(E), x, En);    % plot of (a) and (b) w/ labels
title('Part (a) & (b)');
xlabel('n');
ylabel('Energy (eV)');
legend('E(x)', 'En(x)', 'Location', 'EastOutside');

figure;

plot(x, V(:,1) .^ 2, x, V(:,2) .^ 2, ...    % plot of (d) w/ labels
    x, V(:,10) .^ 2, x, V(:,50) .^ 2);
title('Part (d)');
xlabel('n');
ylabel('\psi^2(n)');
legend('\psi^2_{E_1}(n)','\psi^2_{E_2}(n)', ...
    '\psi^2_{E_1_0}(n)','\psi^2_{E_5_0}(n)', ...
    'Location', 'EastOutside');