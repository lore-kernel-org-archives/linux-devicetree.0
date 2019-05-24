From: Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Devicetree fixes for 5.2-rc
Date: Fri, 24 May 2019 16:01:21 -0500
Message-ID: <CAL_JsqKUbPziR3dHi15K-uZUH_D-GtodV_LVqw+EhEGLeZZZHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull.

Rob


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-5.2

for you to fetch changes up to 852d095d16a6298834839f441593f59d58a31978:

  checkpatch.pl: Update DT vendor prefix check (2019-05-22 14:54:49 -0500)

----------------------------------------------------------------
Devicetree fixes for 5.2:

- Update checkpatch.pl to use DT vendor-prefixes.yaml

- Fix DT binding references to files converted to DT schema

- Clean-up Arm CPU binding examples to match schema

- Add Sifive block versioning scheme documentation

- Pass binding directory base to validation tools for reference lookups

----------------------------------------------------------------
Kamal Dasu (1):
      dt: bindings: mtd: replace references to nand.txt with
nand-controller.yaml

Mauro Carvalho Chehab (1):
      dt: fix refs that were renamed to json with the same file name

Paul Walmsley (1):
      dt-bindings: sifive: describe sifive-blocks versioning

Rob Herring (3):
      dt-bindings: Pass binding directory to validation tools
      dt-bindings: interrupt-controller: arm,gic: Fix schema errors in example
      checkpatch.pl: Update DT vendor prefix check

Robin Murphy (1):
      dt-bindings: arm: Clean up CPU binding examples

 Documentation/devicetree/bindings/Makefile         |  2 +-
 Documentation/devicetree/bindings/arm/arm-boards   |  4 +--
 .../devicetree/bindings/arm/cpu-capacity.txt       | 12 +++----
 .../devicetree/bindings/arm/omap/crossbar.txt      |  2 +-
 .../bindings/clock/samsung,s5pv210-clock.txt       |  2 +-
 .../bindings/interrupt-controller/arm,gic.yaml     | 24 +++++++-------
 .../marvell,odmi-controller.txt                    |  2 +-
 .../devicetree/bindings/leds/irled/spi-ir-led.txt  |  2 +-
 .../devicetree/bindings/mtd/amlogic,meson-nand.txt |  2 +-
 .../devicetree/bindings/mtd/brcm,brcmnand.txt      |  6 ++--
 .../devicetree/bindings/mtd/denali-nand.txt        |  6 ++--
 .../devicetree/bindings/mtd/fsmc-nand.txt          |  6 ++--
 .../devicetree/bindings/mtd/gpmc-nand.txt          |  2 +-
 .../devicetree/bindings/mtd/hisi504-nand.txt       |  2 +-
 .../devicetree/bindings/mtd/marvell-nand.txt       | 14 ++++----
 Documentation/devicetree/bindings/mtd/mxc-nand.txt |  6 ++--
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  6 ++--
 .../devicetree/bindings/mtd/oxnas-nand.txt         |  2 +-
 .../devicetree/bindings/mtd/qcom_nandc.txt         |  4 +--
 .../devicetree/bindings/mtd/samsung-s3c2410.txt    |  6 ++--
 .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    |  6 ++--
 .../devicetree/bindings/mtd/tango-nand.txt         |  2 +-
 .../devicetree/bindings/mtd/vf610-nfc.txt          |  8 ++---
 .../sifive/sifive-blocks-ip-versioning.txt         | 38 ++++++++++++++++++++++
 MAINTAINERS                                        |  4 +--
 scripts/Makefile.lib                               |  2 +-
 scripts/checkpatch.pl                              |  4 +--
 27 files changed, 108 insertions(+), 68 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
