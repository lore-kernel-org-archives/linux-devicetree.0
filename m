From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 3/5] drm: jz4780: Add DRM driver for Ingenic JZ4780
Date: Wed, 4 Mar 2015 15:37:49 +0000
Message-ID: <1425483471-59808-4-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1425483471-59808-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425483471-59808-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

Add drm driver for the Ingenic JZ4780 SoC.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 drivers/gpu/drm/Kconfig              |   2 +
 drivers/gpu/drm/Makefile             |   1 +
 drivers/gpu/drm/jz4780/Kconfig       |  12 +
 drivers/gpu/drm/jz4780/Makefile      |  10 +
 drivers/gpu/drm/jz4780/jz4780_crtc.c | 721 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/jz4780/jz4780_drv.c  | 388 +++++++++++++++++++
 drivers/gpu/drm/jz4780/jz4780_drv.h  |  84 ++++
 drivers/gpu/drm/jz4780/jz4780_regs.h | 696 +++++++++++++++++++++++++++++++++
 8 files changed, 1914 insertions(+)
 create mode 100644 drivers/gpu/drm/jz4780/Kconfig
 create mode 100644 drivers/gpu/drm/jz4780/Makefile
 create mode 100644 drivers/gpu/drm/jz4780/jz4780_crtc.c
 create mode 100644 drivers/gpu/drm/jz4780/jz4780_drv.c
 create mode 100644 drivers/gpu/drm/jz4780/jz4780_drv.h
 create mode 100644 drivers/gpu/drm/jz4780/jz4780_regs.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 151a050..77edd60 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -208,3 +208,5 @@ source "drivers/gpu/drm/sti/Kconfig"
 source "drivers/gpu/drm/amd/amdkfd/Kconfig"
 
 source "drivers/gpu/drm/imx/Kconfig"
+
+source "drivers/gpu/drm/jz4780/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c239b9..f8403e1 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_DRM_MSM) += msm/
 obj-$(CONFIG_DRM_TEGRA) += tegra/
 obj-$(CONFIG_DRM_STI) += sti/
 obj-$(CONFIG_DRM_IMX) += imx/
+obj-$(CONFIG_DRM_JZ4780) += jz4780/
 obj-y			+= i2c/
 obj-y			+= panel/
 obj-y			+= bridge/
diff --git a/drivers/gpu/drm/jz4780/Kconfig b/drivers/gpu/drm/jz4780/Kconfig
new file mode 100644
index 0000000..ae417d1
--- /dev/null
+++ b/drivers/gpu/drm/jz4780/Kconfig
@@ -0,0 +1,12 @@
+config DRM_JZ4780
+	tristate "DRM Support for Ingenic JZ4780 LCDC Display Controller"
+	depends on DRM && OF
+	select DRM_KMS_HELPER
+	select DRM_KMS_FB_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
+	select VIDEOMODE_HELPERS
+	help
+	  Choose this option if you have an Ingenic JZ4780 SoC with LCDC display
+	  controller, for example the MIPS Creator CI20 board
+
diff --git a/drivers/gpu/drm/jz4780/Makefile b/drivers/gpu/drm/jz4780/Makefile
new file mode 100644
index 0000000..f1c9ee5
--- /dev/null
+++ b/drivers/gpu/drm/jz4780/Makefile
@@ -0,0 +1,10 @@
+ccflags-y := -Iinclude/drm
+ifeq (, $(findstring -W,$(EXTRA_CFLAGS)))
+
+endif
+
+jz4780-y := \
+	jz4780_crtc.o \
+	jz4780_drv.o
+
+obj-$(CONFIG_DRM_JZ4780)	+= jz4780.o
diff --git a/drivers/gpu/drm/jz4780/jz4780_crtc.c b/drivers/gpu/drm/jz4780/jz4780_crtc.c
new file mode 100644
index 0000000..6f48cfa
--- /dev/null
+++ b/drivers/gpu/drm/jz4780/jz4780_crtc.c
@@ -0,0 +1,721 @@
+/*
+ * Copyright (C) 2014 Imagination Technologies
+ * Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+ *
+ * LCDC CRTC driver for Ingenic JZ4780, based on the tilcdc driver
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/component.h>
+
+#include "drm_flip_work.h"
+#include <drm/drm_plane_helper.h>
+
+#include "jz4780_drv.h"
+#include "jz4780_regs.h"
+
+/**
+ * @next: physical address of next frame descriptor
+ * @databuf: physical address of buffer
+ * @id: frame ID
+ * @cmd: DMA command and buffer length(in word)
+ * @offsize: DMA off size, in word
+ * @page_width: DMA page width, in word
+ * @cpos: smart LCD mode is commands' number, other is bpp,
+ * premulti and position of foreground 0, 1
+ * @desc_size: alpha and size of foreground 0, 1
+ */
+struct jz4780_framedesc {
+	uint32_t next;
+	uint32_t databuf;
+	uint32_t id;
+	uint32_t cmd;
+	uint32_t offsize;
+	uint32_t page_width;
+	uint32_t cpos;
+	uint32_t desc_size;
+} __packed;
+
+struct jz4780_crtc {
+	struct drm_crtc base;
+	struct device *dev;
+	struct drm_device *drm_dev;
+
+	const struct jz4780_panel_info *info;
+	uint32_t dirty;
+
+	struct drm_pending_vblank_event *event;
+	int dpms;
+	wait_queue_head_t frame_done_wq;
+	bool frame_done;
+
+	/* fb currently set to scanout 0/1: */
+	struct drm_framebuffer *scanout[2];
+
+	/* for deferred fb unref's: */
+	struct drm_flip_work unref_work;
+
+	/* DMA descriptors */
+	struct jz4780_framedesc *framedesc;
+	dma_addr_t framedesc_phys;
+};
+#define to_jz4780_crtc(x) container_of(x, struct jz4780_crtc, base)
+
+static void unref_worker(struct drm_flip_work *work, void *val)
+{
+	struct jz4780_crtc *jz4780_crtc =
+		container_of(work, struct jz4780_crtc, unref_work);
+	struct drm_device *dev = jz4780_crtc->base.dev;
+
+	mutex_lock(&dev->mode_config.mutex);
+	drm_framebuffer_unreference(val);
+	mutex_unlock(&dev->mode_config.mutex);
+}
+
+static void set_scanout(struct drm_crtc *crtc, int n)
+{
+	struct jz4780_crtc *jz4780_crtc = to_jz4780_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+	struct jz4780_drm_private *priv = dev->dev_private;
+	struct drm_framebuffer *fb = crtc->primary->fb;
+	struct jz4780_framedesc *framedesc = jz4780_crtc->framedesc;
+	struct drm_gem_cma_object *gem;
+	unsigned int depth, bpp;
+	int fg0_line_size;
+	int fg0_frm_size;
+	int height_width;
+
+	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	drm_fb_get_bpp_depth(fb->pixel_format, &depth, &bpp);
+	pm_runtime_get_sync(dev->dev);
+
+	/* lcd display area */
+	fg0_line_size = crtc->mode.hdisplay * bpp >> 3;
+	/* word aligned and in word */
+	fg0_line_size = ALIGN(fg0_line_size, 4) >> 2;
+	fg0_frm_size = fg0_line_size * crtc->mode.vdisplay;
+
+	height_width = (crtc->mode.vdisplay - 1) << LCDC_DESSIZE_HEIGHT_BIT
+		& LCDC_DESSIZE_HEIGHT_MASK;
+	height_width |= ((crtc->mode.hdisplay - 1) << LCDC_DESSIZE_WIDTH_BIT
+			     & LCDC_DESSIZE_WIDTH_MASK);
+
+	if (n == 0) {
+		framedesc[0].next = jz4780_crtc->framedesc_phys
+				    + sizeof(struct jz4780_framedesc);
+		framedesc[0].databuf = gem->paddr;
+		framedesc[0].id = 0xda0;
+		framedesc[0].cmd = LCDC_CMD_EOFINT | LCDC_CMD_FRM_EN
+				   | fg0_frm_size;
+		framedesc[0].offsize = 0;
+		framedesc[0].page_width = 0;
+		framedesc[0].cpos = 0x2d000000;
+		framedesc[0].desc_size = 0xff << LCDC_DESSIZE_ALPHA_BIT;
+		framedesc[0].desc_size |= height_width;
+
+		jz4780_write(dev, LCDC_DA0, framedesc[0].next);
+	} else {
+		framedesc[1].next = jz4780_crtc->framedesc_phys;
+		framedesc[1].id = 0xda1;
+		framedesc[1].databuf = gem->paddr;
+		framedesc[1].offsize = 0;
+		framedesc[1].page_width = 0;
+		framedesc[1].cmd = (LCDC_CMD_EOFINT | LCDC_CMD_FRM_EN)
+				   | fg0_frm_size;
+
+		framedesc[1].desc_size = 0xff << LCDC_DESSIZE_ALPHA_BIT;
+		framedesc[1].desc_size |= height_width;
+
+		framedesc[1].cpos = 0x2f000000;
+		jz4780_write(dev, LCDC_DA1, framedesc[1].next);
+	}
+
+	if (jz4780_crtc->scanout[n]) {
+		drm_flip_work_queue(&jz4780_crtc->unref_work,
+				    jz4780_crtc->scanout[n]);
+		drm_flip_work_commit(&jz4780_crtc->unref_work, priv->wq);
+	}
+	jz4780_crtc->scanout[n] = crtc->primary->fb;
+	drm_framebuffer_reference(jz4780_crtc->scanout[n]);
+	pm_runtime_put_sync(dev->dev);
+}
+
+static void update_scanout(struct drm_crtc *crtc)
+{
+	struct jz4780_crtc *jz4780_crtc = to_jz4780_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+
+	if (jz4780_crtc->dpms == DRM_MODE_DPMS_ON) {
+		drm_vblank_get(dev, 0);
+	} else {
+		/* not enabled yet, so update registers immediately: */
+		jz4780_write(dev, LCDC_STATE, 0);
+		set_scanout(crtc, 0);
+		set_scanout(crtc, 1);
+	}
+}
+
+static void start(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	uint32_t ctrl;
+
+	jz4780_write(dev, LCDC_STATE, 0);
+	jz4780_write(dev, LCDC_OSDS, 0);
+	ctrl = jz4780_read(dev, LCDC_CTRL);
+	ctrl |= LCDC_CTRL_ENA;
+	ctrl &= ~LCDC_CTRL_DIS;
+	jz4780_write(dev, LCDC_CTRL, ctrl);
+
+}
+
+static void stop(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	int count = 5;
+	uint32_t ctrl;
+
+	ctrl = jz4780_read(dev, LCDC_CTRL);
+	ctrl |= LCDC_CTRL_DIS;
+	jz4780_write(dev, LCDC_CTRL, ctrl);
+	while (!(jz4780_read(dev, LCDC_STATE) & LCDC_STATE_LDD)
+	       && count--) {
+		usleep_range(1000, 2000);
+	}
+	if (count >= 0) {
+		ctrl = jz4780_read(dev, LCDC_STATE);
+		ctrl &= ~LCDC_STATE_LDD;
+		jz4780_write(dev, LCDC_STATE, ctrl);
+	} else {
+		DRM_DEBUG_DRIVER("LCDC normal disable state wrong");
+	}
+
+}
+
+static void jz4780_crtc_destroy(struct drm_crtc *crtc)
+{
+	struct jz4780_crtc *jz4780_crtc = to_jz4780_crtc(crtc);
+
+	drm_crtc_cleanup(crtc);
+	drm_flip_work_cleanup(&jz4780_crtc->unref_work);
+
+}
+
+static int jz4780_crtc_page_flip(struct drm_crtc *crtc,
+		struct drm_framebuffer *fb,
+		struct drm_pending_vblank_event *event,
+		uint32_t page_flip_flags)
+{
+	struct jz4780_crtc *jz4780_crtc = to_jz4780_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+
+	if (jz4780_crtc->event) {
+		dev_err(dev->dev, "already pending page flip!\n");
+		return -EBUSY;
+	}
+
+	crtc->primary->fb = fb;
+	jz4780_crtc->event = event;
+	update_scanout(crtc);
+
+	return 0;
+}
+
+static void jz4780_crtc_dpms(struct drm_crtc *crtc, int mode)
+{
+	struct jz4780_crtc *jz4780_crtc = to_jz4780_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+
+	/* we really only care about on or off: */
+	if (mode != DRM_MODE_DPMS_ON)
+		mode = DRM_MODE_DPMS_OFF;
+
+	if (jz4780_crtc->dpms == mode)
+		return;
+
+	jz4780_crtc->dpms = mode;
+
+	pm_runtime_get_sync(dev->dev);
+
+	if (mode == DRM_MODE_DPMS_ON) {
+		pm_runtime_forbid(dev->dev);
+		start(crtc);
+	} else {
+		jz4780_crtc->frame_done = false;
+		stop(crtc);
+		pm_runtime_allow(dev->dev);
+	}
+
+	pm_runtime_put_sync(dev->dev);
+}
+
+static bool jz4780_crtc_mode_fixup(struct drm_crtc *crtc,
+		const struct drm_display_mode *mode,
+		struct drm_display_mode *adjusted_mode)
+{
+	DRM_DEBUG_DRIVER("Mode Fixup not supported by driver yet\n");
+	return true;
+}
+
+static void jz4780_crtc_prepare(struct drm_crtc *crtc)
+{
+
+	jz4780_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+}
+
+static void jz4780_crtc_commit(struct drm_crtc *crtc)
+{
+
+	jz4780_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
+}
+
+static int jz4780_crtc_mode_set(struct drm_crtc *crtc,
+		struct drm_display_mode *mode,
+		struct drm_display_mode *adjusted_mode,
+		int x, int y,
+		struct drm_framebuffer *old_fb)
+{
+	struct drm_device *dev = crtc->dev;
+	uint32_t hbp, hfp, hsw, vbp, vfp, vsw;
+	int ret;
+	uint32_t pcfg;
+
+	uint16_t hds, vds;
+	uint16_t hde, vde;
+	uint16_t ht, vt;
+	uint32_t cfg, ctrl;
+	unsigned int rgb_ctrl;
+
+	ret = jz4780_crtc_mode_valid(crtc, mode);
+	if (WARN_ON(ret))
+		return ret;
+
+	pm_runtime_get_sync(dev->dev);
+
+	/* Configure timings: */
+	hbp = mode->htotal - mode->hsync_end;
+	hfp = mode->hsync_start - mode->hdisplay;
+	hsw = mode->hsync_end - mode->hsync_start;
+	vbp = mode->vtotal - mode->vsync_end;
+	vfp = mode->vsync_start - mode->vdisplay;
+	vsw = mode->vsync_end - mode->vsync_start;
+
+	hds = hsw + hbp;
+	hde = hds + mode->hdisplay;
+	ht = hde + hfp;
+
+	vds = vsw + vbp;
+	vde = vds + mode->vdisplay;
+	vt = vde + vfp;
+
+	cfg = LCDC_CFG_NEWDES | LCDC_CFG_RECOVER | LCDC_CFG_MODE_TFT_24BIT;
+	cfg |= LCDC_CFG_PSM;
+	cfg |= LCDC_CFG_CLSM;
+	cfg |= LCDC_CFG_SPLM;
+	cfg |= LCDC_CFG_REVM;
+	cfg |= LCDC_CFG_PCP;
+
+	ctrl = LCDC_CTRL_BST_64 | LCDC_CTRL_OFUM;
+
+	/* magic number */
+	pcfg = 0xC0000000 | (511<<18) | (400<<9) | (256<<0);
+
+	jz4780_write(dev, LCDC_VAT, (ht << 16) | vt);
+	jz4780_write(dev, LCDC_DAH, (hds << 16) | hde);
+	jz4780_write(dev, LCDC_DAV, (vds << 16) | vde);
+
+	jz4780_write(dev, LCDC_HSYNC, hsw);
+	jz4780_write(dev, LCDC_VSYNC, vsw);
+
+	jz4780_write(dev, LCDC_CFG, cfg);
+	ctrl |= jz4780_read(dev, LCDC_CTRL);
+	jz4780_write(dev, LCDC_CTRL, ctrl);
+	jz4780_write(dev, LCDC_PCFG, pcfg);
+
+	rgb_ctrl = LCDC_RGBC_RGBFMT | LCDC_RGBC_ODD_RGB |
+			LCDC_RGBC_EVEN_RGB;
+
+	jz4780_write(dev, LCDC_RGBC, rgb_ctrl);
+
+	update_scanout(crtc);
+	jz4780_crtc_update_clk(crtc);
+
+	pm_runtime_put_sync(dev->dev);
+
+	return 0;
+}
+
+static const struct drm_crtc_funcs jz4780_crtc_funcs = {
+		.destroy        = jz4780_crtc_destroy,
+		.set_config     = drm_crtc_helper_set_config,
+		.page_flip      = jz4780_crtc_page_flip,
+};
+
+static const struct drm_crtc_helper_funcs jz4780_crtc_helper_funcs = {
+		.dpms           = jz4780_crtc_dpms,
+		.mode_fixup     = jz4780_crtc_mode_fixup,
+		.prepare        = jz4780_crtc_prepare,
+		.commit         = jz4780_crtc_commit,
+		.mode_set       = jz4780_crtc_mode_set,
+};
+
+int jz4780_crtc_max_width(struct drm_crtc *crtc)
+{
+	return 2048;
+}
+
+int jz4780_crtc_mode_valid(struct drm_crtc *crtc, struct drm_display_mode *mode)
+{
+	struct jz4780_drm_private *priv = crtc->dev->dev_private;
+	unsigned int bandwidth;
+	uint32_t hbp, hfp, hsw, vbp, vfp, vsw;
+
+	/*
+	 * check to see if the width is within the range that
+	 * the LCD Controller physically supports
+	 */
+	if (mode->hdisplay > 2048)
+		return MODE_VIRTUAL_X;
+
+	/* width must be multiple of 16 */
+	if (mode->hdisplay & 0xf)
+		return MODE_VIRTUAL_X;
+
+	if (mode->vdisplay > 2048)
+		return MODE_VIRTUAL_Y;
+
+	DRM_DEBUG_DRIVER("Processing mode %dx%d@%d with pixel clock %d",
+		mode->hdisplay, mode->vdisplay,
+		drm_mode_vrefresh(mode), mode->clock);
+
+	hbp = mode->htotal - mode->hsync_end;
+	hfp = mode->hsync_start - mode->hdisplay;
+	hsw = mode->hsync_end - mode->hsync_start;
+	vbp = mode->vtotal - mode->vsync_end;
+	vfp = mode->vsync_start - mode->vdisplay;
+	vsw = mode->vsync_end - mode->vsync_start;
+
+	if ((hbp-1) & ~0x3ff) {
+		DRM_DEBUG_DRIVER("Prune: Horizontal Back Porch out of range");
+		return MODE_HBLANK_WIDE;
+	}
+
+	if ((hfp-1) & ~0x3ff) {
+		DRM_DEBUG_DRIVER("Prune: Horizontal Front Porch out of range");
+		return MODE_HBLANK_WIDE;
+	}
+
+	if ((hsw-1) & ~0x3ff) {
+		DRM_DEBUG_DRIVER("Prune: Horizontal Sync Width out of range");
+		return MODE_HSYNC_WIDE;
+	}
+
+	if (vbp & ~0xff) {
+		DRM_DEBUG_DRIVER("Prune: Vertical Back Porch out of range");
+		return MODE_VBLANK_WIDE;
+	}
+
+	if (vfp & ~0xff) {
+		DRM_DEBUG_DRIVER("Prune: Vertical Front Porch out of range");
+		return MODE_VBLANK_WIDE;
+	}
+
+	if ((vsw-1) & ~0x3f) {
+		DRM_DEBUG_DRIVER("Prune: Vertical Sync Width out of range");
+		return MODE_VSYNC_WIDE;
+	}
+
+	/*
+	 * some devices have a maximum allowed pixel clock
+	 * configured from the DT
+	 */
+	if (mode->clock > priv->max_pixelclock) {
+		DRM_DEBUG_DRIVER("Prune: pixel clock too high");
+		return MODE_CLOCK_HIGH;
+	}
+
+	/*
+	 * some devices further limit the max horizontal resolution
+	 * configured from the DT
+	 */
+	if (mode->hdisplay > priv->max_width) {
+		DRM_DEBUG_DRIVER("Prune: Bad width");
+		return MODE_BAD_WIDTH;
+	}
+
+	/* filter out modes that would require too much memory bandwidth: */
+	bandwidth = mode->hdisplay * mode->vdisplay *
+		drm_mode_vrefresh(mode);
+	if (bandwidth > priv->max_bandwidth) {
+		DRM_DEBUG_DRIVER("Prune: exceeds defined bandwidth limit %d",
+				 bandwidth);
+		return MODE_BAD;
+	}
+
+	return MODE_OK;
+}
+
+void jz4780_crtc_update_clk(struct drm_crtc *crtc)
+{
+	struct jz4780_crtc *jz4780_crtc = to_jz4780_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+	struct jz4780_drm_private *priv = dev->dev_private;
+	int dpms = jz4780_crtc->dpms;
+	unsigned int lcd_clk;
+	int ret;
+
+	pm_runtime_get_sync(dev->dev);
+
+	if (dpms == DRM_MODE_DPMS_ON)
+		jz4780_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+
+	/* in raster mode, minimum divisor is 2: */
+	ret = clk_set_rate(priv->disp_clk, crtc->mode.clock * 1000);
+	if (ret) {
+		dev_err(dev->dev, "failed to set display clock rate to: %d\n",
+				crtc->mode.clock);
+		goto out;
+	}
+
+	lcd_clk = clk_get_rate(priv->clk);
+
+	DRM_DEBUG_DRIVER("lcd_clk=%u, mode clock=%d", lcd_clk,
+			  crtc->mode.clock);
+	DRM_DEBUG_DRIVER("fck=%lu, dpll_disp_ck=%lu", clk_get_rate(priv->clk),
+			 clk_get_rate(priv->disp_clk));
+
+	if (dpms == DRM_MODE_DPMS_ON)
+		jz4780_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
+
+out:
+	pm_runtime_put_sync(dev->dev);
+}
+
+irqreturn_t jz4780_crtc_irq(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int state;
+	unsigned int tmp;
+
+	state = jz4780_read(dev, LCDC_STATE);
+
+	if (state & LCDC_STATE_EOF) {
+		jz4780_write(dev, LCDC_STATE, state & ~LCDC_STATE_EOF);
+		update_scanout(crtc);
+	}
+
+	if (state & LCDC_STATE_OFU) {
+		DRM_DEBUG_DRIVER("Out FiFo underrun\n");
+		jz4780_write(dev, LCDC_STATE, state & ~LCDC_STATE_OFU);
+		tmp = jz4780_read(dev, LCDC_CTRL);
+		jz4780_write(dev, LCDC_CTRL, tmp & ~LCDC_CTRL_OFUM);
+		update_scanout(crtc);
+		start(crtc);
+	}
+
+	return IRQ_HANDLED;
+}
+
+void jz4780_crtc_cancel_page_flip(struct drm_crtc *crtc, struct drm_file *file)
+{
+	struct jz4780_crtc *jz4780_crtc = to_jz4780_crtc(crtc);
+	struct drm_pending_vblank_event *event;
+	struct drm_device *dev = crtc->dev;
+	unsigned long flags;
+
+	/* Destroy the pending vertical blanking event associated with the
+	 * pending page flip, if any, and disable vertical blanking interrupts.
+	 */
+	spin_lock_irqsave(&dev->event_lock, flags);
+	event = jz4780_crtc->event;
+	if (event && event->base.file_priv == file) {
+		jz4780_crtc->event = NULL;
+		event->base.destroy(&event->base);
+		drm_vblank_put(dev, 0);
+	}
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+}
+
+struct drm_crtc *jz4780_crtc_create(struct jz4780_crtc *jz4780_crtc)
+{
+
+	struct drm_crtc *crtc;
+	struct device_node *port;
+	struct drm_device *drm_dev = jz4780_crtc->drm_dev;
+	struct device *dev = jz4780_crtc->dev;
+	int ret;
+
+	jz4780_crtc->framedesc = dma_alloc_coherent(dev,
+				 sizeof(struct jz4780_framedesc) * 2,
+				 &jz4780_crtc->framedesc_phys,
+				 GFP_KERNEL | GFP_ATOMIC);
+	if (!jz4780_crtc->framedesc) {
+		dev_err(dev, "desc allocation failed\n");
+		return NULL;
+	}
+
+	crtc = &jz4780_crtc->base;
+
+	jz4780_crtc->dpms = DRM_MODE_DPMS_OFF;
+	init_waitqueue_head(&jz4780_crtc->frame_done_wq);
+
+	drm_flip_work_init(&jz4780_crtc->unref_work,
+			"unref", unref_worker);
+
+
+	ret = drm_crtc_init(drm_dev, crtc, &jz4780_crtc_funcs);
+	if (ret < 0)
+		goto fail;
+
+	drm_crtc_helper_add(crtc, &jz4780_crtc_helper_funcs);
+
+	port = of_get_child_by_name(dev->of_node, "port");
+	if (!port) {
+		DRM_ERROR("no port node found in %s\n",
+			  dev->of_node->full_name);
+		goto fail;
+	}
+
+	crtc->port = port;
+
+	return crtc;
+
+fail:
+	jz4780_crtc_destroy(crtc);
+	return NULL;
+}
+
+static const struct of_device_id jz4780_driver_dt_match[] = {
+	{ .compatible = "ingenic,jz4780-lcd",
+	  .data = NULL },
+	{},
+};
+
+static int jz4780_crtc_bind(struct device *dev, struct device *master,
+			    void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	const struct of_device_id *of_id;
+	struct drm_device *drm_dev = data;
+	struct jz4780_drm_private *priv = drm_dev->dev_private;
+	struct resource *res;
+	struct device_node *node = dev->of_node;
+	struct jz4780_crtc *jz4780_crtc;
+
+	jz4780_crtc = devm_kzalloc(dev, sizeof(*jz4780_crtc), GFP_KERNEL);
+	if (!jz4780_crtc)
+		return -ENOMEM;
+
+	jz4780_crtc->dev = dev;
+	jz4780_crtc->drm_dev = drm_dev;
+	dev_set_drvdata(dev, jz4780_crtc);
+
+	of_id = of_match_device(jz4780_driver_dt_match, dev);
+	if (!of_id)
+		return -ENODEV;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		DRM_DEBUG_DRIVER("failed to get memory resource\n");
+		return -EINVAL;
+	}
+
+	priv->mmio = ioremap_nocache(res->start, resource_size(res));
+	if (!priv->mmio) {
+		DRM_DEBUG_DRIVER("failed to ioremap\n");
+		return -ENOMEM;
+	}
+
+	priv->clk = devm_clk_get(dev, "lcd_clk");
+	if (IS_ERR(priv->clk)) {
+		DRM_DEBUG_DRIVER("failed to get lcd clock\n");
+		return -ENODEV;
+	}
+
+	clk_prepare_enable(priv->clk);
+
+	priv->disp_clk = devm_clk_get(dev, "lcd_pixclk");
+	if (IS_ERR(priv->clk)) {
+		DRM_DEBUG_DRIVER("failed to get pixel clock\n");
+		return -ENODEV;
+	}
+
+	clk_prepare_enable(priv->disp_clk);
+
+	if (of_property_read_u32(node, "max-bandwidth", &priv->max_bandwidth))
+		priv->max_bandwidth = JZ4780_DEFAULT_MAX_BANDWIDTH;
+
+	if (of_property_read_u32(node, "max-width", &priv->max_width))
+		priv->max_width = JZ4780_DEFAULT_MAX_WIDTH;
+
+	if (of_property_read_u32(node, "max-pixelclock",
+					&priv->max_pixelclock))
+		priv->max_pixelclock = JZ4780_DEFAULT_MAX_PIXELCLOCK;
+
+	drm_irq_install(drm_dev, platform_get_irq(pdev, 0));
+
+	priv->crtc = jz4780_crtc_create(jz4780_crtc);
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static void jz4780_crtc_unbind(struct device *dev, struct device *master,
+			       void *data)
+{
+	struct jz4780_crtc *jz4780_crtc = dev_get_drvdata(dev);
+
+	pm_runtime_disable(dev);
+	jz4780_crtc_destroy(&jz4780_crtc->base);
+}
+
+static const struct component_ops jz4780_crtc_component_ops = {
+	.bind = jz4780_crtc_bind,
+	.unbind = jz4780_crtc_unbind,
+};
+
+static int jz4780_crtc_probe(struct platform_device *pdev)
+{
+
+	struct device *dev = &pdev->dev;
+
+	if (!dev->of_node) {
+		dev_err(dev, "can't find jz4780 crtc devices\n");
+		return -ENODEV;
+	}
+
+	return component_add(dev, &jz4780_crtc_component_ops);
+}
+
+static int jz4780_crtc_remove(struct platform_device *pdev)
+{
+
+	component_del(&pdev->dev, &jz4780_crtc_component_ops);
+
+	return 0;
+}
+
+struct platform_driver jz4780_crtc_platform_driver = {
+	.probe = jz4780_crtc_probe,
+	.remove = jz4780_crtc_remove,
+	.driver = {
+		.name = "jz4780-lcd-crtc",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(jz4780_driver_dt_match),
+	},
+};
+
+module_platform_driver(jz4780_crtc_platform_driver);
+
diff --git a/drivers/gpu/drm/jz4780/jz4780_drv.c b/drivers/gpu/drm/jz4780/jz4780_drv.c
new file mode 100644
index 0000000..7728109
--- /dev/null
+++ b/drivers/gpu/drm/jz4780/jz4780_drv.c
@@ -0,0 +1,388 @@
+/*
+ * Copyright (C) 2015 Imagination Technologies
+ * Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+ *
+ * DRM driver for Ingenic JZ4780
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <linux/of_graph.h>
+#include <linux/component.h>
+
+#include "jz4780_drv.h"
+#include "jz4780_regs.h"
+
+static void jz4780_fb_output_poll_changed(struct drm_device *drm_dev)
+{
+
+	struct jz4780_drm_private *priv = drm_dev->dev_private;
+
+	if (priv->fbdev)
+		drm_fbdev_cma_hotplug_event(priv->fbdev);
+}
+
+static const struct drm_mode_config_funcs jz4780_mode_config_funcs = {
+	.fb_create = drm_fb_cma_create,
+	.output_poll_changed = jz4780_fb_output_poll_changed,
+};
+
+void jz4780_drm_mode_config_init(struct drm_device *drm_dev)
+{
+
+	drm_dev->mode_config.min_width = 0;
+	drm_dev->mode_config.min_height = 0;
+	drm_dev->mode_config.max_width = 2048;
+	drm_dev->mode_config.max_height = 2048;
+	drm_dev->mode_config.funcs = &jz4780_mode_config_funcs;
+}
+
+/*
+ * DRM operations:
+ */
+
+static int jz4780_unload(struct drm_device *drm_dev)
+{
+
+	struct jz4780_drm_private *priv = drm_dev->dev_private;
+	struct device *dev = drm_dev->dev;
+
+	drm_kms_helper_poll_fini(drm_dev);
+	drm_mode_config_cleanup(drm_dev);
+	drm_vblank_cleanup(drm_dev);
+
+	component_unbind_all(dev, drm_dev);
+
+	flush_workqueue(priv->wq);
+	destroy_workqueue(priv->wq);
+
+	drm_dev->dev_private = NULL;
+	pm_runtime_disable(drm_dev->dev);
+
+	return 0;
+}
+
+static int jz4780_load(struct drm_device *drm_dev, unsigned long flags)
+{
+	struct device *dev = drm_dev->dev;
+	struct jz4780_drm_private *priv;
+	int ret;
+
+	priv = devm_kzalloc(drm_dev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		DRM_DEBUG_DRIVER("failed to allocate private data\n");
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(drm_dev->platformdev, drm_dev);
+	drm_dev->dev_private = priv;
+
+	priv->wq = alloc_ordered_workqueue("jz4780", 0);
+
+	drm_mode_config_init(drm_dev);
+
+	jz4780_drm_mode_config_init(drm_dev);
+
+	/* Try to bind all sub drivers. */
+	ret = component_bind_all(dev, drm_dev);
+	if (ret)
+		goto err_config_cleanup;
+
+	ret = drm_vblank_init(drm_dev, 1);
+	if (ret < 0) {
+		DRM_DEBUG_DRIVER("failed to initialize vblank\n");
+		goto err_vblank_cleanup;
+	}
+
+	priv->fbdev = drm_fbdev_cma_init(drm_dev, 32,
+			drm_dev->mode_config.num_crtc,
+			drm_dev->mode_config.num_connector);
+
+	drm_kms_helper_poll_init(drm_dev);
+
+	return 0;
+
+err_vblank_cleanup:
+	drm_vblank_cleanup(drm_dev);
+	component_unbind_all(dev, drm_dev);
+err_config_cleanup:
+	drm_mode_config_cleanup(drm_dev);
+	return ret;
+}
+
+static void jz4780_preclose(struct drm_device *drm_dev, struct drm_file *file)
+{
+
+	struct jz4780_drm_private *priv = drm_dev->dev_private;
+
+	jz4780_crtc_cancel_page_flip(priv->crtc, file);
+}
+
+static void jz4780_lastclose(struct drm_device *drm_dev)
+{
+
+	struct jz4780_drm_private *priv = drm_dev->dev_private;
+
+	drm_fbdev_cma_restore_mode(priv->fbdev);
+}
+
+static irqreturn_t jz4780_irq(int irq, void *arg)
+{
+
+	struct drm_device *drm_dev = arg;
+	struct jz4780_drm_private *priv = drm_dev->dev_private;
+
+	return jz4780_crtc_irq(priv->crtc);
+}
+
+static void jz4780_enable_disable_vblank(struct drm_device *drm_dev,
+					 bool enable)
+{
+
+	u32 tmp;
+
+	/* clear previous EOF flag */
+	tmp = jz4780_read(drm_dev, LCDC_STATE);
+	jz4780_write(drm_dev, LCDC_STATE, tmp & ~LCDC_STATE_EOF);
+
+	/* enable end of frame interrupt */
+	tmp = jz4780_read(drm_dev, LCDC_CTRL);
+	if (enable)
+		jz4780_write(drm_dev, LCDC_CTRL, tmp | LCDC_CTRL_EOFM);
+	else
+		jz4780_write(drm_dev, LCDC_CTRL, tmp & ~LCDC_CTRL_EOFM);
+
+}
+
+static int jz4780_enable_vblank(struct drm_device *drm_dev, int crtc)
+{
+
+	jz4780_enable_disable_vblank(drm_dev, true);
+	return 0;
+}
+
+static void jz4780_disable_vblank(struct drm_device *drm_dev, int crtc)
+{
+
+	jz4780_enable_disable_vblank(drm_dev, false);
+}
+
+static const struct file_operations fops = {
+	.owner              = THIS_MODULE,
+	.open               = drm_open,
+	.release            = drm_release,
+	.unlocked_ioctl     = drm_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl       = drm_compat_ioctl,
+#endif
+	.poll               = drm_poll,
+	.read               = drm_read,
+	.llseek             = no_llseek,
+	.mmap               = drm_gem_cma_mmap,
+};
+
+static struct drm_driver jz4780_driver = {
+	.driver_features    = DRIVER_HAVE_IRQ | DRIVER_GEM | DRIVER_MODESET,
+	.load               = jz4780_load,
+	.unload             = jz4780_unload,
+	.preclose           = jz4780_preclose,
+	.lastclose          = jz4780_lastclose,
+	.set_busid          = drm_platform_set_busid,
+	.irq_handler        = jz4780_irq,
+	.get_vblank_counter = drm_vblank_count,
+	.enable_vblank      = jz4780_enable_vblank,
+	.disable_vblank     = jz4780_disable_vblank,
+	.gem_free_object    = drm_gem_cma_free_object,
+	.gem_vm_ops         = &drm_gem_cma_vm_ops,
+	.dumb_create        = drm_gem_cma_dumb_create,
+	.dumb_map_offset    = drm_gem_cma_dumb_map_offset,
+	.dumb_destroy       = drm_gem_dumb_destroy,
+	.fops               = &fops,
+	.name               = "jz4780",
+	.desc               = "Ingenic LCD Controller DRM",
+	.date               = "20140623",
+	.major              = 1,
+	.minor              = 0,
+};
+
+static int compare_of(struct device *dev, void *data)
+{
+
+	struct device_node *np = data;
+
+	return dev->of_node == np;
+}
+
+static void jz4780_add_endpoints(struct device *dev,
+				   struct component_match **match,
+				   struct device_node *port)
+{
+
+	struct device_node *ep, *remote;
+
+	for_each_child_of_node(port, ep) {
+		remote = of_graph_get_remote_port_parent(ep);
+		if (!remote || !of_device_is_available(remote)) {
+			of_node_put(remote);
+			continue;
+		} else if (!of_device_is_available(remote->parent)) {
+			dev_warn(dev, "parent device of %s is not available\n",
+				 remote->full_name);
+			of_node_put(remote);
+			continue;
+		}
+
+		component_match_add(dev, match, compare_of, remote);
+		of_node_put(remote);
+	}
+}
+
+static int jz4780_drm_bind(struct device *dev)
+{
+
+	struct drm_device *drm;
+	struct platform_device *pdev = dev_get_drvdata(dev);
+	int ret;
+
+	drm = drm_dev_alloc(&jz4780_driver, dev);
+	if (!drm)
+		return -ENOMEM;
+
+	ret = drm_dev_set_unique(drm, "%s", dev_name(dev));
+	if (ret)
+		goto err_free;
+
+	drm->platformdev = pdev;
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		goto err_free;
+
+	dev_set_drvdata(dev, drm);
+
+	return 0;
+
+err_free:
+	drm_dev_unref(drm);
+	return ret;
+}
+
+static void jz4780_drm_unbind(struct device *dev)
+{
+
+	struct drm_device *drm = dev_get_drvdata(dev);
+
+	drm_dev_unregister(drm);
+	drm_dev_unref(drm);
+	dev_set_drvdata(dev, NULL);
+}
+
+static const struct component_master_ops jz4780_drm_ops = {
+	.bind = jz4780_drm_bind,
+	.unbind = jz4780_drm_unbind,
+};
+
+/*
+ * Platform driver:
+ */
+static int jz4780_pdev_probe(struct platform_device *pdev)
+{
+
+	struct device *dev = &pdev->dev;
+	struct component_match *match = NULL;
+	struct device_node *np = dev->of_node;
+	struct device_node *port;
+	int i;
+
+	if (!np)
+		return -ENODEV;
+
+	/*
+	 * Bind the crtc ports first, so that
+	 * drm_of_find_possible_crtcs called from encoder .bind callbacks
+	 * works as expected.
+	 */
+	for (i = 0;; i++) {
+		port = of_parse_phandle(np, "ports", i);
+		if (!port)
+			break;
+
+		if (!of_device_is_available(port->parent)) {
+			of_node_put(port);
+			continue;
+		}
+
+		component_match_add(dev, &match, compare_of, port->parent);
+		of_node_put(port);
+	}
+
+	if (i == 0) {
+		dev_err(dev, "missing 'ports' property\n");
+		return -ENODEV;
+	}
+
+	if (!match) {
+		dev_err(dev, "No available crtc found for display-subsystem.\n");
+		return -ENODEV;
+	}
+	/*
+	 * For each bound crtc, bind the encoders attached to its
+	 * remote endpoint.
+	 */
+	for (i = 0;; i++) {
+		port = of_parse_phandle(np, "ports", i);
+		if (!port)
+			break;
+
+		if (!of_device_is_available(port->parent)) {
+			of_node_put(port);
+			continue;
+		}
+
+		jz4780_add_endpoints(dev, &match, port);
+		of_node_put(port);
+	}
+
+	dev_set_drvdata(dev, pdev);
+	return component_master_add_with_match(dev, &jz4780_drm_ops, match);
+}
+
+static int jz4780_pdev_remove(struct platform_device *pdev)
+{
+
+	component_master_del(&pdev->dev, &jz4780_drm_ops);
+	return 0;
+}
+
+static const struct of_device_id jz4780_of_match[] = {
+		{ .compatible = "ingenic,jz4780-display-subsystem", },
+		{ },
+};
+MODULE_DEVICE_TABLE(of, jz4780_of_match);
+
+static struct platform_driver jz4780_platform_driver = {
+	.probe      = jz4780_pdev_probe,
+	.remove     = jz4780_pdev_remove,
+	.driver     = {
+		.owner  = THIS_MODULE,
+		.name   = "ingenic-jz4780-drm",
+		.of_match_table = jz4780_of_match,
+	},
+};
+
+module_platform_driver(jz4780_platform_driver);
+
+MODULE_AUTHOR("Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>");
+MODULE_DESCRIPTION("Ingenic JZ4780 LCD/HDMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/jz4780/jz4780_drv.h b/drivers/gpu/drm/jz4780/jz4780_drv.h
new file mode 100644
index 0000000..981ce83
--- /dev/null
+++ b/drivers/gpu/drm/jz4780/jz4780_drv.h
@@ -0,0 +1,84 @@
+/*
+ * Copyright (C) 2014 Imagination Technologies
+ * Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __jz4780_DRV_H__
+#define __jz4780_DRV_H__
+
+#include <linux/clk.h>
+#include <linux/cpufreq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/list.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+
+/* Defaulting to maximum capability of JZ4780 */
+#define JZ4780_DEFAULT_MAX_PIXELCLOCK	200000
+#define JZ4780_DEFAULT_MAX_WIDTH	2048
+#define JZ4780_DEFAULT_MAX_BANDWIDTH	(1920*1080*60)
+
+
+struct jz4780_drm_private {
+	void __iomem *mmio;
+
+	struct clk *disp_clk;    /* display dpll */
+	struct clk *clk;         /* functional clock */
+	int rev;                /* IP revision */
+
+	/* don't attempt resolutions w/ higher W * H * Hz: */
+	uint32_t max_bandwidth;
+	/*
+	 * Pixel Clock will be restricted to some value as
+	 * defined in the device datasheet measured in KHz
+	 */
+	uint32_t max_pixelclock;
+	/*
+	 * Max allowable width is limited on a per device basis
+	 * measured in pixels
+	 */
+	uint32_t max_width;
+
+	struct workqueue_struct *wq;
+
+	struct drm_fbdev_cma *fbdev;
+
+	struct drm_crtc *crtc;
+
+	unsigned int num_encoders;
+	struct drm_encoder *encoders[8];
+
+	unsigned int num_connectors;
+	struct drm_connector *connectors[8];
+};
+
+void jz4780_crtc_cancel_page_flip(struct drm_crtc *crtc,
+				  struct drm_file *file);
+irqreturn_t jz4780_crtc_irq(struct drm_crtc *crtc);
+void jz4780_crtc_update_clk(struct drm_crtc *crtc);
+int jz4780_crtc_mode_valid(struct drm_crtc *crtc,
+			   struct drm_display_mode *mode);
+int jz4780_crtc_max_width(struct drm_crtc *crtc);
+
+#endif /* __jz4780_DRV_H__ */
diff --git a/drivers/gpu/drm/jz4780/jz4780_regs.h b/drivers/gpu/drm/jz4780/jz4780_regs.h
new file mode 100644
index 0000000..20f7435
--- /dev/null
+++ b/drivers/gpu/drm/jz4780/jz4780_regs.h
@@ -0,0 +1,696 @@
+/*
+ * Copyright (c) 2014 Imagination Technologies
+ * Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __JZ4780_REGS_H__
+#define __JZ4780_REGS_H__
+
+/* LCDC register definitions */
+
+#include <linux/bitops.h>
+
+#include "jz4780_drv.h"
+
+/* Register Map Of LCDC */
+#define LCDC_CFG			0x00
+#define LCDC_CTRL			0x30
+#define LCDC_STATE			0x34
+#define LCDC_OSDC			0x100
+#define LCDC_OSDCTRL			0x104
+#define LCDC_OSDS			0x108
+#define LCDC_BGC0			0x10c
+#define LCDC_BGC1			0x2c4
+#define LCDC_KEY0			0x110
+#define LCDC_KEY1			0x114
+#define LCDC_ALPHA			0x118
+#define LCDC_IPUR			0x11c
+#define LCDC_RGBC			0x90
+#define LCDC_VAT			0x0c
+#define LCDC_DAH			0x10
+#define LCDC_DAV			0x14
+#define LCDC_XYP0			0x120
+#define LCDC_XYP1			0x124
+#define LCDC_SIZE0			0x128
+#define LCDC_SIZE1			0x12c
+#define LCDC_VSYNC			0x04
+#define LCDC_HSYNC			0x08
+#define LCDC_PS				0x18
+#define LCDC_CLS			0x1c
+#define LCDC_SPL			0x20
+#define LCDC_REV			0x24
+#define LCDC_IID			0x38
+#define LCDC_DA0			0x40
+#define LCDC_SA0			0x44
+#define LCDC_FID0			0x48
+#define LCDC_CMD0			0x4c
+#define LCDC_OFFS0			0x60
+#define LCDC_PW0			0x64
+#define LCDC_CNUM0			0x68
+#define LCDC_CPOS0			0x68
+#define LCDC_DESSIZE0			0x6c
+#define LCDC_DA1			0x50
+#define LCDC_SA1			0x54
+#define LCDC_FID1			0x58
+#define LCDC_CMD1			0x5c
+#define LCDC_OFFS1			0x70
+#define LCDC_PW1			0x74
+#define LCDC_CNUM1			0x78
+#define LCDC_CPOS1			0x78
+#define LCDC_DESSIZE1			0x7c
+#define LCDC_PCFG			0x2c0
+#define LCDC_DUAL_CTRL			0x2c8
+#define LCDC_ENH_CFG			0x400
+#define LCDC_ENH_CSCCFG			0x404
+#define LCDC_ENH_LUMACFG		0x408
+#define LCDC_ENH_CHROCFG0		0x40c
+#define LCDC_ENH_CHROCFG1		0x410
+#define LCDC_ENH_DITHERCFG		0x414
+#define LCDC_ENH_STATUS			0x418
+#define LCDC_ENH_GAMMA			0x800
+#define LCDC_ENH_VEE			0x1000
+
+/* LCD Configure Register */
+#define LCDC_CFG_LCDPIN_BIT		31
+#define LCDC_CFG_LCDPIN_MASK		(0x1 << LCDC_CFG_LCDPIN_BIT)
+#define LCDC_CFG_LCDPIN_LCD		(0x0 << LCDC_CFG_LCDPIN_BIT)
+#define LCDC_CFG_LCDPIN_SLCD		(0x1 << LCDC_CFG_LCDPIN_BIT)
+#define LCDC_CFG_TVEPEH			BIT(30)
+#define LCDC_CFG_NEWDES			BIT(28)
+#define LCDC_CFG_PALBP			BIT(27)
+#define LCDC_CFG_TVEN			BIT(26)
+#define LCDC_CFG_RECOVER		BIT(25)
+
+#define LCDC_CFG_PSM			BIT(23)
+#define LCDC_CFG_CLSM			BIT(22)
+#define LCDC_CFG_SPLM			BIT(21)
+#define LCDC_CFG_REVM			BIT(20)
+#define LCDC_CFG_HSYNM			BIT(19)
+#define LCDC_CFG_PCLKM			BIT(18)
+#define LCDC_CFG_INVDAT			BIT(17)
+#define LCDC_CFG_SYNDIR_IN		BIT(16)
+#define LCDC_CFG_PSP			BIT(15)
+#define LCDC_CFG_CLSP			BIT(14)
+#define LCDC_CFG_SPLP			BIT(13)
+#define LCDC_CFG_REVP			BIT(12)
+#define LCDC_CFG_HSP			BIT(11)
+#define LCDC_CFG_PCP			BIT(10)
+#define LCDC_CFG_DEP			BIT(9)
+#define LCDC_CFG_VSP			BIT(8)
+#define LCDC_CFG_MODE_TFT_18BIT		BIT(7)
+#define LCDC_CFG_MODE_TFT_16BIT		(0 << 7)
+#define LCDC_CFG_MODE_TFT_24BIT		BIT(6)
+
+#define LCDC_CFG_MODE_BIT		0
+#define LCDC_CFG_MODE_MASK		(0x0f << LCDC_CFG_MODE_BIT)
+#define LCDC_CFG_MODE_GENERIC_TFT	(0 << LCDC_CFG_MODE_BIT)
+#define LCDC_CFG_MODE_SPECIAL_TFT_1	(1 << LCDC_CFG_MODE_BIT)
+#define LCDC_CFG_MODE_SPECIAL_TFT_2	(2 << LCDC_CFG_MODE_BIT)
+#define LCDC_CFG_MODE_SPECIAL_TFT_3	(3 << LCDC_CFG_MODE_BIT)
+#define LCDC_CFG_MODE_NONINTER_CCIR656	(4 << LCDC_CFG_MODE_BIT)
+#define LCDC_CFG_MODE_INTER_CCIR656	(6 << LCDC_CFG_MODE_BIT)
+#define LCDC_CFG_MODE_SERIAL_TFT	(12 << LCDC_CFG_MODE_BIT)
+#define LCDC_CFG_MODE_LCM		(13 << LCDC_CFG_MODE_BIT)
+
+/* LCD Control Register */
+#define LCDC_CTRL_PINMD			BIT(31)
+#define LCDC_CTRL_BST_BIT		28
+#define LCDC_CTRL_BST_MASK		(0x7 << LCDC_CTRL_BST_BIT)
+#define LCDC_CTRL_BST_4			(0 << LCDC_CTRL_BST_BIT)
+#define LCDC_CTRL_BST_8			(1 << LCDC_CTRL_BST_BIT)
+#define LCDC_CTRL_BST_16		(2 << LCDC_CTRL_BST_BIT)
+#define LCDC_CTRL_BST_32		(3 << LCDC_CTRL_BST_BIT)
+#define LCDC_CTRL_BST_64		(4 << LCDC_CTRL_BST_BIT)
+#define LCDC_CTRL_RGB565		(0 << 27)
+#define LCDC_CTRL_RGB555		BIT(27)
+#define LCDC_CTRL_OFUP			BIT(26)
+#define LCDC_CTRL_PDD_BIT		16
+#define LCDC_CTRL_PDD_MASK		(0xff << LCDC_CTRL_PDD_BIT)
+
+#define LCDC_CTRL_DACTE			BIT(14)
+#define LCDC_CTRL_EOFM			BIT(13)
+#define LCDC_CTRL_SOFM			BIT(12)
+#define LCDC_CTRL_OFUM			BIT(11)
+#define LCDC_CTRL_IFUM0			BIT(10)
+#define LCDC_CTRL_IFUM1			BIT(9)
+#define LCDC_CTRL_LDDM			BIT(8)
+#define LCDC_CTRL_QDM			BIT(7)
+#define LCDC_CTRL_BEDN			BIT(6)
+#define LCDC_CTRL_PEDN			BIT(5)
+#define LCDC_CTRL_DIS			BIT(4)
+#define LCDC_CTRL_ENA			BIT(3)
+#define LCDC_CTRL_BPP_BIT		0
+#define LCDC_CTRL_BPP_MASK		(0x07 << LCDC_CTRL_BPP_BIT)
+#define LCDC_CTRL_BPP_1			(0 << LCDC_CTRL_BPP_BIT)
+#define LCDC_CTRL_BPP_2			(1 << LCDC_CTRL_BPP_BIT)
+#define LCDC_CTRL_BPP_4			(2 << LCDC_CTRL_BPP_BIT)
+#define LCDC_CTRL_BPP_8			(3 << LCDC_CTRL_BPP_BIT)
+#define LCDC_CTRL_BPP_16		(4 << LCDC_CTRL_BPP_BIT)
+#define LCDC_CTRL_BPP_18_24		(5 << LCDC_CTRL_BPP_BIT)
+#define LCDC_CTRL_BPP_CMPS_24		(6 << LCDC_CTRL_BPP_BIT)
+#define LCDC_CTRL_BPP_30		(7 << LCDC_CTRL_BPP_BIT)
+
+#define LCD_TYPE_GENERIC_24_BIT		(0 | 1 << 6)
+
+/* LCD Status Register */
+#define LCDC_STATE_QD			BIT(7)
+#define LCDC_STATE_EOF			BIT(5)
+#define LCDC_STATE_SOF			BIT(4)
+#define LCDC_STATE_OFU			BIT(3)
+#define LCDC_STATE_IFU0			BIT(2)
+#define LCDC_STATE_IFU1			BIT(1)
+#define LCDC_STATE_LDD			BIT(0)
+
+/* OSD Configure Register */
+#define LCDC_OSDC_PREMULTI1		BIT(23)
+#define LCDC_OSDC_COEF_SLE1_BIT		21
+#define LCDC_OSDC_COEF_SLE1_MASK	(0x03 << LCDC_OSDC_COEF_SLE1_BIT)
+#define LCDC_OSDC_COEF_SLE1_0		(0 << LCDC_OSDC_COEF_SLE1_BIT)
+#define LCDC_OSDC_COEF_SLE1_1		(1 << LCDC_OSDC_COEF_SLE1_BIT)
+#define LCDC_OSDC_COEF_SLE1_2		(2 << LCDC_OSDC_COEF_SLE1_BIT)
+#define LCDC_OSDC_COEF_SLE1_3		(3 << LCDC_OSDC_COEF_SLE1_BIT)
+
+#define LCDC_OSDC_PREMULTI0		BIT(20)
+#define LCDC_OSDC_COEF_SLE0_BIT		18
+#define LCDC_OSDC_COEF_SLE0_MASK	(0x03 << LCDC_OSDC_COEF_SLE0_BIT)
+#define LCDC_OSDC_COEF_SLE0_0		(0 << LCDC_OSDC_COEF_SLE0_BIT)
+#define LCDC_OSDC_COEF_SLE0_1		(1 << LCDC_OSDC_COEF_SLE0_BIT)
+#define LCDC_OSDC_COEF_SLE0_2		(2 << LCDC_OSDC_COEF_SLE0_BIT)
+#define LCDC_OSDC_COEF_SLE0_3		(3 << LCDC_OSDC_COEF_SLE0_BIT)
+#define LCDC_OSDC_ALPHAMD1		BIT(17)
+
+#define LCDC_OSDC_SOFM1			BIT(15)
+#define LCDC_OSDC_EOFM1			BIT(14)
+#define LCDC_OSDC_SOFM0			BIT(11)
+#define LCDC_OSDC_EOFM0			BIT(10)
+#define LCDC_OSDC_DENDM			BIT(9)
+#define LCDC_OSDC_F1EN			BIT(4)
+#define LCDC_OSDC_F0EN			BIT(3)
+#define LCDC_OSDC_ALPHAEN		BIT(2)
+#define LCDC_OSDC_ALPHAMD0		BIT(1)
+#define LCDC_OSDC_OSDEN			BIT(0)
+
+/* OSD Control Register */
+#define LCDC_OSDCTRL_IPU_CLKEN		BIT(15)
+#define LCDC_OSDCTRL_RGB0_RGB565	(0 << 5)
+#define LCDC_OSDCTRL_RGB0_RGB555	BIT(5)
+#define LCDC_OSDCTRL_RGB1_RGB565	(0 << 4)
+#define LCDC_OSDCTRL_RGB1_RGB555	BIT(4)
+
+#define LCDC_OSDCTRL_BPP_BIT		0
+#define LCDC_OSDCTRL_BPP_MASK		(0x7 << LCDC_OSDCTRL_BPP_BIT)
+#define LCDC_OSDCTRL_BPP_15_16		(4 << LCDC_OSDCTRL_BPP_BIT)
+#define LCDC_OSDCTRL_BPP_18_24		(5 << LCDC_OSDCTRL_BPP_BIT)
+#define LCDC_OSDCTRL_BPP_CMPS_24	(6 << LCDC_OSDCTRL_BPP_BIT)
+#define LCDC_OSDCTRL_BPP_30		(7 << LCDC_OSDCTRL_BPP_BIT)
+
+/* OSD State Register */
+#define LCDC_OSDS_SOF1			BIT(15)
+#define LCDC_OSDS_EOF1			BIT(14)
+#define LCDC_OSDS_SOF0			BIT(11)
+#define LCDC_OSDS_EOF0			BIT(10)
+#define LCDC_OSDS_DEND			BIT(8)
+
+/* Background 0 or Background 1 Color Register */
+#define LCDC_BGC_RED_OFFSET		16
+#define LCDC_BGC_RED_MASK		(0xFF << LCDC_BGC_RED_OFFSET)
+#define LCDC_BGC_GREEN_OFFSET		8
+#define LCDC_BGC_GREEN_MASK		(0xFF << LCDC_BGC_GREEN_OFFSET)
+#define LCDC_BGC_BLUE_OFFSET		0
+#define LCDC_BGC_BLUE_MASK		(0xFF << LCDC_BGC_BLUE_OFFSET)
+
+/* Foreground 0 or Foreground 1 Color Key Register */
+#define LCDC_KEY_KEYEN			BIT(31)
+#define LCDC_KEY_KEYMD			BIT(30)
+#define LCDC_KEY_RED_OFFSET		16
+#define LCDC_KEY_RED_MASK		(0xFF << LCDC_KEY_RED_OFFSET)
+#define LCDC_KEY_GREEN_OFFSET		8
+#define LCDC_KEY_GREEN_MASK		(0xFF << LCDC_KEY_GREEN_OFFSET)
+#define LCDC_KEY_BLUE_OFFSET		0
+#define LCDC_KEY_BLUE_MASK		(0xFF << LCDC_KEY_BLUE_OFFSET)
+#define LCDC_KEY_MASK			(LCDC_KEY_RED_MASK | \
+					 | LCDC_KEY_GREEN_MASK \
+					 | LCDC_KEY_BLUE_MASK)
+
+/* ALPHA Register */
+#define LCDC_ALPHA1_OFFSET		8
+#define LCDC_ALPHA1_MASK		(0xFF << LCDC_ALPHA1_OFFSET)
+#define LCDC_ALPHA0_OFFSET		0
+#define LCDC_ALPHA0_MASK		(0xFF << LCDC_ALPHA0_OFFSET)
+
+/* IPU Restart Register */
+#define LCDC_IPUR_IPUREN		BIT(31)
+#define LCDC_IPUR_IPURMASK		0xFFFFFF
+
+/* RGB Control Register */
+#define LCDC_RGBC_RGBDM			BIT(15)
+#define LCDC_RGBC_DMM			BIT(14)
+#define LCDC_RGBC_422			BIT(8)
+#define LCDC_RGBC_RGBFMT		BIT(7)
+#define LCDC_RGBC_ODDRGB_BIT		4
+#define LCDC_RGBC_ODDRGB_MASK		(0x7 << LCDC_RGBC_ODDRGB_BIT)
+#define LCDC_RGBC_ODD_RGB		(0 << LCDC_RGBC_ODDRGB_BIT) /* RGB */
+#define LCDC_RGBC_ODD_RBG		(1 << LCDC_RGBC_ODDRGB_BIT) /* RBG */
+#define LCDC_RGBC_ODD_GRB		(2 << LCDC_RGBC_ODDRGB_BIT) /* GRB */
+#define LCDC_RGBC_ODD_GBR		(3 << LCDC_RGBC_ODDRGB_BIT) /* GBR */
+#define LCDC_RGBC_ODD_BRG		(4 << LCDC_RGBC_ODDRGB_BIT) /* BRG */
+#define LCDC_RGBC_ODD_BGR		(5 << LCDC_RGBC_ODDRGB_BIT) /* BGR */
+
+#define LCDC_RGBC_EVENRGB_BIT		0
+#define LCDC_RGBC_EVENRGB_MASK		(0x7 << LCDC_RGBC_EVENRGB_BIT)
+#define LCDC_RGBC_EVEN_RGB		0 /* RGB */
+#define LCDC_RGBC_EVEN_RBG		1 /* RBG */
+#define LCDC_RGBC_EVEN_GRB		2 /* GRB */
+#define LCDC_RGBC_EVEN_GBR		3 /* GBR */
+#define LCDC_RGBC_EVEN_BRG		4 /* BRG */
+#define LCDC_RGBC_EVEN_BGR		5 /* BGR */
+
+/* Vertical Synchronize Register */
+#define LCDC_VSYNC_VPS_BIT		16
+#define LCDC_VSYNC_VPS_MASK		(0xfff << LCDC_VSYNC_VPS_BIT)
+#define LCDC_VSYNC_VPE_BIT		0
+#define LCDC_VSYNC_VPE_MASK		(0xfff << LCDC_VSYNC_VPE_BIT)
+
+/* Horizontal Synchronize Register */
+#define LCDC_HSYNC_HPS_BIT		16
+#define LCDC_HSYNC_HPS_MASK		(0xfff << LCDC_HSYNC_HPS_BIT)
+#define LCDC_HSYNC_HPE_BIT		0
+#define LCDC_HSYNC_HPE_MASK		(0xfff << LCDC_HSYNC_HPE_BIT)
+
+/* Virtual Area Setting Register */
+#define LCDC_VAT_HT_BIT			16
+#define LCDC_VAT_HT_MASK		(0xfff << LCDC_VAT_HT_BIT)
+#define LCDC_VAT_VT_BIT			0
+#define LCDC_VAT_VT_MASK		(0xfff << LCDC_VAT_VT_BIT)
+
+/* Display Area Horizontal Start/End Point Register */
+#define LCDC_DAH_HDS_BIT		16
+#define LCDC_DAH_HDS_MASK		(0xfff << LCDC_DAH_HDS_BIT)
+#define LCDC_DAH_HDE_BIT		0
+#define LCDC_DAH_HDE_MASK		(0xfff << LCDC_DAH_HDE_BIT)
+
+/* Display Area Vertical Start/End Point Register */
+#define LCDC_DAV_VDS_BIT		16
+#define LCDC_DAV_VDS_MASK		(0xfff << LCDC_DAV_VDS_BIT)
+#define LCDC_DAV_VDE_BIT		0
+#define LCDC_DAV_VDE_MASK		(0xfff << LCDC_DAV_VDE_BIT)
+
+/* Foreground 0 or Foreground 1 XY Position Register */
+#define LCDC_XYP_YPOS_BIT		16
+#define LCDC_XYP_YPOS_MASK		(0xfff << LCDC_XYP_YPOS_BIT)
+#define LCDC_XYP_XPOS_BIT		0
+#define LCDC_XYP_XPOS_MASK		(0xfff << LCDC_XYP_XPOS_BIT)
+
+/* Foreground 0 or Foreground 1 Size Register */
+#define LCDC_SIZE_HEIGHT_BIT		16
+#define LCDC_SIZE_HEIGHT_MASK		(0xfff << LCDC_SIZE_HEIGHT_BIT)
+#define LCDC_SIZE_WIDTH_BIT		0
+#define LCDC_SIZE_WIDTH_MASK		(0xfff << LCDC_SIZE_WIDTH_BIT)
+
+/* PS Signal Setting */
+#define LCDC_PS_PSS_BIT			16
+#define LCDC_PS_PSS_MASK		(0xfff << LCDC_PS_PSS_BIT)
+#define LCDC_PS_PSE_BIT			0
+#define LCDC_PS_PSE_MASK		(0xfff << LCDC_PS_PSE_BIT)
+
+/* CLS Signal Setting */
+#define LCDC_CLS_CLSS_BIT		16
+#define LCDC_CLS_CLSS_MASK		(0xfff << LCDC_CLS_CLSS_BIT)
+#define LCDC_CLS_CLSE_BIT		0
+#define LCDC_CLS_CLSE_MASK		(0xfff << LCDC_CLS_CLSE_BIT)
+
+/* SPL Signal Setting */
+#define LCDC_SPL_SPLS_BIT		16
+#define LCDC_SPL_SPLS_MASK		(0xfff << LCDC_SPL_SPLS_BIT)
+#define LCDC_SPL_SPLE_BIT		0
+#define LCDC_SPL_SPLE_MASK		(0xfff << LCDC_SPL_SPLE_BIT)
+
+/* REV Signal Setting */
+#define LCDC_REV_REVS_BIT		16
+#define LCDC_REV_REVS_MASK		(0xfff << LCDC_REV_REVS_BIT)
+
+/* DMA Command 0 or 1 Register */
+#define LCDC_CMD_SOFINT			BIT(31)
+#define LCDC_CMD_EOFINT			BIT(30)
+#define LCDC_CMD_CMD			BIT(29)
+#define LCDC_CMD_PAL			BIT(28)
+#define LCDC_CMD_COMPEN			BIT(27)
+#define LCDC_CMD_FRM_EN			BIT(26)
+#define LCDC_CMD_FIELD_SEL		BIT(25)
+#define LCDC_CMD_16X16BLOCK		BIT(24)
+#define LCDC_CMD_LEN_BIT		0
+#define LCDC_CMD_LEN_MASK		(0xffffff << LCDC_CMD_LEN_BIT)
+
+/* DMA Offsize Register 0,1 */
+#define LCDC_OFFS_BIT			0
+#define LCDC_OFFS_OFFSIZE_MASK		(0xffffff << LCDC_OFFS_BIT)
+
+/* DMA Page Width Register 0,1 */
+#define LCDC_PW_BIT			0
+#define LCDC_PW_PAGEWIDTH_MASK		(0xffffff << LCDC_PW_BIT)
+
+/* DMA Command Counter Register 0,1 */
+#define LCDC_CNUM_BIT			0
+#define LCDC_CNUM_CNUM_MASK		(0xff << LCDC_CNUM_BIT)
+
+/* DMA Command Counter Register */
+#define LCDC_CPOS_ALPHAMD1		BIT(31)
+#define LCDC_CPOS_RGB_RGB565		(0 << 30)
+#define LCDC_CPOS_RGB_RGB555		BIT(30)
+
+#define LCDC_CPOS_BPP_BIT		27
+#define LCDC_CPOS_BPP_MASK		(0x07 << LCDC_CPOS_BPP_BIT)
+#define LCDC_CPOS_BPP_16		(4 << LCDC_CPOS_BPP_BIT)
+#define LCDC_CPOS_BPP_18_24		(5 << LCDC_CPOS_BPP_BIT)
+#define LCDC_CPOS_BPP_CMPS_24		(6 << LCDC_CPOS_BPP_BIT)
+#define LCDC_CPOS_BPP_30		(7 << LCDC_CPOS_BPP_BIT)
+
+#define LCDC_CPOS_PREMULTI		BIT(26)
+#define LCDC_CPOS_COEF_SLE_BIT		24
+#define LCDC_CPOS_COEF_SLE_MASK		(0x3 << LCDC_CPOS_COEF_SLE_BIT)
+#define LCDC_CPOS_COEF_SLE_0		(0 << LCDC_CPOS_COEF_SLE_BIT)
+#define LCDC_CPOS_COEF_SLE_1		(1 << LCDC_CPOS_COEF_SLE_BIT)
+#define LCDC_CPOS_COEF_SLE_2		(2 << LCDC_CPOS_COEF_SLE_BIT)
+#define LCDC_CPOS_COEF_SLE_3		(3 << LCDC_CPOS_COEF_SLE_BIT)
+
+#define LCDC_CPOS_YPOS_BIT		12
+#define LCDC_CPOS_YPOS_MASK		(0xfff << LCDC_CPOS_YPOS_BIT)
+#define LCDC_CPOS_XPOS_BIT		0
+#define LCDC_CPOS_XPOS_MASK		(0xfff << LCDC_CPOS_XPOS_BIT)
+
+/* Foreground 0,1 Size Register */
+#define LCDC_DESSIZE_ALPHA_BIT		24
+#define LCDC_DESSIZE_ALPHA_MASK		(0xff << LCDC_DESSIZE_ALPHA_BIT)
+#define LCDC_DESSIZE_HEIGHT_BIT		12
+#define LCDC_DESSIZE_HEIGHT_MASK	(0xfff << LCDC_DESSIZE_HEIGHT_BIT)
+#define LCDC_DESSIZE_WIDTH_BIT		0
+#define LCDC_DESSIZE_WIDTH_MASK		(0xfff << LCDC_DESSIZE_WIDTH_BIT)
+
+/* Priority level threshold configure Register */
+#define LCDC_PCFG_LCDC_PRI_MD		BIT(31)
+
+#define LCDC_PCFG_HP_BST_BIT		28
+#define LCDC_PCFG_HP_BST_MASK		(0x7 << LCDC_PCFG_HP_BST_BIT)
+#define LCDC_PCFG_HP_BST_4		(0 << LCDC_PCFG_HP_BST_BIT)
+#define LCDC_PCFG_HP_BST_8		(1 << LCDC_PCFG_HP_BST_BIT)
+#define LCDC_PCFG_HP_BST_16		(2 << LCDC_PCFG_HP_BST_BIT)
+#define LCDC_PCFG_HP_BST_32		(3 << LCDC_PCFG_HP_BST_BIT)
+#define LCDC_PCFG_HP_BST_C16		(5 << LCDC_PCFG_HP_BST_BIT)
+#define LCDC_PCFG_HP_BST_64		(4 << LCDC_PCFG_HP_BST_BIT)
+#define LCDC_PCFG_HP_BST_DIS		(7 << LCDC_PCFG_HP_BST_BIT)
+
+#define LCDC_PCFG_PCFG2_BIT		18
+#define LCDC_PCFG_PCFG2_MASK		(0x1ff << LCDC_PCFG_PCFG2_BIT)
+#define LCDC_PCFG_PCFG1_BIT		9
+#define LCDC_PCFG_PCFG1_MASK		(0x1ff << LCDC_PCFG_PCFG1_BIT)
+#define LCDC_PCFG_PCFG0_BIT		0
+#define LCDC_PCFG_PCFG0_MASK		(0x1ff << LCDC_PCFG_PCFG0_BIT)
+
+/* Dual LCDC Channel Control register */
+/*
+ * Select which IPU is able to write back, this field is just
+ * available in lcdc1. 0:ipu1; 1:ipu0
+ */
+#define LCDC_DUAL_CTRL_IPU_WR_SEL	BIT(8)
+/*
+ * Select which controller output to the tft/slcd panel, this field is just
+ * available in lcdc1. 0:lcdc1; 1:lcdc0
+ */
+#define LCDC_DUAL_CTRL_TFT_SEL		BIT(6)
+/*
+ * 1: fix the priority of ipu0/1 in lcd internal arbiter;
+ * 0: use priority of ipu0/1 generated by lcd in lcd internal arbiter
+ */
+#define LCDC_DUAL_CTRL_PRI_IPU_EN	BIT(5)
+#define LCDC_DUAL_CTRL_PRI_IPU_BIT	3
+#define LCDC_DUAL_CTRL_PRI_IPU_MASK	(0x3 << LCDC_DUAL_CTRL_PRI_IPU_BIT)
+/*
+ * 1: fix the priority of lcd0/1 in lcd internal arbiter;
+ * 0: use priority of lcd0/1 generated by lcd in lcd internal arbiter
+ */
+#define LCDC_DUAL_CTRL_PRI_LCD_EN	BIT(2)
+#define LCDC_DUAL_CTRL_PRI_LCD_BIT	0
+#define LCDC_DUAL_CTRL_PRI_LCD_MASK	(0x3 << LCDC_DUAL_CTRL_PRI_LCD_BIT)
+
+/* Image Enhancement CFG Register */
+#define LCDC_ENH_CFG_DITHER_EN		BIT(9)
+#define LCDC_ENH_CFG_YCC2RGB_EN		BIT(8)
+#define LCDC_ENH_CFG_SATURATION_EN	BIT(7)
+#define LCDC_ENH_CFG_VEE_EN		BIT(6)
+#define LCDC_ENH_CFG_HUE_EN		BIT(5)
+#define LCDC_ENH_CFG_BRIGHTNESS_EN	BIT(4)
+#define LCDC_ENH_CFG_CONTRAST_EN	BIT(3)
+#define LCDC_ENH_CFG_RGB2YCC_EN		BIT(2)
+#define LCDC_ENH_CFG_GAMMA_EN		BIT(1)
+#define LCDC_ENH_CFG_ENH_EN		BIT(0)
+
+/* Color Space Conversion CFG Register */
+#define LCDC_ENH_CSCCFG_YCC2RGBMD_BIT	2 /* YCbCr to RGB */
+#define LCDC_ENH_CSCCFG_YCC2RGBMD_MASK	(0x03 << LCDC_ENH_CSCCFG_YCC2RGBMD_BIT)
+#define LCDC_ENH_CSCCFG_YCC2RGBMD_0	(0 << LCDC_ENH_CSCCFG_YCC2RGBMD_BIT)
+#define LCDC_ENH_CSCCFG_YCC2RGBMD_1	(1 << LCDC_ENH_CSCCFG_YCC2RGBMD_BIT)
+#define LCDC_ENH_CSCCFG_YCC2RGBMD_2	(2 << LCDC_ENH_CSCCFG_YCC2RGBMD_BIT)
+#define LCDC_ENH_CSCCFG_YCC2RGBMD_3	(3 << LCDC_ENH_CSCCFG_YCC2RGBMD_BIT)
+/*
+ * 00:601WIDE; 01:601NARROW
+ * 10:709WIDE; 11:709NARROW
+ * WIDE:RGB range 16-235
+ * NARROW:RGB range 0-255
+*/
+#define LCDC_ENH_CSCCFG_RGB2YCCMD_BIT	0 /* RGB to YCbCr*/
+#define LCDC_ENH_CSCCFG_RGB2YCCMD_MASK	(0x03 << LCDC_ENH_CSCCFG_RGB2YCCMD_BIT)
+#define LCDC_ENH_CSCCFG_RGB2YCCMD_0	(0 << LCDC_ENH_CSCCFG_RGB2YCCMD_BIT)
+#define LCDC_ENH_CSCCFG_RGB2YCCMD_1	(1 << LCDC_ENH_CSCCFG_RGB2YCCMD_BIT)
+#define LCDC_ENH_CSCCFG_RGB2YCCMD_2	(2 << LCDC_ENH_CSCCFG_RGB2YCCMD_BIT)
+#define LCDC_ENH_CSCCFG_RGB2YCCMD_3	(3 << LCDC_ENH_CSCCFG_RGB2YCCMD_BIT)
+
+/* LUMA CFG Register */
+#define LCDC_ENH_LUMACFG_BRIGHT_BIT	16	/*
+						* Brightness value :0x0-0x7ff
+						* means 0.9999~-0.9999
+						*/
+#define LCDC_ENH_LUMACFG_BRIGHT_MASK	(0x7ff << LCDC_ENH_LUMACFG_BRIGHT_BIT)
+
+#define LCDC_ENH_LUMACFG_CONTRAST_BIT	0	/*
+						* Contrast value :0x0-0x7ff
+						* means 0~1.9999
+						*/
+#define LCDC_ENH_LUMACFG_CONTRAST_MASK	(0x7ff << LCDC_ENH_LUMACFG_CONTRAST_BIT)
+
+/* CHROMA0 CFG Register */
+#define LCDC_ENH_CHROCFG0_HUE_SIN_BIT	16
+#define LCDC_ENH_CHROCFG0_HUE_SIN_MASK	(0xfff << LCDC_ENH_CHROCFG0_HUE_SIN_BIT)
+#define LCDC_ENH_CHROCFG0_HUE_COS_BIT	0
+#define LCDC_ENH_CHROCFG0_HUE_COS_MASK	(0xfff << LCDC_ENH_CHROCFG0_HUE_COS_BIT)
+
+/* CHROMA1 CFG Register */
+#define LCDC_ENH_CHROCFG1_SATUR_BIT	0
+#define LCDC_ENH_CHROCFG1_SATUR_MASK	(0x7ff << LCDC_ENH_CHROCFG1_SATUR_BIT)
+
+/* DITHER CFG Register */
+/*
+ * 00:8bit dither
+ * 01:6bit dither
+ * 10:5bit dither
+ * 11:4bit dither
+*/
+#define LCDC_ENH_DITHERCFG_RED_BIT	4
+#define LCDC_ENH_DITHERCFG_RED_MASK	(0x03 << LCDC_ENH_DITHERCFG_RED_BIT)
+#define LCDC_ENH_DITHERCFG_GREEN_BIT	2
+#define LCDC_ENH_DITHERCFG_GREEN_MASK	(0x03 << LCDC_ENH_DITHERCFG_GREEN_BIT)
+#define LCDC_ENH_DITHERCFG_BLUE_BIT	0
+#define LCDC_ENH_DITHERCFG_BLUE_MASK	(0x03 << LCDC_ENH_DITHERCFG_BLUE_BIT)
+
+/* Enhance Status Register */
+#define LCDC_ENH_STATUS_DITHER_DIS	BIT(9)
+#define LCDC_ENH_STATUS_YCC2RGB_DIS	BIT(8)
+#define LCDC_ENH_STATUS_SATURATION_DIS	BIT(7)
+#define LCDC_ENH_STATUS_VEE_DIS		BIT(6)
+#define LCDC_ENH_STATUS_HUE_DIS		BIT(5)
+#define LCDC_ENH_STATUS_BRIGHTNESS_DIS	BIT(4)
+#define LCDC_ENH_STATUS_CONTRAST_DIS	BIT(3)
+#define LCDC_ENH_STATUS_RGB2YCC_DIS	BIT(2)
+#define LCDC_ENH_STATUS_GAMMA_DIS	BIT(1)
+
+/* GAMMA CFG Register */
+#define LCDC_ENH_GAMMA_DATA1_BIT	16
+#define LCDC_ENH_GAMMA_DATA1_MASK	(0x3ff << LCDC_ENH_GAMMA_DATA1_BIT)
+#define LCDC_ENH_GAMMA_DATA0_BIT	0
+#define LCDC_ENH_GAMMA_DATA0_MASK	(0x3ff << LCDC_ENH_GAMMA_DATA0_BIT)
+#define LCDC_ENH_GAMMA_LEN		0x800
+
+/* VEE CFG Register */
+#define LCDC_ENH_VEE_VEE_DATA1_BIT	16
+#define LCDC_ENH_VEE_VEE_DATA1_MASK	(0x3ff << LCDC_ENH_VEE_VEE_DATA1_BIT)
+#define LCDC_ENH_VEE_VEE_DATA0_BIT	0
+#define LCDC_ENH_VEE_VEE_DATA0_MASK	(0x3ff << LCDC_ENH_VEE_VEE_DATA0_BIT)
+#define LCDC_ENH_VEE_LEN		0x800
+
+/* Register Map Of SLCD (Smart LCD Controller) */
+#define SLCDC_CFG			0xA0
+#define SLCDC_CTRL			0xA4
+#define SLCDC_STATE			0xA8
+#define SLCDC_DATA			0xAc
+
+/* SLCD Configure Register */
+#define SLCDC_CFG_DWIDTH_BIT		10
+#define SLCDC_CFG_DWIDTH_MASK		(0x7 << SLCDC_CFG_DWIDTH_BIT)
+#define SLCDC_CFG_DWIDTH_18BIT		(0 << SLCDC_CFG_DWIDTH_BIT)
+#define SLCDC_CFG_DWIDTH_16BIT		(1 << SLCDC_CFG_DWIDTH_BIT)
+#define SLCDC_CFG_DWIDTH_8BIT_x3	(2 << SLCDC_CFG_DWIDTH_BIT)
+#define SLCDC_CFG_DWIDTH_8BIT_x2	(3 << SLCDC_CFG_DWIDTH_BIT)
+#define SLCDC_CFG_DWIDTH_8BIT_x1	(4 << SLCDC_CFG_DWIDTH_BIT)
+#define SLCDC_CFG_DWIDTH_24BIT		(5 << SLCDC_CFG_DWIDTH_BIT)
+#define SLCDC_CFG_DWIDTH_9BIT_x2	(7 << SLCDC_CFG_DWIDTH_BIT)
+#define SLCDC_CFG_CWIDTH_BIT		8
+#define SLCDC_CFG_CWIDTH_MASK		(0x3 << SLCDC_CFG_CWIDTH_BIT)
+#define SLCDC_CFG_CWIDTH_16BIT		(0 << SLCDC_CFG_CWIDTH_BIT)
+#define SLCDC_CFG_CWIDTH_8BIT		(1 << SLCDC_CFG_CWIDTH_BIT)
+#define SLCDC_CFG_CWIDTH_18BIT		(2 << SLCDC_CFG_CWIDTH_BIT)
+#define SLCDC_CFG_CWIDTH_24BIT		(3 << SLCDC_CFG_CWIDTH_BIT)
+#define SLCDC_CFG_CS_ACTIVE_LOW		(0 << 4)
+#define SLCDC_CFG_CS_ACTIVE_HIGH	BIT(4)
+#define SLCDC_CFG_RS_CMD_LOW		(0 << 3)
+#define SLCDC_CFG_RS_CMD_HIGH		BIT(3)
+#define SLCDC_CFG_CLK_ACTIVE_FALLING	(0 << 1)
+#define SLCDC_CFG_CLK_ACTIVE_RISING	BIT(1)
+#define SLCDC_CFG_TYPE_PARALLEL		(0 << 0)
+#define SLCDC_CFG_TYPE_SERIAL		BIT(0)
+
+/* SLCD Control Register */
+#define SLCDC_CTRL_DMA_MODE		BIT(2)
+#define SLCDC_CTRL_DMA_START		BIT(1)
+#define SLCDC_CTRL_DMA_EN		BIT(0)
+
+/* SLCD Status Register */
+#define SLCDC_STATE_BUSY		BIT(0)
+
+/* SLCD Data Register */
+#define SLCDC_DATA_RS_DATA		(0 << 31)
+#define SLCDC_DATA_RS_COMMAND		BIT(31)
+
+/* Register Map Of LVDSC (LVDS Controller) */
+#define LVDS_TXCTRL			0x3c0
+#define LVDS_TXPLL0			0x3c4
+#define LVDS_TXPLL1			0x3c8
+#define LVDS_TXECTRL			0x3cc
+
+/* TXCTRL (LVDS Transmitter Control Register) */
+#define LVDS_MODEL_SEL			BIT(31)
+#define LVDS_TX_PDB			BIT(30)
+#define LVDS_TX_PDB_CK			BIT(29)
+#define LVDS_RESERVE(n)			(1 << 20 + (n))
+#define LVDS_TX_RSTB			BIT(18)
+#define LVDS_TX_CKBIT_PHA_SEL		BIT(17)
+#define LVDS_TX_CKBYTE_PHA_SEL		BIT(16)
+
+#define LVDS_TX_CKOUT_PHA_S_BIT		13
+#define LVDS_TX_CKOUT_PHA_S_MASK	(0x07 << LVDS_TX_CKOUT_PHA_S_BIT)
+
+#define LVDS_TX_CKOUT_SET		BIT(12)
+#define LVDS_TX_OUT_SEL			BIT(11)
+#define LVDS_TX_DLY_SEL_BIT		8
+#define LVDS_TX_DLY_SEL_MASK		(0x07 << LVDS_TX_DLY_SEL_BIT)
+#define LVDS_TX_AMP_ADJ			BIT(7)
+#define LVDS_TX_LVDS			BIT(6)
+#define LVDS_TX_CR_BIT			3
+#define LVDS_TX_CR_MASK			(0x07 << LVDS_TX_CR_BIT)
+#define LVDS_TX_CR_CK			BIT(2)
+#define LVDS_TX_OD_S			BIT(1)
+#define LVDS_TX_OD_EN			BIT(0)
+
+/* TXPLL0 (LVDS Transmitter's PLL Control Register 0 */
+
+#define LVDS_PLL_LOCK			BIT(31)
+#define LVDS_PLL_EN			BIT(30)
+#define LVDS_BG_PWD			BIT(29)
+#define LVDS_PLL_SSC_EN			BIT(27)
+#define LVDS_PLL_SSC_MODE		BIT(26)
+#define LVDS_PLL_TEST			BIT(25)
+#define LVDS_PLL_POST_DIVA_BIT		21
+#define LVDS_PLL_POST_DIVA_MASK		(0x03 << LVDS_PLL_POST_DIVA_BIT)
+#define LVDS_PLL_POST_DIVB_BIT		16
+#define LVDS_PLL_POST_DIVB_MASK		(0x1f << LVDS_PLL_POST_DIVB_BIT)
+#define LVDS_PLL_PLLN_BIT		8
+#define LVDS_PLL_PLLN_MASK		(0x7f << LVDS_PLL_PLLN_BIT)
+#define LVDS_PLL_TEST_DIV_BIT		6
+#define LVDS_PLL_TEST_DIV_MASK		(0x03 << LVDS_PLL_TEST_DIV_BIT)
+#define LVDS_PLL_TEST_DIV_2		(0 << LVDS_PLL_TEST_DIV_BIT)
+#define LVDS_PLL_TEST_DIV_4		(1 << LVDS_PLL_TEST_DIV_BIT)
+#define LVDS_PLL_TEST_DIV_8		(2 << LVDS_PLL_TEST_DIV_BIT)
+#define LVDS_PLL_TEST_DIV_16		(3 << LVDS_PLL_TEST_DIV_BIT)
+#define LVDS_PLL_IN_BYPASS		(1 << 5)
+#define LVDS_PLL_INDIV_BIT		0
+#define LVDS_PLL_INDIV_MASK		(0x1f << LVDS_PLL_INDIV_BIT)
+
+/* TXPLL1 (LVDS Transmitter's PLL Control Register 1 */
+
+#define LVDS_PLL_ICP_SEL_BIT		29
+#define LVDS_PLL_ICP_SEL_MASK		(0x07 << LVDS_PLL_ICP_SEL_BIT)
+#define LVDS_PLL_KVCO_BIT		26
+#define LVDS_PLL_KVCO_MASK		(0x03 << LVDS_PLL_KVCO_BIT)
+#define LVDS_PLL_IVCO_SEL_BIT		24
+#define LVDS_PLL_IVCO_SEL_MASK		(0x03 << LVDS_PLL_IVCO_SEL_BIT)
+#define LVDS_PLL_SSCN_BIT		17
+#define LVDS_PLL_SSCN_MASK		(0x7f << LVDS_PLL_SSCN_BIT)
+#define LVDS_PLL_COUNT_BIT		4
+#define LVDS_PLL_COUNT_MASK		(0x1fff << LVDS_PLL_COUNT_BIT)
+#define LVDS_PLL_GAIN_BIT		0
+#define LVDS_PLL_GAIN_MASK		(0x0f << LVDS_PLL_GAIN_BIT)
+
+/* TXECTRL (LVDS Transmitter's Enhance Control */
+
+#define LVDS_TX_EM_S_BIT		9
+#define LVDS_TX_EM_S_MASK		(0x03 <<  LVDS_TX_EM_S_BIT)
+#define LVDS_TX_EM_EN			BIT(8)
+#define LVDS_TX_LDO_VO_S_BIT		5
+#define LVDS_TX_LDO_VO_S_MASK		(0x03 << LVDS_TX_LDO_VO_S_BIT)
+#define LVDS_TX_LDO_VO_S_0		(0x00 << LVDS_TX_LDO_VO_S_BIT)
+#define LVDS_TX_LDO_VO_S_1		(0x01 << LVDS_TX_LDO_VO_S_BIT)
+#define LVDS_TX_LDO_VO_S_2		(0x02 << LVDS_TX_LDO_VO_S_BIT)
+#define LVDS_TX_LDO_VO_S_3		(0x03 << LVDS_TX_LDO_VO_S_BIT)
+#define LVDS_PLL_PL_BP			BIT(4)
+
+/*
+ * Internal 7x clock phase fine tuning for data
+ * setup/hold time optimization
+ */
+#define LVDS_TX_CK_PHA_FINE_BIT		2
+#define LVDS_TX_CK_PHA_FINE_MASK	(0x03 << LVDS_TX_CK_PHA_FINE_BIT)
+/*
+ * Internal 7x clock phase coarse tuning for data
+ * setup/hold time optimization
+ */
+#define LVDS_TX_CK_PHA_COAR_BIT		0
+#define LVDS_TX_CK_PHA_COAR_MASK	(0x03 << LVDS_TX_CK_PHA_COAR_BIT)
+
+/*
+ * Helpers:
+ */
+
+static inline unsigned long jz4780_read(struct drm_device *dev, u32 reg)
+{
+	struct jz4780_drm_private *priv = dev->dev_private;
+
+	return ioread32(priv->mmio + reg);
+}
+
+static inline void jz4780_write(struct drm_device *dev, u32 reg, u32 data)
+{
+	struct jz4780_drm_private *priv = dev->dev_private;
+
+	iowrite32(data, priv->mmio + reg);
+}
+#endif /* __JZ4780_REGS_H__ */
-- 
1.9.1
