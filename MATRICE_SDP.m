function A = MATRICE_SDP(N)
 bool = 0;
while( bool == 0)
    A = rand(N,N); % �l�ments extra diago
    A= (A + A')/2; % sym�trisation
    A = 10*(A*A');
    A = floor(A);
    if(min(eig(A)) > 0) 
        bool = 1;
    end
end
end