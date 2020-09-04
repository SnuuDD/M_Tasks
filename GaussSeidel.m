%
%   A01703455 - Luis Jesus Morales Juarez
%   A01250647 - Alberto Castañeda Arana
%   A01233416 - Sebastián González Tafoya
%   
%  This script implement the Gauss-Seidel method to solve a system of linear
%  equations
%  The matrix o f coefficients must be non singular (determinant diferent
%  from zero)
    ContadorPasos=0;
    A = input('Give me the matrix coefficients: ');
% Calculate the determinant
    d = det(A)
    [m,n]=size(A);

    if d ~= 0

        B = input('Gimme the vector of constant: ');
        [p,q] = size(B);

        if (p==m && q==1)
            % Initialize a X and Apre
            x=zeros(m,1)
            prev = x
            APRE = 100*ones(m,1)
           k=0;
           tol = input('Gimme the tolerance: ');
           while sum(APRE>tol) > 0
               k=k+1
            for i=1:m

                Sumatoria=0;
                for j=1:m
                    if j~=i
                    Sumatoria = A(i,j)*x(j)+Sumatoria
                    end
                end
                x(i) = (B(i) - Sumatoria)/A(i,i)
                APRE(i) = abs((x(i) - prev(i))/x(i))*100
                prev(i)= x(i);
            end
           end
        else
            disp('Incorrect dimensions');
            return
        end
    
    else %d==0
        disp('The matrix is singular, not able to continue');
        return  
end