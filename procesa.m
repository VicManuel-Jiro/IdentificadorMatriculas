function [img, a, pla] = procesa(I)
rec2= I;
J=I;
b=0;
b1=0;
recorte=2;
intf=0;
while b==0
    for j=1:3
        resultados= ocr(rec2);
        textoreconocido = resultados.Text;
        y=length(textoreconocido);
        q='';
        if y>7
            o=1;
            while o<=y
                if regexp(textoreconocido(o),'[a-z A-Z 0-9]')
                    q=[q,textoreconocido(o)];
                    o=o+1;
                else
                    o=o+1;
                end
            end
        end
        if contains(q,'LRF6474')|| contains(q,'6474')%luis
            img=rec2;
            pla='LRF-64-74';
            a='Luis';
            return
        else
            if contains(q,'MDS1459')|| contains(q,'1459') %mary
                img=rec2;
                pla='MDS-14-59';
                a='Mary';
                return
            else
                if contains(q,'MDS2542')|| contains(q,'2542') %tono
                    img=rec2;
                    pla='MDS-25-42';
                    a='Toño';
                    return
                else
                    if contains(q,'MDT1733')|| contains(q,'1733') %victor
                        img=rec2;
                        pla='MDT-17-33';
                        a='Victor';
                        return
                    else
                        if contains(q,'XHG9642')|| contains(q,'9642') %xochitl
                            img=rec2;
                            pla='XHG-96-42';
                            a='Xochitl';
                            return
                        else
                            if j==1
                                if recorte==0
                                    rec2=imcrop(J,[5 15 315 145]);
                                else
                                    if recorte==1
                                        rec2= imcrop(J,[9 35 305 95]);
                                    else
                                        if recorte==2
                                            rec2= J;
                                        end
                                    end
                                end
                                rec2 = imrotate(rec2 ,180);
                            else
                                if j==2
                                    if recorte==0
                                        rec2=imcrop(J,[5 15 315 145]);
                                    else
                                        if recorte==1
                                            rec2= imcrop(J,[9 35 305 95]);
                                        else
                                            if recorte==2
                                                rec2= J;
                                            end
                                        end
                                    end
                                    rec2 = flip(rec2 ,2);
                                else
                                    if j==3
                                        if b1==0
                                            rec2=imcrop(J,[5 15 315 145]);
                                            b1=1;
                                            recorte=0;
                                        else
                                            if b1==1
                                                rec2= imcrop(J,[9 35 305 95]);
                                                b1=2;
                                                recorte=1;
                                            else
                                                if b1==2 && intf==0
                                                    J = imresize(I,[95 305]);
                                                    rec2=J;
                                                    recorte=2;
                                                    intf=1;
                                                else
                                                    rec= imcrop(I,[9 35 305 95]);
                                                    ban=0;
                                                    ban2=0;
                                                    ban3=0;
                                                    ban4=0;
                                                    k=0.1;
                                                    while ban==0
                                                        J=im2bw(rec,k);
                                                        J=not(J);
                                                        J=bwareaopen(J,50);
                                                        J = imerode(not(J),ones(3,3));
                                                        J=not(J);
                                                        se = strel('disk',1);
                                                        J= imclose(J,se);
                                                        J=bwareaopen(J,50);
                                                        if ban2==1
                                                            se = strel('disk',3);
                                                            J= imopen(J,se);
                                                            J=bwareaopen(J,50);
                                                        end
                                                        l=J;
                                                        for i=1:3
                                                            resultados= ocr(l);
                                                            textoreconocido = resultados.Text;
                                                            y=length(textoreconocido);
                                                            if y>7
                                                                o=1;
                                                                q='';
                                                                while o<=y
                                                                    if regexp(textoreconocido(o),'[a-z A-Z 0-9]')
                                                                        q=[q,textoreconocido(o)];
                                                                        o=o+1;
                                                                    else
                                                                        o=o+1;
                                                                    end
                                                                end
                                                            end
                                                            if contains(q,'LRF6474')|| contains(q,'6474')%luis
                                                                img=l;
                                                                pla='LRF-64-74';
                                                                a='Luis';
                                                                return
                                                            else
                                                                if contains(q,'MDS1459')|| contains(q,'1459') %mary
                                                                    img=l;
                                                                    pla='MDS-14-59';
                                                                    a='Mary';
                                                                    return
                                                                else
                                                                    if contains(q,'MDS2542')|| contains(q,'2542') %tono
                                                                        img=l;
                                                                        pla='MDS-25-42';
                                                                        a='Toño';
                                                                        return
                                                                    else
                                                                        if contains(q,'MDT1733')|| contains(q,'1733') %victor
                                                                            img=l;
                                                                            pla='MDT-17-33';
                                                                            a='Victor';
                                                                            return
                                                                        else
                                                                            if contains(q,'XHG9642')|| contains(q,'9642') %xochitl
                                                                                img=l;
                                                                                pla='XHG-96-42';
                                                                                a='Xochitl';
                                                                                return
                                                                            else
                                                                                if i==1
                                                                                    l = imrotate(J ,180);
                                                                                else
                                                                                    if i==2
                                                                                        l = flip(J ,2);
                                                                                    else
                                                                                        if i==3
                                                                                            if ban2==0
                                                                                                ban2=1;
                                                                                            else
                                                                                                if(ban3==0)
                                                                                                    ban2=0;
                                                                                                    ban3=1;
                                                                                                    k=0.14;
                                                                                                else
                                                                                                    if (ban3==1)
                                                                                                        ban2=0;
                                                                                                        ban3=2;
                                                                                                        k=0.16;
                                                                                                    else
                                                                                                        if(ban3==2)
                                                                                                            ban2=0;
                                                                                                            ban3=3;
                                                                                                            k=0.38;
                                                                                                        else
                                                                                                            if(ban3==3)
                                                                                                                ban2=0;
                                                                                                                ban3=4;
                                                                                                                k=0.51;
                                                                                                            else
                                                                                                                if ban3==4 && ban4==0
                                                                                                                    rec=imcrop(I,[5 10 310 145]);
                                                                                                                    ban2=0;
                                                                                                                    ban3=0;
                                                                                                                    k=0.1;
                                                                                                                    ban4=1;
                                                                                                                else
                                                                                                                    if intf==1
                                                                                                                        J = imresize(I,[95 305]);
                                                                                                                        rec=J;
                                                                                                                        ban2=0;
                                                                                                                        ban3=0;
                                                                                                                        ban4=0;
                                                                                                                        intf=1;
                                                                                                                    else
                                                                                                                        img=I;
                                                                                                                        pla='000-00-00';
                                                                                                                        a='error 404';
                                                                                                                        return
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end