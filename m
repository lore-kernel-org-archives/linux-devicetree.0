From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/2] make imx hdmi publicly used by dw hdmi compatible platform
Date: Tue,  4 Nov 2014 21:33:10 +0800
Message-ID: <1415107992-34289-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Andy yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

We found freescale imx6 and rockchip rk3288 and Ingenic JZ4780 (Xburst/MIPS)
use the interface compatible Designware HDMI IP, but they also have some
lightly difference, such as phy pll configuration, register width(imx hdmi
register is one byte, but rk3288 is 4 bytes width and can only access by word),
4K support(imx6 doesn't support 4k, but rk3288 does).

To reuse the imx-hdmi driver, we do this patch set:
patch (1): split out imx-soc code from imx-hdmi to dw_hdmi-imx.c
patch (2): move imx-hdmi to bridge/, and rename to dw-hdmi to
make this driver indepent of drm-imx . And we will add rockchip 
platform specific code dw_hdmi-rockchip.c later, this is depend
on drm-rockchip.

Andy Yan (1):
  imx-drm: imx-hdmi: split imx soc specific code from imx-hdmi

Andy yan (1):
  move imx-hdmi to bridge/dw-hdmi

 drivers/gpu/drm/bridge/Kconfig        |    5 +
 drivers/gpu/drm/bridge/Makefile       |    1 +
 drivers/gpu/drm/bridge/dw_hdmi.c      | 1651 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/dw_hdmi.h      | 1032 +++++++++++++++++++
 drivers/staging/imx-drm/Kconfig       |    1 +
 drivers/staging/imx-drm/Makefile      |    2 +-
 drivers/staging/imx-drm/dw_hdmi-imx.c |  214 ++++
 drivers/staging/imx-drm/imx-hdmi.c    | 1767 ---------------------------------
 drivers/staging/imx-drm/imx-hdmi.h    | 1032 -------------------
 include/drm/bridge/dw_hdmi.h          |  114 +++
 10 files changed, 3019 insertions(+), 2800 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/dw_hdmi.c
 create mode 100644 drivers/gpu/drm/bridge/dw_hdmi.h
 create mode 100644 drivers/staging/imx-drm/dw_hdmi-imx.c
 delete mode 100644 drivers/staging/imx-drm/imx-hdmi.c
 delete mode 100644 drivers/staging/imx-drm/imx-hdmi.h
 create mode 100644 include/drm/bridge/dw_hdmi.h

-- 
1.8.3.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
