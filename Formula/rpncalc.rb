class Rpncalc < Formula
  desc "Fortran 2018 Reverse Polish Notation (RPN) calcular. Over 100 module/library functions not in standard Fortran"
  homepage "https://github.com/scivision/rpn-calc-fortran"
  url "https://github.com/scivision/rpn-calc-fortran/archive/v1.1.5.tar.gz"
  sha256 "b363f9cfcadf01d907f0d848bf8cdff8b25ee913ff253c98f3029c9788d2ee91"
  depends_on "cmake" => :build
  depends_on "gcc" => :build

  def install
      system "cmake", "src/", "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=#{bin}",*std_cmake_args
      system "cmake", "--build", ".", "--target", "install"
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/rpncalc", "4") do |stdin, stdout, _|
      stdin.close
      assert_equal " Fortran 2018  RPN Calculator, Version 1.1.5\n  ?  \n\n      0.00000000000000\n", stdout.read
    end
  end
end
