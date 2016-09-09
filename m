From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [RESEND PATCH v7 0/4] the fix for the USB HOST1 at rk3288 platform
Date: Sat, 10 Sep 2016 02:59:36 +0800
Message-ID: <1473447580-10369-1-git-send-email-ayaka@soulik.info>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

  At this stage it is the only "full features" and well verified 
USB EHCI controller in this platform. More review is always necessary.

Changelog:
 - v7:
    adding a wrapper for the reset operation for phy
    using that wrapper
 - v6:
    move pwms pinctrl to pwms node
    fix the order of the dtb file in Makefile
 - v5:
   - correct the mail format
 - v4:
   - re-order some nodes in alphabetical order
   - fix some minor bugs
   - add a entry in vendor list
 - v3:
   - fixing the rtc clock, using clock source from PMIC
   - enable the tmu
   - enable the fimc for elite board
   - suuport the audio codec at elite board
   - fixing minor bugs in the last commit
 - v2:
   - removing rtc node
     the clock source driver is not done yet.
   - adding exynos-bus
   - fixing the MFC

Randy Li (4):
  phy: Add reset callback
  phy: rockchip-usb: use rockchip_usb_phy_reset to reset phy during
    wakeup
  usb: dwc2: assert phy reset when waking up in rk3288 platform
  ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset

 .../devicetree/bindings/phy/rockchip-usb-phy.txt     |  3 +++
 arch/arm/boot/dts/rk3288.dtsi                        |  4 ++++
 drivers/phy/phy-core.c                               | 14 ++++++++++++++
 drivers/phy/phy-rockchip-usb.c                       | 20 ++++++++++++++++++++
 drivers/usb/dwc2/core_intr.c                         | 11 +++++++++++
 include/linux/phy/phy.h                              |  3 +++
 6 files changed, 55 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
