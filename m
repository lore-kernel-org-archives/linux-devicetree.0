From: Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Devicetree fixes for 5.3-rc
Date: Sat, 20 Jul 2019 20:37:56 -0600
Message-ID: <CAL_JsqLTAAT1hEPkxD=BUvmovvA+rdsZdbVfQM6=1m9bvaEysQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull a couple of DT binding fixes for 5.3-rc.

Rob

The following changes since commit abdfd52a295fb5731ab07b5c9013e2e39f4d1cbe:

  Merge tag 'armsoc-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (2019-07-19
17:27:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-5.3

for you to fetch changes up to e2297f7c3ab3b68dda2ac732b1767212019d3bdf:

  dt-bindings: pinctrl: stm32: Fix missing 'clocks' property in
examples (2019-07-20 20:28:53 -0600)

----------------------------------------------------------------
Devicetree fixes for 5.3:

Fix several warnings/errors in validation of binding schemas.

----------------------------------------------------------------
Rob Herring (7):
      dt-bindings: Ensure child nodes are of type 'object'
      dt-bindings: riscv: Limit cpus schema to only check RiscV 'cpu' nodes
      dt-bindings: pinctrl: aspeed: Fix 'compatible' schema errors
      dt-bindings: pinctrl: aspeed: Fix AST2500 example errors
      dt-bindings: iio: avia-hx711: Fix avdd-supply typo in example
      dt-bindings: iio: ad7124: Fix dtc warnings in example
      dt-bindings: pinctrl: stm32: Fix missing 'clocks' property in examples

 .../bindings/bus/allwinner,sun8i-a23-rsb.yaml      |   1 +
 .../devicetree/bindings/iio/adc/adi,ad7124.yaml    |  71 +++++-----
 .../devicetree/bindings/iio/adc/avia-hx711.yaml    |   2 +-
 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   1 +
 .../devicetree/bindings/mtd/nand-controller.yaml   |   1 +
 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   |   4 +-
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   |   9 +-
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   7 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  | 143 +++++++++------------
 .../bindings/spi/allwinner,sun4i-a10-spi.yaml      |   1 +
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml      |   1 +
 11 files changed, 119 insertions(+), 122 deletions(-)
