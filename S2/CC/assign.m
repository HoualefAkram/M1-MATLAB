function output = assign(vector,cut_index)
    output = [];
    for i = 1:length(vector)
       if(i <= 2)
           value = [vector(i) 0];
       else
           value = [vector(i) 1];
       end
       output = [output; value];
    end

end