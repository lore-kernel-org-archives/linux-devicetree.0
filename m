From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v7 usb-next 0/4] initialize (multiple) PHYs on the roothub
Date: Mon, 23 Oct 2017 23:57:14 +0200
Message-ID: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series is the outcome of a discussion with Felipe Balbi,
see [0] and [1] as well as Mathias Nyman, see [7] and [8].
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

This series adds a new "roothub PHY wrapper". This can be configured
through devicetree by passing a child-node with "reg = <0>" (in other
words: it describes the roothub) to the USB controller.
Additionally there has to be a child-node for each port on
the root-hub. Each of the child-nodes takes a "phys" and "phy-names"
property. This allows modeling the root-hub in devicetree similar to the
USB device binding (documented in devicetree/bindings/usb/usb-device.txt)
This avoids and backwards-compatibility problems (which was a concern
regardless of the solution, see [3]) since the binding for the root-hub
was previously not specified (and we're not using the "phys" property of
the controller, which might have served different purposes before,
depending on the drivers).

Additionally this integrates the new roothub PHY wrapper into hcd.c
which automatically enables it for all USB controller drivers (tested
on an Amlogic Meson GXL SoC which uses a dwc3 controller).

Changes since v6 at [11]:
- fixed unnecessary whitespace change (noticed by Alan Stern - thanks)
- added PATCH #4 to clarify (with an example) how I understood how Rob
  wanted the dt-binding to look like (see [2]). please wait for an ACK
  from Rob on this one to make sure that we're not introducing some
  broken binding (as discussed with Arnd: [12])
- added Alan Stern's ACK on PATCH #3
- added Neil's Tested-by on PATCH #2 and #3

Changes since RfC v5 at [10]:
- dropped RfC prefix
- removed noisy dev_err if no roothub node was found (spotted by
  Xiaolong Ye's kbuild test robot - thank you for that!)
- moved the call to usb_phy_roothub_power_off() within
  hcd_bus_suspend() to make sure that the PHYs are turned off
  if the "race with a root-hub wakeup event" condition is met (in
  this case the PHYs are turned on again, with the old code we did
  break the PHYs internal ref-counting because we never turned the
  PHYs off before turning them on again in case of that special
  "race with a root-hub wakeup event").
  additionally we're not handling the status returned by
  usb_phy_roothub_power_off() anymore (the bus is already turned off
  and we tried to turn off all PHYs as well - only the PHYs which
  failed to power off will stay in the current state).
  thanks to Alan Stern for the suggestion
- removed return value from usb_phy_roothub_power_off() because none
  of my code uses it anymore. thanks to Alan Stern for the suggestion

Changes since v4 at [9]:
- renamed the subject of the cover-letter (old name was:
  "initialize (multiple) PHYs in xhci-plat")
- back into RFC status (see below for the reasons)
- dropped Tested-by from Chunfeng Yun (same reasons as RFC status)
- reworded cover-letter and commit messages from "platform-roothub"
  to "roothub PHY wrapper"
- moved code from drivers/usb/host/platform-roothub.* to
  drivers/usb/core/phy.* and the changes to
  drivers/usb/host/xhci-plat.c to drivers/usb/core/hcd.c as suggested
  by Mathias Nyman (as a benefit this will enable the new logic for
  non-xHCI controllers as well - however this was not tested yet)
- rename the structs, function names, etc from platform_roothub_* to
  usb_phy_roothub*

Changes since RFCv3 at [6]:
- moved the DT binding change from patch #3 to patch #1 as suggested
  by Rob Herring (and slightly adjusted the commit message to account
  for that)
- added Tested-by from Chunfeng Yun (who confirmed that the whole
  concept and implementation works fine on Mediatek SoCs - many thanks
  again!) to patch #2
- added Rob Herring's ACK to patches 1 and 3
- dropped RFC status (RFCv3 -> PATCH v4)

Changes since RFCv2 at [5]:
- split phy_{init,exit} and phy_power_{on,off} handling. up until RFCv2
  I called phy_init plus phy_power_on in platform_roothub_power_on and
  phy_power_off plus phy_exit in platform_roothub_power_off. However,
  Chunfeng Yun (a Mediatek SoC developer - many thanks for testing my
  series and providing great feedback) reported that only using
  phy_power_off (and omitting phy_exit) during system suspend fixes an
  issue where USB devices would be re-enumerated when resuming. His
  original problem description: "In order to keep link state on mt8173,
  we just power off all phys(not exit) when system enter suspend, then
  power on them again (needn't init, otherwise device will be
  disconnected) when system resume, this can avoid re-enumerating
  device.". This fix affects patch #2 and #3 as we now have
  platform_roothub_init (which calls phy_init internally),
  platform_roothub_power_on (which calls phy_power_on internally),
  platform_roothub_power_off (which calls phy_power_off internally) and
  platform_roothub_exit (which calls phy_exit internally). suspend and
  resume only call platform_roothub_power_{on,off} to prevent the issue
  described by Chunfeng Yun (unfortunately I cannot test this because
  the Amlogic platform currently does not support system suspend).
- dropped two struct forward declarations from platform-roothub.h which
  are not used in the header file (thanks to Chunfeng Yun for spotting
  this)

Changes since RFCv1 at [4]:
- split the usb-xhci dt-binding documentation into a separate patch
- fixed a typo ("usb-phy" -> "phys" in the dt-binding example)
- rebased to apply against latest usb-next


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001945.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001947.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2016-November/001818.html
[3] http://lists.infradead.org/pipermail/linux-amlogic/2017-January/001948.html
[4] http://marc.info/?l=linux-usb&m=148414866303604&w=2
[5] https://www.spinics.net/lists/linux-usb/msg158967.html
[6] https://www.spinics.net/lists/devicetree/msg190426.html
[7] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/004881.html
[8] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/004920.html
[9] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004685.html
[10] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/004924.html
[11] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/005049.html
[12] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/005121.html

Martin Blumenstingl (4):
  dt-bindings: usb: add the documentation for USB root-hub
  usb: core: add a wrapper for the USB PHYs on the root-hub
  usb: core: hcd: integrate the PHY roothub wrapper
  dt-bindings: usb: xhci: include the roothub and a device in the
    example

 .../devicetree/bindings/usb/usb-roothub.txt        |  46 ++++++
 Documentation/devicetree/bindings/usb/usb-xhci.txt |  30 ++++
 drivers/usb/core/Makefile                          |   2 +-
 drivers/usb/core/hcd.c                             |  26 +++
 drivers/usb/core/phy.c                             | 176 +++++++++++++++++++++
 drivers/usb/core/phy.h                             |   7 +
 include/linux/usb/hcd.h                            |   1 +
 7 files changed, 287 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-roothub.txt
 create mode 100644 drivers/usb/core/phy.c
 create mode 100644 drivers/usb/core/phy.h

-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
