From: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/2] support USB2 PHY OTG port for rk3399
Date: Mon,  7 Nov 2016 20:08:47 +0800
Message-ID: <1478520529-8869-1-git-send-email-wulf@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series add support for rk3399 USB2 PHY0 and PHY1 OTG port.
rk3399 has two USB2 PHYs, and each USB2 PHY is comprised of one
Host port and one OTG port. We have supported Host port before,
and try to support OTG port now.

Test on rk3399-evb board.

William Wu (2):
  phy: rockchip-inno-usb2: support otg-port for rk3399
  arm64: dts: rockchip: add usb2-phy otg-port support for rk3399

 arch/arm64/boot/dts/rockchip/rk3399.dtsi |  21 ++
 drivers/phy/phy-rockchip-inno-usb2.c     | 591 +++++++++++++++++++++++++++++--
 2 files changed, 582 insertions(+), 30 deletions(-)

-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
