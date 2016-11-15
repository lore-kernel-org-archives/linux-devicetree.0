From: William Wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 0/2] phy: rockchip-inno-usb2: correct 480MHz clk_ops callbacks and stable time
Date: Tue, 15 Nov 2016 11:54:05 +0800
Message-ID: <1479182047-3399-1-git-send-email-wulf@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series try to correct the 480MHz output clock of USB2 PHY
clk_ops callback and fix the delay time. It aims to make the
480MHz clock gate more sensible and stable.

Tested on rk3366/rk3399 EVB board.

William Wu (2):
  phy: rockchip-inno-usb2: correct clk_ops callback
  phy: rockchip-inno-usb2: correct 480MHz output clock stable time

 drivers/phy/phy-rockchip-inno-usb2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
