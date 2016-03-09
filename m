From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v13 03/14] drm/mediatek: Add DSI sub driver
Date: Wed, 9 Mar 2016 22:07:48 +0800
Message-ID: <CAGS+omDuzLt7ErhpqC4rBwLnCDtKi-mci6=PVFEh=4JJZ+zS_g@mail.gmail.com>
References: <1457443649-12133-1-git-send-email-p.zabel@pengutronix.de> <1457443649-12133-4-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457443649-12133-4-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, moderated list:ARM/Mediatek SoC suppo
List-Id: devicetree@vger.kernel.org

Hi Philipp, CK,

Some small comments.
Nothing that couldn't be addressed after merging, if you prefer.

On Tue, Mar 8, 2016 at 9:27 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> This patch add a drm encoder/connector driver for the MIPI DSI function
> block of the Mediatek display subsystem and a phy driver for the MIPI TX
> D-PHY control module.
>
> Signed-off-by: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> --
>  drivers/gpu/drm/mediatek/Kconfig       |   2 +
>  drivers/gpu/drm/mediatek/Makefile      |   4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |   2 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c     | 942 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mipi_tx.c | 487 +++++++++++++++++
>  6 files changed, 1438 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dsi.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mipi_tx.c
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index 8dad892..0c49a94 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -3,6 +3,8 @@ config DRM_MEDIATEK
>         depends on DRM
>         depends on ARCH_MEDIATEK || (ARM && COMPILE_TEST)
>         select DRM_KMS_HELPER
> +       select DRM_MIPI_DSI
> +       select DRM_PANEL
>         select IOMMU_DMA
>         select MTK_SMI
>         help
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index d4bde7c..e781db5a 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -6,6 +6,8 @@ mediatek-drm-y := mtk_disp_ovl.o \
>                   mtk_drm_drv.o \
>                   mtk_drm_fb.o \
>                   mtk_drm_gem.o \
> -                 mtk_drm_plane.o
> +                 mtk_drm_plane.o \
> +                 mtk_dsi.o \
> +                 mtk_mipi_tx.o
>
>  obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 8a21ca7..4fcc0e0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -551,6 +551,8 @@ static struct platform_driver * const mtk_drm_drivers[] = {
>         &mtk_drm_platform_driver,
>         &mtk_disp_ovl_driver,
>         &mtk_disp_rdma_driver,
> +       &mtk_dsi_driver,
> +       &mtk_mipi_tx_driver,
>  };
>
>  static int __init mtk_drm_init(void)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index efb744c..161a362 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -50,5 +50,7 @@ struct mtk_drm_private {
>
>  extern struct platform_driver mtk_disp_ovl_driver;
>  extern struct platform_driver mtk_disp_rdma_driver;
> +extern struct platform_driver mtk_dsi_driver;
> +extern struct platform_driver mtk_mipi_tx_driver;
>
>  #endif /* MTK_DRM_DRV_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> new file mode 100644
> index 0000000..463d389
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -0,0 +1,942 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <video/videomode.h>
> +
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DSI_VIDEO_FIFO_DEPTH   (1920 / 4)
> +#define DSI_HOST_FIFO_DEPTH    64
> +
> +#define DSI_START              0x00
> +
> +#define DSI_CON_CTRL           0x10
> +#define DSI_RESET                      BIT(0)
> +#define DSI_EN                         BIT(1)
> +
> +#define DSI_MODE_CTRL          0x14
> +#define MODE                           (3)
> +#define CMD_MODE                       0
> +#define SYNC_PULSE_MODE                        1
> +#define SYNC_EVENT_MODE                        2
> +#define BURST_MODE                     3
> +#define FRM_MODE                       BIT(16)
> +#define MIX_MODE                       BIT(17)
> +
> +#define DSI_TXRX_CTRL          0x18
> +#define VC_NUM                         (2 << 0)
> +#define LANE_NUM                       (0xf << 2)
> +#define DIS_EOT                                BIT(6)
> +#define NULL_EN                                BIT(7)
> +#define TE_FREERUN                     BIT(8)
> +#define EXT_TE_EN                      BIT(9)
> +#define EXT_TE_EDGE                    BIT(10)
> +#define MAX_RTN_SIZE                   (0xf << 12)
> +#define HSTX_CKLP_EN                   BIT(16)
> +
> +#define DSI_PSCTRL             0x1c
> +#define DSI_PS_WC                      0x3fff
> +#define DSI_PS_SEL                     (3 << 16)
> +#define PACKED_PS_16BIT_RGB565         (0 << 16)
> +#define LOOSELY_PS_18BIT_RGB666                (1 << 16)
> +#define PACKED_PS_18BIT_RGB666         (2 << 16)
> +#define PACKED_PS_24BIT_RGB888         (3 << 16)
> +
> +#define DSI_VSA_NL             0x20
> +#define DSI_VBP_NL             0x24
> +#define DSI_VFP_NL             0x28
> +#define DSI_VACT_NL            0x2C
> +#define DSI_HSA_WC             0x50
> +#define DSI_HBP_WC             0x54
> +#define DSI_HFP_WC             0x58
> +
> +#define DSI_HSTX_CKL_WC                0x64
> +
> +#define DSI_PHY_LCCON          0x104
> +#define LC_HS_TX_EN                    BIT(0)
> +#define LC_ULPM_EN                     BIT(1)
> +#define LC_WAKEUP_EN                   BIT(2)
> +
> +#define DSI_PHY_LD0CON         0x108
> +#define LD0_HS_TX_EN                   BIT(0)
> +#define LD0_ULPM_EN                    BIT(1)
> +#define LD0_WAKEUP_EN                  BIT(2)
> +
> +#define DSI_PHY_TIMECON0       0x110
> +#define LPX                            (0xff << 0)
> +#define HS_PRPR                                (0xff << 8)
> +#define HS_ZERO                                (0xff << 16)
> +#define HS_TRAIL                       (0xff << 24)
> +
> +#define DSI_PHY_TIMECON1       0x114
> +#define TA_GO                          (0xff << 0)
> +#define TA_SURE                                (0xff << 8)
> +#define TA_GET                         (0xff << 16)
> +#define DA_HS_EXIT                     (0xff << 24)
> +
> +#define DSI_PHY_TIMECON2       0x118
> +#define CONT_DET                       (0xff << 0)
> +#define CLK_ZERO                       (0xff << 16)
> +#define CLK_TRAIL                      (0xff << 24)
> +
> +#define DSI_PHY_TIMECON3       0x11c
> +#define CLK_HS_PRPR                    (0xff << 0)
> +#define CLK_HS_POST                    (0xff << 8)
> +#define CLK_HS_EXIT                    (0xff << 16)
> +
> +#define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
> +
> +struct phy;
> +
> +struct mtk_dsi {
> +       struct mtk_ddp_comp ddp_comp;
> +       struct device *dev;
> +       struct mipi_dsi_host host;
> +       struct drm_encoder encoder;
> +       struct drm_connector conn;
> +       struct drm_panel *panel;
> +       struct drm_bridge *bridge;
> +       struct phy *phy;
> +
> +       void __iomem *regs;
> +
> +       struct clk *engine_clk;
> +       struct clk *digital_clk;
> +       struct clk *hs_clk;
> +
> +       u32 data_rate;
> +
> +       unsigned long mode_flags;
> +       enum mipi_dsi_pixel_format format;
> +       unsigned int lanes;
> +       struct videomode vm;
> +       int refcount;
> +       bool enabled;
> +};
> +
> +static inline struct mtk_dsi *encoder_to_dsi(struct drm_encoder *e)
> +{
> +       return container_of(e, struct mtk_dsi, encoder);
> +}
> +
> +static inline struct mtk_dsi *connector_to_dsi(struct drm_connector *c)
> +{
> +       return container_of(c, struct mtk_dsi, conn);
> +}
> +
> +static inline struct mtk_dsi *host_to_dsi(struct mipi_dsi_host *h)
> +{
> +       return container_of(h, struct mtk_dsi, host);
> +}
> +
> +static void mtk_dsi_mask(struct mtk_dsi *dsi, u32 offset, u32 mask, u32 data)
> +{
> +       u32 temp = readl(dsi->regs + offset);
> +
> +       writel((temp & ~mask) | (data & mask), dsi->regs + offset);
> +}
> +
> +static void dsi_phy_timconfig(struct mtk_dsi *dsi)
> +{
> +       u32 timcon0, timcon1, timcon2, timcon3;
> +       unsigned int ui, cycle_time;
> +       unsigned int lpx;
> +
> +       ui = 1000 / dsi->data_rate + 0x01;
> +       cycle_time = 8000 / dsi->data_rate + 0x01;
> +       lpx = 5;
> +
> +       timcon0 = (8 << 24) | (0xa << 16) | (0x6 << 8) | lpx;
> +       timcon1 = (7 << 24) | (5 * lpx << 16) | ((3 * lpx) / 2) << 8 |
> +                 (4 * lpx);
> +       timcon2 = ((NS_TO_CYCLE(0x64, cycle_time) + 0xa) << 24) |
> +                 (NS_TO_CYCLE(0x150, cycle_time) << 16);
> +       timcon3 = (2 * lpx) << 16 | NS_TO_CYCLE(80 + 52 * ui, cycle_time) << 8 |
> +                  NS_TO_CYCLE(0x40, cycle_time);
> +
> +       writel(timcon0, dsi->regs + DSI_PHY_TIMECON0);
> +       writel(timcon1, dsi->regs + DSI_PHY_TIMECON1);
> +       writel(timcon2, dsi->regs + DSI_PHY_TIMECON2);
> +       writel(timcon3, dsi->regs + DSI_PHY_TIMECON3);
> +}
> +
> +static void mtk_dsi_enable(struct mtk_dsi *dsi)
> +{
> +       mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_EN, DSI_EN);
> +}
> +
> +static void mtk_dsi_disable(struct mtk_dsi *dsi)
> +{
> +       mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_EN, 0);
> +}
> +
> +static void mtk_dsi_reset(struct mtk_dsi *dsi)
> +{
> +       mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_RESET, DSI_RESET);
> +       mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_RESET, 0);
> +}
> +
> +static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> +{
> +       struct device *dev = dsi->dev;
> +       int ret;
> +
> +       if (++dsi->refcount != 1)
> +               return 0;

What is the point of this refcount?
I believe dsi->enabled already ensures poweron/poweroff calls are paired.

> +
> +       /**
> +        * data_rate = (pixel_clock / 1000) * pixel_dipth * mipi_ratio;
> +        * pixel_clock unit is Khz, data_rata unit is MHz, so need divide 1000.
> +        * mipi_ratio is mipi clk coefficient for balance the pixel clk in mipi.
> +        * we set mipi_ratio is 1.05.
> +        */
> +       dsi->data_rate = dsi->vm.pixelclock * 3 * 21 / (1 * 1000 * 10);
> +
> +       ret = clk_set_rate(dsi->hs_clk, dsi->data_rate * 1000000);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to set data rate: %d\n", ret);
> +               goto err_refcount;
> +       }
> +
> +       phy_power_on(dsi->phy);
> +
> +       ret = clk_prepare_enable(dsi->engine_clk);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to enable engine clock: %d\n", ret);
> +               goto err_phy_power_off;
> +       }
> +
> +       ret = clk_prepare_enable(dsi->digital_clk);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to enable digital clock: %d\n", ret);
> +               goto err_disable_engine_clk;
> +       }
> +
> +       mtk_dsi_enable(dsi);
> +       mtk_dsi_reset(dsi);
> +       dsi_phy_timconfig(dsi);
> +
> +       return 0;
> +
> +err_disable_engine_clk:
> +       clk_disable_unprepare(dsi->engine_clk);
> +err_phy_power_off:
> +       phy_power_off(dsi->phy);
> +err_refcount:
> +       dsi->refcount--;
> +       return ret;
> +}
> +
> +static void dsi_clk_ulp_mode_enter(struct mtk_dsi *dsi)
> +{
> +       mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, 0);
> +       mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_ULPM_EN, 0);
> +}
> +
> +static void dsi_clk_ulp_mode_leave(struct mtk_dsi *dsi)
> +{
> +       mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_ULPM_EN, 0);
> +       mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_WAKEUP_EN, LC_WAKEUP_EN);
> +       mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_WAKEUP_EN, 0);
> +}
> +
> +static void dsi_lane0_ulp_mode_enter(struct mtk_dsi *dsi)
> +{
> +       mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_HS_TX_EN, 0);
> +       mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_ULPM_EN, 0);
> +}
> +
> +static void dsi_lane0_ulp_mode_leave(struct mtk_dsi *dsi)
> +{
> +       mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_ULPM_EN, 0);
> +       mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_WAKEUP_EN, LD0_WAKEUP_EN);
> +       mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_WAKEUP_EN, 0);
> +}
> +
> +static bool dsi_clk_hs_state(struct mtk_dsi *dsi)
> +{
> +       u32 tmp_reg1;
> +
> +       tmp_reg1 = readl(dsi->regs + DSI_PHY_LCCON);
> +       return ((tmp_reg1 & LC_HS_TX_EN) == 1) ? true : false;
> +}
> +
> +static void dsi_clk_hs_mode(struct mtk_dsi *dsi, bool enter)
> +{
> +       if (enter && !dsi_clk_hs_state(dsi))
> +               mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, LC_HS_TX_EN);
> +       else if (!enter && dsi_clk_hs_state(dsi))
> +               mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, 0);
> +}
> +
> +static void dsi_set_mode(struct mtk_dsi *dsi)
> +{
> +       u32 vid_mode = CMD_MODE;
> +
> +       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +               vid_mode = SYNC_PULSE_MODE;
> +
> +               if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
> +                   !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
> +                       vid_mode = BURST_MODE;
> +       }
> +
> +       writel(vid_mode, dsi->regs + DSI_MODE_CTRL);
> +}
> +
> +static void dsi_ps_control_vact(struct mtk_dsi *dsi)
> +{
> +       struct videomode *vm = &dsi->vm;
> +       u32 dsi_buf_bpp, ps_wc;
> +       u32 ps_bpp_mode;
> +
> +       if (dsi->format == MIPI_DSI_FMT_RGB565)
> +               dsi_buf_bpp = 2;
> +       else
> +               dsi_buf_bpp = 3;
> +
> +       ps_wc = vm->hactive * dsi_buf_bpp;
> +       ps_bpp_mode = ps_wc;
> +
> +       switch (dsi->format) {
> +       case MIPI_DSI_FMT_RGB888:
> +               ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
> +               break;
> +       case MIPI_DSI_FMT_RGB666:
> +               ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
> +               break;
> +       case MIPI_DSI_FMT_RGB666_PACKED:
> +               ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
> +               break;
> +       case MIPI_DSI_FMT_RGB565:
> +               ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
> +               break;
> +       }
> +
> +       writel(vm->vactive, dsi->regs + DSI_VACT_NL);
> +       writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
> +       writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
> +}
> +
> +static void dsi_rxtx_control(struct mtk_dsi *dsi)
> +{
> +       u32 tmp_reg;
> +
> +       switch (dsi->lanes) {
> +       case 1:
> +               tmp_reg = 1 << 2;
> +               break;
> +       case 2:
> +               tmp_reg = 3 << 2;
> +               break;
> +       case 3:
> +               tmp_reg = 7 << 2;
> +               break;
> +       case 4:
> +               tmp_reg = 0xf << 2;
> +               break;
> +       default:
> +               tmp_reg = 0xf << 2;
> +               break;
> +       }
> +
> +       writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
> +}
> +
> +static void dsi_ps_control(struct mtk_dsi *dsi)
> +{
> +       unsigned int dsi_tmp_buf_bpp;
> +       u32 tmp_reg;
> +
> +       switch (dsi->format) {
> +       case MIPI_DSI_FMT_RGB888:
> +               tmp_reg = PACKED_PS_24BIT_RGB888;
> +               dsi_tmp_buf_bpp = 3;
> +               break;
> +       case MIPI_DSI_FMT_RGB666:
> +               tmp_reg = LOOSELY_PS_18BIT_RGB666;
> +               dsi_tmp_buf_bpp = 3;
> +               break;
> +       case MIPI_DSI_FMT_RGB666_PACKED:
> +               tmp_reg = PACKED_PS_18BIT_RGB666;
> +               dsi_tmp_buf_bpp = 3;
> +               break;
> +       case MIPI_DSI_FMT_RGB565:
> +               tmp_reg = PACKED_PS_16BIT_RGB565;
> +               dsi_tmp_buf_bpp = 2;
> +               break;
> +       default:
> +               tmp_reg = PACKED_PS_24BIT_RGB888;
> +               dsi_tmp_buf_bpp = 3;
> +               break;
> +       }
> +
> +       tmp_reg += dsi->vm.hactive * dsi_tmp_buf_bpp & DSI_PS_WC;
> +       writel(tmp_reg, dsi->regs + DSI_PSCTRL);
> +}
> +
> +static void dsi_config_vdo_timing(struct mtk_dsi *dsi)
> +{
> +       unsigned int horizontal_sync_active_byte;
> +       unsigned int horizontal_backporch_byte;
> +       unsigned int horizontal_frontporch_byte;
> +       unsigned int dsi_tmp_buf_bpp;
> +
> +       struct videomode *vm = &dsi->vm;
> +
> +       if (dsi->format == MIPI_DSI_FMT_RGB565)
> +               dsi_tmp_buf_bpp = 2;
> +       else
> +               dsi_tmp_buf_bpp = 3;
> +
> +       writel(vm->vsync_len, dsi->regs + DSI_VSA_NL);
> +       writel(vm->vback_porch, dsi->regs + DSI_VBP_NL);
> +       writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
> +       writel(vm->vactive, dsi->regs + DSI_VACT_NL);
> +
> +       horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
> +
> +       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +               horizontal_backporch_byte =
> +                       (vm->hback_porch * dsi_tmp_buf_bpp - 10);
> +       else
> +               horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
> +                       dsi_tmp_buf_bpp - 10);
> +
> +       horizontal_frontporch_byte = (vm->hfront_porch * dsi_tmp_buf_bpp - 12);
> +
> +       writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> +       writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
> +       writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> +
> +       dsi_ps_control(dsi);
> +}
> +
> +static void mtk_dsi_start(struct mtk_dsi *dsi)
> +{
> +       writel(0, dsi->regs + DSI_START);
> +       writel(1, dsi->regs + DSI_START);
> +}
> +
> +static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
> +{
> +       if (WARN_ON(dsi->refcount == 0))
> +               return;
> +
> +       if (--dsi->refcount != 0)
> +               return;
> +
> +       dsi_lane0_ulp_mode_enter(dsi);
> +       dsi_clk_ulp_mode_enter(dsi);
> +
> +       mtk_dsi_disable(dsi);
> +
> +       clk_disable_unprepare(dsi->engine_clk);
> +       clk_disable_unprepare(dsi->digital_clk);
> +
> +       phy_power_off(dsi->phy);
> +}
> +
> +static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> +{
> +       int ret;
> +
> +       if (dsi->enabled)
> +               return;
> +
> +       if (dsi->panel) {
> +               if (drm_panel_prepare(dsi->panel)) {
> +                       DRM_ERROR("failed to setup the panel\n");
> +                       return;
> +               }
> +       }
> +
> +       ret = mtk_dsi_poweron(dsi);
> +       if (ret < 0) {
> +               DRM_ERROR("failed to power on dsi\n");
> +               return;
> +       }
> +
> +       dsi_rxtx_control(dsi);
> +
> +       dsi_clk_ulp_mode_leave(dsi);
> +       dsi_lane0_ulp_mode_leave(dsi);
> +       dsi_clk_hs_mode(dsi, 0);
> +       dsi_set_mode(dsi);
> +
> +       dsi_ps_control_vact(dsi);
> +       dsi_config_vdo_timing(dsi);
> +
> +       dsi_set_mode(dsi);
> +       dsi_clk_hs_mode(dsi, 1);
> +
> +       mtk_dsi_start(dsi);
> +
> +       dsi->enabled = true;
> +}
> +
> +static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
> +{
> +       if (!dsi->enabled)
> +               return;
> +
> +       if (dsi->panel) {
> +               if (drm_panel_disable(dsi->panel)) {
> +                       DRM_ERROR("failed to disable the panel\n");
> +                       return;
> +               }
> +       }
> +
> +       mtk_dsi_poweroff(dsi);
> +
> +       dsi->enabled = false;
> +}
> +
> +static void mtk_dsi_encoder_destroy(struct drm_encoder *encoder)
> +{
> +       drm_encoder_cleanup(encoder);
> +}
> +
> +static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
> +       .destroy = mtk_dsi_encoder_destroy,
> +};
> +
> +static bool mtk_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
> +                                      const struct drm_display_mode *mode,
> +                                      struct drm_display_mode *adjusted_mode)
> +{
> +       return true;
> +}
> +
> +static void mtk_dsi_encoder_mode_set(struct drm_encoder *encoder,
> +                                    struct drm_display_mode *mode,
> +                                    struct drm_display_mode *adjusted)
> +{
> +       struct mtk_dsi *dsi = encoder_to_dsi(encoder);
> +
> +       dsi->vm.pixelclock = adjusted->clock;
> +       dsi->vm.hactive = adjusted->hdisplay;
> +       dsi->vm.hback_porch = adjusted->htotal - adjusted->hsync_end;
> +       dsi->vm.hfront_porch = adjusted->hsync_start - adjusted->hdisplay;
> +       dsi->vm.hsync_len = adjusted->hsync_end - adjusted->hsync_start;
> +
> +       dsi->vm.vactive = adjusted->vdisplay;
> +       dsi->vm.vback_porch = adjusted->vtotal - adjusted->vsync_end;
> +       dsi->vm.vfront_porch = adjusted->vsync_start - adjusted->vdisplay;
> +       dsi->vm.vsync_len = adjusted->vsync_end - adjusted->vsync_start;
> +}
> +
> +static void mtk_dsi_encoder_disable(struct drm_encoder *encoder)
> +{
> +       struct mtk_dsi *dsi = encoder_to_dsi(encoder);
> +
> +       mtk_output_dsi_disable(dsi);
> +}
> +
> +static void mtk_dsi_encoder_enable(struct drm_encoder *encoder)
> +{
> +       struct mtk_dsi *dsi = encoder_to_dsi(encoder);
> +
> +       mtk_output_dsi_enable(dsi);
> +}
> +
> +static enum drm_connector_status mtk_dsi_connector_detect(
> +       struct drm_connector *connector, bool force)
> +{
> +       return connector_status_connected;
> +}
> +
> +static void mtk_dsi_connector_destroy(struct drm_connector *connector)
> +{
> +       drm_connector_unregister(connector);
> +       drm_connector_cleanup(connector);
> +}
> +
> +static int mtk_dsi_connector_get_modes(struct drm_connector *connector)
> +{
> +       struct mtk_dsi *dsi = connector_to_dsi(connector);
> +
> +       return drm_panel_get_modes(dsi->panel);
> +}
> +
> +static struct drm_encoder *mtk_dsi_connector_best_encoder(
> +               struct drm_connector *connector)
> +{
> +       struct mtk_dsi *dsi = connector_to_dsi(connector);
> +
> +       return &dsi->encoder;
> +}
> +
> +static const struct drm_encoder_helper_funcs mtk_dsi_encoder_helper_funcs = {
> +       .mode_fixup = mtk_dsi_encoder_mode_fixup,
> +       .mode_set = mtk_dsi_encoder_mode_set,
> +       .disable = mtk_dsi_encoder_disable,
> +       .enable = mtk_dsi_encoder_enable,
> +};
> +
> +static const struct drm_connector_funcs mtk_dsi_connector_funcs = {
> +       .dpms = drm_atomic_helper_connector_dpms,
> +       .detect = mtk_dsi_connector_detect,
> +       .fill_modes = drm_helper_probe_single_connector_modes,
> +       .destroy = mtk_dsi_connector_destroy,
> +       .reset = drm_atomic_helper_connector_reset,
> +       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_connector_helper_funcs
> +       mtk_dsi_connector_helper_funcs = {
> +       .get_modes = mtk_dsi_connector_get_modes,
> +       .best_encoder = mtk_dsi_connector_best_encoder,
> +};
> +
> +static int mtk_drm_attach_bridge(struct drm_bridge *bridge,
> +                                struct drm_encoder *encoder)
> +{
> +       int ret;
> +
> +       if (!bridge)
> +               return -ENOENT;
> +
> +       encoder->bridge = bridge;
> +       bridge->encoder = encoder;
> +       ret = drm_bridge_attach(encoder->dev, bridge);
> +       if (ret) {
> +               DRM_ERROR("Failed to attach bridge to drm\n");
> +               encoder->bridge = NULL;
> +               bridge->encoder = NULL;
> +       }
> +
> +       return ret;
> +}
> +
> +static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
> +{
> +       int ret;
> +
> +       ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
> +                              DRM_MODE_ENCODER_DSI, NULL);
> +       if (ret) {
> +               DRM_ERROR("Failed to encoder init to drm\n");
> +               return ret;
> +       }
> +       drm_encoder_helper_add(&dsi->encoder, &mtk_dsi_encoder_helper_funcs);
> +
> +       /*
> +        * Currently display data paths are statically assigned to a crtc each.
> +        * crtc 0 is OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
> +        */
> +       dsi->encoder.possible_crtcs = 1;
> +
> +       /* Pre-empt DP connector creation if there's a bridge */
> +       ret = mtk_drm_attach_bridge(dsi->bridge, &dsi->encoder);
> +       if (!ret)
> +               return 0;

nit: the above valid early termination of this function here is a bit unusual.
It might be more clear if the "connector init" part below was split out into its
own helper function.

> +
> +       ret = drm_connector_init(drm, &dsi->conn, &mtk_dsi_connector_funcs,
> +                                DRM_MODE_CONNECTOR_DSI);
> +       if (ret) {
> +               DRM_ERROR("Failed to connector init to drm\n");
> +               goto err_encoder_cleanup;
> +       }
> +
> +       drm_connector_helper_add(&dsi->conn, &mtk_dsi_connector_helper_funcs);
> +
> +       ret = drm_connector_register(&dsi->conn);
> +       if (ret) {
> +               DRM_ERROR("Failed to connector register to drm\n");
> +               goto err_connector_cleanup;
> +       }
> +
> +       dsi->conn.dpms = DRM_MODE_DPMS_OFF;
> +       drm_mode_connector_attach_encoder(&dsi->conn, &dsi->encoder);
> +
> +       if (dsi->panel) {
> +               ret = drm_panel_attach(dsi->panel, &dsi->conn);
> +               if (ret) {
> +                       DRM_ERROR("Failed to attach panel to drm\n");
> +                       goto err_connector_unregister;
> +               }
> +       }
> +       return 0;
> +
> +err_connector_unregister:
> +       drm_connector_unregister(&dsi->conn);
> +err_connector_cleanup:
> +       drm_connector_cleanup(&dsi->conn);
> +err_encoder_cleanup:
> +       drm_encoder_cleanup(&dsi->encoder);
> +
> +       return ret;
> +}
> +
> +static void mtk_dsi_destroy_conn_enc(struct mtk_dsi *dsi)
> +{
> +       drm_encoder_cleanup(&dsi->encoder);
> +       /* Skip connector cleanup if creation was delegated to the bridge */
> +       if (dsi->conn.dev) {
> +               drm_connector_unregister(&dsi->conn);
> +               drm_connector_cleanup(&dsi->conn);
> +       }
> +}
> +
> +static void mtk_dsi_ddp_start(struct mtk_ddp_comp *comp)
> +{
> +       struct mtk_dsi *dsi = container_of(comp, struct mtk_dsi, ddp_comp);
> +
> +       mtk_dsi_poweron(dsi);
> +}
> +
> +static void mtk_dsi_ddp_stop(struct mtk_ddp_comp *comp)
> +{
> +       struct mtk_dsi *dsi = container_of(comp, struct mtk_dsi, ddp_comp);
> +
> +       mtk_dsi_poweroff(dsi);
> +}
> +
> +static const struct mtk_ddp_comp_funcs mtk_dsi_funcs = {
> +       .start = mtk_dsi_ddp_start,
> +       .stop = mtk_dsi_ddp_stop,
> +};
> +
> +static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
> +                              struct mipi_dsi_device *device)
> +{
> +       struct mtk_dsi *dsi = host_to_dsi(host);
> +
> +       dsi->lanes = device->lanes;
> +       dsi->format = device->format;
> +       dsi->mode_flags = device->mode_flags;
> +
> +       if (dsi->conn.dev)
> +               drm_helper_hpd_irq_event(dsi->conn.dev);
> +
> +       return 0;
> +}
> +
> +static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
> +                              struct mipi_dsi_device *device)
> +{
> +       struct mtk_dsi *dsi = host_to_dsi(host);
> +
> +       if (dsi->conn.dev)
> +               drm_helper_hpd_irq_event(dsi->conn.dev);
> +
> +       return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops mtk_dsi_ops = {
> +       .attach = mtk_dsi_host_attach,
> +       .detach = mtk_dsi_host_detach,
> +};
> +
> +static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
> +{
> +       int ret;
> +       struct drm_device *drm = data;
> +       struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +
> +       ret = mtk_ddp_comp_register(drm, &dsi->ddp_comp);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to register component %s: %d\n",
> +                       dev->of_node->full_name, ret);
> +               return ret;
> +       }
> +
> +       ret = mipi_dsi_host_register(&dsi->host);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to register DSI host: %d\n", ret);
> +               goto err_ddp_comp_unregister;
> +       }
> +
> +       ret = mtk_dsi_create_conn_enc(drm, dsi);
> +       if (ret) {
> +               DRM_ERROR("Encoder create failed with %d\n", ret);
> +               goto err_unregister;
> +       }
> +
> +       return 0;
> +
> +err_unregister:
> +       mipi_dsi_host_unregister(&dsi->host);
> +err_ddp_comp_unregister:
> +       mtk_ddp_comp_unregister(drm, &dsi->ddp_comp);
> +       return ret;
> +}
> +
> +static void mtk_dsi_unbind(struct device *dev, struct device *master,
> +                          void *data)
> +{
> +       struct drm_device *drm = data;
> +       struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +
> +       mtk_dsi_destroy_conn_enc(dsi);
> +       mipi_dsi_host_unregister(&dsi->host);
> +       mtk_ddp_comp_unregister(drm, &dsi->ddp_comp);
> +}
> +
> +static const struct component_ops mtk_dsi_component_ops = {
> +       .bind = mtk_dsi_bind,
> +       .unbind = mtk_dsi_unbind,
> +};
> +
> +static int mtk_dsi_probe(struct platform_device *pdev)
> +{
> +       struct mtk_dsi *dsi;
> +       struct device *dev = &pdev->dev;
> +       struct device_node *remote_node, *endpoint;
> +       struct resource *regs;
> +       int comp_id;
> +       int ret;
> +
> +       dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +       if (!dsi)
> +               return -ENOMEM;
> +
> +       dsi->host.ops = &mtk_dsi_ops;
> +       dsi->host.dev = dev;
> +
> +       endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +       if (endpoint) {
> +               remote_node = of_graph_get_remote_port_parent(endpoint);
> +               if (!remote_node) {
> +                       dev_err(dev, "No panel connected\n");
> +                       return -ENODEV;
> +               }
> +
> +               dsi->bridge = of_drm_find_bridge(remote_node);
> +               dsi->panel = of_drm_find_panel(remote_node);
> +               of_node_put(remote_node);
> +               if (!dsi->bridge && !dsi->panel) {
> +                       dev_info(dev, "Waiting for bridge or panel driver\n");
> +                       return -EPROBE_DEFER;
> +               }
> +       }
> +
> +       dsi->engine_clk = devm_clk_get(dev, "engine");
> +       if (IS_ERR(dsi->engine_clk)) {
> +               ret = PTR_ERR(dsi->engine_clk);
> +               dev_err(dev, "Failed to get engine clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       dsi->digital_clk = devm_clk_get(dev, "digital");
> +       if (IS_ERR(dsi->digital_clk)) {
> +               ret = PTR_ERR(dsi->digital_clk);
> +               dev_err(dev, "Failed to get digital clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       dsi->hs_clk = devm_clk_get(dev, "hs");
> +       if (IS_ERR(dsi->hs_clk)) {
> +               ret = PTR_ERR(dsi->hs_clk);
> +               dev_err(dev, "Failed to get hs clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       dsi->regs = devm_ioremap_resource(dev, regs);
> +       if (IS_ERR(dsi->regs)) {
> +               ret = PTR_ERR(dsi->regs);
> +               dev_err(dev, "Failed to ioremap memory: %d\n", ret);
> +               return ret;
> +       }
> +
> +       dsi->phy = devm_phy_get(dev, "dphy");
> +       if (IS_ERR(dsi->phy)) {
> +               ret = PTR_ERR(dsi->phy);
> +               dev_err(dev, "Failed to get MIPI-DPHY: %d\n", ret);
> +               return ret;
> +       }
> +
> +       comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DSI);
> +       if (comp_id < 0) {
> +               dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
> +               return comp_id;
> +       }
> +
> +       ret = mtk_ddp_comp_init(dev, dev->of_node, &dsi->ddp_comp, comp_id,
> +                               &mtk_dsi_funcs);
> +       if (ret) {
> +               dev_err(dev, "Failed to initialize component: %d\n", ret);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, dsi);
> +
> +       return component_add(&pdev->dev, &mtk_dsi_component_ops);
> +}
> +
> +static int mtk_dsi_remove(struct platform_device *pdev)
> +{
> +       struct mtk_dsi *dsi = platform_get_drvdata(pdev);
> +
> +       mtk_output_dsi_disable(dsi);

This one looks unmatched.

> +       component_del(&pdev->dev, &mtk_dsi_component_ops);
> +
> +       return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int mtk_dsi_suspend(struct device *dev)
> +{
> +       struct mtk_dsi *dsi;
> +
> +       dsi = dev_get_drvdata(dev);
> +
> +       mtk_output_dsi_disable(dsi);
> +       DRM_DEBUG_DRIVER("dsi suspend success!\n");
> +
> +       return 0;
> +}
> +
> +static int mtk_dsi_resume(struct device *dev)
> +{
> +       struct mtk_dsi *dsi;
> +
> +       dsi = dev_get_drvdata(dev);
> +
> +       mtk_output_dsi_enable(dsi);
> +       DRM_DEBUG_DRIVER("dsi resume success!\n");
> +
> +       return 0;
> +}
> +#endif
> +static SIMPLE_DEV_PM_OPS(mtk_dsi_pm_ops, mtk_dsi_suspend, mtk_dsi_resume);

I don't think we want PM ops.
The MTK DRM driver disables/enables encoders during suspend/resume.

> +
> +static const struct of_device_id mtk_dsi_of_match[] = {
> +       { .compatible = "mediatek,mt8173-dsi" },
> +       { },
> +};
> +
> +struct platform_driver mtk_dsi_driver = {
> +       .probe = mtk_dsi_probe,
> +       .remove = mtk_dsi_remove,
> +       .driver = {
> +               .name = "mtk-dsi",
> +               .of_match_table = mtk_dsi_of_match,
> +               .pm = &mtk_dsi_pm_ops,
> +       },
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> new file mode 100644
> index 0000000..b1e8e34
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> @@ -0,0 +1,487 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/phy/phy.h>
> +
> +#define MIPITX_DSI_CON         0x00
> +#define RG_DSI_LDOCORE_EN              BIT(0)
> +#define RG_DSI_CKG_LDOOUT_EN           BIT(1)
> +#define RG_DSI_BCLK_SEL                        (3 << 2)
> +#define RG_DSI_LD_IDX_SEL              (7 << 4)
> +#define RG_DSI_PHYCLK_SEL              (2 << 8)
> +#define RG_DSI_DSICLK_FREQ_SEL         BIT(10)
> +#define RG_DSI_LPTX_CLMP_EN            BIT(11)
> +
> +#define MIPITX_DSI_CLOCK_LANE  0x04
> +#define RG_DSI_LNTC_LDOOUT_EN          BIT(0)
> +#define RG_DSI_LNTC_CKLANE_EN          BIT(1)
> +#define RG_DSI_LNTC_LPTX_IPLUS1                BIT(2)
> +#define RG_DSI_LNTC_LPTX_IPLUS2                BIT(3)
> +#define RG_DSI_LNTC_LPTX_IMINUS                BIT(4)
> +#define RG_DSI_LNTC_LPCD_IPLUS         BIT(5)
> +#define RG_DSI_LNTC_LPCD_IMLUS         BIT(6)
> +#define RG_DSI_LNTC_RT_CODE            (0xf << 8)
> +
> +#define MIPITX_DSI_DATA_LANE0  0x08
> +#define RG_DSI_LNT0_LDOOUT_EN          BIT(0)
> +#define RG_DSI_LNT0_CKLANE_EN          BIT(1)
> +#define RG_DSI_LNT0_LPTX_IPLUS1                BIT(2)
> +#define RG_DSI_LNT0_LPTX_IPLUS2                BIT(3)
> +#define RG_DSI_LNT0_LPTX_IMINUS                BIT(4)
> +#define RG_DSI_LNT0_LPCD_IPLUS         BIT(5)
> +#define RG_DSI_LNT0_LPCD_IMINUS                BIT(6)
> +#define RG_DSI_LNT0_RT_CODE            (0xf << 8)
> +
> +#define MIPITX_DSI_DATA_LANE1  0x0c
> +#define RG_DSI_LNT1_LDOOUT_EN          BIT(0)
> +#define RG_DSI_LNT1_CKLANE_EN          BIT(1)
> +#define RG_DSI_LNT1_LPTX_IPLUS1                BIT(2)
> +#define RG_DSI_LNT1_LPTX_IPLUS2                BIT(3)
> +#define RG_DSI_LNT1_LPTX_IMINUS                BIT(4)
> +#define RG_DSI_LNT1_LPCD_IPLUS         BIT(5)
> +#define RG_DSI_LNT1_LPCD_IMINUS                BIT(6)
> +#define RG_DSI_LNT1_RT_CODE            (0xf << 8)
> +
> +#define MIPITX_DSI_DATA_LANE2  0x10
> +#define RG_DSI_LNT2_LDOOUT_EN          BIT(0)
> +#define RG_DSI_LNT2_CKLANE_EN          BIT(1)
> +#define RG_DSI_LNT2_LPTX_IPLUS1                BIT(2)
> +#define RG_DSI_LNT2_LPTX_IPLUS2                BIT(3)
> +#define RG_DSI_LNT2_LPTX_IMINUS                BIT(4)
> +#define RG_DSI_LNT2_LPCD_IPLUS         BIT(5)
> +#define RG_DSI_LNT2_LPCD_IMINUS                BIT(6)
> +#define RG_DSI_LNT2_RT_CODE            (0xf << 8)
> +
> +#define MIPITX_DSI_DATA_LANE3  0x14
> +#define RG_DSI_LNT3_LDOOUT_EN          BIT(0)
> +#define RG_DSI_LNT3_CKLANE_EN          BIT(1)
> +#define RG_DSI_LNT3_LPTX_IPLUS1                BIT(2)
> +#define RG_DSI_LNT3_LPTX_IPLUS2                BIT(3)
> +#define RG_DSI_LNT3_LPTX_IMINUS                BIT(4)
> +#define RG_DSI_LNT3_LPCD_IPLUS         BIT(5)
> +#define RG_DSI_LNT3_LPCD_IMINUS                BIT(6)
> +#define RG_DSI_LNT3_RT_CODE            (0xf << 8)
> +
> +#define MIPITX_DSI_TOP_CON     0x40
> +#define RG_DSI_LNT_INTR_EN             BIT(0)
> +#define RG_DSI_LNT_HS_BIAS_EN          BIT(1)
> +#define RG_DSI_LNT_IMP_CAL_EN          BIT(2)
> +#define RG_DSI_LNT_TESTMODE_EN         BIT(3)
> +#define RG_DSI_LNT_IMP_CAL_CODE                (0xf << 4)
> +#define RG_DSI_LNT_AIO_SEL             (7 << 8)
> +#define RG_DSI_PAD_TIE_LOW_EN          BIT(11)
> +#define RG_DSI_DEBUG_INPUT_EN          BIT(12)
> +#define RG_DSI_PRESERVE                        (7 << 13)
> +
> +#define MIPITX_DSI_BG_CON      0x44
> +#define RG_DSI_BG_CORE_EN              BIT(0)
> +#define RG_DSI_BG_CKEN                 BIT(1)
> +#define RG_DSI_BG_DIV                  (0x3 << 2)
> +#define RG_DSI_BG_FAST_CHARGE          BIT(4)
> +#define RG_DSI_VOUT_MSK                        (0x3ffff << 5)
> +#define RG_DSI_V12_SEL                 (7 << 5)
> +#define RG_DSI_V10_SEL                 (7 << 8)
> +#define RG_DSI_V072_SEL                        (7 << 11)
> +#define RG_DSI_V04_SEL                 (7 << 14)
> +#define RG_DSI_V032_SEL                        (7 << 17)
> +#define RG_DSI_V02_SEL                 (7 << 20)
> +#define RG_DSI_BG_R1_TRIM              (0xf << 24)
> +#define RG_DSI_BG_R2_TRIM              (0xf << 28)
> +
> +#define MIPITX_DSI_PLL_CON0    0x50
> +#define RG_DSI_MPPLL_PLL_EN            BIT(0)
> +#define RG_DSI_MPPLL_DIV_MSK           (0x1ff << 1)
> +#define RG_DSI_MPPLL_PREDIV            (3 << 1)
> +#define RG_DSI_MPPLL_TXDIV0            (3 << 3)
> +#define RG_DSI_MPPLL_TXDIV1            (3 << 5)
> +#define RG_DSI_MPPLL_POSDIV            (7 << 7)
> +#define RG_DSI_MPPLL_MONVC_EN          BIT(10)
> +#define RG_DSI_MPPLL_MONREF_EN         BIT(11)
> +#define RG_DSI_MPPLL_VOD_EN            BIT(12)
> +
> +#define MIPITX_DSI_PLL_CON1    0x54
> +#define RG_DSI_MPPLL_SDM_FRA_EN                BIT(0)
> +#define RG_DSI_MPPLL_SDM_SSC_PH_INIT   BIT(1)
> +#define RG_DSI_MPPLL_SDM_SSC_EN                BIT(2)
> +#define RG_DSI_MPPLL_SDM_SSC_PRD       (0xffff << 16)
> +
> +#define MIPITX_DSI_PLL_CON2    0x58
> +
> +#define MIPITX_DSI_PLL_PWR     0x68
> +#define RG_DSI_MPPLL_SDM_PWR_ON                BIT(0)
> +#define RG_DSI_MPPLL_SDM_ISO_EN                BIT(1)
> +#define RG_DSI_MPPLL_SDM_PWR_ACK       BIT(8)
> +
> +#define MIPITX_DSI_SW_CTRL     0x80
> +#define SW_CTRL_EN                     BIT(0)
> +
> +#define MIPITX_DSI_SW_CTRL_CON0        0x84
> +#define SW_LNTC_LPTX_PRE_OE            BIT(0)
> +#define SW_LNTC_LPTX_OE                        BIT(1)
> +#define SW_LNTC_LPTX_P                 BIT(2)
> +#define SW_LNTC_LPTX_N                 BIT(3)
> +#define SW_LNTC_HSTX_PRE_OE            BIT(4)
> +#define SW_LNTC_HSTX_OE                        BIT(5)
> +#define SW_LNTC_HSTX_ZEROCLK           BIT(6)
> +#define SW_LNT0_LPTX_PRE_OE            BIT(7)
> +#define SW_LNT0_LPTX_OE                        BIT(8)
> +#define SW_LNT0_LPTX_P                 BIT(9)
> +#define SW_LNT0_LPTX_N                 BIT(10)
> +#define SW_LNT0_HSTX_PRE_OE            BIT(11)
> +#define SW_LNT0_HSTX_OE                        BIT(12)
> +#define SW_LNT0_LPRX_EN                        BIT(13)
> +#define SW_LNT1_LPTX_PRE_OE            BIT(14)
> +#define SW_LNT1_LPTX_OE                        BIT(15)
> +#define SW_LNT1_LPTX_P                 BIT(16)
> +#define SW_LNT1_LPTX_N                 BIT(17)
> +#define SW_LNT1_HSTX_PRE_OE            BIT(18)
> +#define SW_LNT1_HSTX_OE                        BIT(19)
> +#define SW_LNT2_LPTX_PRE_OE            BIT(20)
> +#define SW_LNT2_LPTX_OE                        BIT(21)
> +#define SW_LNT2_LPTX_P                 BIT(22)
> +#define SW_LNT2_LPTX_N                 BIT(23)
> +#define SW_LNT2_HSTX_PRE_OE            BIT(24)
> +#define SW_LNT2_HSTX_OE                        BIT(25)
> +
> +struct mtk_mipi_tx {
> +       struct device *dev;
> +       void __iomem *regs;
> +       unsigned int data_rate;
> +       struct clk_hw pll_hw;
> +       struct clk *pll;
> +};
> +
> +static void mtk_mipi_tx_mask(struct mtk_mipi_tx *mipi_tx, u32 offset, u32 mask,
> +                            u32 data)
> +{
> +       u32 temp = readl(mipi_tx->regs + offset);
> +
> +       writel((temp & ~mask) | (data & mask), mipi_tx->regs + offset);
> +}
> +
> +static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
> +{
> +       struct mtk_mipi_tx *mipi_tx = container_of(hw, struct mtk_mipi_tx,
> +                                                  pll_hw);
> +       unsigned int txdiv, txdiv0, txdiv1;
> +       u64 pcw;
> +
> +       dev_dbg(mipi_tx->dev, "prepare: %u Hz\n", mipi_tx->data_rate);
> +
> +       if (mipi_tx->data_rate >= 500000000) {
> +               txdiv = 1;
> +               txdiv0 = 0;
> +               txdiv1 = 0;
> +       } else if (mipi_tx->data_rate >= 250000000) {
> +               txdiv = 2;
> +               txdiv0 = 1;
> +               txdiv1 = 0;
> +       } else if (mipi_tx->data_rate >= 125000000) {
> +               txdiv = 4;
> +               txdiv0 = 2;
> +               txdiv1 = 0;
> +       } else if (mipi_tx->data_rate > 62000000) {
> +               txdiv = 8;
> +               txdiv0 = 2;
> +               txdiv1 = 1;
> +       } else if (mipi_tx->data_rate >= 50000000) {
> +               txdiv = 16;
> +               txdiv0 = 2;
> +               txdiv1 = 2;
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_BG_CON,
> +                        RG_DSI_VOUT_MSK | RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN,
> +                        (4 << 20) | (4 << 17) | (4 << 14) |
> +                        (4 << 11) | (4 << 8) | (4 << 5) |
> +                        RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN);
> +
> +       usleep_range(30, 100);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_TOP_CON,
> +                        RG_DSI_LNT_IMP_CAL_CODE | RG_DSI_LNT_HS_BIAS_EN,
> +                        (8 << 4) | RG_DSI_LNT_HS_BIAS_EN);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_CON,
> +                        RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN,
> +                        RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_PWR,
> +                        RG_DSI_MPPLL_SDM_PWR_ON | RG_DSI_MPPLL_SDM_ISO_EN,
> +                        RG_DSI_MPPLL_SDM_PWR_ON);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN, 0);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_CON0,
> +                        RG_DSI_MPPLL_TXDIV0 | RG_DSI_MPPLL_TXDIV1 |
> +                        RG_DSI_MPPLL_PREDIV,
> +                        (txdiv0 << 3) | (txdiv1 << 5));
> +
> +       /*
> +        * PLL PCW config
> +        * PCW bit 24~30 = integer part of pcw
> +        * PCW bit 0~23 = fractional part of pcw
> +        * pcw = data_Rate*4*txdiv/(Ref_clk*2);
> +        * Post DIV =4, so need data_Rate*4
> +        * Ref_clk is 26MHz
> +        */
> +       pcw = ((u64)mipi_tx->data_rate * 2 * txdiv) << 24;
> +       pcw /= 26000000;
> +       writel(pcw, mipi_tx->regs + MIPITX_DSI_PLL_CON2);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_CON1,
> +                        RG_DSI_MPPLL_SDM_FRA_EN, RG_DSI_MPPLL_SDM_FRA_EN);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_CON0,
> +                        RG_DSI_MPPLL_PLL_EN, RG_DSI_MPPLL_PLL_EN);
> +
> +       usleep_range(20, 100);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_CON1,
> +                        RG_DSI_MPPLL_SDM_SSC_EN, 0);
> +
> +       return 0;
> +}
> +
> +static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
> +{
> +       struct mtk_mipi_tx *mipi_tx = container_of(hw, struct mtk_mipi_tx,
> +                                                  pll_hw);
> +
> +       dev_dbg(mipi_tx->dev, "unprepare\n");
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN, 0);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_PWR,
> +                        RG_DSI_MPPLL_SDM_ISO_EN | RG_DSI_MPPLL_SDM_PWR_ON,
> +                        RG_DSI_MPPLL_SDM_ISO_EN);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_TOP_CON, RG_DSI_LNT_HS_BIAS_EN, 0);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_CON,
> +                        RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN, 0);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_BG_CON,
> +                        RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN, 0);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_DIV_MSK, 0);
> +}
> +
> +static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                      unsigned long *prate)
> +{
> +       return clamp_val(rate, 50000000, 1250000000);
> +}
> +
> +static int mtk_mipi_tx_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                   unsigned long parent_rate)
> +{
> +       struct mtk_mipi_tx *mipi_tx = container_of(hw, struct mtk_mipi_tx,
> +                                                  pll_hw);
> +
> +       dev_dbg(mipi_tx->dev, "set rate: %lu Hz\n", rate);
> +
> +       mipi_tx->data_rate = rate;
> +
> +       return 0;
> +}
> +
> +static unsigned long mtk_mipi_tx_pll_recalc_rate(struct clk_hw *hw,
> +                                                unsigned long parent_rate)
> +{
> +       struct mtk_mipi_tx *mipi_tx = container_of(hw, struct mtk_mipi_tx,
> +                                                  pll_hw);

An inline function / macro would help here.

> +       return mipi_tx->data_rate;
> +}
> +
> +static const struct clk_ops mtk_mipi_tx_pll_ops = {
> +       .prepare = mtk_mipi_tx_pll_prepare,
> +       .unprepare = mtk_mipi_tx_pll_unprepare,
> +       .round_rate = mtk_mipi_tx_pll_round_rate,
> +       .set_rate = mtk_mipi_tx_pll_set_rate,
> +       .recalc_rate = mtk_mipi_tx_pll_recalc_rate,
> +};
> +
> +static int mtk_mipi_tx_power_on_signal(struct phy *phy)
> +{
> +       struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_CLOCK_LANE,
> +                        RG_DSI_LNTC_LDOOUT_EN, RG_DSI_LNTC_LDOOUT_EN);
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_DATA_LANE0,
> +                        RG_DSI_LNT0_LDOOUT_EN, RG_DSI_LNT0_LDOOUT_EN);
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_DATA_LANE1,
> +                        RG_DSI_LNT1_LDOOUT_EN, RG_DSI_LNT1_LDOOUT_EN);
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_DATA_LANE2,
> +                        RG_DSI_LNT2_LDOOUT_EN, RG_DSI_LNT2_LDOOUT_EN);
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_DATA_LANE3,
> +                        RG_DSI_LNT3_LDOOUT_EN, RG_DSI_LNT3_LDOOUT_EN);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_TOP_CON, RG_DSI_PAD_TIE_LOW_EN, 0);
> +
> +       return 0;
> +}
> +
> +static int mtk_mipi_tx_power_on(struct phy *phy)
> +{
> +       struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
> +       int ret;
> +
> +       /* Power up core and enable PLL */
> +       ret = clk_prepare_enable(mipi_tx->pll);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Enable DSI Lane LDO outputs, disable pad tie low */
> +       mtk_mipi_tx_power_on_signal(phy);
> +
> +       return 0;
> +}
> +
> +static void mtk_mipi_tx_power_off_signal(struct phy *phy)
> +{
> +       struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_TOP_CON, RG_DSI_PAD_TIE_LOW_EN,
> +                        RG_DSI_PAD_TIE_LOW_EN);

As mentioned in the HDMI review, _set_bits() / _clr_bits() is more readable than
_mask() if we are just setting/clearing groups of bits.

> +
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_CLOCK_LANE,
> +                        RG_DSI_LNTC_LDOOUT_EN, 0);
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_DATA_LANE0,
> +                        RG_DSI_LNT0_LDOOUT_EN, 0);
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_DATA_LANE1,
> +                        RG_DSI_LNT1_LDOOUT_EN, 0);
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_DATA_LANE2,
> +                        RG_DSI_LNT2_LDOOUT_EN, 0);
> +       mtk_mipi_tx_mask(mipi_tx, MIPITX_DSI_DATA_LANE3,
> +                        RG_DSI_LNT3_LDOOUT_EN, 0);
> +}
> +
> +static int mtk_mipi_tx_power_off(struct phy *phy)
> +{
> +       struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
> +
> +       /* Enable pad tie low, disable DSI Lane LDO outputs */
> +       mtk_mipi_tx_power_off_signal(phy);
> +
> +       /* Disable PLL and power down core */
> +       clk_disable_unprepare(mipi_tx->pll);
> +
> +       return 0;
> +}
> +
> +static const struct phy_ops mtk_mipi_tx_ops = {
> +       .power_on = mtk_mipi_tx_power_on,
> +       .power_off = mtk_mipi_tx_power_off,
> +       .owner = THIS_MODULE,
> +};
> +
> +static int mtk_mipi_tx_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct mtk_mipi_tx *mipi_tx;
> +       struct resource *mem;
> +       struct clk *ref_clk;
> +       const char *ref_clk_name;
> +       struct clk_init_data clk_init = {
> +               .ops = &mtk_mipi_tx_pll_ops,
> +               .num_parents = 1,
> +               .parent_names = (const char * const *)&ref_clk_name,
> +               .flags = CLK_SET_RATE_GATE,
> +       };
> +       struct phy *phy;
> +       struct phy_provider *phy_provider;
> +       int ret;
> +
> +       mipi_tx = devm_kzalloc(dev, sizeof(*mipi_tx), GFP_KERNEL);
> +       if (!mipi_tx)
> +               return -ENOMEM;
> +
> +       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       mipi_tx->regs = devm_ioremap_resource(dev, mem);
> +       if (IS_ERR(mipi_tx->regs)) {
> +               ret = PTR_ERR(mipi_tx->regs);
> +               dev_err(dev, "Failed to get memory resource: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ref_clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(ref_clk)) {
> +               ret = PTR_ERR(ref_clk);
> +               dev_err(dev, "Failed to get reference clock: %d\n", ret);
> +               return ret;
> +       }
> +       ref_clk_name = __clk_get_name(ref_clk);
> +
> +       ret = of_property_read_string(dev->of_node, "clock-output-names",
> +                                     &clk_init.name);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to read clock-output-names: %d\n", ret);
> +               return ret;
> +       }
> +
> +       mipi_tx->pll_hw.init = &clk_init;
> +       mipi_tx->pll = devm_clk_register(dev, &mipi_tx->pll_hw);
> +       if (IS_ERR(mipi_tx->pll)) {
> +               ret = PTR_ERR(mipi_tx->pll);
> +               dev_err(dev, "Failed to register PLL: %d\n", ret);
> +               return ret;
> +       }
> +
> +       phy = devm_phy_create(dev, NULL, &mtk_mipi_tx_ops);
> +       if (IS_ERR(phy)) {
> +               ret = PTR_ERR(phy);
> +               dev_err(dev, "Failed to create MIPI D-PHY: %d\n", ret);
> +               return ret;
> +       }
> +       phy_set_drvdata(phy, mipi_tx);
> +
> +       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +       if (IS_ERR(phy)) {
> +               ret = PTR_ERR(phy_provider);
> +               return ret;
> +       }
> +
> +       mipi_tx->dev = dev;
> +
> +       return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
> +                                  mipi_tx->pll);
> +}
> +
> +static int mtk_mipi_tx_remove(struct platform_device *pdev)
> +{
> +       of_clk_del_provider(pdev->dev.of_node);
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_mipi_tx_match[] = {
> +       { .compatible = "mediatek,mt8173-mipi-tx", },
> +       {},
> +};
> +
> +struct platform_driver mtk_mipi_tx_driver = {
> +       .probe = mtk_mipi_tx_probe,
> +       .remove = mtk_mipi_tx_remove,
> +       .driver = {
> +               .name = "mediatek-mipi-tx",
> +               .of_match_table = mtk_mipi_tx_match,
> +       },
> +};
> --
> 2.7.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
