class MinimaxStatusline < Formula
  desc "Configurable, themeable statusline for the MiniMax CLI / Coding Plan"
  homepage "https://github.com/liush2yuxjtu/minimax-statusline"
  url "https://github.com/liush2yuxjtu/minimax-statusline/archive/refs/tags/v0.2.0.tar.gz"
  sha256 ""
  license "MIT"
  head "https://github.com/liush2yuxjtu/minimax-statusline.git", branch: "main"

  depends_on "bash"
  depends_on "python@3.11"

  def install
    libexec.install "minimax-statusline.sh"
    libexec.install "lib"
    libexec.install "themes"
    libexec.install "config.example.toml"
    (bin/"minimax-statusline").write <<~SH
      #!/usr/bin/env bash
      exec "#{libexec}/minimax-statusline.sh" "$@"
    SH
    chmod 0755, bin/"minimax-statusline"
  end

  test do
    assert_match "minimax-statusline #{version}", shell_output("#{bin}/minimax-statusline --version")
  end
end
