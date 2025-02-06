close all; clear all; clc;
message = 'aq12abbca2saddd';
output = [];   
while(length(message) ~= 0) 
    index = 1:length(message);
    counter = 0;
    for i = index
        if(message(1) == message(i))
        counter = counter + 1; 
        end
    end
    output = [output;counter];
    del_value = message(1);
    del_counter = 0;
    for j = index
        current_index = j - del_counter;
        if(message(current_index) == del_value)
            message(current_index) = [];
            del_counter = del_counter + 1;
        end
    end
end