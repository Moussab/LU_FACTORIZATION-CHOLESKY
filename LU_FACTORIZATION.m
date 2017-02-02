    %Factorisation LU%
    function [ L , U ] = LU_FACTORIZATION(A)


    rows = size(A,1);
    columns = size(A,2);
    eig_A = eig(A);
    bool = 0;
    for j = 1 : size(eig_A)
        if(eig_A(j) == 0) 
            bool = 1;
        end
    end

    if( det(A) ~= 0 && rows == columns && bool == 0 )
        L = eye(rows);
        for k=1:rows
            L(k+1:rows, k) = A(k+1:rows, k)/A(k, k);
            for i=k+1:rows
                A(i, :) =  A(i, :) - L(i, k)*A(k, :);
            end
        end

        U = A;
        A = L*U;
    elseif( det(A) == 0 )
        error('La matrice insere est non inversible');
    elseif( rows ~= columns )
        error('La matrice insere n est pas carrée');
    elseif(bool == 1)
        error('La matrice insere n est pas definit positive');
    end


    end

