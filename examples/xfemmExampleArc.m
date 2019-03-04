clc
clear

DRAW_MAGNET = 0;
DRAW_TIKZ   = 0;
DRAW_XFEMM = 1;

%% Define cross sections

arc1 = CrossSectArc( ...
        'name', 'arc1', ...
        'dim_d_a', DimMillimeter(1), ...
        'dim_r_o', DimMillimeter(10), ...        
        'dim_alpha', DimDegree(45).toRadians(), ...
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([0,0]), ...
            'theta', DimDegree([0]).toRadians() ...
        ) ...
        );

%% Define components

cs = arc1;

comp1 = Component( ...
        'name', 'comp1', ...
        'crossSections', cs, ...
        'material', MaterialGeneric('name', 'M19: USS Transformer 72 -- 29 Gage'), ...
        'makeSolid', MakeSimpleExtrude( ...
            'location', Location3D( ...
                'anchor_xyz', DimMillimeter([0,0,0]), ...
                'rotate_xyz', DimDegree([0,0,0]).toRadians() ...
                ), ...
            'dim_depth', DimMillimeter(0)) ...
        );

%% Draw via MagNet

if (DRAW_MAGNET)
    toolMn = MagNet();
    toolMn.open(0,0,true);
    toolMn.setDefaultLengthUnit('millimeters', false);

    comp1.make(toolMn, toolMn);

    toolMn.viewAll();
end

%% Draw via TikZ

if (DRAW_TIKZ)
    toolTikz = TikZ();
    toolTikz.open('output.txt');

    comp1.make(toolTikz);

    toolTikz.close();
end

if (DRAW_XFEMM)
    toolXFEMM = XFEMM();
    toolXFEMM.newFemmProblem(0,'planar','millimeters');
    comp1.make(toolXFEMM,toolXFEMM);
    FemmProblem = toolXFEMM.returnFemmProblem();

    plotfemmproblem(FemmProblem)
end
