Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v4 0/4] usb: role: rcar-usb3-role-switch: add support for R-Car SoCs
Date: Tue, 22 May 2018 21:01:05 +0900
Message-Id: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on Felipe's usb.git / testing/next branch
(commit id = 47265c067c0d129f3a0e94bc221293a780af9d78).

I still marked this patch set as "RFC". I would like to know whether
this way is good or not. About last discusstion with Heikki:
 https://patchwork.kernel.org/patch/10397635/

Changes from RFC v3:
 - Rebase latest usb.git / testing/next branch.
 - Add graph parse into device_connection_find_match().
 - Use workqueue to call _usb3_set_mode() in patch 3.
   (I realized renesas_usb3_role_switch_set() cannot run on atomic because
    device_attach() might sleep.)

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
  base: devcon: add graph parse in device_connection_find_match()
  usb: gadget: udc: renesas_usb3: Add register of usb role switch
  usb: gadget: udc: renesas_usb3: use usb role switch API
  arm64: dts: renesas: r8a7795: add OF graph for usb role switch

 .../devicetree/bindings/usb/renesas_usb3.txt       |  15 +++
 Documentation/driver-api/device_connection.rst     |   2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  12 +++
 drivers/base/devcon.c                              |  15 +++
 drivers/usb/gadget/udc/Kconfig                     |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 105 ++++++++++++++++++++-
 include/linux/device.h                             |   2 +
 7 files changed, 150 insertions(+), 2 deletions(-)

-- 
1.9.1
