From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 1/8] drm/exynos: add Exynos5433 decon driver
Date: Thu, 26 Mar 2015 20:15:33 +0900
Message-ID: <1427368540-28010-2-git-send-email-human.hwang@samsung.com>
References: <1427368540-28010-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1427368540-28010-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

DECON(Display and Enhancement Controller) is new IP replacing FIMD in
Exynos5433. This patch adds Exynos5433 decon driver.

Signed-off-by: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes for v2:
 - change file names and variable names of decon to represnt exynos5433 instead
 of exynos to distinguish them from exynos7 decon

Changes for v3:
 - fail fast when the proper image format is not set
 - remove unnecessary checking code
 - add and modify the function to make DPMS work well
 .../devicetree/bindings/video/exynos5433-decon.txt |  65 ++
 drivers/gpu/drm/exynos/Kconfig                     |   6 +
 drivers/gpu/drm/exynos/Makefile                    |   1 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      | 665 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   3 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |   1 +
 include/video/exynos5433_decon.h                   | 163 +++++
 7 files changed, 904 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/exynos5433-decon.txt
 create mode 100644 drivers/gpu/drm/exynos/exynos5433_drm_decon.c
 create mode 100644 include/video/exynos5433_decon.h

diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
new file mode 100644
index 0000000..377afbf
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
@@ -0,0 +1,65 @@
+Device-Tree bindings for Samsung Exynos SoC display controller (DECON)
+
+DECON (Display and Enhancement Controller) is the Display Controller for the
+Exynos series of SoCs which transfers the image data from a video memory
+buffer to an external LCD interface.
+
+Required properties:
+- compatible: value should be "samsung,exynos5433-decon";
+- reg: physical base address and length of the DECON registers set.
+- interrupts: should contain a list of all DECON IP block interrupts in the
+	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
+	      depends on the interrupt controller used.
+- interrupt-names: should contain the interrupt names: "vsync", "lcd_sys"
+		   in the same order as they were listed in the interrupts
+		   property.
+- clocks: must include clock specifiers corresponding to entries in the
+	  clock-names property.
+- clock-names: list of clock names sorted in the same order as the clocks
+	       property. Must contain "aclk_decon", "aclk_smmu_decon0x",
+	       "aclk_xiu_decon0x", "pclk_smmu_decon0x", clk_decon_vclk",
+	       "sclk_decon_eclk"
+- ports: contains a port which is connected to mic node. address-cells and
+	 size-cells must 1 and 0, respectively.
+- port: contains an endpoint node which is connected to the endpoint in the mic
+	node. The reg value muset be 0.
+- i80-if-timings: specify whether the panel which is connected to decon uses
+		  i80 lcd interface or mipi video interface. This node contains
+		  no timing information as that of fimd does. Because there is
+		  no register in decon to specify i80 interface timing value,
+		  it is not needed, but make it remain to use same kind of node
+		  in fimd and exynos7 decon.
+
+Example:
+SoC specific DT entry:
+decon: decon@13800000 {
+	compatible = "samsung,exynos5433-decon";
+	reg = <0x13800000 0x2104>;
+	clocks = <&cmu_disp CLK_ACLK_DECON>, <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
+		<&cmu_disp CLK_ACLK_XIU_DECON0X>,
+		<&cmu_disp CLK_PCLK_SMMU_DECON0X>,
+		<&cmu_disp CLK_SCLK_DECON_VCLK>,
+		<&cmu_disp CLK_SCLK_DECON_ECLK>;
+	clock-names = "aclk_decon", "aclk_smmu_decon0x", "aclk_xiu_decon0x",
+		"pclk_smmu_decon0x", "sclk_decon_vclk", "sclk_decon_eclk";
+	interrupt-names = "vsync", "lcd_sys";
+	interrupts = <0 202 0>, <0 203 0>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			decon_to_mic: endpoint {
+				remote-endpoint = <&mic_to_decon>;
+			};
+		};
+	};
+};
+
+Board specific DT entry:
+&decon {
+	i80-if-timings {
+	};
+};
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index c8001c2..d9dc408 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -24,6 +24,12 @@ config DRM_EXYNOS_FIMD
 	help
 	  Choose this option if you want to use Exynos FIMD for DRM.
 
+config DRM_EXYNOS5433_DECON
+	bool "Exynos5433 DRM DECON"
+	depends on DRM_EXYNOS
+	help
+	  Choose this option if you want to use Exynos5433 DECON for DRM.
+
 config DRM_EXYNOS7_DECON
 	bool "Exynos DRM DECON"
 	depends on DRM_EXYNOS
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index cc90679..fbd084d 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -10,6 +10,7 @@ exynosdrm-y := exynos_drm_drv.o exynos_drm_encoder.o \
 
 exynosdrm-$(CONFIG_DRM_EXYNOS_IOMMU) += exynos_drm_iommu.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
+exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)	+= exynos_drm_dpi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
new file mode 100644
index 0000000..97078c9
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -0,0 +1,665 @@
+/* drivers/gpu/drm/exynos5433_drm_decon.c
+ *
+ * Copyright (C) 2015 Samsung Electronics Co.Ltd
+ * Authors:
+ *	Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *	Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundationr
+ */
+
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_gpio.h>
+
+#include <video/exynos5433_decon.h>
+
+#include "exynos_drm_drv.h"
+#include "exynos_drm_crtc.h"
+
+#define WINDOWS_NR	3
+#define MIN_FB_WIDTH_FOR_16WORD_BURST	128
+
+struct decon_win_data {
+	unsigned int	offset_x;
+	unsigned int	offset_y;
+	unsigned int	ovl_x;
+	unsigned int	ovl_y;
+	unsigned int	ovl_width;
+	unsigned int	ovl_height;
+	unsigned int	fb_width;
+	unsigned int	fb_height;
+	unsigned int	fb_pitch;
+	unsigned int	bpp;
+	unsigned int	pixel_format;
+	dma_addr_t	dma_addr;
+	bool		enabled;
+	bool		resume;
+};
+
+struct decon_context {
+	struct device			*dev;
+	struct drm_device		*drm_dev;
+	struct exynos_drm_crtc		*crtc;
+	void __iomem			*addr;
+	struct clk			*clks[6];
+	struct decon_win_data		win_data[WINDOWS_NR];
+	unsigned int			default_win;
+	int				pipe;
+	bool				suspended;
+
+#define BIT_CLKS_ENABLED		0
+#define BIT_IRQS_ENABLED		1
+	unsigned long			enabled;
+	bool				i80_if;
+	atomic_t			win_updated;
+};
+
+static const char * const decon_clks_name[] = {
+	"aclk_decon",
+	"aclk_smmu_decon0x",
+	"aclk_xiu_decon0x",
+	"pclk_smmu_decon0x",
+	"sclk_decon_vclk",
+	"sclk_decon_eclk",
+};
+
+static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+	u32 val;
+
+	if (ctx->suspended)
+		return -EPERM;
+
+	if (!test_and_set_bit(BIT_IRQS_ENABLED, &ctx->enabled)) {
+		val = VIDINTCON0_INTEN;
+		if (ctx->i80_if)
+			val |= VIDINTCON0_FRAMEDONE;
+		else
+			val |= VIDINTCON0_INTFRMEN;
+
+		writel(val, ctx->addr + DECON_VIDINTCON0);
+	}
+
+	return 0;
+}
+
+static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+
+	if (ctx->suspended)
+		return;
+
+	if (test_and_clear_bit(BIT_IRQS_ENABLED, &ctx->enabled))
+		writel(0, ctx->addr + DECON_VIDINTCON0);
+}
+
+static void decon_commit(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+	struct drm_display_mode *mode = &crtc->base.mode;
+	u32 val;
+
+	/* enable clock gate */
+	val = CMU_CLKGAGE_MODE_SFR_F | CMU_CLKGAGE_MODE_MEM_F;
+	writel(val, ctx->addr + DECON_CMU);
+
+	/* lcd on and use command if */
+	val = VIDOUT_LCD_ON;
+	if (ctx->i80_if)
+		val |= VIDOUT_COMMAND_IF;
+	else
+		val |= VIDOUT_RGB_IF;
+	writel(val, ctx->addr + DECON_VIDOUTCON0);
+
+	val = VIDTCON2_LINEVAL(mode->vdisplay - 1) |
+		VIDTCON2_HOZVAL(mode->hdisplay - 1);
+	writel(val, ctx->addr + DECON_VIDTCON2);
+
+	if (!ctx->i80_if) {
+		val = VIDTCON00_VBPD_F(
+				mode->crtc_vtotal - mode->crtc_vsync_end) |
+			VIDTCON00_VFPD_F(
+				mode->crtc_vsync_start - mode->crtc_vdisplay);
+		writel(val, ctx->addr + DECON_VIDTCON00);
+
+		val = VIDTCON01_VSPW_F(
+				mode->crtc_vsync_end - mode->crtc_vsync_start);
+		writel(val, ctx->addr + DECON_VIDTCON01);
+
+		val = VIDTCON10_HBPD_F(
+				mode->crtc_htotal - mode->crtc_hsync_end) |
+			VIDTCON10_HFPD_F(
+				mode->crtc_hsync_start - mode->crtc_hdisplay);
+		writel(val, ctx->addr + DECON_VIDTCON10);
+
+		val = VIDTCON11_HSPW_F(
+				mode->crtc_hsync_end - mode->crtc_hsync_start);
+		writel(val, ctx->addr + DECON_VIDTCON11);
+	}
+
+	/* sw trigger enable */
+	val = TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F | TRIGCON_TE_AUTO_MASK |
+		TRIGCON_SWTRIGEN;
+	writel(val, ctx->addr + DECON_TRIGCON);
+
+	/* enable output and display signal */
+	val = VIDCON0_ENVID | VIDCON0_ENVID_F;
+	writel(val, ctx->addr + DECON_VIDCON0);
+}
+
+#define COORDINATE_X(x)		(((x) & 0xfff) << 12)
+#define COORDINATE_Y(x)		((x) & 0xfff)
+#define OFFSIZE(x)		(((x) & 0x3fff) << 14)
+#define PAGEWIDTH(x)		((x) & 0x3fff)
+
+static void decon_win_mode_set(struct exynos_drm_crtc *crtc,
+			       struct exynos_drm_plane *plane)
+{
+	struct decon_context *ctx = crtc->ctx;
+	struct decon_win_data *win_data;
+	unsigned int win;
+
+	if (!plane) {
+		DRM_ERROR("plane is NULL\n");
+		return;
+	}
+
+	win = plane->zpos;
+	if (win == DEFAULT_ZPOS)
+		win = ctx->default_win;
+
+	if (win < 0 || win >= WINDOWS_NR)
+		return;
+
+	win_data = &ctx->win_data[win];
+
+	win_data->offset_x = plane->fb_x;
+	win_data->offset_y = plane->fb_y;
+	win_data->fb_width = plane->fb_width;
+	win_data->fb_height = plane->fb_height;
+	win_data->fb_pitch = plane->pitch;
+	win_data->ovl_x = plane->crtc_x;
+	win_data->ovl_y = plane->crtc_y;
+	win_data->ovl_width = plane->crtc_width;
+	win_data->ovl_height = plane->crtc_height;
+	win_data->dma_addr = plane->dma_addr[0];
+	win_data->bpp = plane->bpp;
+	win_data->pixel_format = plane->pixel_format;
+}
+
+static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
+{
+	struct decon_win_data *win_data = &ctx->win_data[win];
+	unsigned long val;
+
+	val = readl(ctx->addr + DECON_WINCONx(win));
+	val &= ~WINCONx_BPPMODE_MASK;
+
+	switch (win_data->pixel_format) {
+	case DRM_FORMAT_XRGB1555:
+		val |= WINCONx_BPPMODE_16BPP_I1555;
+		val |= WINCONx_HAWSWP_F;
+		val |= WINCONx_BURSTLEN_16WORD;
+		break;
+	case DRM_FORMAT_RGB565:
+		val |= WINCONx_BPPMODE_16BPP_565;
+		val |= WINCONx_HAWSWP_F;
+		val |= WINCONx_BURSTLEN_16WORD;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		val |= WINCONx_BPPMODE_24BPP_888;
+		val |= WINCONx_WSWP_F;
+		val |= WINCONx_BURSTLEN_16WORD;
+		break;
+	case DRM_FORMAT_ARGB8888:
+		val |= WINCONx_BPPMODE_32BPP_A8888;
+		val |= WINCONx_WSWP_F | WINCONx_BLD_PIX_F | WINCONx_ALPHA_SEL_F;
+		val |= WINCONx_BURSTLEN_16WORD;
+		break;
+	default:
+		DRM_ERROR("Proper pixel format is not set\n");
+		return;
+	}
+
+	DRM_DEBUG_KMS("bpp = %u\n", win_data->bpp);
+
+	/*
+	 * In case of exynos, setting dma-burst to 16Word causes permanent
+	 * tearing for very small buffers, e.g. cursor buffer. Burst Mode
+	 * switching which is based on plane size is not recommended as
+	 * plane size varies a lot towards the end of the screen and rapid
+	 * movement causes unstable DMA which results into iommu crash/tear.
+	 */
+
+	if (win_data->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
+		val &= ~WINCONx_BURSTLEN_MASK;
+		val |= WINCONx_BURSTLEN_8WORD;
+	}
+
+	writel(val, ctx->addr + DECON_WINCONx(win));
+}
+
+static void decon_shadow_protect_win(struct decon_context *ctx, int win,
+					bool protect)
+{
+	u32 val;
+
+	val = readl(ctx->addr + DECON_SHADOWCON);
+
+	if (protect)
+		val |= SHADOWCON_Wx_PROTECT(win);
+	else
+		val &= ~SHADOWCON_Wx_PROTECT(win);
+
+	writel(val, ctx->addr + DECON_SHADOWCON);
+}
+
+static void decon_win_commit(struct exynos_drm_crtc *crtc, int zpos)
+{
+	struct decon_context *ctx = crtc->ctx;
+	struct decon_win_data *win_data;
+	unsigned int win = zpos;
+	u32 val;
+
+	if (win == DEFAULT_ZPOS)
+		win = ctx->default_win;
+
+	if (win < 0 || win >= WINDOWS_NR)
+		return;
+
+	win_data = &ctx->win_data[win];
+
+	/* If suspended, enable this on resume */
+	if (ctx->suspended) {
+		win_data->resume = true;
+		return;
+	}
+
+	decon_shadow_protect_win(ctx, win, true);
+
+	val = COORDINATE_X(win_data->ovl_x) | COORDINATE_Y(win_data->ovl_y);
+	writel(val, ctx->addr + DECON_VIDOSDxA(win));
+
+	val = COORDINATE_X(win_data->ovl_x + win_data->ovl_width - 1) |
+		COORDINATE_Y(win_data->ovl_y + win_data->ovl_height - 1);
+	writel(val, ctx->addr + DECON_VIDOSDxB(win));
+
+	val = VIDOSD_Wx_ALPHA_R_F(0x0) | VIDOSD_Wx_ALPHA_G_F(0x0) |
+		VIDOSD_Wx_ALPHA_B_F(0x0);
+	writel(val, ctx->addr + DECON_VIDOSDxC(win));
+
+	val = VIDOSD_Wx_ALPHA_R_F(0x0) | VIDOSD_Wx_ALPHA_G_F(0x0) |
+		VIDOSD_Wx_ALPHA_B_F(0x0);
+	writel(val, ctx->addr + DECON_VIDOSDxD(win));
+
+	writel(win_data->dma_addr, ctx->addr + DECON_VIDW0xADD0B0(win));
+
+	val = win_data->dma_addr + win_data->fb_pitch * win_data->ovl_height;
+	writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
+
+	val = OFFSIZE(win_data->fb_pitch -
+			win_data->ovl_width * (win_data->bpp >> 3))
+		| PAGEWIDTH(win_data->ovl_width * (win_data->bpp >> 3));
+	writel(val, ctx->addr + DECON_VIDW0xADD2(win));
+
+	decon_win_set_pixfmt(ctx, win);
+
+	/* window enable */
+	val = readl(ctx->addr + DECON_WINCONx(win));
+	val |= WINCONx_ENWIN_F;
+	writel(val, ctx->addr + DECON_WINCONx(win));
+
+	decon_shadow_protect_win(ctx, win, false);
+
+	/* standalone update */
+	val = readl(ctx->addr + DECON_UPDATE);
+	val |= STANDALONE_UPDATE_F;
+	writel(val, ctx->addr + DECON_UPDATE);
+
+	if (ctx->i80_if)
+		atomic_set(&ctx->win_updated, 1);
+
+	win_data->enabled = true;
+}
+
+static void decon_win_disable(struct exynos_drm_crtc *crtc, int zpos)
+{
+	struct decon_context *ctx = crtc->ctx;
+	struct decon_win_data *win_data;
+	unsigned int win = zpos;
+	u32 val;
+
+	if (win == DEFAULT_ZPOS)
+		win = ctx->default_win;
+
+	if (win < 0 || win >= WINDOWS_NR)
+		return;
+
+	win_data = &ctx->win_data[win];
+
+	if (ctx->suspended) {
+		win_data->resume = false;
+		return;
+	}
+
+	decon_shadow_protect_win(ctx, win, true);
+
+	/* window disable */
+	val = readl(ctx->addr + DECON_WINCONx(win));
+	val &= ~WINCONx_ENWIN_F;
+	writel(val, ctx->addr + DECON_WINCONx(win));
+
+	decon_shadow_protect_win(ctx, win, false);
+
+	/* standalone update */
+	val = readl(ctx->addr + DECON_UPDATE);
+	val |= STANDALONE_UPDATE_F;
+	writel(val, ctx->addr + DECON_UPDATE);
+
+	win_data->enabled = false;
+}
+
+static void decon_window_suspend(struct decon_context *ctx)
+{
+	struct decon_win_data *win_data;
+	int i;
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		win_data = &ctx->win_data[i];
+		win_data->resume = win_data->enabled;
+		if (win_data->enabled)
+			decon_win_disable(ctx->crtc, i);
+	}
+}
+
+static void decon_window_resume(struct decon_context *ctx)
+{
+	struct decon_win_data *win_data;
+	int i;
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		win_data = &ctx->win_data[i];
+		win_data->enabled = win_data->resume;
+		win_data->resume = false;
+	}
+}
+
+static void decon_apply(struct decon_context *ctx)
+{
+	struct decon_win_data *win_data;
+	int i;
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		win_data = &ctx->win_data[i];
+		if (win_data->enabled)
+			decon_win_commit(ctx->crtc, i);
+		else
+			decon_win_disable(ctx->crtc, i);
+	}
+
+	decon_commit(ctx->crtc);
+}
+
+static void decon_dpms_on(struct decon_context *ctx)
+{
+	int ret;
+	int i;
+
+	if (!ctx->suspended)
+		return;
+
+	ctx->suspended = false;
+
+	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
+		ret = clk_prepare_enable(ctx->clks[i]);
+		if (ret < 0)
+			goto err;
+	}
+
+	set_bit(BIT_CLKS_ENABLED, &ctx->enabled);
+
+	decon_window_resume(ctx);
+	decon_apply(ctx);
+
+	return;
+err:
+	while (--i >= 0)
+		clk_disable_unprepare(ctx->clks[i]);
+
+	ctx->suspended = true;
+}
+
+static void decon_dpms_off(struct decon_context *ctx)
+{
+	int i;
+
+	if (ctx->suspended)
+		return;
+
+	clear_bit(BIT_CLKS_ENABLED, &ctx->enabled);
+	decon_window_suspend(ctx);
+
+	for (i = ARRAY_SIZE(decon_clks_name) - 1; i >= 0; i--)
+		clk_disable_unprepare(ctx->clks[i]);
+
+	ctx->suspended = true;
+}
+
+static void decon_dpms(struct exynos_drm_crtc *crtc, int mode)
+{
+	struct decon_context *ctx = crtc->ctx;
+
+	switch (mode) {
+	case DRM_MODE_DPMS_ON:
+		decon_dpms_on(ctx);
+		break;
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_SUSPEND:
+	case DRM_MODE_DPMS_OFF:
+		decon_dpms_off(ctx);
+		break;
+	default:
+		DRM_DEBUG_KMS("unspecified mode %d\n", mode);
+		break;
+	}
+}
+
+void decon_te_irq_handler(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+	u32 val;
+
+	if (!test_bit(BIT_CLKS_ENABLED, &ctx->enabled))
+		return;
+
+	if (atomic_add_unless(&ctx->win_updated, -1, 0)) {
+		/* trigger */
+		val = readl(ctx->addr + DECON_TRIGCON);
+		val |= TRIGCON_SWTRIGCMD;
+		writel(val, ctx->addr + DECON_TRIGCON);
+	}
+}
+
+static struct exynos_drm_crtc_ops decon_crtc_ops = {
+	.dpms			= decon_dpms,
+	.enable_vblank		= decon_enable_vblank,
+	.disable_vblank		= decon_disable_vblank,
+	.commit			= decon_commit,
+	.win_mode_set		= decon_win_mode_set,
+	.win_commit		= decon_win_commit,
+	.win_disable		= decon_win_disable,
+	.te_handler		= decon_te_irq_handler,
+};
+
+static int decon_bind(struct device *dev, struct device *master, void *data)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+
+	ctx->drm_dev = drm_dev;
+	ctx->pipe = priv->pipe++;
+
+	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
+			EXYNOS_DISPLAY_TYPE_LCD, &decon_crtc_ops, ctx);
+	if (IS_ERR(ctx->crtc)) {
+		priv->pipe--;
+		return PTR_ERR(ctx->crtc);
+	}
+
+	return 0;
+}
+
+static void decon_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+
+	decon_dpms(ctx->crtc, DRM_MODE_DPMS_OFF);
+}
+
+static const struct component_ops decon_component_ops = {
+	.bind	= decon_bind,
+	.unbind = decon_unbind,
+};
+
+static irqreturn_t decon_vsync_irq_handler(int irq, void *dev_id)
+{
+	struct decon_context *ctx = dev_id;
+	u32 val;
+
+	if (!test_bit(BIT_CLKS_ENABLED, &ctx->enabled))
+		goto out;
+
+	val = readl(ctx->addr + DECON_VIDINTCON1);
+	if (val & VIDINTCON1_INTFRMPEND) {
+		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+
+		/* clear */
+		writel(VIDINTCON1_INTFRMPEND, ctx->addr + DECON_VIDINTCON1);
+	}
+
+out:
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t decon_lcd_sys_irq_handler(int irq, void *dev_id)
+{
+	struct decon_context *ctx = dev_id;
+	u32 val;
+
+	if (!test_bit(BIT_CLKS_ENABLED, &ctx->enabled))
+		goto out;
+
+	val = readl(ctx->addr + DECON_VIDINTCON1);
+	if (val & VIDINTCON1_INTFRMDONEPEND) {
+		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+
+		/* clear */
+		writel(VIDINTCON1_INTFRMDONEPEND,
+				ctx->addr + DECON_VIDINTCON1);
+	}
+
+out:
+	return IRQ_HANDLED;
+}
+
+static int exynos5433_decon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct decon_context *ctx;
+	struct resource *res;
+	int ret;
+	int i;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->default_win = 0;
+	ctx->suspended = true;
+	ctx->dev = dev;
+	if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
+		ctx->i80_if = true;
+
+	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
+		struct clk *clk;
+
+		clk = devm_clk_get(ctx->dev, decon_clks_name[i]);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+
+		ctx->clks[i] = clk;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "cannot find IO resource\n");
+		return -ENXIO;
+	}
+
+	ctx->addr = devm_ioremap_resource(dev, res);
+	if (IS_ERR(ctx->addr)) {
+		dev_err(dev, "ioremap failed\n");
+		return PTR_ERR(ctx->addr);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
+			ctx->i80_if ? "lcd_sys" : "vsync");
+	if (!res) {
+		dev_err(dev, "cannot find IRQ resource\n");
+		return -ENXIO;
+	}
+
+	ret = devm_request_irq(dev, res->start, ctx->i80_if ?
+			decon_lcd_sys_irq_handler : decon_vsync_irq_handler, 0,
+			"drm_decon", ctx);
+	if (ret < 0) {
+		dev_err(dev, "lcd_sys irq request failed\n");
+		return ret;
+	}
+
+	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
+				       EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, ctx);
+
+	ret = component_add(dev, &decon_component_ops);
+	if (ret < 0) {
+		exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CRTC);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int exynos5433_decon_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &decon_component_ops);
+	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
+
+	return 0;
+}
+
+static const struct of_device_id exynos5433_decon_driver_dt_match[] = {
+	{ .compatible = "samsung,exynos5433-decon" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos5433_decon_driver_dt_match);
+
+struct platform_driver exynos5433_decon_driver = {
+	.probe		= exynos5433_decon_probe,
+	.remove		= exynos5433_decon_remove,
+	.driver		= {
+		.name	= "exynos5433-decon",
+		.owner	= THIS_MODULE,
+		.of_match_table = exynos5433_decon_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 16d8af6..4d6ad28 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -556,6 +556,9 @@ static struct platform_driver *const exynos_drm_kms_drivers[] = {
 #ifdef CONFIG_DRM_EXYNOS_FIMD
 	&fimd_driver,
 #endif
+#ifdef CONFIG_DRM_EXYNOS5433_DECON
+	&exynos5433_decon_driver,
+#endif
 #ifdef CONFIG_DRM_EXYNOS7_DECON
 	&decon_driver,
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 9afd390..40996d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -344,6 +344,7 @@ void exynos_drm_component_del(struct device *dev,
 				enum exynos_drm_device_type dev_type);
 
 extern struct platform_driver fimd_driver;
+extern struct platform_driver exynos5433_decon_driver;
 extern struct platform_driver decon_driver;
 extern struct platform_driver dp_driver;
 extern struct platform_driver dsi_driver;
diff --git a/include/video/exynos5433_decon.h b/include/video/exynos5433_decon.h
new file mode 100644
index 0000000..9e7f851
--- /dev/null
+++ b/include/video/exynos5433_decon.h
@@ -0,0 +1,163 @@
+/*
+ * Copyright (C) 2014 Samsung Electronics Co.Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundationr
+ */
+
+#ifndef EXYNOS_REGS_DECON_H
+#define EXYNOS_REGS_DECON_H
+
+/* Exynos543X DECON */
+#define DECON_VIDCON0			0x0000
+#define DECON_VIDOUTCON0		0x0010
+#define DECON_WINCONx(n)		(0x0020 + ((n) * 4))
+#define DECON_VIDOSDxH(n)		(0x0080 + ((n) * 4))
+#define DECON_SHADOWCON			0x00A0
+#define DECON_VIDOSDxA(n)		(0x00B0 + ((n) * 0x20))
+#define DECON_VIDOSDxB(n)		(0x00B4 + ((n) * 0x20))
+#define DECON_VIDOSDxC(n)		(0x00B8 + ((n) * 0x20))
+#define DECON_VIDOSDxD(n)		(0x00BC + ((n) * 0x20))
+#define DECON_VIDOSDxE(n)		(0x00C0 + ((n) * 0x20))
+#define DECON_VIDW0xADD0B0(n)		(0x0150 + ((n) * 0x10))
+#define DECON_VIDW0xADD0B1(n)		(0x0154 + ((n) * 0x10))
+#define DECON_VIDW0xADD0B2(n)		(0x0158 + ((n) * 0x10))
+#define DECON_VIDW0xADD1B0(n)		(0x01A0 + ((n) * 0x10))
+#define DECON_VIDW0xADD1B1(n)		(0x01A4 + ((n) * 0x10))
+#define DECON_VIDW0xADD1B2(n)		(0x01A8 + ((n) * 0x10))
+#define DECON_VIDW0xADD2(n)		(0x0200 + ((n) * 4))
+#define DECON_LOCALxSIZE(n)		(0x0214 + ((n) * 4))
+#define DECON_VIDINTCON0		0x0220
+#define DECON_VIDINTCON1		0x0224
+#define DECON_WxKEYCON0(n)		(0x0230 + ((n - 1) * 8))
+#define DECON_WxKEYCON1(n)		(0x0234 + ((n - 1) * 8))
+#define DECON_WxKEYALPHA(n)		(0x0250 + ((n - 1) * 4))
+#define DECON_WINxMAP(n)		(0x0270 + ((n) * 4))
+#define DECON_QOSLUT07_00		0x02C0
+#define DECON_QOSLUT15_08		0x02C4
+#define DECON_QOSCTRL			0x02C8
+#define DECON_BLENDERQx(n)		(0x0300 + ((n - 1) * 4))
+#define DECON_BLENDCON			0x0310
+#define DECON_OPE_VIDW0xADD0(n)		(0x0400 + ((n) * 4))
+#define DECON_OPE_VIDW0xADD1(n)		(0x0414 + ((n) * 4))
+#define DECON_FRAMEFIFO_REG7		0x051C
+#define DECON_FRAMEFIFO_REG8		0x0520
+#define DECON_FRAMEFIFO_STATUS		0x0524
+#define DECON_CMU			0x1404
+#define DECON_UPDATE			0x1410
+#define DECON_UPDATE_SCHEME		0x1438
+#define DECON_VIDCON1			0x2000
+#define DECON_VIDCON2			0x2004
+#define DECON_VIDCON3			0x2008
+#define DECON_VIDCON4			0x200C
+#define DECON_VIDTCON2			0x2028
+#define DECON_FRAME_SIZE		0x2038
+#define DECON_LINECNT_OP_THRESHOLD	0x203C
+#define DECON_TRIGCON			0x2040
+#define DECON_TRIGSKIP			0x2050
+#define DECON_CRCRDATA			0x20B0
+#define DECON_CRCCTRL			0x20B4
+
+/* Exynos5430 DECON */
+#define DECON_VIDTCON0			0x2020
+#define DECON_VIDTCON1			0x2024
+
+/* Exynos5433 DECON */
+#define DECON_VIDTCON00			0x2010
+#define DECON_VIDTCON01			0x2014
+#define DECON_VIDTCON10			0x2018
+#define DECON_VIDTCON11			0x201C
+
+/* Exynos543X DECON Internal */
+#define DECON_W013DSTREOCON		0x0320
+#define DECON_W233DSTREOCON		0x0324
+#define DECON_FRAMEFIFO_REG0		0x0500
+#define DECON_ENHANCER_CTRL		0x2100
+
+/* Exynos543X DECON TV */
+#define DECON_VCLKCON0			0x0014
+#define DECON_VIDINTCON2		0x0228
+#define DECON_VIDINTCON3		0x022C
+
+/* VIDCON0 */
+#define VIDCON0_ENVID			(1 << 1)
+#define VIDCON0_ENVID_F			(1 << 0)
+
+/* VIDOUTCON0 */
+#define VIDOUT_LCD_ON			(1 << 24)
+#define VIDOUT_IF_F_MASK		(0x3 << 20)
+#define VIDOUT_RGB_IF			(0x0 << 20)
+#define VIDOUT_COMMAND_IF		(0x2 << 20)
+
+/* WINCONx */
+#define WINCONx_HAWSWP_F		(1 << 16)
+#define WINCONx_WSWP_F			(1 << 15)
+#define WINCONx_BURSTLEN_MASK		(0x3 << 10)
+#define WINCONx_BURSTLEN_16WORD		(0x0 << 10)
+#define WINCONx_BURSTLEN_8WORD		(0x1 << 10)
+#define WINCONx_BURSTLEN_4WORD		(0x2 << 10)
+#define WINCONx_BLD_PIX_F		(1 << 6)
+#define WINCONx_BPPMODE_MASK		(0xf << 2)
+#define WINCONx_BPPMODE_16BPP_565	(0x5 << 2)
+#define WINCONx_BPPMODE_16BPP_A1555	(0x6 << 2)
+#define WINCONx_BPPMODE_16BPP_I1555	(0x7 << 2)
+#define WINCONx_BPPMODE_24BPP_888	(0xb << 2)
+#define WINCONx_BPPMODE_24BPP_A1887	(0xc << 2)
+#define WINCONx_BPPMODE_25BPP_A1888	(0xd << 2)
+#define WINCONx_BPPMODE_32BPP_A8888	(0xd << 2)
+#define WINCONx_BPPMODE_16BPP_A4444	(0xe << 2)
+#define WINCONx_ALPHA_SEL_F		(1 << 1)
+#define WINCONx_ENWIN_F			(1 << 0)
+
+/* SHADOWCON */
+#define SHADOWCON_Wx_PROTECT(n)		(1 << (10 + (n)))
+
+/* VIDOSDxD */
+#define VIDOSD_Wx_ALPHA_R_F(n)		(((n) & 0xff) << 16)
+#define VIDOSD_Wx_ALPHA_G_F(n)		(((n) & 0xff) << 8)
+#define VIDOSD_Wx_ALPHA_B_F(n)		(((n) & 0xff) << 0)
+
+/* VIDINTCON0 */
+#define VIDINTCON0_FRAMEDONE		(1 << 17)
+#define VIDINTCON0_INTFRMEN		(1 << 12)
+#define VIDINTCON0_INTEN		(1 << 0)
+
+/* VIDINTCON1 */
+#define VIDINTCON1_INTFRMDONEPEND	(1 << 2)
+#define VIDINTCON1_INTFRMPEND		(1 << 1)
+#define VIDINTCON1_INTFIFOPEND		(1 << 0)
+
+/* DECON_CMU */
+#define CMU_CLKGAGE_MODE_SFR_F		(1 << 1)
+#define CMU_CLKGAGE_MODE_MEM_F		(1 << 0)
+
+/* DECON_UPDATE */
+#define STANDALONE_UPDATE_F		(1 << 0)
+
+/* DECON_VIDTCON00 */
+#define VIDTCON00_VBPD_F(x)		(((x) & 0xfff) << 16)
+#define VIDTCON00_VFPD_F(x)		((x) & 0xfff)
+
+/* DECON_VIDTCON01 */
+#define VIDTCON01_VSPW_F(x)		(((x) & 0xfff) << 16)
+
+/* DECON_VIDTCON10 */
+#define VIDTCON10_HBPD_F(x)		(((x) & 0xfff) << 16)
+#define VIDTCON10_HFPD_F(x)		((x) & 0xfff)
+
+/* DECON_VIDTCON11 */
+#define VIDTCON11_HSPW_F(x)		(((x) & 0xfff) << 16)
+
+/* DECON_VIDTCON2 */
+#define VIDTCON2_LINEVAL(x)		(((x) & 0xfff) << 16)
+#define VIDTCON2_HOZVAL(x)		((x) & 0xfff)
+
+/* TRIGCON */
+#define TRIGCON_TRIGEN_PER_F		(1 << 31)
+#define TRIGCON_TRIGEN_F		(1 << 30)
+#define TRIGCON_TE_AUTO_MASK		(1 << 29)
+#define TRIGCON_SWTRIGCMD		(1 << 1)
+#define TRIGCON_SWTRIGEN		(1 << 0)
+
+#endif /* EXYNOS_REGS_DECON_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
