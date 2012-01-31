function sv = forwardbackward(ev, prior) % ev is the set of evidence for 1..t, pripor is the initial state P(X_0)
  fv(0) = prior;
  t = size(ev);	% ev is a vector of 1 to t, so t is the length of this vector
  b = ones(t);	% b is initially a vector of ones, with dimension t
  sv;
  for i = 1:t
    fv[i] = forward(fv(i-1),ev(i))
  end
    
  for i = 1:-1:t
    sv(i) = normalize(fv(i)*b)
    b = backward(b, ev(i))
  end
  return sv;
end
      