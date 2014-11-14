From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v10 0/11] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Fri, 14 Nov 2014 11:09:43 +0800
Message-ID: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
References: <1415883141-3330-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415883141-3330-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Josh Boyer <jwboyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


We found Freescale imx6 and Rockchip rk3288 and Ingenic JZ4780 (Xburst/MIPS)
use the interface compatible Designware HDMI IP, but they also have some
lightly differences, such as phy pll configuration, register width(imx hdmi
register is one byte, but rk3288 is 4 bytes width and can only be accessed
by word), 4K support(imx6 doesn't support 4k, but rk3288 does), and HDMI2.0
support.

To reuse the imx-hdmi driver, we make this patch set:
(1): fix some CodingStyle warning to make checkpatch happy
(2): split out imx-soc code from imx-hdmi to dw_hdmi-imx.c
(3): move imx-hdmi to bridge/dw-hdmi, and convert it to a drm_bridge driver
(4): add rockchip rk3288 platform specific code dw_hdmi-rockchip.c

Changes in v10:
- split generic dw_hdmi.c improvements from patch#11(add rk3288 support)
- add more display mode support mpll configuration for rk3288

Changes in v9:
- move some phy configuration to platform driver

Changes in v8:
- correct some spelling mistake
- modify ddc-i2c-bus and interrupt description
- Add documentation for rockchip dw hdmi

Changes in v7:
- remove unused variables from structure dw_hdmi
- remove a wrong modification
- add copyrights for dw_hdmi-imx.c

Changes in v6:
- rearrange the patch order
- move some modification to  patch#6
- refactor register access without reg_shift
- move some modification from patch#5

Changes in v5:
- refactor reg-io-width

Changes in v4:
- fix checkpatch CHECK
- defer probe ddc i2c adapter

Changes in v3:
- split multi register access to one indepent patch

Changes in v2:
- use git format -M to generate these patch

Andy Yan (10):
  staging: imx-drm: imx-hdmi: make checkpatch happy
  staging: imx-drm: imx-hdmi: return defer if can't get ddc i2c adapter
  staging: imx-drm: imx-hdmi: split imx soc specific code from imx-hdmi
  staging: imx-drm: imx-hdmi: move imx-hdmi to bridge/dw_hdmi
  drm: bridge/dw_hdmi:split some phy configuration to platform driver
  drm: bridge/dw_hdmi: clear i2cmphy_stat0 reg in hdmi_phy_wait_i2c_done
  dt-bindings: add document for dw_hdmi
  drm: bridge/dw_hdmi: add support for multi byte register width access
  dt-bindings: Add documentation for rockchip dw hdmi
  drm: bridge/dw_hdmi: add rockchip rk3288 support

Yakir Yang (1):
  drm: bridge/dw_hdmi: convert dw-hdmi to drm_bridge mode

 .../devicetree/bindings/drm/bridge/dw_hdmi.txt     |  40 ++
 .../devicetree/bindings/video/dw_hdmi-rockchip.txt |  43 ++
 drivers/gpu/drm/bridge/Kconfig                     |   5 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 .../imx-hdmi.c => gpu/drm/bridge/dw_hdmi.c}        | 762 +++++++++------------
 .../imx-hdmi.h => gpu/drm/bridge/dw_hdmi.h}        |   8 +-
 drivers/gpu/drm/rockchip/Kconfig                   |  10 +
 drivers/gpu/drm/rockchip/Makefile                  |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 355 ++++++++++
 drivers/staging/imx-drm/Kconfig                    |   1 +
 drivers/staging/imx-drm/Makefile                   |   2 +-
 drivers/staging/imx-drm/dw_hdmi-imx.c              | 274 ++++++++
 include/drm/bridge/dw_hdmi.h                       |  60 ++
 13 files changed, 1138 insertions(+), 425 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt
 rename drivers/{staging/imx-drm/imx-hdmi.c => gpu/drm/bridge/dw_hdmi.c} (70%)
 rename drivers/{staging/imx-drm/imx-hdmi.h => gpu/drm/bridge/dw_hdmi.h} (99%)
 create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
 create mode 100644 drivers/staging/imx-drm/dw_hdmi-imx.c
 create mode 100644 include/drm/bridge/dw_hdmi.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
