From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 1/5] drm: xlnx: Xilinx DRM KMS module
Date: Tue, 6 Feb 2018 17:36:36 -0800
Message-ID: <1517967400-16993-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Xilinx has various platforms for display, where users can create
using multiple IPs in the programmable FPGA fabric, or where
some hardened piepline is available on the chip. Furthermore,
hardened pipeline can also interact with soft logics in FPGA.

The Xilinx DRM KMS module is to integrate multiple subdevices and
to represent the entire pipeline as a single DRM device. The module
includes helper (ex, framebuffer and gem helpers) and
glue logic (ex, crtc interface) functions.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
v5
- Redefine xlnx_pipeline_init()
v4
- Fix a bug in of graph binding handling
- Remove vblank callbacks from xlnx_crtc
- Remove the dt binding. This module becomes more like a library.
- Rephrase the commit message
v3
- Add Laurent as a maintainer
- Fix multiple-reference on gem objects
v2
- Change the SPDX identifier format
- Merge patches(crtc, gem, fb) into single one
v2 of xlnx_drv
- Rename kms to display in xlnx_drv
- Replace some xlnx specific fb helper with common helpers in xlnx_drv
- Don't set the commit tail callback in xlnx_drv
- Support 'ports' graph binding in xlnx_drv
v2 of xlnx_fb
- Remove wrappers in xlnx_fb
- Replace some functions with drm core helpers in xlnx_fb
---
---
 MAINTAINERS                      |   9 +
 drivers/gpu/drm/Kconfig          |   2 +
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/xlnx/Kconfig     |  12 +
 drivers/gpu/drm/xlnx/Makefile    |   2 +
 drivers/gpu/drm/xlnx/xlnx_crtc.c | 177 ++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_crtc.h |  70 ++++++
 drivers/gpu/drm/xlnx/xlnx_drv.c  | 501 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_drv.h  |  33 +++
 drivers/gpu/drm/xlnx/xlnx_fb.c   | 298 +++++++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_fb.h   |  33 +++
 drivers/gpu/drm/xlnx/xlnx_gem.c  |  47 ++++
 drivers/gpu/drm/xlnx/xlnx_gem.h  |  26 ++
 13 files changed, 1211 insertions(+)
 create mode 100644 drivers/gpu/drm/xlnx/Kconfig
 create mode 100644 drivers/gpu/drm/xlnx/Makefile
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_crtc.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_crtc.h
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_drv.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_drv.h
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_fb.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_fb.h
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_gem.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_gem.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bc088f..07c0e73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4789,6 +4789,15 @@ F:	drivers/gpu/drm/etnaviv/
 F:	include/uapi/drm/etnaviv_drm.h
 F:	Documentation/devicetree/bindings/display/etnaviv/
 
+DRM DRIVERS FOR XILINX
+M:	Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+M:	Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
+L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
+S:	Maintained
+F:	drivers/gpu/drm/xlnx/
+F:	Documentation/devicetree/bindings/display/xlnx/
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+
 DRM DRIVERS FOR ZTE ZX
 M:	Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
 L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index deeefa7..5a3ec66 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -289,6 +289,8 @@ source "drivers/gpu/drm/pl111/Kconfig"
 
 source "drivers/gpu/drm/tve200/Kconfig"
 
+source "drivers/gpu/drm/xlnx/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 50093ff..f93557e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -103,3 +103,4 @@ obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
 obj-$(CONFIG_DRM_TINYDRM) += tinydrm/
 obj-$(CONFIG_DRM_PL111) += pl111/
 obj-$(CONFIG_DRM_TVE200) += tve200/
+obj-$(CONFIG_DRM_XLNX)	+= xlnx/
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
new file mode 100644
index 0000000..19fd7cd
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -0,0 +1,12 @@
+config DRM_XLNX
+	tristate "Xilinx DRM KMS Driver"
+	depends on DRM && OF
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
+	help
+	  Xilinx DRM KMS driver. Choose this option if you have
+	  a Xilinx SoCs with hardened display pipeline or soft
+	  display pipeline using Xilinx IPs in FPGA. This module
+	  provides the kernel mode setting functionalities
+	  for Xilinx display drivers.
diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
new file mode 100644
index 0000000..c60a281
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -0,0 +1,2 @@
+xlnx_drm-objs += xlnx_crtc.o xlnx_drv.o xlnx_fb.o xlnx_gem.o
+obj-$(CONFIG_DRM_XLNX) += xlnx_drm.o
diff --git a/drivers/gpu/drm/xlnx/xlnx_crtc.c b/drivers/gpu/drm/xlnx/xlnx_crtc.c
new file mode 100644
index 0000000..de83905
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_crtc.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx DRM crtc driver
+ *
+ *  Copyright (C) 2017 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <drm/drmP.h>
+
+#include <linux/list.h>
+
+#include "xlnx_crtc.h"
+#include "xlnx_drv.h"
+
+/*
+ * Overview
+ * --------
+ *
+ * The Xilinx CRTC layer is to enable the custom interface to CRTC drivers.
+ * The interface is used by Xilinx DRM driver where it needs CRTC
+ * functionailty. CRTC drivers should attach the desired callbacks
+ * to struct xlnx_crtc and register the xlnx_crtc with correcsponding
+ * drm_device. It's highly recommended CRTC drivers register all callbacks
+ * even though many of them are optional.
+ * The CRTC helper simply walks through the registered CRTC device,
+ * and call the callbacks.
+ */
+
+/**
+ * struct xlnx_crtc_helper - Xilinx CRTC helper
+ * @xlnx_crtcs: list of Xilinx CRTC devices
+ * @lock: lock to protect @xlnx_crtcs
+ * @drm: back pointer to DRM core
+ */
+struct xlnx_crtc_helper {
+	struct list_head xlnx_crtcs;
+	struct mutex lock; /* lock for @xlnx_crtcs */
+	struct drm_device *drm;
+};
+
+#define XLNX_CRTC_MAX_HEIGHT_WIDTH	UINT_MAX
+
+unsigned int xlnx_crtc_helper_get_align(struct xlnx_crtc_helper *helper)
+{
+	struct xlnx_crtc *crtc;
+	unsigned int align = 1, tmp;
+
+	list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+		if (crtc->get_align) {
+			tmp = crtc->get_align(crtc);
+			align = ALIGN(align, tmp);
+		}
+	}
+
+	return align;
+}
+
+u64 xlnx_crtc_helper_get_dma_mask(struct xlnx_crtc_helper *helper)
+{
+	struct xlnx_crtc *crtc;
+	u64 mask = DMA_BIT_MASK(sizeof(dma_addr_t) * 8), tmp;
+
+	list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+		if (crtc->get_dma_mask) {
+			tmp = crtc->get_dma_mask(crtc);
+			mask = min(mask, tmp);
+		}
+	}
+
+	return mask;
+}
+
+int xlnx_crtc_helper_get_max_width(struct xlnx_crtc_helper *helper)
+{
+	struct xlnx_crtc *crtc;
+	unsigned int width = XLNX_CRTC_MAX_HEIGHT_WIDTH, tmp;
+
+	list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+		if (crtc->get_max_width) {
+			tmp = crtc->get_max_width(crtc);
+			width = min(width, tmp);
+		}
+	}
+
+	return width;
+}
+
+int xlnx_crtc_helper_get_max_height(struct xlnx_crtc_helper *helper)
+{
+	struct xlnx_crtc *crtc;
+	unsigned int height = XLNX_CRTC_MAX_HEIGHT_WIDTH, tmp;
+
+	list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+		if (crtc->get_max_height) {
+			tmp = crtc->get_max_height(crtc);
+			height = min(height, tmp);
+		}
+	}
+
+	return height;
+}
+
+uint32_t xlnx_crtc_helper_get_format(struct xlnx_crtc_helper *helper)
+{
+	struct xlnx_crtc *crtc;
+	u32 format = 0, tmp;
+
+	list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+		if (crtc->get_format) {
+			tmp = crtc->get_format(crtc);
+			if (format && format != tmp)
+				return 0;
+			format = tmp;
+		}
+	}
+
+	return format;
+}
+
+struct xlnx_crtc_helper *xlnx_crtc_helper_init(struct drm_device *drm)
+{
+	struct xlnx_crtc_helper *helper;
+
+	helper = devm_kzalloc(drm->dev, sizeof(*helper), GFP_KERNEL);
+	if (!helper)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&helper->xlnx_crtcs);
+	mutex_init(&helper->lock);
+	helper->drm = drm;
+
+	return helper;
+}
+
+void xlnx_crtc_helper_fini(struct drm_device *drm,
+			   struct xlnx_crtc_helper *helper)
+{
+	if (WARN_ON(helper->drm != drm))
+		return;
+
+	if (WARN_ON(!list_empty(&helper->xlnx_crtcs)))
+		return;
+
+	mutex_destroy(&helper->lock);
+	devm_kfree(drm->dev, helper);
+}
+
+void xlnx_crtc_register(struct drm_device *drm, struct xlnx_crtc *crtc)
+{
+	struct xlnx_crtc_helper *helper = xlnx_get_crtc_helper(drm);
+
+	mutex_lock(&helper->lock);
+	list_add_tail(&crtc->list, &helper->xlnx_crtcs);
+	mutex_unlock(&helper->lock);
+}
+EXPORT_SYMBOL_GPL(xlnx_crtc_register);
+
+void xlnx_crtc_unregister(struct drm_device *drm, struct xlnx_crtc *crtc)
+{
+	struct xlnx_crtc_helper *helper = xlnx_get_crtc_helper(drm);
+
+	mutex_lock(&helper->lock);
+	list_del(&crtc->list);
+	mutex_unlock(&helper->lock);
+}
+EXPORT_SYMBOL_GPL(xlnx_crtc_unregister);
diff --git a/drivers/gpu/drm/xlnx/xlnx_crtc.h b/drivers/gpu/drm/xlnx/xlnx_crtc.h
new file mode 100644
index 0000000..bff5e3d
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_crtc.h
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx DRM crtc header
+ *
+ *  Copyright (C) 2017 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _XLNX_CRTC_H_
+#define _XLNX_CRTC_H_
+
+/**
+ * struct xlnx_crtc - Xilinx CRTC device
+ * @crtc: DRM CRTC device
+ * @list: list node for Xilinx CRTC device list
+ * @get_align: Get the alignment requirement of CRTC device
+ * @get_dma_mask: Get the dma mask of CRTC device
+ * @get_max_width: Get the maximum supported width
+ * @get_max_height: Get the maximum supported height
+ * @get_format: Get the current format of CRTC device
+ */
+struct xlnx_crtc {
+	struct drm_crtc crtc;
+	struct list_head list;
+	unsigned int (*get_align)(struct xlnx_crtc *crtc);
+	u64 (*get_dma_mask)(struct xlnx_crtc *crtc);
+	int (*get_max_width)(struct xlnx_crtc *crtc);
+	int (*get_max_height)(struct xlnx_crtc *crtc);
+	uint32_t (*get_format)(struct xlnx_crtc *crtc);
+};
+
+/*
+ * Helper functions: used within Xlnx DRM
+ */
+
+struct xlnx_crtc_helper;
+
+unsigned int xlnx_crtc_helper_get_align(struct xlnx_crtc_helper *helper);
+u64 xlnx_crtc_helper_get_dma_mask(struct xlnx_crtc_helper *helper);
+int xlnx_crtc_helper_get_max_width(struct xlnx_crtc_helper *helper);
+int xlnx_crtc_helper_get_max_height(struct xlnx_crtc_helper *helper);
+uint32_t xlnx_crtc_helper_get_format(struct xlnx_crtc_helper *helper);
+
+struct xlnx_crtc_helper *xlnx_crtc_helper_init(struct drm_device *drm);
+void xlnx_crtc_helper_fini(struct drm_device *drm,
+			   struct xlnx_crtc_helper *helper);
+
+/*
+ * CRTC registration: used by other sub-driver modules
+ */
+
+static inline struct xlnx_crtc *to_xlnx_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct xlnx_crtc, crtc);
+}
+
+void xlnx_crtc_register(struct drm_device *drm, struct xlnx_crtc *crtc);
+void xlnx_crtc_unregister(struct drm_device *drm, struct xlnx_crtc *crtc);
+
+#endif /* _XLNX_CRTC_H_ */
diff --git a/drivers/gpu/drm/xlnx/xlnx_drv.c b/drivers/gpu/drm/xlnx/xlnx_drv.c
new file mode 100644
index 0000000..8f0e357
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_drv.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx DRM KMS Driver
+ *
+ *  Copyright (C) 2013 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_of.h>
+
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/reservation.h>
+
+#include "xlnx_crtc.h"
+#include "xlnx_fb.h"
+#include "xlnx_gem.h"
+
+#define DRIVER_NAME	"xlnx"
+#define DRIVER_DESC	"Xilinx DRM KMS Driver"
+#define DRIVER_DATE	"20130509"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static uint xlnx_fbdev_vres = 2;
+module_param_named(fbdev_vres, xlnx_fbdev_vres, uint, 0444);
+MODULE_PARM_DESC(fbdev_vres,
+		 "fbdev virtual resolution multiplier for fb (default: 2)");
+
+/**
+ * struct xlnx_drm - Xilinx DRM private data
+ * @drm: DRM core
+ * @crtc: Xilinx DRM CRTC helper
+ * @fb: DRM fb helper
+ * @master: logical master device for pipeline
+ * @suspend_state: atomic state for suspend / resume
+ */
+struct xlnx_drm {
+	struct drm_device *drm;
+	struct xlnx_crtc_helper *crtc;
+	struct drm_fb_helper *fb;
+	struct platform_device *master;
+	struct drm_atomic_state *suspend_state;
+};
+
+/**
+ * xlnx_get_crtc_helper - Return the crtc helper instance
+ * @drm: DRM device
+ *
+ * Return: the crtc helper instance
+ */
+struct xlnx_crtc_helper *xlnx_get_crtc_helper(struct drm_device *drm)
+{
+	struct xlnx_drm *xlnx_drm = drm->dev_private;
+
+	return xlnx_drm->crtc;
+}
+
+/**
+ * xlnx_get_align - Return the align requirement through CRTC helper
+ * @drm: DRM device
+ *
+ * Return: the alignment requirement
+ */
+unsigned int xlnx_get_align(struct drm_device *drm)
+{
+	struct xlnx_drm *xlnx_drm = drm->dev_private;
+
+	return xlnx_crtc_helper_get_align(xlnx_drm->crtc);
+}
+
+/**
+ * xlnx_get_format - Return the current format of CRTC
+ * @drm: DRM device
+ *
+ * Return: the current CRTC format
+ */
+uint32_t xlnx_get_format(struct drm_device *drm)
+{
+	struct xlnx_drm *xlnx_drm = drm->dev_private;
+
+	return xlnx_crtc_helper_get_format(xlnx_drm->crtc);
+}
+
+static void xlnx_output_poll_changed(struct drm_device *drm)
+{
+	struct xlnx_drm *xlnx_drm = drm->dev_private;
+
+	if (xlnx_drm->fb)
+		drm_fb_helper_hotplug_event(xlnx_drm->fb);
+}
+
+static const struct drm_mode_config_funcs xlnx_mode_config_funcs = {
+	.fb_create		= xlnx_fb_create,
+	.output_poll_changed	= xlnx_output_poll_changed,
+	.atomic_check		= drm_atomic_helper_check,
+	.atomic_commit		= drm_atomic_helper_commit,
+};
+
+static void xlnx_mode_config_init(struct drm_device *drm)
+{
+	struct xlnx_drm *xlnx_drm = drm->dev_private;
+	struct xlnx_crtc_helper *crtc = xlnx_drm->crtc;
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	drm->mode_config.max_width = xlnx_crtc_helper_get_max_width(crtc);
+	drm->mode_config.max_height = xlnx_crtc_helper_get_max_height(crtc);
+}
+
+static void xlnx_lastclose(struct drm_device *drm)
+{
+	struct xlnx_drm *xlnx_drm = drm->dev_private;
+
+	if (xlnx_drm->fb)
+		drm_fb_helper_restore_fbdev_mode_unlocked(xlnx_drm->fb);
+}
+
+static const struct file_operations xlnx_fops = {
+	.owner		= THIS_MODULE,
+	.open		= drm_open,
+	.release	= drm_release,
+	.unlocked_ioctl	= drm_ioctl,
+	.mmap		= drm_gem_cma_mmap,
+	.poll		= drm_poll,
+	.read		= drm_read,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl	= drm_compat_ioctl,
+#endif
+	.llseek		= noop_llseek,
+};
+
+static struct drm_driver xlnx_drm_driver = {
+	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
+					  DRIVER_ATOMIC | DRIVER_PRIME,
+	.lastclose			= xlnx_lastclose,
+
+	.prime_handle_to_fd		= drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle		= drm_gem_prime_fd_to_handle,
+	.gem_prime_export		= drm_gem_prime_export,
+	.gem_prime_import		= drm_gem_prime_import,
+	.gem_prime_get_sg_table		= drm_gem_cma_prime_get_sg_table,
+	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
+	.gem_prime_vmap			= drm_gem_cma_prime_vmap,
+	.gem_prime_vunmap		= drm_gem_cma_prime_vunmap,
+	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
+	.gem_free_object		= drm_gem_cma_free_object,
+	.gem_vm_ops			= &drm_gem_cma_vm_ops,
+	.dumb_create			= xlnx_gem_cma_dumb_create,
+	.dumb_destroy			= drm_gem_dumb_destroy,
+
+	.fops				= &xlnx_fops,
+
+	.name				= DRIVER_NAME,
+	.desc				= DRIVER_DESC,
+	.date				= DRIVER_DATE,
+	.major				= DRIVER_MAJOR,
+	.minor				= DRIVER_MINOR,
+};
+
+static int xlnx_bind(struct device *dev)
+{
+	struct xlnx_drm *xlnx_drm;
+	struct drm_device *drm;
+	const struct drm_format_info *info;
+	struct platform_device *master = to_platform_device(dev);
+	struct platform_device *pdev = to_platform_device(dev->parent);
+	int ret;
+	u32 format;
+
+	drm = drm_dev_alloc(&xlnx_drm_driver, &pdev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	xlnx_drm = devm_kzalloc(drm->dev, sizeof(*xlnx_drm), GFP_KERNEL);
+	if (!xlnx_drm) {
+		ret = -ENOMEM;
+		goto err_drm;
+	}
+
+	drm_mode_config_init(drm);
+	drm->mode_config.funcs = &xlnx_mode_config_funcs;
+
+	ret = drm_vblank_init(drm, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to initialize vblank\n");
+		goto err_xlnx_drm;
+	}
+
+	drm->irq_enabled = 1;
+	drm->dev_private = xlnx_drm;
+	xlnx_drm->drm = drm;
+	xlnx_drm->master = master;
+	drm_kms_helper_poll_init(drm);
+	platform_set_drvdata(master, xlnx_drm);
+
+	xlnx_drm->crtc = xlnx_crtc_helper_init(drm);
+	if (IS_ERR(xlnx_drm->crtc)) {
+		ret = PTR_ERR(xlnx_drm->crtc);
+		goto err_xlnx_drm;
+	}
+
+	ret = component_bind_all(&master->dev, drm);
+	if (ret)
+		goto err_crtc;
+
+	xlnx_mode_config_init(drm);
+	drm_mode_config_reset(drm);
+	dma_set_mask(drm->dev, xlnx_crtc_helper_get_dma_mask(xlnx_drm->crtc));
+
+	format = xlnx_crtc_helper_get_format(xlnx_drm->crtc);
+	info = drm_format_info(format);
+	if (info && info->depth && info->cpp[0]) {
+		unsigned int align;
+
+		align = xlnx_crtc_helper_get_align(xlnx_drm->crtc);
+		xlnx_drm->fb = xlnx_fb_init(drm, info->cpp[0] * 8, 1, align,
+					    xlnx_fbdev_vres);
+		if (IS_ERR(xlnx_drm->fb)) {
+			dev_err(&pdev->dev,
+				"failed to initialize drm fb\n");
+			xlnx_drm->fb = NULL;
+		}
+	} else {
+		/* fbdev emulation is optional */
+		dev_info(&pdev->dev, "fbdev is not initialized\n");
+	}
+
+	ret = drm_dev_register(drm, 0);
+	if (ret < 0)
+		goto err_fb;
+
+	return 0;
+
+err_fb:
+	if (xlnx_drm->fb)
+		xlnx_fb_fini(xlnx_drm->fb);
+	component_unbind_all(drm->dev, drm);
+err_crtc:
+	xlnx_crtc_helper_fini(drm, xlnx_drm->crtc);
+err_xlnx_drm:
+	drm_mode_config_cleanup(drm);
+err_drm:
+	drm_dev_unref(drm);
+	return ret;
+}
+
+static void xlnx_unbind(struct device *dev)
+{
+	struct xlnx_drm *xlnx_drm = dev_get_drvdata(dev);
+	struct drm_device *drm = xlnx_drm->drm;
+
+	drm_dev_unregister(drm);
+	if (xlnx_drm->fb)
+		xlnx_fb_fini(xlnx_drm->fb);
+	component_unbind_all(&xlnx_drm->master->dev, drm);
+	xlnx_crtc_helper_fini(drm, xlnx_drm->crtc);
+	drm_kms_helper_poll_fini(drm);
+	drm_mode_config_cleanup(drm);
+	drm_dev_unref(drm);
+}
+
+static const struct component_master_ops xlnx_master_ops = {
+	.bind	= xlnx_bind,
+	.unbind	= xlnx_unbind,
+};
+
+static int xlnx_of_component_probe(struct device *master_dev,
+				   int (*compare_of)(struct device *, void *),
+				   const struct component_master_ops *m_ops)
+{
+	struct device *dev = master_dev->parent;
+	struct device_node *ep, *port, *remote, *parent;
+	struct component_match *match = NULL;
+	int i;
+
+	if (!dev->of_node)
+		return -EINVAL;
+
+	component_match_add(master_dev, &match, compare_of, dev->of_node);
+
+	for (i = 0; ; i++) {
+		port = of_parse_phandle(dev->of_node, "ports", i);
+		if (!port)
+			break;
+
+		parent = port->parent;
+		if (!of_node_cmp(parent->name, "ports"))
+			parent = parent->parent;
+		parent = of_node_get(parent);
+
+		if (!of_device_is_available(parent)) {
+			of_node_put(parent);
+			of_node_put(port);
+			continue;
+		}
+
+		component_match_add(master_dev, &match, compare_of, parent);
+		of_node_put(parent);
+		of_node_put(port);
+	}
+
+	parent = dev->of_node;
+	for (i = 0; ; i++) {
+		parent = of_node_get(parent);
+		if (!of_device_is_available(parent)) {
+			of_node_put(parent);
+			continue;
+		}
+
+		for_each_endpoint_of_node(parent, ep) {
+			remote = of_graph_get_remote_port_parent(ep);
+			if (!remote || !of_device_is_available(remote) ||
+			    remote == dev->of_node) {
+				of_node_put(remote);
+				continue;
+			} else if (!of_device_is_available(remote->parent)) {
+				dev_warn(dev, "parent dev of %s unavailable\n",
+					 remote->full_name);
+				of_node_put(remote);
+				continue;
+			}
+			component_match_add(master_dev, &match, compare_of,
+					    remote);
+			of_node_put(remote);
+		}
+		of_node_put(parent);
+
+		port = of_parse_phandle(dev->of_node, "ports", i);
+		if (!port)
+			break;
+
+		parent = port->parent;
+		if (!of_node_cmp(parent->name, "ports"))
+			parent = parent->parent;
+		of_node_put(port);
+	}
+
+	return component_master_add_with_match(master_dev, m_ops, match);
+}
+
+static int xlnx_compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static int xlnx_platform_probe(struct platform_device *pdev)
+{
+	return xlnx_of_component_probe(&pdev->dev, xlnx_compare_of,
+				       &xlnx_master_ops);
+}
+
+static int xlnx_platform_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &xlnx_master_ops);
+	return 0;
+}
+
+static void xlnx_platform_shutdown(struct platform_device *pdev)
+{
+	struct xlnx_drm *xlnx_drm = platform_get_drvdata(pdev);
+
+	drm_put_dev(xlnx_drm->drm);
+}
+
+static int __maybe_unused xlnx_pm_suspend(struct device *dev)
+{
+	struct xlnx_drm *xlnx_drm = dev_get_drvdata(dev);
+	struct drm_device *drm = xlnx_drm->drm;
+
+	drm_kms_helper_poll_disable(drm);
+
+	xlnx_drm->suspend_state = drm_atomic_helper_suspend(drm);
+	if (IS_ERR(xlnx_drm->suspend_state)) {
+		drm_kms_helper_poll_enable(drm);
+		return PTR_ERR(xlnx_drm->suspend_state);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused xlnx_pm_resume(struct device *dev)
+{
+	struct xlnx_drm *xlnx_drm = dev_get_drvdata(dev);
+	struct drm_device *drm = xlnx_drm->drm;
+
+	drm_atomic_helper_resume(drm, xlnx_drm->suspend_state);
+	drm_kms_helper_poll_enable(drm);
+
+	return 0;
+}
+
+static const struct dev_pm_ops xlnx_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(xlnx_pm_suspend, xlnx_pm_resume)
+};
+
+static struct platform_driver xlnx_driver = {
+	.probe			= xlnx_platform_probe,
+	.remove			= xlnx_platform_remove,
+	.shutdown		= xlnx_platform_shutdown,
+	.driver			= {
+		.name		= "xlnx-drm",
+		.pm		= &xlnx_pm_ops,
+	},
+};
+
+/* bitmap for master id */
+static u32 xlnx_master_ids = GENMASK(31, 0);
+
+/**
+ * xilinx_drm_pipeline_init - Initialize the drm pipeline for the device
+ * @pdev: The platform device to initialize the drm pipeline device
+ *
+ * This function initializes the drm pipeline device, struct drm_device,
+ * on @pdev by creating a logical master platform device. The logical platform
+ * device acts as a master device to bind slave devices and represents
+ * the entire pipeline.
+ * The logical master uses the port bindings of the calling device to
+ * figure out the pipeline topology.
+ *
+ * Return: the logical master platform device if the drm device is initialized
+ * on @pdev. Error code otherwise.
+ */
+struct platform_device *xlnx_drm_pipeline_init(struct platform_device *pdev)
+{
+	struct platform_device *master;
+	int id, ret;
+
+	id = ffs(xlnx_master_ids);
+	if (!id)
+		return ERR_PTR(-ENOSPC);
+
+	master = platform_device_alloc("xlnx-drm", id - 1);
+	if (!master)
+		return ERR_PTR(-ENOMEM);
+
+	master->dev.parent = &pdev->dev;
+	ret = platform_device_add(master);
+	if (ret)
+		goto err_out;
+
+	WARN_ON(master->id != id - 1);
+	xlnx_master_ids &= ~BIT(master->id);
+	return master;
+
+err_out:
+	platform_device_unregister(master);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(xlnx_drm_pipeline_init);
+
+/**
+ * xilinx_drm_pipeline_exit - Release the drm pipeline for the device
+ * @master: The master pipeline device to release
+ *
+ * Release the logical pipeline device returned by xlnx_drm_pipeline_init().
+ */
+void xlnx_drm_pipeline_exit(struct platform_device *master)
+{
+	xlnx_master_ids |= BIT(master->id);
+	platform_device_unregister(master);
+}
+EXPORT_SYMBOL_GPL(xlnx_drm_pipeline_exit);
+
+static int __init xlnx_drm_drv_init(void)
+{
+	platform_driver_register(&xlnx_driver);
+	return 0;
+}
+
+static void __exit xlnx_drm_drv_exit(void)
+{
+	platform_driver_unregister(&xlnx_driver);
+}
+
+module_init(xlnx_drm_drv_init);
+module_exit(xlnx_drm_drv_exit);
+
+MODULE_AUTHOR("Xilinx, Inc.");
+MODULE_DESCRIPTION("Xilinx DRM KMS Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/xlnx/xlnx_drv.h b/drivers/gpu/drm/xlnx/xlnx_drv.h
new file mode 100644
index 0000000..0f6595f
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_drv.h
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx DRM KMS Header for Xilinx
+ *
+ *  Copyright (C) 2013 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _XLNX_DRV_H_
+#define _XLNX_DRV_H_
+
+struct drm_device;
+struct xlnx_crtc_helper;
+
+struct platform_device *xlnx_drm_pipeline_init(struct platform_device *parent);
+void xlnx_drm_pipeline_exit(struct platform_device *pipeline);
+
+uint32_t xlnx_get_format(struct drm_device *drm);
+unsigned int xlnx_get_align(struct drm_device *drm);
+struct xlnx_crtc_helper *xlnx_get_crtc_helper(struct drm_device *drm);
+struct xlnx_bridge_helper *xlnx_get_bridge_helper(struct drm_device *drm);
+
+#endif /* _XLNX_DRV_H_ */
diff --git a/drivers/gpu/drm/xlnx/xlnx_fb.c b/drivers/gpu/drm/xlnx/xlnx_fb.c
new file mode 100644
index 0000000..e72087d
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_fb.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx DRM KMS Framebuffer helper
+ *
+ *  Copyright (C) 2015 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * Based on drm_fb_cma_helper.c
+ *
+ *  Copyright (C) 2012 Analog Device Inc.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+#include "xlnx_drv.h"
+#include "xlnx_fb.h"
+
+#define XLNX_MAX_PLANES	4
+
+struct xlnx_fbdev {
+	struct drm_fb_helper fb_helper;
+	struct drm_framebuffer *fb;
+	unsigned int align;
+	unsigned int vres_mult;
+};
+
+static inline struct xlnx_fbdev *to_fbdev(struct drm_fb_helper *fb_helper)
+{
+	return container_of(fb_helper, struct xlnx_fbdev, fb_helper);
+}
+
+static struct drm_framebuffer_funcs xlnx_fb_funcs = {
+	.destroy	= drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+};
+
+static int
+xlnx_fb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	unsigned int i;
+	int ret = 0;
+
+	switch (cmd) {
+	case FBIO_WAITFORVSYNC:
+		for (i = 0; i < fb_helper->crtc_count; i++) {
+			struct drm_mode_set *mode_set;
+			struct drm_crtc *crtc;
+
+			mode_set = &fb_helper->crtc_info[i].mode_set;
+			crtc = mode_set->crtc;
+			ret = drm_crtc_vblank_get(crtc);
+			if (!ret) {
+				drm_crtc_wait_one_vblank(crtc);
+				drm_crtc_vblank_put(crtc);
+			}
+		}
+		return ret;
+	default:
+		return -ENOTTY;
+	}
+
+	return 0;
+}
+
+static struct fb_ops xlnx_fbdev_ops = {
+	.owner		= THIS_MODULE,
+	.fb_fillrect	= sys_fillrect,
+	.fb_copyarea	= sys_copyarea,
+	.fb_imageblit	= sys_imageblit,
+	.fb_check_var	= drm_fb_helper_check_var,
+	.fb_set_par	= drm_fb_helper_set_par,
+	.fb_blank	= drm_fb_helper_blank,
+	.fb_pan_display	= drm_fb_helper_pan_display,
+	.fb_setcmap	= drm_fb_helper_setcmap,
+	.fb_ioctl	= xlnx_fb_ioctl,
+};
+
+/**
+ * xlnx_fbdev_create - Create the fbdev with a framebuffer
+ * @fb_helper: fb helper structure
+ * @size: framebuffer size info
+ *
+ * This function is based on drm_fbdev_cma_create().
+ *
+ * Return: 0 if successful, or the error code.
+ */
+static int xlnx_fbdev_create(struct drm_fb_helper *fb_helper,
+			     struct drm_fb_helper_surface_size *size)
+{
+	struct xlnx_fbdev *fbdev = to_fbdev(fb_helper);
+	struct drm_device *drm = fb_helper->dev;
+	struct drm_gem_cma_object *obj;
+	struct drm_framebuffer *fb;
+	unsigned int bytes_per_pixel;
+	unsigned long offset;
+	struct fb_info *fbi;
+	size_t bytes;
+	int ret;
+
+	dev_dbg(drm->dev, "surface width(%d), height(%d) and bpp(%d)\n",
+		size->surface_width, size->surface_height, size->surface_bpp);
+
+	size->surface_height *= fbdev->vres_mult;
+	bytes_per_pixel = DIV_ROUND_UP(size->surface_bpp, 8);
+	bytes = ALIGN(size->surface_width * bytes_per_pixel, fbdev->align);
+	bytes *= size->surface_height;
+
+	obj = drm_gem_cma_create(drm, bytes);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	fbi = framebuffer_alloc(0, drm->dev);
+	if (!fbi) {
+		dev_err(drm->dev, "Failed to allocate framebuffer info.\n");
+		ret = -ENOMEM;
+		goto err_drm_gem_cma_free_object;
+	}
+
+	fbdev->fb = drm_gem_fbdev_fb_create(drm, size, fbdev->align, &obj->base,
+					    &xlnx_fb_funcs);
+	if (IS_ERR(fbdev->fb)) {
+		dev_err(drm->dev, "Failed to allocate DRM framebuffer.\n");
+		ret = PTR_ERR(fbdev->fb);
+		goto err_framebuffer_release;
+	}
+
+	fb = fbdev->fb;
+	fb_helper->fb = fb;
+	fb_helper->fbdev = fbi;
+	fbi->par = fb_helper;
+	fbi->flags = FBINFO_FLAG_DEFAULT;
+	fbi->fbops = &xlnx_fbdev_ops;
+
+	ret = fb_alloc_cmap(&fbi->cmap, 256, 0);
+	if (ret) {
+		dev_err(drm->dev, "Failed to allocate color map.\n");
+		goto err_fb_destroy;
+	}
+
+	drm_fb_helper_fill_fix(fbi, fb->pitches[0], fb->format->depth);
+	drm_fb_helper_fill_var(fbi, fb_helper, fb->width, fb->height);
+	fbi->var.yres = fb->height / fbdev->vres_mult;
+
+	offset = fbi->var.xoffset * bytes_per_pixel;
+	offset += fbi->var.yoffset * fb->pitches[0];
+
+	drm->mode_config.fb_base = (resource_size_t)obj->paddr;
+	fbi->screen_base = (char __iomem *)(obj->vaddr + offset);
+	fbi->fix.smem_start = (unsigned long)(obj->paddr + offset);
+	fbi->screen_size = bytes;
+	fbi->fix.smem_len = bytes;
+
+	return 0;
+
+err_fb_destroy:
+	drm_framebuffer_unregister_private(fb);
+	drm_gem_fb_destroy(fb);
+err_framebuffer_release:
+	framebuffer_release(fbi);
+err_drm_gem_cma_free_object:
+	drm_gem_cma_free_object(&obj->base);
+	return ret;
+}
+
+static struct drm_fb_helper_funcs xlnx_fb_helper_funcs = {
+	.fb_probe = xlnx_fbdev_create,
+};
+
+/**
+ * xlnx_fb_init - Allocate and initializes the Xilinx framebuffer
+ * @drm: DRM device
+ * @preferred_bpp: preferred bits per pixel for the device
+ * @max_conn_count: maximum number of connectors
+ * @align: alignment value for pitch
+ * @vres_mult: multiplier for virtual resolution
+ *
+ * This function is based on drm_fbdev_cma_init().
+ *
+ * Return: a newly allocated drm_fb_helper struct or a ERR_PTR.
+ */
+struct drm_fb_helper *
+xlnx_fb_init(struct drm_device *drm, int preferred_bpp,
+	     unsigned int max_conn_count, unsigned int align,
+	     unsigned int vres_mult)
+{
+	struct xlnx_fbdev *fbdev;
+	struct drm_fb_helper *fb_helper;
+	int ret;
+
+	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
+	if (!fbdev)
+		return ERR_PTR(-ENOMEM);
+
+	fbdev->vres_mult = vres_mult;
+	fbdev->align = align;
+	fb_helper = &fbdev->fb_helper;
+	drm_fb_helper_prepare(drm, fb_helper, &xlnx_fb_helper_funcs);
+
+	ret = drm_fb_helper_init(drm, fb_helper, max_conn_count);
+	if (ret < 0) {
+		dev_err(drm->dev, "Failed to initialize drm fb helper.\n");
+		goto err_free;
+	}
+
+	ret = drm_fb_helper_single_add_all_connectors(fb_helper);
+	if (ret < 0) {
+		dev_err(drm->dev, "Failed to add connectors.\n");
+		goto err_drm_fb_helper_fini;
+	}
+
+	ret = drm_fb_helper_initial_config(fb_helper, preferred_bpp);
+	if (ret < 0) {
+		dev_err(drm->dev, "Failed to set initial hw configuration.\n");
+		goto err_drm_fb_helper_fini;
+	}
+
+	return fb_helper;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_free:
+	kfree(fbdev);
+	return ERR_PTR(ret);
+}
+
+/**
+ * xlnx_fbdev_defio_fini - Free the defio fb
+ * @fbi: fb_info struct
+ *
+ * This function is based on drm_fbdev_cma_defio_fini().
+ */
+static void xlnx_fbdev_defio_fini(struct fb_info *fbi)
+{
+	if (!fbi->fbdefio)
+		return;
+
+	fb_deferred_io_cleanup(fbi);
+	kfree(fbi->fbdefio);
+	kfree(fbi->fbops);
+}
+
+/**
+ * xlnx_fbdev_fini - Free the Xilinx framebuffer
+ * @fb_helper: drm_fb_helper struct
+ *
+ * This function is based on drm_fbdev_cma_fini().
+ */
+void xlnx_fb_fini(struct drm_fb_helper *fb_helper)
+{
+	struct xlnx_fbdev *fbdev = to_fbdev(fb_helper);
+
+	drm_fb_helper_unregister_fbi(&fbdev->fb_helper);
+	if (fbdev->fb_helper.fbdev)
+		xlnx_fbdev_defio_fini(fbdev->fb_helper.fbdev);
+
+	if (fbdev->fb_helper.fb)
+		drm_framebuffer_remove(fbdev->fb_helper.fb);
+
+	drm_fb_helper_fini(&fbdev->fb_helper);
+	kfree(fbdev);
+}
+
+/**
+ * xlnx_fb_create - (struct drm_mode_config_funcs *)->fb_create callback
+ * @drm: DRM device
+ * @file_priv: drm file private data
+ * @mode_cmd: mode command for fb creation
+ *
+ * This functions creates a drm_framebuffer with xlnx_fb_funcs for given mode
+ * @mode_cmd. This functions is intended to be used for the fb_create callback
+ * function of drm_mode_config_funcs.
+ *
+ * Return: a drm_framebuffer object if successful, or
+ * ERR_PTR from drm_gem_fb_create_with_funcs().
+ */
+struct drm_framebuffer *
+xlnx_fb_create(struct drm_device *drm, struct drm_file *file_priv,
+	       const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	return drm_gem_fb_create_with_funcs(drm, file_priv, mode_cmd,
+					    &xlnx_fb_funcs);
+}
diff --git a/drivers/gpu/drm/xlnx/xlnx_fb.h b/drivers/gpu/drm/xlnx/xlnx_fb.h
new file mode 100644
index 0000000..6efc985
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_fb.h
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx DRM KMS Framebuffer helper header
+ *
+ *  Copyright (C) 2015 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _XLNX_FB_H_
+#define _XLNX_FB_H_
+
+struct drm_fb_helper;
+
+struct drm_framebuffer *
+xlnx_fb_create(struct drm_device *drm, struct drm_file *file_priv,
+	       const struct drm_mode_fb_cmd2 *mode_cmd);
+struct drm_fb_helper *
+xlnx_fb_init(struct drm_device *drm, int preferred_bpp,
+	     unsigned int max_conn_count, unsigned int align,
+	     unsigned int vres_mult);
+void xlnx_fb_fini(struct drm_fb_helper *fb_helper);
+
+#endif /* _XLNX_FB_H_ */
diff --git a/drivers/gpu/drm/xlnx/xlnx_gem.c b/drivers/gpu/drm/xlnx/xlnx_gem.c
new file mode 100644
index 0000000..4a5d533
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_gem.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx DRM KMS GEM helper
+ *
+ *  Copyright (C) 2015 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_gem_cma_helper.h>
+
+#include "xlnx_drv.h"
+#include "xlnx_gem.h"
+
+/*
+ * xlnx_gem_cma_dumb_create - (struct drm_driver)->dumb_create callback
+ * @file_priv: drm_file object
+ * @drm: DRM object
+ * @args: info for dumb scanout buffer creation
+ *
+ * This function is for dumb_create callback of drm_driver struct. Simply
+ * it wraps around drm_gem_cma_dumb_create() and sets the pitch value
+ * by retrieving the value from the device.
+ *
+ * Return: The return value from drm_gem_cma_dumb_create()
+ */
+int xlnx_gem_cma_dumb_create(struct drm_file *file_priv, struct drm_device *drm,
+			     struct drm_mode_create_dumb *args)
+{
+	int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	unsigned int align = xlnx_get_align(drm);
+
+	if (!args->pitch || !IS_ALIGNED(args->pitch, align))
+		args->pitch = ALIGN(pitch, align);
+
+	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
+}
diff --git a/drivers/gpu/drm/xlnx/xlnx_gem.h b/drivers/gpu/drm/xlnx/xlnx_gem.h
new file mode 100644
index 0000000..f380de9
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_gem.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx DRM KMS GEM helper header
+ *
+ *  Copyright (C) 2015 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _XLNX_GEM_H_
+#define _XLNX_GEM_H_
+
+int xlnx_gem_cma_dumb_create(struct drm_file *file_priv,
+			     struct drm_device *drm,
+			     struct drm_mode_create_dumb *args);
+
+#endif /* _XLNX_GEM_H_ */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
