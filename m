From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v9 0/4] Add a new Rockchip usb2 phy driver
Date: Fri, 22 Jul 2016 15:00:42 +0800
Message-ID: <1469170846-15617-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The newer SoCs (rk3366, rk3399) of Rock-chip take a different usb-phy
IP block than rk3288 and before, and most of phy-related registers are
also different from the past, so a new phy driver is required necessarily.

These series patch add phy-rockchip-inno-usb2.c and the corresponding
dt-bindings.

Changes in v9:
 - Move the usb gpio config from dtsi to dts.
 - Add vin-supply (vcc5v0_sys) for vcc5v0_host.
 - Change some properties' name.

Changes in v8:
 - Added support for rk3399 SoC.
 - Prepare input clock of phy at probe time.
 - Improved sm_work function to handle phy-port state more clearly.

Changes in v7:
 - Renamed functions *usb2phy_resume/*usb2phy_suspend to *usb2phy_power_on/usb2phy_power_off.

Changes in v6:
 - Changed '_' to '-' for otg-id and otg-bvalid property in devicetree bindings.
 - Fixed the output clock would be disabled more than once while phy-port was going to suspend.
 - Improved the driver to avoid the currently empty otg-port would cause null-pointer dereferences.

Changes in v5:
 - Added 'reg' property both in devicetree bindings and driver to match the different phy-blocks.

Changes in v4:
 - Used 'phy-supply' instead of 'vbus_*-supply'.

Changes in v3:
 - Supplemented some hardware-description into the devicetree bindings.
 - Resolved the mapping defect between fixed value in driver and the property
   in devicetree.
 - Code cleanup.

Changes in v2:
 - Specified more hardware-description into the devicetree bindings.
 - Optimized some process of driver.

Frank Wang (4):
  Documentation: bindings: add DT documentation for Rockchip USB2PHY
  phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
  arm64: dts: rockchip: add usb2-phy support for rk3399
  arm64: dts: rockchip: configure usb2-phy support for rk3399-evb

 .../bindings/phy/phy-rockchip-inno-usb2.txt        |   64 ++
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |   44 ++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   42 +-
 drivers/phy/Kconfig                                |    7 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-rockchip-inno-usb2.c               |  707 ++++++++++++++++++++
 6 files changed, 864 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
 create mode 100644 drivers/phy/phy-rockchip-inno-usb2.c

-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
