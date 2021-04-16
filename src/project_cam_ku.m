function [P, D] = project_cam_ku(w, cv, clookat, cup, cp)
    zc = (clookat-cv)/norm(clookat-cv);
    t = cup-cup'*zc*zc;
    yc = t/norm(t);
    xc=cross(yc,zc);
    [P, D]= project_cam(w, cv, xc, yc, zc, cp);
end

