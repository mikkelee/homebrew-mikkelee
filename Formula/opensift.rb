class Opensift < Formula
  desc "Open-Source SIFT Library"
  homepage "https://github.com/robwhess/opensift"
  head "https://github.com/robwhess/opensift.git", :revision => "195d764062205c0aff4b71d6f21608d764009eed"

  depends_on "pkg-config" => :build
  depends_on "opencv@2"
  depends_on "gtk+"

  patch :DATA

  def install
    system "make", "libopensift.a"
    
    (include/"opensift").install Dir["include/*.h"]
    (lib/"opensift").install Dir["lib/*.a"]
  end
end

__END__
diff --git a/include/imgfeatures.h b/include/imgfeatures.h
index 1d8224e..22f49a1 100644
--- a/include/imgfeatures.h
+++ b/include/imgfeatures.h
@@ -9,7 +9,10 @@
 #ifndef IMGFEATURES_H
 #define IMGFEATURES_H
 
-#include "cxcore.h"
+#include <opencv2/core/core_c.h>
+#include <opencv2/imgproc/imgproc_c.h>
+#define CV_RGB(r, g, b)  cvScalar((b), (g), (r), 0)
+
 
 /** FEATURE_OXFD <BR> FEATURE_LOWE */
 enum feature_type
diff --git a/include/kdtree.h b/include/kdtree.h
index d244a85..980c1e8 100644
--- a/include/kdtree.h
+++ b/include/kdtree.h
@@ -18,7 +18,7 @@
 #ifndef KDTREE_H
 #define KDTREE_H
 
-#include "cxcore.h"
+#include <opencv2/core/core_c.h>
 
 
 /********************************* Structures ********************************/
diff --git a/include/sift.h b/include/sift.h
index 5711448..cc621c3 100644
--- a/include/sift.h
+++ b/include/sift.h
@@ -20,7 +20,7 @@
 #ifndef SIFT_H
 #define SIFT_H
 
-#include "cxcore.h"
+#include <opencv2/core/core_c.h>
 
 /******************************** Structures *********************************/
 
diff --git a/include/utils.h b/include/utils.h
index 770067b..234ac8b 100644
--- a/include/utils.h
+++ b/include/utils.h
@@ -9,7 +9,7 @@
 #ifndef UTILS_H
 #define UTILS_H
 
-#include "cxcore.h"
+#include <opencv2/core/core_c.h>
 
 #include <stdio.h>
 #include <dirent.h>
diff --git a/include/xform.h b/include/xform.h
index baca8d5..b4d70c8 100644
--- a/include/xform.h
+++ b/include/xform.h
@@ -9,7 +9,7 @@
 #ifndef XFORM_H
 #define XFORM_H
 
-#include <cxcore.h>
+#include <opencv2/core/core_c.h>
 
 
 /********************************** Structures *******************************/
diff --git a/src/dspfeat.c b/src/dspfeat.c
index 9aeba1c..a511621 100644
--- a/src/dspfeat.c
+++ b/src/dspfeat.c
@@ -9,8 +9,8 @@
 #include "imgfeatures.h"
 #include "utils.h"
 
-#include <cxcore.h>
-#include <highgui.h>
+#include <opencv2/core/core_c.h>
+#include <opencv2/highgui/highgui_c.h>
 
 #include <unistd.h>
 
diff --git a/src/imgfeatures.c b/src/imgfeatures.c
index 4e518d4..7e095f8 100644
--- a/src/imgfeatures.c
+++ b/src/imgfeatures.c
@@ -9,8 +9,6 @@
 #include "utils.h"
 #include "imgfeatures.h"
 
-#include <cxcore.h>
-
 static int import_oxfd_features( char*, struct feature** );
 static int export_oxfd_features( char*, struct feature*, int );
 static void draw_oxfd_features( IplImage*, struct feature*, int );
diff --git a/src/kdtree.c b/src/kdtree.c
index a7bdb06..dfd1d66 100644
--- a/src/kdtree.c
+++ b/src/kdtree.c
@@ -19,7 +19,7 @@
 #include "imgfeatures.h"
 #include "utils.h"
 
-#include <cxcore.h>
+#include <opencv2/core/core_c.h>
 
 #include <stdio.h>
 
diff --git a/src/match.c b/src/match.c
index fe6f360..740974b 100644
--- a/src/match.c
+++ b/src/match.c
@@ -12,9 +12,8 @@
 #include "utils.h"
 #include "xform.h"
 
-#include <cv.h>
-#include <cxcore.h>
-#include <highgui.h>
+#include <opencv2/core/core_c.h>
+#include <opencv2/highgui/highgui_c.h>
 
 #include <stdio.h>
 
diff --git a/src/match_num.c b/src/match_num.c
index 7a74cac..d541005 100644
--- a/src/match_num.c
+++ b/src/match_num.c
@@ -12,9 +12,8 @@
 #include "utils.h"
 #include "xform.h"
 
-#include <cv.h>
-#include <cxcore.h>
-#include <highgui.h>
+#include <opencv2/core/core_c.h>
+#include <opencv2/highgui/highgui_c.h>
 
 #include <stdio.h>
 #include <pthread.h>
diff --git a/src/sift.c b/src/sift.c
index e0cb6e3..9889ced 100644
--- a/src/sift.c
+++ b/src/sift.c
@@ -21,8 +21,7 @@
 #include "imgfeatures.h"
 #include "utils.h"
 
-#include <cxcore.h>
-#include <cv.h>
+#include <opencv2/core/core_c.h>
 
 /************************* Local Function Prototypes *************************/
 
diff --git a/src/utils.c b/src/utils.c
index b819fc6..52f6962 100644
--- a/src/utils.c
+++ b/src/utils.c
@@ -8,9 +8,9 @@
 
 #include "utils.h"
 
-#include <cv.h>
-#include <cxcore.h>
-#include <highgui.h>
+#include <opencv2/core/core_c.h>
+#include <opencv2/highgui/highgui_c.h>
+#include <opencv2/imgproc/types_c.h>
 
 #include <gdk/gdk.h>
 #include <gtk/gtk.h>
diff --git a/src/xform.c b/src/xform.c
index 1560994..4b747a1 100644
--- a/src/xform.c
+++ b/src/xform.c
@@ -11,7 +11,8 @@
 #include "imgfeatures.h"
 #include "utils.h"
 
-#include <cxcore.h>
+#include <opencv2/core/core_c.h>
+#include <opencv2/highgui/highgui_c.h>
 
 #include <stdlib.h>
 #include <time.h>
