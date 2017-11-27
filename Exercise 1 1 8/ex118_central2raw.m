% Exercise 1.1.8 - function
% *Author: Giuseppe Mascolo*
% Map the first n central moments into the first n raw moments.

% Input: mu -> central moments; dim -> number of moments
% Output: raw moments

function RawMu = ex118_central2raw( mu, dim)

RawMu(1) = mu(1); %First moment is the same by definition

%to map other moments we just compute the formula in the exercise
for i=2:dim
    for k=1:i-1
        sum_term = (-1)^(i-k+1) * mu(i-k) * RawMu(k);
    end
    RawMu(i) = mu(i) + sum_term;
end

end

