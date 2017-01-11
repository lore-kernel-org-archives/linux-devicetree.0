From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC PATCH 0/2] initialize (multiple) PHYs in xhci-plat
Date: Wed, 11 Jan 2017 16:29:45 +0100
Message-ID: <20170111152947.27088-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series is the outcome of a discussion with Felipe Balbi,
see [0] and [1].
The quick-summary of this is:
- dwc3 already takes one USB2 and one USB3 PHY and initializes these
  correct
- some other HCI platform drivers (like ehci-platform.c, xhci-mtk.c and
  ohci-platform.c) do not have a limitation on the number of PHYs - they
  support one PHY per actual host port
- Amlogic Meson GXL and GXM SoCs come with a dwc3 IP block which has two
  or three USB2 ports enabled on the internal root-hub. The SoCs also
  provide separate USB2 PHYs, one per port. All USB2 PHYs (which are
  internally "connected" to the dwc3 roothub) need to be powered on,
  otherwise USB devices cannot be enumerated (even if just one PHY is
  disabled and if the device is plugged into another, enabled port)

In my first attempt to get USB supported on the GXL and GXM SoCs I tried
to work-around the problem that I could not pass multiple PHYs to the
dwc3 controller.
This was rejected by Rob Herring (which was definitely the thing to do in
my opinion), see [2]

This series adds a new "platform-roothub". This can be configured through
devicetree by passing a child-node with "reg = <0>" to the USB
controller. Additionally there has to be a child-node for each port on
the root-hub. Each of the child-nodes takes a "phys" and "phy-names"
property. This allows modeling the root-hub in devicetree similar to the
USB device binding (documented in devicetree/bindings/usb/usb-device.txt)
This avoids and backwards-compatibility problems (which was a concern
regardless of the solution, see [3]) since the binding for the root-hub
was previously not specified (and we're not using the "phys" property of
the controller, which might have served different purposes before,
depending on the drivers).

Additionally this integrates the new platform-roothub into xhci-plat.c
which automatically enables it for the dwc3 driver (in host-mode).


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001945.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001947.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001818.html
[3] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001948.html

Martin Blumenstingl (2):
  usb: host: add a generic platform USB roothub driver
  usb: host: xhci: plat: integrate the platform-roothub

 .../devicetree/bindings/usb/usb-roothub.txt        |  41 ++++++
 Documentation/devicetree/bindings/usb/usb-xhci.txt |   7 +
 drivers/usb/host/Kconfig                           |   4 +
 drivers/usb/host/Makefile                          |   2 +
 drivers/usb/host/platform-roothub.c                | 146 +++++++++++++++++++++
 drivers/usb/host/platform-roothub.h                |  14 ++
 drivers/usb/host/xhci-plat.c                       |  37 +++++-
 drivers/usb/host/xhci.h                            |   3 +
 8 files changed, 251 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-roothub.txt
 create mode 100644 drivers/usb/host/platform-roothub.c
 create mode 100644 drivers/usb/host/platform-roothub.h

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
