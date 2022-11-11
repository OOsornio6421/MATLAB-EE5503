format short

x = [1 2 3; 3 4 5; 6 7 8];
[v,d] = eig(x)

for i = 1:3
    y = ['Eigenvalue: ', num2str(d(i,i))];
    z = ['Eigenvector: ', num2str(v(1,i)), 'x + ', ...
        num2str(v(2,i)), 'y + ', num2str(v(3,i)), 'z'];
    disp(y);
    disp(z);
end
