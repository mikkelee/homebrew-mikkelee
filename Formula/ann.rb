class Ann < Formula
  desc "ANN: A Library for Approximate Nearest Neighbor Searching"
  homepage "https://www.cs.umd.edu/~mount/ANN/"
  url "https://www.cs.umd.edu/~mount/ANN/Files/1.1.2/ann_1.1.2.tar.gz"
  sha256 "eea03f2e224b66813226d775053316675375dcec45bd263674c052d9324a49a5"
  version "1.1.2"

  def patches
    :DATA
  end

  def install
    system "make", "macosx-g++"
    include.install Dir["include/*"]
    lib.install Dir["lib/*"]
  end
end

__END__
diff --git a/ann2fig/ann2fig.cpp b/ann2fig/ann2fig.cpp
index d9ad3e5..87d70f3 100644
--- a/ann2fig/ann2fig.cpp
+++ b/ann2fig/ann2fig.cpp
@@ -580,7 +580,7 @@ void readANN()
 // procedure.
 //----------------------------------------------------------------------
 
-main(int argc, char **argv)
+int main(int argc, char **argv)
 {
 	getArgs(argc, argv);						// get input arguments
 	readANN();									// read the dump file
