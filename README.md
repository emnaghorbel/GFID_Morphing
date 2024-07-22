

Shape intersection function can be found in the following file : shape_intersection.m  (paper link : https://link.springer.com/article/10.1007/s00521-024-09798-5)

DPCC criterion function can be found in the following file : DPCC.m (paper link : https://ieeexplore.ieee.org/abstract/document/9866594)

GPC criterion function can be found in the following file : GPC.m (paper link : https://link.springer.com/article/10.1007/s00521-024-09798-5)

An Example of the GFID morphing between two shapes followed by the calculation of the DPCC and GPC criteria can be found in the following file : morphinggithubcriteriq.m

The pseudo-inverse Registrqtion algorithm introduced in the paper  **A fast and robust affine-invariant method for shape registration under partial occlusion** (link : https://link.springer.com/article/10.1007/s13735-021-00224-3 ) can be found in the file : recalage_distancel2.m

Arc length reparameterization : Reparametrage_euclidien2.m


Example of GFID morphing with the hyperparameter n0=2 :

![Extraction_de_contour](git1.png)
GPC= 5.406520423267544
DPCC= 5.587188102711261 (more sensitive to p and a variation)

Example of GFID morphing with the hyperparameter n0=5 :

![Extraction_de_contour](git2.png)
GPC= 10.525737816453134
DPCC= 4.509621984709076 (more sensitive to p and a variation)





