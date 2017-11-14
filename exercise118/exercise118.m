%% Exercise 1.1.8
%Map the first n central moments into the first n raw moments.

%% First of all we need to create out central moments
X = rand(10,1); %creates a random vector (we can choose the size)
n=5;            %n := number of central moments we want to map
                %it represents the maximum order calculated
%creates a vector of central moments                
for i=1:n
    mu(i) = moment( X, i ); %generates the central momen of order i
end

%% We now map our central moments into the raw ones
mu_t(1) = mu(1); %First moment is the same by definition
%to map other moments we just compute the formula in the exercise
for i=2:n
    for k=1:i-1
        sum_term = (-1)^(i-k+1) * mu(i-k) * mu_t(k);
    end
    mu_t(i) = mu(i) + sum_term;
end

%% We now check that our result is the same as Meucci's one
if( Central2Raw(mu) == mu_t )
    "Well done!"
else
    "something is wrong"
end
