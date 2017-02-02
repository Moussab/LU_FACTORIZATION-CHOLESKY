function [ X , C ] = CHOLESKY_SOLUTION( A , b )

    tStart = tic;
    
    C = CHOLESKY(A);
    
    rows = size(A,1);

    Y = zeros(rows,1);
    for i = 1 : rows
        n = 0;        
        for j = 1 : rows
           if i ~= j
              n = n + C(i,j)*Y(j,1);
           end
        end
        Y(i,1) = (b(i,1) - n)/C(i,i);   
    end
    
    X = zeros(rows,1);
    T = C';
    for i = rows : -1 : 1
       n = 0;
       for j = 1 : rows
           if i ~= j
              n = n + T(i,j)*X(j,1);
           end
       end
       X(i,1) =  (Y(i,1) - n)/T(i,i);
    
    end
    
       
    tEnd = toc(tStart);
    fprintf('%d minutes and %f seconds\n',floor(tEnd/60),rem(tEnd,60));
end