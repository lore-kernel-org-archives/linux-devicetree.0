Return-Path: <SRS0=k+DT=RJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/9] Add USB3.0 and TI HD3SS3220 driver support
Date: Wed,  6 Mar 2019 09:07:17 +0000
Message-Id: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This series adds USB 3.0 support for the CAT874 platform, including a
new driver for the TI HD3SS3220 USB Type-C DRP port controller.

This patch series supports:
1) Host hotplug operation
2) Device hot plug operation
3) USB type-C data_role switch 
   (Tested with 2 RZ/G2E boards connected with a Type-C cable)

This patchset is based on usb_next and renesas-devel-20190304-v5.0 branch.

Biju Das (9):
  dt-bindings: usb: hd3ss3220 device tree binding document
  dt-bindings: usb: renesas_usb3: add extcon support
  usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
  usb: gadget: udc: renesas_usb3: use extcon framework to receive
    connect/disconnect
  arm64: defconfig: enable TYPEC_HD3SS3220 config option
  arm64: renesas_defconfig: Enable TYPEC_HD3SS3220 config option
  arm64: dts: renesas: r8a774c0-cat874: enable USB3.0 host/peripheral
    device node
  arm64: dts: renesas: r8a774c0-cat874: Enable TI HD3SS3220 support
  arm64: dts: renesas: r8a774c0-cat874: Enable extcon support

 .../devicetree/bindings/usb/renesas_usb3.txt       |   2 +
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       |  15 ++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  31 +++
 arch/arm64/configs/defconfig                       |   2 +
 arch/arm64/configs/renesas_defconfig               |   2 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 115 +++++++--
 drivers/usb/typec/Kconfig                          |  10 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/hd3ss3220.c                      | 284 +++++++++++++++++++++
 9 files changed, 446 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 drivers/usb/typec/hd3ss3220.c

-- 
2.7.4
