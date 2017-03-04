From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/2] Meson GXL USB2 PHY driver
Date: Sat,  4 Mar 2017 23:22:29 +0100
Message-ID: <20170304222231.14496-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds a driver for the USB2 PHYs found in Amlogic Meson GXL
(and GXM) SoCs.
Devicetree changes are intentionally missing in this series because of
various other problems that need to be resolved before we get USB host
support working.

As usual we unfortunately don't have any documentation available. The
register definitions were taken from the vendor's GPL kernel sources
(see [5] if you are really interested). Translation to human readable
names is done using the "best effort" algorithm.

The USB situation on GXL and GXM is a bit special:
the SoCs include both, a dwc3 and a dwc2 controller. The dwc3 controller
IP only supports host-mode, while the dwc2 controller IP only supports
device mode.
The dwc3 controller has all USB3 ports disabled. GXL has two USB2 ports
enabled on dwc3's internal hub, while GXM has three USB2 ports enabled.
This makes the initialization a bit special: to enable any of the dwc3
controller's USB2 ports *ALL* PHYs have to be initialized (probably due
to the hub's routing logic).
The first USB2 PHY (hardware-wise) also supports OTG mode. The vendor
kernel implements this through the USB3 PHY by re-routing the first
USB2 PHY from the dwc3 controller to the dwc2 controller (which is
disabled by default, but if the USB3 PHY detects that the port should
enter device mode it enables the dwc2 controller).

To get USB host mode working the following steps are needed:
- xhci-plat must be able to manage more than one PHY for a controller,
  this is work-in-progress, see [0]
- there are some DMA handling issues in dwc3 and the rest of the USB
  stack, this is solved by the "sysdev" patches from [1]
- adding all USB related bits to meson-gxl.dtsi - this is work in
  progress but depends on the previous TODOs, see [2] and [3]

This supersedes my previous series "Meson GXL and GXM USB support" [4].

[0] https://www.spinics.net/lists/linux-usb/msg151837.html
[1] http://www.mail-archive.com/linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg87077.html
[2] https://github.com/xdarklight/linux/commit/e2b83785687fe859ae4bba8da8bb2fb2d7e32bfb
[3] https://github.com/xdarklight/linux/commit/203ab9ea5d1bea0bf066b6738010c8072b821d87
[4] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001721.html
[5] https://github.com/khadas/linux/blob/76fd19ac41bb774e396ce8009ff665f29c26c535/include/linux/amlogic/usb-gxl.h

Martin Blumenstingl (2):
  Documentation: dt-bindings: Add documentation for the Meson GXL USB2
    PHY
  phy: meson: add USB2 PHY support for Meson GXL and GXM

 .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt |  17 ++
 drivers/phy/Kconfig                                |  13 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-meson-gxl-usb2.c                   | 263 +++++++++++++++++++++
 4 files changed, 294 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
 create mode 100644 drivers/phy/phy-meson-gxl-usb2.c

-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
