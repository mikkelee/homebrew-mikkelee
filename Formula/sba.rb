class Sba < Formula
  desc "Sparse Bundle Adjustment"
  homepage "http://users.ics.forth.gr/~lourakis/sba/"
  head "https://github.com/balintfodor/sba.git", :revision => "56cf7f90f83017c5d04141af4066b5c5b0e5abd2"
  url "http://users.ics.forth.gr/~lourakis/sba/sba-1.6.tgz"
  version "1.6"
  sha256 "29245e11ec52e2744307e116b5a961c0b7d7a7163180e763d254a348c149ce9a"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
