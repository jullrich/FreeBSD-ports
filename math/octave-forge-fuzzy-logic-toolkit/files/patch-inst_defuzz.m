--- inst/defuzz.m.orig	2014-07-02 00:11:06 UTC
+++ inst/defuzz.m
@@ -1,4 +1,4 @@
-## Copyright (C) 2011-2014 L. Markowsky <lmarkov@users.sourceforge.net>
+## Copyright (C) 2011-2018 L. Markowsky <lmarkov@users.sourceforge.net>
 ##
 ## This file is part of the fuzzy-logic-toolkit.
 ##
@@ -162,7 +162,16 @@ endfunction
 function crisp_x = mom (x, y)
 
   max_y = max (y);
-  y_val = @(y_val) if (y_val == max_y) 1 else 0 endif;
+
+  function y_val = calc_yval(y_val)
+    if (y_val == max_y)
+      y_val = 1;
+    else
+      y_val = 0;
+    endif
+  endfunction
+
+  y_val = @(y_val) calc_yval(y_val);
   max_y_locations = arrayfun (y_val, y);
   crisp_x = sum (x .* max_y_locations) / sum (max_y_locations);
 
@@ -185,7 +194,16 @@ endfunction
 function crisp_x = som (x, y)
 
   max_y = max (y);
-  y_val = @(y_val) if (y_val == max_y) 1 else (NaN) endif;
+
+  function y_val = calc_yval(y_val)
+    if (y_val == max_y)
+      y_val = 1;
+    else
+      y_val = (NaN);
+    endif
+  endfunction
+
+  y_val = @(y_val) calc_yval(y_val);
   max_y_locations = arrayfun (y_val, y);
   crisp_x = min (x .* max_y_locations);
 
@@ -207,7 +225,16 @@ endfunction
 function crisp_x = lom (x, y)
 
   max_y = max (y);
-  y_val = @(y_val) if (y_val == max_y) 1 else (NaN) endif;
+
+  function y_val = calc_yval(y_val)
+    if (y_val == max_y)
+      y_val = 1;
+    else
+      y_val = (NaN);
+    endif
+  endfunction
+
+  y_val = @(y_val) calc_yval(y_val);
   max_y_locations = arrayfun (y_val, y);
   crisp_x = max (x .* max_y_locations);
 
