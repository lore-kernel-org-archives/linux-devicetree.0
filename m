From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree for 5.2
Date: Tue, 7 May 2019 18:53:25 -0500
Message-ID: <CAL_JsqJ8YqaiNwj715B=5r39RzuXLn1inhAQ044j8d-L0vYLZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DT updates for 5.2.

Rob

The following changes since commit 8c2ffd9174779014c3fe1f96d9dc3641d9175f00=
:

  Linux 5.1-rc2 (2019-03-24 14:02:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-5.2

for you to fetch changes up to 2a656cb5a4a3473c5fc6bf4fddc3560ceed53220:

  of: unittest: Remove error printing on OOM (2019-05-02 16:38:59 -0500)

----------------------------------------------------------------
Devicetree for 5.2:

- Fix possible memory leak in reserved-memory failure case

- Support for DMA parent bus which are not a parent node

- Clang -Wunsequenced fix

- Remove some unnecessary prints on memory alloc failures

- Various printk msg and comment fixes

- Update DT schema tools repository location

- Convert simple-framebuffer binding to DT schema

- Bindings for isl68137 and ir38064 trivial devices

- New documentation on binding do's and don't's for binding writers to
  ignore

----------------------------------------------------------------
Chris Packham (1):
      of: use correct function prototype for of_overlay_fdt_apply()

Christian Lamparter (1):
      dt-bindings: pinctrl: fix bias-pull,up typo

Cl=C3=A9ment P=C3=A9ron (1):
      dt-bindings: mfd: axp20x: Add fallback for axp805

Florian Fainelli (1):
      of: Improve of_phandle_iterator_next() error message

Geert Uytterhoeven (2):
      of: irq: Remove WARN_ON() for kzalloc() failure
      of: unittest: Remove error printing on OOM

Jojo Zeng (1):
      of/device.c: fix the wrong comments

Maxime Ripard (6):
      of: property: Document that of_graph_get_endpoint_by_regs needs
of_node_put
      dt-bindings: interconnect: Add a dma interconnect name
      dt-bindings: bus: Add binding for the Allwinner MBUS controller
      of: address: Retrieve a parent through a callback in
__of_translate_address
      of: address: Add support for the parent DMA bus
      dt-bindings: Add schemas for simple-framebuffer

Miquel Raynal (1):
      dt-bindings: connector: Spelling mistake

Patrick Venture (2):
      dt-bindings: Add ir38064 as a trivial device
      dt-bindings: Add isl68137 as a trivial device

Phong Tran (1):
      of: fix clang -Wunsequenced for be32_to_cpu()

Rob Herring (3):
      dt-bindings: Add a guide of do's and don't's for writing bindings
      dt-bindings: Require child nodes type to be 'object'
      dt-bindings: Update schema project location to devicetree.org github =
group

pierre Kuo (1):
      of: reserved_mem: fix reserve memory leak

xiaojiangfeng (1):
      of: del redundant type conversion

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 .../devicetree/bindings/arm/sunxi/sunxi-mbus.txt   |  36 +++++
 .../bindings/connector/usb-connector.txt           |   2 +-
 .../display/amlogic,simple-framebuffer.txt         |  33 -----
 .../bindings/display/simple-framebuffer-sunxi.txt  |  36 -----
 .../bindings/display/simple-framebuffer.txt        |  91 ------------
 .../bindings/display/simple-framebuffer.yaml       | 160 +++++++++++++++++=
++++
 .../bindings/interconnect/interconnect.txt         |   4 +
 .../bindings/interrupt-controller/arm,gic.yaml     |   1 +
 Documentation/devicetree/bindings/mfd/axp20x.txt   |   1 +
 .../bindings/pinctrl/qcom,apq8064-pinctrl.txt      |   2 +-
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      |   2 +-
 .../bindings/pinctrl/qcom,ipq8064-pinctrl.txt      |   2 +-
 .../bindings/pinctrl/qcom,msm8660-pinctrl.txt      |   2 +-
 .../bindings/pinctrl/qcom,msm8974-pinctrl.txt      |   2 +-
 .../bindings/timer/arm,arch_timer_mmio.yaml        |   1 +
 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 .../devicetree/bindings/writing-bindings.txt       |  60 ++++++++
 Documentation/devicetree/writing-schema.md         |   2 +-
 drivers/of/address.c                               |  40 +++++-
 drivers/of/base.c                                  |   5 +-
 drivers/of/device.c                                |   2 +-
 drivers/of/fdt.c                                   |   2 +-
 drivers/of/irq.c                                   |   2 +-
 drivers/of/of_reserved_mem.c                       |  22 ++-
 drivers/of/property.c                              |   2 +-
 drivers/of/unittest.c                              |  13 +-
 include/linux/of.h                                 |   7 +-
 28 files changed, 341 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.=
txt
 delete mode 100644
Documentation/devicetree/bindings/display/amlogic,simple-framebuffer.txt
 delete mode 100644
Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
 delete mode 100644
Documentation/devicetree/bindings/display/simple-framebuffer.txt
 create mode 100644
Documentation/devicetree/bindings/display/simple-framebuffer.yaml
 create mode 100644 Documentation/devicetree/bindings/writing-bindings.txt
