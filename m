From: hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Subject: [PATCHv2 2/3] ARM: drm: Intel FPGA VIP Frame Buffer II drm driver
Date: Tue, 25 Apr 2017 10:06:45 +0800
Message-ID: <1493086006-4392-3-git-send-email-hean.loong.ong@intel.com>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493086006-4392-1-git-send-email-hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ong-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Driver for Intel FPGA Video and Image Processing
Suite Frame Buffer II. The driver only supports the Intel
Arria10 devkit and its variants. This driver can be either
loaded staticlly or in modules. The OF device tree binding
is located at:
Documentation/devicetree/bindings/display/altr,vip-fb2.txt

Signed-off-by: Ong, Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
v2:
* Simplify the driver by using drm_simple_display_pipe_init.
* Cleaned up some unused codes with no-ops
* Clean up Kconfig to use only DRM_IVIP
* Use DRM_GEM_CMA_FOPS for file operations
* Removed the use of fb_info to populate DT information
---
 drivers/gpu/drm/Kconfig               |   2 +
 drivers/gpu/drm/Makefile              |   1 +
 drivers/gpu/drm/ivip/Kconfig          |  13 +++
 drivers/gpu/drm/ivip/Makefile         |   9 ++
 drivers/gpu/drm/ivip/intel_vip_conn.c |  96 +++++++++++++++++
 drivers/gpu/drm/ivip/intel_vip_core.c | 171 +++++++++++++++++++++++++++++
 drivers/gpu/drm/ivip/intel_vip_drv.h  |  55 ++++++++++
 drivers/gpu/drm/ivip/intel_vip_of.c   | 195 ++++++++++++++++++++++++++++++++++
 8 files changed, 542 insertions(+)
 create mode 100644 drivers/gpu/drm/ivip/Kconfig
 create mode 100644 drivers/gpu/drm/ivip/Makefile
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_conn.c
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_core.c
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_drv.h
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_of.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 78d7fc0..bc03c938 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -195,6 +195,8 @@ source "drivers/gpu/drm/nouveau/Kconfig"
 
 source "drivers/gpu/drm/i915/Kconfig"
 
+source "drivers/gpu/drm/ivip/Kconfig"
+
 config DRM_VGEM
 	tristate "Virtual GEM provider"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 59f0f9b..7cfe899 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_MGA)	+= mga/
 obj-$(CONFIG_DRM_I810)	+= i810/
 obj-$(CONFIG_DRM_I915)	+= i915/
+obj-$(CONFIG_DRM_IVIP)	+= ivip/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
 obj-$(CONFIG_DRM_VC4)  += vc4/
 obj-$(CONFIG_DRM_CIRRUS_QEMU) += cirrus/
diff --git a/drivers/gpu/drm/ivip/Kconfig b/drivers/gpu/drm/ivip/Kconfig
new file mode 100644
index 0000000..9a8c5ce
--- /dev/null
+++ b/drivers/gpu/drm/ivip/Kconfig
@@ -0,0 +1,13 @@
+config DRM_IVIP
+        tristate "Intel FGPA Video and Image Processing"
+        depends on DRM && OF
+        select DRM_GEM_CMA_HELPER
+        select DRM_KMS_HELPER
+        select DRM_KMS_FB_HELPER
+        select DRM_KMS_CMA_HELPER
+        help
+            Choose this option if you have a Intel FPGA Arria 10 system
+            and above with a Display Port IP. This does not support legacy
+            Intel FPGA Cyclone V display port. Currently only single frame
+            buffer is supported. Note that ACPI and X_86 architecture is yet
+            to be supported.If M is selected the module would be called ivip.
diff --git a/drivers/gpu/drm/ivip/Makefile b/drivers/gpu/drm/ivip/Makefile
new file mode 100644
index 0000000..95291c6
--- /dev/null
+++ b/drivers/gpu/drm/ivip/Makefile
@@ -0,0 +1,9 @@
+#
+# Makefile for the drm device driver.  This driver provides support for the
+# Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
+
+ccflags-y := -Iinclude/drm
+
+obj-$(CONFIG_DRM_IVIP) += ivip.o
+ivip-objs := intel_vip_of.o intel_vip_core.o \
+intel_vip_conn.o
diff --git a/drivers/gpu/drm/ivip/intel_vip_conn.c b/drivers/gpu/drm/ivip/intel_vip_conn.c
new file mode 100644
index 0000000..499d3b4
--- /dev/null
+++ b/drivers/gpu/drm/ivip/intel_vip_conn.c
@@ -0,0 +1,96 @@
+/*
+ * intel_vip_conn.c -- Intel Video and Image Processing(VIP)
+ * Frame Buffer II driver
+ *
+ * This driver supports the Intel VIP Frame Reader component.
+ * More info on the hardware can be found in the Intel Video
+ * and Image Processing Suite User Guide at this address
+ * http://www.altera.com/literature/ug/ug_vip.pdf.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * Authors:
+ * Ong, Hean-Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder_slave.h>
+#include <drm/drm_plane_helper.h>
+
+static enum drm_connector_status
+intelvipfb_drm_connector_detect(struct drm_connector *connector, bool force)
+{
+	return connector_status_connected;
+}
+
+static void intelvipfb_drm_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs intelvipfb_drm_connector_funcs = {
+	.dpms = drm_helper_connector_dpms,
+	.reset = drm_atomic_helper_connector_reset,
+	.detect = intelvipfb_drm_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = intelvipfb_drm_connector_destroy,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int intelvipfb_drm_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *drm = connector->dev;
+	int count;
+
+	count = drm_add_modes_noedid(connector, drm->mode_config.max_width,
+				     drm->mode_config.max_height);
+	drm_set_preferred_mode(connector, drm->mode_config.max_width,
+			       drm->mode_config.max_height);
+	return count;
+}
+
+static const struct drm_connector_helper_funcs
+intelvipfb_drm_connector_helper_funcs = {
+	.get_modes = intelvipfb_drm_connector_get_modes,
+};
+
+struct drm_connector *
+intelvipfb_conn_setup(struct drm_device *drm)
+{
+	struct drm_connector *conn;
+	int ret;
+
+	conn = devm_kzalloc(drm->dev, sizeof(*conn), GFP_KERNEL);
+	if (IS_ERR(conn))
+		return NULL;
+
+	ret = drm_connector_init(drm, conn, &intelvipfb_drm_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret < 0) {
+		dev_err(drm->dev, "failed to initialize drm connector\n");
+		ret = -ENOMEM;
+		goto error_connector_cleanup;
+	}
+
+	drm_connector_helper_add(conn, &intelvipfb_drm_connector_helper_funcs);
+
+	return conn;
+
+error_connector_cleanup:
+	drm_connector_cleanup(conn);
+
+	return NULL;
+}
diff --git a/drivers/gpu/drm/ivip/intel_vip_core.c b/drivers/gpu/drm/ivip/intel_vip_core.c
new file mode 100644
index 0000000..4e83343
--- /dev/null
+++ b/drivers/gpu/drm/ivip/intel_vip_core.c
@@ -0,0 +1,171 @@
+/*
+ * intel_vip_core.c -- Intel Video and Image Processing(VIP)
+ * Frame Buffer II driver
+ *
+ * This driver supports the Intel VIP Frame Reader component.
+ * More info on the hardware can be found in the Intel Video
+ * and Image Processing Suite User Guide at this address
+ * http://www.altera.com/literature/ug/ug_vip.pdf.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * Authors:
+ * Ong, Hean-Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "intel_vip_drv.h"
+
+static const u32 fbpriv_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_RGB565
+};
+
+static void intelvipfb_start_hw(void __iomem *base, resource_size_t addr)
+{
+	/*
+	 * The frameinfo variable has to correspond to the size of the VIP Suite
+	 * Frame Reader register 7 which will determine the maximum size used
+	 * in this frameinfo
+	 */
+
+	u32 frameinfo;
+
+	frameinfo =
+		readl(base + INTELVIPFB_FRAME_READER) & 0x00ffffff;
+	writel(frameinfo, base + INTELVIPFB_FRAME_INFO);
+	writel(addr, base + INTELVIPFB_FRAME_START);
+	/* Finally set the control register to 1 to start streaming */
+	writel(1, base + INTELVIPFB_CONTROL);
+}
+
+static void intelvipfb_disable_hw(void __iomem *base)
+{
+	/* set the control register to 0 to stop streaming */
+	writel(0, base + INTELVIPFB_CONTROL);
+}
+
+static const struct drm_mode_config_funcs intelvipfb_mode_config_funcs = {
+	.fb_create = drm_fb_cma_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static struct drm_mode_config_helper_funcs intelvipfb_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail,
+};
+
+static void intelvipfb_setup_mode_config(struct drm_device *drm)
+{
+	drm_mode_config_init(drm);
+	drm->mode_config.funcs = &intelvipfb_mode_config_funcs;
+	drm->mode_config.helper_private = &intelvipfb_mode_config_helpers;
+}
+
+static int intelvipfb_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
+				      struct drm_plane_state *plane_state)
+{
+	return drm_fb_cma_prepare_fb(&pipe->plane, plane_state);
+}
+
+static struct drm_simple_display_pipe_funcs fbpriv_funcs = {
+	.prepare_fb = intelvipfb_pipe_prepare_fb,
+};
+
+int intelvipfb_probe(struct device *dev, void __iomem *base)
+{
+	int retval;
+	struct drm_device *drm;
+	struct intelvipfb_priv *fbpriv = dev_get_drvdata(dev);
+	struct drm_connector *connector;
+
+	dev_set_drvdata(dev, fbpriv);
+
+	drm = fbpriv->drm;
+
+	intelvipfb_setup_mode_config(drm);
+
+	connector = intelvipfb_conn_setup(drm);
+	if (!connector) {
+		dev_err(drm->dev, "Connector setup failed\n");
+		goto err_mode_config;
+	}
+
+	retval = drm_simple_display_pipe_init(drm, &fbpriv->pipe,
+					      &fbpriv_funcs,
+					      fbpriv_formats,
+					      ARRAY_SIZE(fbpriv_formats),
+					      connector);
+	if (retval < 0) {
+		dev_err(drm->dev, "Cannot setup simple display pipe\n");
+		goto err_mode_config;
+	}
+
+	fbpriv->fbcma = drm_fbdev_cma_init(drm, PREF_BPP,
+					   drm->mode_config.num_connector);
+	if (!fbpriv->fbcma) {
+		fbpriv->fbcma = NULL;
+		dev_err(drm->dev, "Failed to init FB CMA area\n");
+		goto err_mode_config;
+	}
+
+	drm_mode_config_reset(drm);
+
+	intelvipfb_start_hw(base, drm->mode_config.fb_base);
+
+	drm_dev_register(drm, 0);
+
+	return retval;
+
+err_mode_config:
+
+	drm_mode_config_cleanup(drm);
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(intelvipfb_probe);
+
+int intelvipfb_remove(struct device *dev)
+{
+	struct intelvipfb_priv *fbpriv = dev_get_drvdata(dev);
+	struct drm_device *drm =  fbpriv->drm;
+
+	drm_dev_unregister(drm);
+
+	if (fbpriv->fbcma)
+		drm_fbdev_cma_fini(fbpriv->fbcma);
+
+	intelvipfb_disable_hw(fbpriv->base);
+	drm_mode_config_cleanup(drm);
+
+	drm_dev_unref(drm);
+
+	devm_kfree(dev, fbpriv);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(intelvipfb_remove);
+
+MODULE_AUTHOR("Ong, Hean-Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>");
+MODULE_DESCRIPTION("Intel VIP Frame Buffer II driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/ivip/intel_vip_drv.h b/drivers/gpu/drm/ivip/intel_vip_drv.h
new file mode 100644
index 0000000..8ef83f59
--- /dev/null
+++ b/drivers/gpu/drm/ivip/intel_vip_drv.h
@@ -0,0 +1,55 @@
+/*
+ * Copyright (C) 2017 Intel Corporation.
+ *
+ * Intel Video and Image Processing(VIP) Frame Buffer II driver.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Authors:
+ * Ong, Hean-Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
+ *
+ */
+#ifndef _INTEL_VIP_DRV_H
+#define _INTEL_VIP_DRV_H
+#include <linux/io.h>
+#include <linux/fb.h>
+
+#define DRIVER_NAME	"intelvipfb"
+#define BYTES_PER_PIXEL	4
+#define PREF_BPP		32
+#define CRTC_NUM		1
+#define CONN_NUM		1
+
+/* control registers */
+#define INTELVIPFB_CONTROL		0
+#define INTELVIPFB_STATUS		0x4
+#define INTELVIPFB_INTERRUPT		0x8
+#define INTELVIPFB_FRAME_COUNTER	0xC
+#define INTELVIPFB_FRAME_DROP		0x10
+#define INTELVIPFB_FRAME_INFO		0x14
+#define INTELVIPFB_FRAME_START		0x18
+#define INTELVIPFB_FRAME_READER		0x1C
+
+int intelvipfb_probe(struct device *dev, void __iomem *base);
+int intelvipfb_remove(struct device *dev);
+int intelvipfb_setup_crtc(struct drm_device *drm);
+struct drm_connector *intelvipfb_conn_setup(struct drm_device *drm);
+
+struct intelvipfb_priv {
+	struct drm_simple_display_pipe pipe;
+	struct drm_fbdev_cma *fbcma;
+	struct drm_device *drm;
+	void	__iomem	*base;
+};
+
+#endif
diff --git a/drivers/gpu/drm/ivip/intel_vip_of.c b/drivers/gpu/drm/ivip/intel_vip_of.c
new file mode 100644
index 0000000..7e3dc39
--- /dev/null
+++ b/drivers/gpu/drm/ivip/intel_vip_of.c
@@ -0,0 +1,195 @@
+/*
+ * intel_vip_of.c -- Intel Video and Image Processing(VIP)
+ * Frame Buffer II driver
+ *
+ * This driver supports the Intel VIP Frame Reader component.
+ * More info on the hardware can be found in the Intel Video
+ * and Image Processing Suite User Guide at this address
+ * http://www.altera.com/literature/ug/ug_vip.pdf.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * Authors:
+ * Ong, Hean-Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
+ *
+ */
+
+#include <linux/component.h>
+#include <linux/fb.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "intel_vip_drv.h"
+
+DEFINE_DRM_GEM_CMA_FOPS(fops);
+
+static struct drm_driver intelvipfb_drm = {
+	.driver_features =
+	    DRIVER_GEM | DRIVER_PRIME |
+	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC,
+	.gem_free_object_unlocked = drm_gem_cma_free_object,
+	.gem_vm_ops = &drm_gem_cma_vm_ops,
+	.dumb_create = drm_gem_cma_dumb_create,
+	.dumb_map_offset = drm_gem_cma_dumb_map_offset,
+	.dumb_destroy = drm_gem_dumb_destroy,
+	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
+	.gem_prime_export = drm_gem_prime_export,
+	.gem_prime_import = drm_gem_prime_import,
+	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
+	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
+	.gem_prime_vmap = drm_gem_cma_prime_vmap,
+	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
+	.gem_prime_mmap = drm_gem_cma_prime_mmap,
+	.name = DRIVER_NAME,
+	.date = "20170329",
+	.desc = "Intel FPGA VIP SUITE",
+	.major = 1,
+	.minor = 0,
+	.patchlevel = 0,
+	.fops = &fops,
+};
+
+/*
+ * Setting up information derived from OF Device Tree Nodes
+ * max-width, max-height, bits per pixel, memory port width
+ */
+
+static int intelvipfb_drm_setup(struct device *dev,
+				struct intelvipfb_priv *fbpriv)
+{
+	struct drm_device *drm = fbpriv->drm;
+	struct device_node *np = dev->of_node;
+	int mem_word_width;
+	int max_h, max_w;
+	int bpp;
+	int ret;
+
+	ret = of_property_read_u32(np, "altr,max-width", &max_w);
+	if (ret) {
+		dev_err(dev,
+			"Missing required parameter 'altr,max-width'");
+		return ret;
+	}
+
+	ret = of_property_read_u32(np, "altr,max-height", &max_h);
+	if (ret) {
+		dev_err(dev,
+			"Missing required parameter 'altr,max-height'");
+		return ret;
+	}
+
+	ret = of_property_read_u32(np, "altr,bits-per-symbol", &bpp);
+	if (ret) {
+		dev_err(dev,
+			"Missing required parameter 'altr,bits-per-symbol'");
+		return ret;
+	}
+
+	ret = of_property_read_u32(np, "altr,mem-port-width", &mem_word_width);
+	if (ret) {
+		dev_err(dev, "Missing required parameter 'altr,mem-port-width '");
+		return ret;
+	}
+
+	if (!(mem_word_width >= 32 && mem_word_width % 32 == 0)) {
+		dev_err(dev,
+			"mem-word-width is set to %i. must be >= 32 and multiple of 32.",
+			 mem_word_width);
+		return -ENODEV;
+	}
+
+	drm->mode_config.min_width = 640;
+	drm->mode_config.min_height = 480;
+	drm->mode_config.max_width = max_w;
+	drm->mode_config.max_height = max_h;
+	drm->mode_config.preferred_depth = bpp * BYTES_PER_PIXEL;
+
+	return 0;
+}
+
+static int intelvipfb_of_probe(struct platform_device *pdev)
+{
+	int retval;
+	struct resource *reg_res;
+	struct intelvipfb_priv *fbpriv;
+	struct device *dev = &pdev->dev;
+	struct drm_device *drm;
+
+	fbpriv = devm_kzalloc(dev, sizeof(*fbpriv), GFP_KERNEL);
+	if (!fbpriv)
+		return -ENOMEM;
+
+	/*setup DRM */
+	drm = drm_dev_alloc(&intelvipfb_drm, dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	retval = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
+	if (retval)
+		return -ENODEV;
+
+	fbpriv->drm = drm;
+
+	reg_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!reg_res)
+		return -ENOMEM;
+
+	fbpriv->base = devm_ioremap_resource(dev, reg_res);
+
+	if (IS_ERR(fbpriv->base)) {
+		dev_err(dev, "devm_ioremap_resource failed\n");
+		retval = PTR_ERR(fbpriv->base);
+		return -ENOMEM;
+	}
+
+	intelvipfb_drm_setup(dev, fbpriv);
+
+	dev_set_drvdata(dev, fbpriv);
+
+	return intelvipfb_probe(dev, fbpriv->base);
+}
+
+static int intelvipfb_of_remove(struct platform_device *pdev)
+{
+	return intelvipfb_remove(&pdev->dev);
+}
+
+/*
+ * The name vip-frame-buffer-2.0 is derived from
+ * http://www.altera.com/literature/ug/ug_vip.pdf
+ * frame buffer IP cores section 14
+ */
+
+static const struct of_device_id intelvipfb_of_match[] = {
+	{ .compatible = "altr,vip-frame-buffer-2.0" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, intelvipfb_of_match);
+
+static struct platform_driver intelvipfb_driver = {
+	.probe = intelvipfb_of_probe,
+	.remove = intelvipfb_of_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = intelvipfb_of_match,
+	},
+};
+
+module_platform_driver(intelvipfb_driver);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
