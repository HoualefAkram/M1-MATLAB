function [chars,count] = counter(message)
count = [];
chars = [];
while(length(message) ~= 0) 
    index = 1 : length(message);
    counter = 0;
    del_counter = 0;
    first_item = message(1);
    for i = index
       current_index = i - del_counter;
       if(message(current_index) == first_item)
       counter = counter + 1;
       message(current_index) = [];
       del_counter = del_counter + 1;
       end
    end
    chars = [chars, first_item];
    count= [count, counter];
end
end