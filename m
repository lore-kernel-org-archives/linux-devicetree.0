From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree fixes for 5.3-rc, take 2
Date: Fri, 26 Jul 2019 18:03:50 -0600
Message-ID: <CAL_JsqJLB4q6wqTOX0oXAGQF4wuZ0irNT8nmpFEmuUKjvv38BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull some more DT fixes for 5.3. The nvmem changes would
typically go thru Greg's tree, but they were missed in the merge
window and I've been unable to get a response (partly because Srinivas
is out on vacation it appears).

Rob


The following changes since commit e2297f7c3ab3b68dda2ac732b1767212019d3bdf:

  dt-bindings: pinctrl: stm32: Fix missing 'clocks' property in
examples (2019-07-20 20:28:53 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-5.3-2

for you to fetch changes up to e1ff7390f58e609aa113a2452a953f669abce6cc:

  dt-bindings: Fix more $id value mismatches filenames (2019-07-26
17:41:41 -0600)

----------------------------------------------------------------
Devicetree fixes for 5.3-rc:

- Fix mismatches in $id values and actual filenames. Now checked by
  tools.

- Convert nvmem binding to DT schema

- Fix a typo in of_property_read_bool() kerneldoc

- Remove some redundant description in al-fic interrupt-controller

----------------------------------------------------------------
Maxime Ripard (2):
      dt-bindings: nvmem: Add YAML schemas for the generic NVMEM bindings
      dt-bindings: nvmem: SID: Fix the examples node names

Rob Herring (2):
      dt-bindings: clk: allwinner,sun4i-a10-ccu: Correct path in $id
      dt-bindings: Fix more $id value mismatches filenames

Talel Shenhar (1):
      dt-bindings: interrupt-controller: al-fic: remove redundant binding

Thierry Reding (1):
      of: Fix typo in kerneldoc

 Documentation/devicetree/bindings/arm/renesas.yaml |  2 +-
 .../bindings/arm/socionext/milbeaut.yaml           |  2 +-
 .../devicetree/bindings/arm/ti/ti,davinci.yaml     |  2 +-
 .../bindings/clock/allwinner,sun4i-a10-ccu.yaml    |  2 +-
 .../intel,ixp4xx-network-processing-engine.yaml    |  2 +-
 .../devicetree/bindings/iio/accel/adi,adxl345.yaml |  2 +-
 .../devicetree/bindings/iio/accel/adi,adxl372.yaml |  2 +-
 .../interrupt-controller/amazon,al-fic.txt         | 16 ++--
 .../intel,ixp4xx-interrupt.yaml                    |  2 +-
 ...er.yaml => intel,ixp4xx-ahb-queue-manager.yaml} |  2 +-
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |  2 +-
 .../bindings/nvmem/allwinner,sun4i-a10-sid.yaml    |  4 +-
 .../devicetree/bindings/nvmem/nvmem-consumer.yaml  | 45 +++++++++++
 Documentation/devicetree/bindings/nvmem/nvmem.txt  | 81 +------------------
 Documentation/devicetree/bindings/nvmem/nvmem.yaml | 93 ++++++++++++++++++++++
 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml         |  2 +-
 .../bindings/timer/intel,ixp4xx-timer.yaml         |  2 +-
 include/linux/of.h                                 |  2 +-
 18 files changed, 161 insertions(+), 104 deletions(-)
 rename Documentation/devicetree/bindings/misc/{intel,ixp4xx-queue-manager.yaml
=> intel,ixp4xx-ahb-queue-manager.yaml} (95%)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem.yaml
