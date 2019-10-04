From: Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Devicetree fixes for v5.4
Date: Fri, 4 Oct 2019 08:22:03 -0500
Message-ID: <20191004132203.GA29838@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull a few DT fixes for 5.4.

Rob

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-5.4

for you to fetch changes up to f437ade3296bacaddb6d7882ba0515940f01daf4:

  dt-bindings: phy: lantiq: Fix Property Name (2019-10-02 14:14:58 -0500)

----------------------------------------------------------------
DeviceTree fixes for v5.4:

Fix several 'dt_binding_check' build failures.

----------------------------------------------------------------
Maxime Ripard (5):
      dt-bindings: dsp: Fix fsl,dsp example
      dt-bindings: media: rc: Fix redundant string
      dt-bindings: iio: ad7192: Fix Regulator Properties
      dt-bindings: iio: ad7192: Fix DTC warning in the example
      dt-bindings: phy: lantiq: Fix Property Name

 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml                | 1 +
 Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml         | 7 +++----
 Documentation/devicetree/bindings/media/rc.yaml                   | 1 -
 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)
