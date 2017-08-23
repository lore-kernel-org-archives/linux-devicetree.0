From: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v7 0/3] Add support Rockchip Soc LVDS
Date: Wed, 23 Aug 2017 14:26:55 +0800
Message-ID: <1503469615-39406-1-git-send-email-hjc@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

this patches add support Rockchip RK3288 LVDS support, based on patches from
Mark yao[0] and Heiko Stuebner[1].

[0]: https://github.com/RockchipOpensourceCommunity/popmetal-kernel-3.14
[1]: http://lists.infradead.org/pipermail/linux-rockchip/2015-April/002830.html

Changes:
- Update rockchip_lvds_encoder_helper_funcs to atomic API
- Add bridge function for RGB/LVDS convert to other output type
- Fix some unreasonable define
- Adapter to the latest rockchip DRM driver framework
- Add pinctrl for RGB output type
- Reseved some define for rockchip next Soc

Sandy Huang (3):
  dt-bindings: display: Add Document for Rockchip Soc LVDS
  ARM: dts: Add LVDS info for rk3288
  drm/rockchip: Add support for Rockchip Soc LVDS

 .../bindings/display/rockchip/rockchip-lvds.txt    |  99 ++++
 arch/arm/boot/dts/rk3288.dtsi                      |  52 ++
 drivers/gpu/drm/rockchip/Kconfig                   |   9 +
 drivers/gpu/drm/rockchip/Makefile                  |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           | 582 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_lvds.h           | 114 ++++
 8 files changed, 860 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_lvds.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_lvds.h

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
