From: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/3] Add support rockchip RGB output interface
Date: Fri, 22 Sep 2017 11:00:21 +0800
Message-ID: <1506049221-117283-1-git-send-email-hjc@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patches add support rockchip RGB output, Some Rockchip CRTCs, like rv1108,
can directly output parallel and serial RGB data to panel or to conversion chip.
So we add this driver to probe encoder and connector to support this case.

Sandy Huang (3):
  dt-bindings: Add document for rockchip RGB output interface
  drm/rockchip: Add support for Rockchip Soc RGB output interface
  drm/rockchip: vop: Add more RGB output interface type

 .../bindings/display/rockchip/rockchip-rgb.txt     |  78 +++++
 drivers/gpu/drm/rockchip/Kconfig                   |   9 +
 drivers/gpu/drm/rockchip/Makefile                  |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   2 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c            | 343 +++++++++++++++++++++
 7 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-rgb.txt
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_rgb.c

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
