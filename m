From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH v8 0/3] the fixup for the USB HOST1 at rk3288 platform
Date: Sun, 25 Sep 2016 02:50:16 +0800
Message-ID: <1474743019-1050-1-git-send-email-ayaka@soulik.info>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

  At this stage it is the only "full features" and well verified 
USB EHCI controller in this platform. More review is always necessary.

Although V7 is almost fine but a forget a dummy function for the phy
system.

changelog:
v7
  add the forgot dummy phy_reset() for the generic phy is disabled.
v7
  Some minor fixup
v6
  Send the last two patches
v5
  A few modification at style, add the missing doc in the last 
  commit.
v4
  1. Adding the reset callback in struct phy_ops.
  2. Moving the reset into phy rockchip usb.
  3. Trying to call a reset when dwc2 wakeup in rk3288.
v3
 Rebased from previous commit
v2
 Rebased from previous commit
v1
 orignal from google

Randy Li (3):
  phy: Add reset callback for not generic phy
  usb: dwc2: assert phy reset when waking up in rk3288 platform
  ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset

 arch/arm/boot/dts/rk3288.dtsi |  4 ++++
 drivers/usb/dwc2/core_intr.c  | 11 +++++++++++
 include/linux/phy/phy.h       |  7 +++++++
 3 files changed, 22 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
