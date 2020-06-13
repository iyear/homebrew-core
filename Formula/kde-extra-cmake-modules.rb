class KdeExtraCmakeModules < Formula
  desc "Extra modules and scripts for CMake"
  homepage "https://api.kde.org/frameworks/extra-cmake-modules/html/index.html"
  url "https://download.kde.org/stable/frameworks/5.71/extra-cmake-modules-5.71.0.tar.xz"
  sha256 "64f41c0b4b3164c7be8fcab5c0181253d97d1e9d62455fd540cb463afd051878"
  head "https://invent.kde.org/frameworks/extra-cmake-modules.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "b0ac3bc7030cc890fedc12a009ed6b426ff521bb13281ec9b618b97438eb766f" => :catalina
    sha256 "13bdd8884d3688c2835e5d1b210ca5706be7ed2a0be096401db25941226ad2ff" => :mojave
    sha256 "b0ac3bc7030cc890fedc12a009ed6b426ff521bb13281ec9b618b97438eb766f" => :high_sierra
  end

  depends_on "cmake" => [:build, :test]
  depends_on "qt" => :build
  depends_on "sphinx-doc" => :build

  def install
    args = std_cmake_args
    args << "-DBUILD_HTML_DOCS=ON"
    args << "-DBUILD_MAN_DOCS=ON"
    args << "-DBUILD_QTHELP_DOCS=ON"
    args << "-DBUILD_TESTING=OFF"

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(ECM REQUIRED)")
    system "cmake", ".", "-Wno-dev"

    expected="ECM_DIR:PATH=#{HOMEBREW_PREFIX}/share/ECM/cmake"
    assert_match expected, File.read(testpath/"CMakeCache.txt")
  end
end
