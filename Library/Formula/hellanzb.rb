require 'formula'

class Hellanzb <Formula
  head 'git://github.com/pjenvey/hellanzb.git'
  homepage 'http://github.com/pjenvey/hellanzb'
  version 'master'

  depends_on 'par'
  depends_on 'par2'
  depends_on 'unrar'

  def install
    system "python setup.py install"
  end
end
