x = [-3, 0, 5; 7, 1, 23; 0, 0, 59];
y = zeros(3);

for c = 1:3
    for r = 1:3
        if r == c || r == (c+2) || c == (r+2)
            y(r,c) = x(r,c);
        end
    end
end

disp(y);

