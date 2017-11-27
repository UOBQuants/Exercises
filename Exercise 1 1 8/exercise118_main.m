%% Exercise 1.1.8 - main
% *Author: Giuseppe Mascolo*
% Map the first n central moments into the first n raw moments.

%% First of all we need to create out central moments
X = rand(10,1); %creates a random vector (we can choose the size)
n=5;            %n := number of central moments we want to map
                %it represents the maximum order calculated
%creates a vector of central moments                
for i=1:n
    mu(i) = moment( X, i ); %generates the central momen of order i
end

%% We now map our central moments into the raw ones
mu_t = ex118_central2raw(mu, n);

%% We now check that our result is the same as Meucci's one
if( Central2Raw(mu) == mu_t )
    "Well done!"
else
    "something is wrong"
end
