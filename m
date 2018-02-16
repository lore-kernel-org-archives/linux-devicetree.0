From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/8] drm/rockchip: hdmi support for rk3328
Date: Fri, 16 Feb 2018 21:41:50 +0100
Message-ID: <20180216204158.29839-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, algea.cao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The rk3228/rk3229 and rk3328 socs started using a new type of hdmi-phy
from Innosilicon that resides completely separate from the dw-hdmi block
and gets accessed via mmio.

Additionally the rk3328 dw-hdmi does not report the vendor-phy type
but a different one instead, so add the possibility to override the
phy type when the glue driver knows better than the ip block itself.


I've put both the phy driver and dw-hdmi changes into one series just
to showcase how everything comes together, but would of course still
expect things to go through the separate phy and drm trees once deemed
ready.

So patches 1+2 are expected to go through the phy-tree and the rest
should go through the drm tree.


changes in v2:
- phy: prevent overflow in tmdsclk calculation
  as reported by Martin Cerveny
- phy: use unsigned long for all tmdsclk rate uses
- phy: simplify tmds rate calculation

- dropped patch exporting some dw-hdmi phy functions
  as a similar patch entered drm-misc already

Heiko Stuebner (6):
  drm/bridge: dw-hdmi: allow overriding of phy-type reading
  drm/rockchip: dw_hdmi: Allow outputs that don't need output switching
  dt-bindings: allow optional phys in Rockchip dw_hdmi binding
  drm/rockchip: dw_hdmi: allow including external phys
  drm/rockchip: dw_hdmi: store rockchip_hdmi reference in phy_data
    object
  drm/rockchip: dw_hdmi: add dw-hdmi support for the rk3328

Zheng Yang (2):
  dt-bindings: add binding for Rockchip hdmi phy using an Innosilicon IP
  phy: add Rockchip Innosilicon hdmi phy

 .../bindings/display/rockchip/dw_hdmi-rockchip.txt |    3 +
 .../bindings/phy/phy-rockchip-inno-hdmi.txt        |   42 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    4 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  130 ++-
 drivers/phy/rockchip/Kconfig                       |    7 +
 drivers/phy/rockchip/Makefile                      |    1 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 1209 ++++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                       |    1 +
 8 files changed, 1393 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-hdmi.txt
 create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
