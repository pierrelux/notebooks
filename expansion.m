function DATA=expansion(hdl, DATA)
% EXPANSION Expand a signal in the space of polynomials of degree 2.
%   EXPDATA = EXPANSION(HDL, DATA) expands the data set 'DATA' in the 
%   space of polynomials of degree 2. HDL is ignored (it is used in other
%   kinds of expansion).
  
  n=size(DATA,2);
  
  % allocate expansion space
  DATA=[DATA zeros(size(DATA,1), xp_dim(n)-size(DATA,2))];
  k=n+1;
  for i=1:n,
    len=n-i+1;
    tmp=repmat(DATA(:,i),1,len);
    DATA(:,k:k+len-1)=tmp.*DATA(:,i:n);
    k=k+len;
  end 
  
  return
  
  % old version
  k=n;
  for i=1:n,
    tmp=DATA(:,i);
    for j=i:n,
      k=k+1;
      DATA(:,k)=tmp.*DATA(:,j);
    end
  end
