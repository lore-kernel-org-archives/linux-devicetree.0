Return-Path: <SRS0=4d3r=SO=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V3 0/7] Add USB3.0 and TI HD3SS3220 driver support
Date: Fri, 12 Apr 2019 11:16:12 +0100
Message-Id: <1555064179-15626-1-git-send-email-biju.das@bp.renesas.com>
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

This patchset is based on linux_next next-20190411 branch.

V2-->V3
  * Used the new API to usb_role_switch by node to find the remote endpoint
    (https://patchwork.kernel.org/patch/10882555/)
  * Added renesas,usb-role-switch property
  * Incorporated shimoda-san's review comment
    (https://patchwork.kernel.org/patch/10852507/)

V1-->V2
  * Use USB role class instead of extcon to receive connect and disconnect
    events and also for the dual role switch.
  * Dropped patch 6
  * Squashed patch 8 and patch 9
  * https://patchwork.kernel.org/cover/10840641/


Biju Das (7):
  dt-bindings: usb: hd3ss3220 device tree binding document
  dt-bindings: usb: renesas_usb3: Add renesas,usb-role-switch property
  usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
  usb: gadget: udc: renesas_usb3: Use usb_role_switch framework
  arm64: defconfig: enable TYPEC_HD3SS3220 config option
  arm64: dts: renesas: r8a774c0-cat874: Enable USB3.0 host/peripheral
    device node
  arm64: dts: renesas: r8a774c0-cat874: Enable usb role switch support

 .../devicetree/bindings/usb/renesas_usb3.txt       |  22 ++
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       |  37 +++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  56 +++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 126 ++++++++--
 drivers/usb/typec/Kconfig                          |  10 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/hd3ss3220.c                      | 278 +++++++++++++++++++++
 8 files changed, 510 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 drivers/usb/typec/hd3ss3220.c

-- 
2.7.4
