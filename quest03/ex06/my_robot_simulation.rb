def run_robot(instructions)
    ass = instructions.split("")
    res={'x'=>0 , 'y'=>0, 'bearing'=>"North"}
    post = res['bearing'];
    for i in ass
        if i=="R" and i!="A"
            post = post=="North"? "East":post=="East"? "South":post=="South"? "West":"North"
        elsif i=="L" and i!="A"
            post = post=="North"? "West":post=="West"? "South":post=="South"? "East":"North"
        else
            if post =="West" or post=="East"
                cordx = res['x']
                res['x'] = post=="West"? cordx-=1:cordx+=1
            else
                cordy = res['y']
                res['y'] = post=="North"? cordy+=1:cordy-=1 
            end
        end
        res['bearing'] = post;
    end
    return res
end