Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v2 0/6] usb: role: rcar-usb3-role-switch: add support for R-Car SoCs
Date: Thu, 26 Apr 2018 20:26:40 +0900
Message-Id: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on renesas-drivers-2018-04-17-v4.17-rc1 tag
of renesas-drivers.git

In last week, I submitted a patch as RFC [1]. But, I completely
misunderstood the discussion of previous' one [2].

I marked this patch set as "RFC" because dtsi patch and udc patch
are not good for upstreaming (should separate a few patches).
I would like to know whether this way is good or not.

[1] https://patchwork.kernel.org/patch/10347511/
[2] https://patchwork.kernel.org/patch/10332865/

Changes from RFC:
 - Remove "device-connection-id" and "usb role switch driver" dt-bingings.
 - Remove drivers/of code.
 - Add a new API for find the connection by using graph on devcon.c and roles.c.
 - Use each new API on the rcar usb role switch and renesas_usb3 drivers.
 - Update the dtsi file for r8a7795.

Yoshihiro Shimoda (6):
  dt-bindings: usb: add Renesas R-Car USB 3.0 role switch
  base: devcon: add a new API to find the graph
  usb: common: roles: add a new API to find the graph
  usb: role: rcar-usb3-role-switch: add support for R-Car SoCs
  usb: gadget: udc: renesas_usb3: add support for a usb role switch
  arm64: dts: renesas: r8a7795: add OF graph for usb role switch

 .../bindings/usb/renesas,rcar-usb3-role-sw.txt     |  47 +++++
 Documentation/driver-api/device_connection.rst     |   4 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  38 +++++
 drivers/base/devcon.c                              |  43 +++++
 drivers/usb/common/roles.c                         |  30 ++++
 drivers/usb/gadget/udc/Kconfig                     |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c              |  34 +++-
 drivers/usb/roles/Kconfig                          |  13 ++
 drivers/usb/roles/Makefile                         |   1 +
 drivers/usb/roles/rcar-usb3-role-switch.c          | 190 +++++++++++++++++++++
 include/linux/device.h                             |   2 +
 include/linux/usb/role.h                           |   2 +
 12 files changed, 397 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
 create mode 100644 drivers/usb/roles/rcar-usb3-role-switch.c

-- 
1.9.1
