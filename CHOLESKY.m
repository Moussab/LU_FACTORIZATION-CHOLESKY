    function R = CHOLESKY(A)


    tic;

    rows = size(A,1);
    columns = size(A,2);
    eig_A = eig(A);

    if( det(A) ~= 0 && rows == columns && norm(A-transpose(A), 1) == 0 && min(eig_A) > 0 )

        n=length(A);
        R=zeros(n);
        for k=1:n
            R(k,k) = sqrt(A(k,k) - R(k,:)*R(k,:)');
            for j = (k+1) : n
                R(j,k) = (A(j,k) - R(k,:) * R(j,:)')/R(k,k);
            end
        end


    elseif( det(A) == 0 )
        error('La matrice insere est non inversible');
    elseif( rows ~= columns )
        error('La matrice insere n est pas carrée');
    elseif(norm(A-transpose(A), 1) ~= 0)
        error('La matrice insere n est pas symetrique');
    elseif(min(eig_A) <= 0)
        error('La matrice insere n est pas definit positive');
    end

    end