function [I] = render_object(p, F, C, M, N, H, W, w, cv, clookat, cup)

[P, D] = project_cam_ku(w, cv, clookat, cup, p');
Prast = rasterize(P,M,N,H,W);
I = render(Prast', F, C', D', 'gouraud');

end

