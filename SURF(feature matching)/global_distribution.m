
function F=global_distribution(key_point_array_i,H,W)

       k = convhull(key_point_array_i(:,1),key_point_array_i(:,2));
        for i=1:size(k,1)-1
         boundary_pts(i,:)=key_point_array_i(k(i),1:2);
         end;
       area_f = polyarea(boundary_pts(:,1),boundary_pts(:,2));        
       F=area_f/(H*W);
