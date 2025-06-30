class Nova < Formula
  desc "AI-powered Python test fixer"
  homepage "https://joinnova.com"
  version "1.0.0"
  
  # You'll upload the binary to GitHub releases on your public homebrew repo
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/novasolve/homebrew-novasolve/releases/download/v1.0.0/nova-1.0.0-arm64.tar.gz"
    sha256 "YOUR_SHA256_HERE"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/novasolve/homebrew-novasolve/releases/download/v1.0.0/nova-1.0.0-x86_64.tar.gz"
    sha256 "YOUR_SHA256_HERE"
  end

  def install
    bin.install "nova"
  end

  test do
    system "#{bin}/nova", "--version"
  end
end 