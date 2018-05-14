Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v3 0/4] usb: role: rcar-usb3-role-switch: add support for R-Car SoCs
Date: Mon, 14 May 2018 18:15:56 +0900
Message-Id: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on Felipe's usb.git / testing/next branch
(commit id = 5d1332a8eabd8bd5b8c322d45542968ee6f113be).

I still marked this patch set as "RFC". I would like to know whether
this way is good or not.

Changes from RFC v2:
 - Add registering usb role switch into drivers/usb/gadget/udc/renesas_usb3
   because hardware resource (a register) is shared and remove individual
   usb role switch driver/dt-bindings for R-Car.
 - Remove "usb_role_switch_get_by_graph" API because the renesas_usb3 driver
   doesn't need such API now.

Changes from RFC:
 - Remove "device-connection-id" and "usb role switch driver" dt-bingings.
 - Remove drivers/of code.
 - Add a new API for find the connection by using graph on devcon.c and roles.c.
 - Use each new API on the rcar usb role switch and renesas_usb3 drivers.
 - Update the dtsi file for r8a7795.


Yoshihiro Shimoda (4):
  base: devcon: add a new API to find the graph
  usb: gadget: udc: renesas_usb3: Add register of usb role switch
  usb: gadget: udc: renesas_usb3: use usb role switch API
  arm64: dts: renesas: r8a7795: add OF graph for usb role switch

 .../devicetree/bindings/usb/renesas_usb3.txt       | 15 +++++
 Documentation/driver-api/device_connection.rst     |  4 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 12 ++++
 drivers/base/devcon.c                              | 43 +++++++++++++
 drivers/usb/gadget/udc/Kconfig                     |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 74 +++++++++++++++++++++-
 include/linux/device.h                             |  2 +
 7 files changed, 147 insertions(+), 4 deletions(-)

-- 
1.9.1
