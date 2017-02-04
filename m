From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] DRM OF graph clean-up
Date: Fri,  3 Feb 2017 21:36:30 -0600
Message-ID: <20170204033635.10250-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puc>
List-Id: devicetree@vger.kernel.org

I've been unhappy with the OF graph API for some time and decided to 
do something about it. The problem is drivers have to do too much of the 
graph parsing and walking themselves. This has led to the same pattern 
duplicated over and over. This series adds 2 new helpers and adapts DRM 
drivers to use them. It only adds one new graph helper, but reduces the 
use of the others which I hope to remove at some point. But we're not 
there yet.

There's a few other things I'd like to clean-up.

The Armada and Rockchip drivers remain oddballs with their own graph 
parsing. I can't see how the armada driver even can work. There's 
nothing to instantiate the armada-drm device either in DT or the kernel.

The omapdrm driver still has some custom helpers similar to the common 
ones, but still slightly different. It got to be more changes than I 
wanted to make to address.

Build tested only (and probably not every last driver).

Rob

Rob Herring (5):
  of: introduce of_graph_get_remote_node
  drm: of: introduce drm_of_find_panel_or_bridge
  drm: convert drivers to use of_graph_get_remote_node
  drm: convert drivers to use drm_of_find_panel_or_bridge
  drm: omap: use common OF graph helpers

 drivers/gpu/drm/arm/hdlcd_drv.c                  |  22 +----
 drivers/gpu/drm/arm/malidp_drv.c                 |  29 +------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c |  64 +++-----------
 drivers/gpu/drm/bridge/adv7511/adv7533.c         |  12 +--
 drivers/gpu/drm/bridge/dumb-vga-dac.c            |  15 +---
 drivers/gpu/drm/bridge/nxp-ptn3460.c             |  16 +---
 drivers/gpu/drm/bridge/parade-ps8622.c           |  16 +---
 drivers/gpu/drm/bridge/tc358767.c                |  27 +-----
 drivers/gpu/drm/bridge/ti-tfp410.c               |  15 ++--
 drivers/gpu/drm/drm_of.c                         |  50 +++++++++++
 drivers/gpu/drm/exynos/exynos_dp.c               |  35 +++-----
 drivers/gpu/drm/exynos/exynos_drm_dpi.c          |  16 +---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c          |  13 +--
 drivers/gpu/drm/exynos/exynos_drm_mic.c          |  27 +-----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c        |  49 ++++-------
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c     |  27 +-----
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c  |  30 +------
 drivers/gpu/drm/imx/imx-ldb.c                    |  28 ++-----
 drivers/gpu/drm/imx/parallel-display.c           |  35 +-------
 drivers/gpu/drm/mediatek/mtk_dpi.c               |  12 +--
 drivers/gpu/drm/mediatek/mtk_dsi.c               |  23 ++---
 drivers/gpu/drm/mediatek/mtk_hdmi.c              |  26 +-----
 drivers/gpu/drm/meson/meson_drv.c                |  12 +--
 drivers/gpu/drm/meson/meson_venc_cvbs.c          |  19 +----
 drivers/gpu/drm/msm/dsi/dsi_host.c               |   3 +-
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c          |  28 +------
 drivers/gpu/drm/mxsfb/mxsfb_out.c                |  36 ++------
 drivers/gpu/drm/omapdrm/dss/dpi.c                |   2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                |   2 +-
 drivers/gpu/drm/omapdrm/dss/dss-of.c             | 102 +----------------------
 drivers/gpu/drm/omapdrm/dss/dss.c                |  61 +++-----------
 drivers/gpu/drm/omapdrm/dss/hdmi4.c              |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c              |   2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h            |  11 ---
 drivers/gpu/drm/omapdrm/dss/venc.c               |   3 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c  |  26 +-----
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c      |  18 ++--
 drivers/gpu/drm/sun4i/sun4i_rgb.c                |  17 ++--
 drivers/gpu/drm/sun4i/sun4i_tcon.c               |  90 ++------------------
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c             |  11 +--
 drivers/gpu/drm/tilcdc/tilcdc_external.c         |  66 ++-------------
 drivers/gpu/drm/vc4/vc4_dpi.c                    |  15 +---
 drivers/of/base.c                                |  28 +++++++
 include/drm/drm_of.h                             |  13 +++
 include/linux/of_graph.h                         |   8 ++
 45 files changed, 272 insertions(+), 891 deletions(-)

-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
