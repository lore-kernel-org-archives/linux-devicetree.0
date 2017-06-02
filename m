From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/4] fix some issues for Rockchip usb2-phy and add rk3228 SoCs' support
Date: Fri,  2 Jun 2017 11:20:22 +0800
Message-ID: <1496373626-27856-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, charles.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cody.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kevan.lan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These series of patches fix some issues for rockchip usb2-phy and amend
usb2-phy framework to support one phy which comprises with two host-ports.

In addition, this change also add rk3228 usb2-phy support.

Changes from v1:
 - Replaced rk322x with rk3228 for PATCH 4/4.
 - Included devicetree people in the recipient list.

Frank Wang (1):
  phy: rockchip-inno-usb2: add support of usb2-phy for rk3228 SoCs

William Wu (3):
  phy: rockchip-inno-usb2: add a delay after phy resume
  phy: rockchip-inno-usb2: increase otg sm work first schedule time
  phy: rockchip-inno-usb2: add one phy comprises with two host-ports
    support

 .../bindings/phy/phy-rockchip-inno-usb2.txt        |  1 +
 drivers/phy/phy-rockchip-inno-usb2.c               | 74 ++++++++++++++++++++--
 2 files changed, 71 insertions(+), 4 deletions(-)

-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
