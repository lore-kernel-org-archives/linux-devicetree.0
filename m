From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v10 0/5] support rockchip dwc3 driver
Date: Mon, 15 Aug 2016 16:50:26 +0800
Message-ID: <1471251031-17084-1-git-send-email-william.wu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add support for rockchip DWC3 driver,
and add additional optional properties for specific
platforms (e.g., rockchip rk3399 platform).

And because rockchip DWC3 need additional handling of
cable events and mode switch to support DRD mode, so
we add a new dwc3-rockchip driver, rather than use the
generic of glue layer which merely enable some clocks
and populate its children.

William Wu (5):
  usb: dwc3: add dis_u2_freeclk_exists_quirk
  usb: dwc3: make usb2 phy utmi interface configurable
  usb: dwc3: add dis_del_phy_power_chg_quirk
  usb: dwc3: rockchip: add devicetree bindings documentation
  usb: dwc3: add rockchip specific glue layer

 Documentation/devicetree/bindings/usb/dwc3.txt     |   5 +
 Documentation/devicetree/bindings/usb/generic.txt  |   6 +
 .../devicetree/bindings/usb/rockchip,dwc3.txt      |  71 ++++
 drivers/usb/dwc3/Kconfig                           |   9 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |  30 +-
 drivers/usb/dwc3/core.h                            |  21 +
 drivers/usb/dwc3/dwc3-rockchip.c                   | 441 +++++++++++++++++++++
 8 files changed, 583 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
 create mode 100644 drivers/usb/dwc3/dwc3-rockchip.c

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
