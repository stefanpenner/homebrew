require 'formula'

class Skipfish <Formula
  url 'http://skipfish.googlecode.com/files/skipfish-1.07b.tgz'
  homepage 'http://code.google.com/p/skipfish/'
  md5 'e18b2b2e82dbd82f7d1bf534e9383cc0'

  depends_on 'libidn'

  def startup_script
    <<-EOS.undent
    #!/usr/bin/env bash
    # This is a startup script for Apache ActiveMQ that calls the 
    # real startup script installed to Homebrew's cellar.

    pushd #{libexec}
    ./skipfish "$@"
    popd
    EOS
  end
  
  def install
    system "make"
    cp 'dictionaries/default.wl','skipfish.wl'
    libexec.install Dir['**']
    (bin + 'skipfish').write startup_script
  end
end
