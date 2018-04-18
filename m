Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 00/11] add support for R-Car USB3.0 role switch
Date: Wed, 18 Apr 2018 17:09:54 +0900
Message-Id: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on v4.17-rc1.

In last week, I submitted a patch as v1 [1]. But, the v1 patch
doesn't use graphs to get usb host device pointer. So, I modified
some frameworks for it.
Since the patch 4 "of: platform: add device connection parsing"
has TODOs, I marked this patch set as "RFC". Before I resolve them,
I would like to know whether this way is good or not.

[1] https://patchwork.kernel.org/patch/10332865/


Yoshihiro Shimoda (11):
  Documentation: of: Add device-connection-id property
  dt-bindings: usb: add usb role switch driver
  dt-bindings: usb: add Renesas R-Car USB 3.0 role switch driver
  of: platform: add device connection parsing
  usb: common: roles: add fwnode graph parsing
  usb: common: roles: Allow if the parent dev_name matches
  usb: common: roles: add getting device pointer APIs
  usb: role: rcar-usb3-role-switch: add support for R-Car SoCs
  usb: gadget: udc: renesas_usb3: add support for a usb role switch
  arm64: dts: renesas: r8a7795: add OF graph for usb role switch
  arm64: dts: renesas: r8a7795: salvator-xs: add OF graph for usb role
    switch

 Documentation/devicetree/bindings/graph.txt        |   2 +-
 .../bindings/usb/renesas,rcar-usb3-role-sw.txt     |  56 +++++++
 .../devicetree/bindings/usb/usb-role-switch.txt    |  42 +++++
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |  28 ++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  44 +++++
 drivers/of/platform.c                              |  66 ++++++++
 drivers/usb/common/roles.c                         |  84 +++++++++-
 drivers/usb/gadget/udc/Kconfig                     |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c              |  34 +++-
 drivers/usb/roles/Kconfig                          |  12 ++
 drivers/usb/roles/Makefile                         |   1 +
 drivers/usb/roles/rcar-usb3-role-switch.c          | 179 +++++++++++++++++++++
 include/linux/of.h                                 |   1 +
 include/linux/usb/role.h                           |   4 +
 14 files changed, 545 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-role-switch.txt
 create mode 100644 drivers/usb/roles/rcar-usb3-role-switch.c

-- 
1.9.1
