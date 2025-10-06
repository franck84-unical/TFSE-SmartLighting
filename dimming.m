function lux = dimming(vehicles)
    vehicles=abs(vehicles);    
    maxLux = 100; 
%     maxVehicles = 10;
     maxVehicles = 50;
    minLux = 25; %[%]
%     minVehicles = 4;
    minVehicles = 1;
    
    if vehicles >= minVehicles && vehicles <= maxVehicles
        lux = ((maxLux-minLux)/(maxVehicles-minVehicles))*(vehicles-minVehicles)+minLux;
    elseif vehicles < minVehicles
        lux = minLux;
    elseif vehicles > maxVehicles
        lux = maxLux;
    end
end
