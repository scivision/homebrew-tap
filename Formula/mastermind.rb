class Mastermind < Formula
  desc "Mastermind game in Fortran"
  homepage "https://github.com/fortran-gaming/mastermind"
  url "https://github.com/fortran-gaming/mastermind/archive/v1.1.0.tar.gz"
  sha256 "234237b47666ab11027d7925e8c57a001bd611acd4f68bdf59f7cdcf5ed059d4"
  depends_on "cmake" => :build
  depends_on "gcc" => :build

  def install
    system "cmake", ".", "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=#{bin}",*std_cmake_args
    system "cmake", "--build", ".", "--target", "install"
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/mastermind", "4") do |stdin, stdout, _|
      stdin.close
      assert_equal " Welcome to MasterMind.   Rules:\nI choose a random combination of  4 colors (letters). \nYou have 10 tries to guess what I chose. \n The colors possible are: \n G Y B R V S\nRound #  1: Type guess as  4 letters:  ", stdout.read
      
    end
  end
end
