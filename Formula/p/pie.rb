class Pie < Formula
  desc "PHP Installer for Extensions"
  homepage "https://github.com/php/pie"
  url "https://github.com/php/pie/releases/download/0.4.0/pie.phar"
  sha256 "3d8183493a7b16d4530778f2ad2209d113ba4dc15a0fa19600678b6c59ae3ed0"
  license "BSD-3-Clause"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cdb20e997f91ff345215ceee4dde30142d606df741c68828619cd6c778f378f9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cdb20e997f91ff345215ceee4dde30142d606df741c68828619cd6c778f378f9"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "cdb20e997f91ff345215ceee4dde30142d606df741c68828619cd6c778f378f9"
    sha256 cellar: :any_skip_relocation, sonoma:        "17a3fea8ede581f7f84c891abf02342d3e0edfeb290f9490ee9e4f536aa7ea8c"
    sha256 cellar: :any_skip_relocation, ventura:       "17a3fea8ede581f7f84c891abf02342d3e0edfeb290f9490ee9e4f536aa7ea8c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "374978fa3c7c8e261d83ef2ab9c8baa816e10122fadf49f8dacac13ca7eb8768"
  end

  depends_on "php"

  def install
    bin.install "pie.phar" => "pie"
    generate_completions_from_executable("php", bin/"pie", "completion")
  end

  test do
    system bin/"pie", "build", "apcu/apcu"
  end
end
