From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 0/5] add some properties for Rockchip usb2-phy and add rv1108 SoCs' support
Date: Fri, 11 Aug 2017 16:07:46 +0800
Message-ID: <1502438871-9482-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These series of patches add rockchip,usbgrf property and otg_mux interrupt for
rockchip usb2-phy. In addition, this change also add rv1108 usb2-phy support.

Changes from v3:
 - Updated the 'Acked-by' tag from Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>.
 - Matched the SoC specific compatible string instead of companion_grf_quirk.

Changes from v2:
 - Amend otg-mux interrupt to be auto-detectable and update related dt-bindings.

Changes from v1:
 - Send the dt-bindings as a separate patch and cc devicetree list.

Frank Wang (5):
  phy: rockchip-inno-usb2: add support for rockchip,usbgrf property
  dt-bindings: phy-rockchip-inno-usb2: add rockchip,usbgrf property
  phy: rockchip-inno-usb2: add support for otg-mux interrupt
  dt-bindings: phy-rockchip-inno-usb2: add otg-mux interrupt
  phy: rockchip-inno-usb2: add support of usb2-phy for rv1108 SoCs

 .../bindings/phy/phy-rockchip-inno-usb2.txt        |  11 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 215 ++++++++++++++++-----
 2 files changed, 174 insertions(+), 52 deletions(-)

-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
