function J = indice_di_costo(dimming_difference,Jmax,delta_max,delta_min)
    
    
    delta = ceil(abs(dimming_difference));
    J = 0;
    if delta > delta_max
        J = min(delta,inf);
    end
    if delta < delta_min
        J = max((1/(delta)),Jmax);
    end

end