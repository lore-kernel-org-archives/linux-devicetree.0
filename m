From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 2/8] drm: xlnx: Xilinx DRM KMS driver
Date: Mon, 15 Jan 2018 17:57:05 -0800
Message-ID: <1516067831-11382-2-git-send-email-hyun.kwon@xilinx.com>
References: <1516067831-11382-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516067831-11382-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Xilinx has various platforms for display, where users can create
using multiple IPs in the programmable FPGA fabric, or where
some hardened piepline is available on the chip. Furthermore,
hardened pipeline can also interact with soft logics in FPGA.

The Xilinx DRM KMS is to integrate multiple subdevices and to represent
the entire pipeline as a single DRM device. The driver includes helpers
(ex, framebuffer and gem helpers) and glue logics (ex, crtc interface).

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
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
 drivers/gpu/drm/xlnx/Kconfig     |  12 ++
 drivers/gpu/drm/xlnx/Makefile    |   2 +
 drivers/gpu/drm/xlnx/xlnx_crtc.c | 203 ++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_crtc.h |  78 +++++++
 drivers/gpu/drm/xlnx/xlnx_drv.c  | 447 +++++++++++++++++++++++++++++++++++=
++++
 drivers/gpu/drm/xlnx/xlnx_drv.h  |  30 +++
 drivers/gpu/drm/xlnx/xlnx_fb.c   | 298 ++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_fb.h   |  33 +++
 drivers/gpu/drm/xlnx/xlnx_gem.c  |  47 ++++
 drivers/gpu/drm/xlnx/xlnx_gem.h  |  26 +++
 13 files changed, 1188 insertions(+)
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
index 2811a21..dc84346 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4682,6 +4682,15 @@ F:       drivers/gpu/drm/etnaviv/
 F:     include/uapi/drm/etnaviv_drm.h
 F:     Documentation/devicetree/bindings/display/etnaviv/

+DRM DRIVERS FOR XILINX
+M:     Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+M:     Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
+L:     dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
+S:     Maintained
+F:     drivers/gpu/drm/xlnx/
+F:     Documentation/devicetree/bindings/display/xlnx/
+T:     git git://anongit.freedesktop.org/drm/drm-misc
+
 DRM DRIVERS FOR ZTE ZX
 M:     Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
 L:     dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 22ee5a1..f3c71e3 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -282,6 +282,8 @@ source "drivers/gpu/drm/tinydrm/Kconfig"

 source "drivers/gpu/drm/pl111/Kconfig"

+source "drivers/gpu/drm/xlnx/Kconfig"
+
 # Keep legacy drivers last

 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 92550dd..2f44c77 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -103,3 +103,4 @@ obj-$(CONFIG_DRM_ZTE)       +=3D zte/
 obj-$(CONFIG_DRM_MXSFB)        +=3D mxsfb/
 obj-$(CONFIG_DRM_TINYDRM) +=3D tinydrm/
 obj-$(CONFIG_DRM_PL111) +=3D pl111/
+obj-$(CONFIG_DRM_XLNX) +=3D xlnx/
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
new file mode 100644
index 0000000..19fd7cd
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -0,0 +1,12 @@
+config DRM_XLNX
+       tristate "Xilinx DRM KMS Driver"
+       depends on DRM && OF
+       select DRM_KMS_HELPER
+       select DRM_KMS_CMA_HELPER
+       select DRM_GEM_CMA_HELPER
+       help
+         Xilinx DRM KMS driver. Choose this option if you have
+         a Xilinx SoCs with hardened display pipeline or soft
+         display pipeline using Xilinx IPs in FPGA. This module
+         provides the kernel mode setting functionalities
+         for Xilinx display drivers.
diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
new file mode 100644
index 0000000..c60a281
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -0,0 +1,2 @@
+xlnx_drm-objs +=3D xlnx_crtc.o xlnx_drv.o xlnx_fb.o xlnx_gem.o
+obj-$(CONFIG_DRM_XLNX) +=3D xlnx_drm.o
diff --git a/drivers/gpu/drm/xlnx/xlnx_crtc.c b/drivers/gpu/drm/xlnx/xlnx_c=
rtc.c
new file mode 100644
index 0000000..89beb9e
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_crtc.c
@@ -0,0 +1,203 @@
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
+ * The Xilinx CRTC layer is to enable the custom interface to CRTC drivers=
.
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
+       struct list_head xlnx_crtcs;
+       struct mutex lock; /* lock for @xlnx_crtcs */
+       struct drm_device *drm;
+};
+
+#define XLNX_CRTC_MAX_HEIGHT_WIDTH     UINT_MAX
+
+int xlnx_crtc_helper_enable_vblank(struct xlnx_crtc_helper *helper,
+                                  unsigned int crtc_id)
+{
+       struct xlnx_crtc *crtc;
+
+       list_for_each_entry(crtc, &helper->xlnx_crtcs, list)
+               if (drm_crtc_index(&crtc->crtc) =3D=3D crtc_id)
+                       if (crtc->enable_vblank)
+                               return crtc->enable_vblank(crtc);
+       return -ENODEV;
+}
+
+void xlnx_crtc_helper_disable_vblank(struct xlnx_crtc_helper *helper,
+                                    unsigned int crtc_id)
+{
+       struct xlnx_crtc *crtc;
+
+       list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+               if (drm_crtc_index(&crtc->crtc) =3D=3D crtc_id) {
+                       if (crtc->disable_vblank)
+                               crtc->disable_vblank(crtc);
+                       return;
+               }
+       }
+}
+
+unsigned int xlnx_crtc_helper_get_align(struct xlnx_crtc_helper *helper)
+{
+       struct xlnx_crtc *crtc;
+       unsigned int align =3D 1, tmp;
+
+       list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+               if (crtc->get_align) {
+                       tmp =3D crtc->get_align(crtc);
+                       align =3D ALIGN(align, tmp);
+               }
+       }
+
+       return align;
+}
+
+u64 xlnx_crtc_helper_get_dma_mask(struct xlnx_crtc_helper *helper)
+{
+       struct xlnx_crtc *crtc;
+       u64 mask =3D DMA_BIT_MASK(sizeof(dma_addr_t) * 8), tmp;
+
+       list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+               if (crtc->get_dma_mask) {
+                       tmp =3D crtc->get_dma_mask(crtc);
+                       mask =3D min(mask, tmp);
+               }
+       }
+
+       return mask;
+}
+
+int xlnx_crtc_helper_get_max_width(struct xlnx_crtc_helper *helper)
+{
+       struct xlnx_crtc *crtc;
+       unsigned int width =3D XLNX_CRTC_MAX_HEIGHT_WIDTH, tmp;
+
+       list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+               if (crtc->get_max_width) {
+                       tmp =3D crtc->get_max_width(crtc);
+                       width =3D min(width, tmp);
+               }
+       }
+
+       return width;
+}
+
+int xlnx_crtc_helper_get_max_height(struct xlnx_crtc_helper *helper)
+{
+       struct xlnx_crtc *crtc;
+       unsigned int height =3D XLNX_CRTC_MAX_HEIGHT_WIDTH, tmp;
+
+       list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+               if (crtc->get_max_height) {
+                       tmp =3D crtc->get_max_height(crtc);
+                       height =3D min(height, tmp);
+               }
+       }
+
+       return height;
+}
+
+uint32_t xlnx_crtc_helper_get_format(struct xlnx_crtc_helper *helper)
+{
+       struct xlnx_crtc *crtc;
+       u32 format =3D 0, tmp;
+
+       list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+               if (crtc->get_format) {
+                       tmp =3D crtc->get_format(crtc);
+                       if (format && format !=3D tmp)
+                               return 0;
+                       format =3D tmp;
+               }
+       }
+
+       return format;
+}
+
+struct xlnx_crtc_helper *xlnx_crtc_helper_init(struct drm_device *drm)
+{
+       struct xlnx_crtc_helper *helper;
+
+       helper =3D devm_kzalloc(drm->dev, sizeof(*helper), GFP_KERNEL);
+       if (!helper)
+               return ERR_PTR(-ENOMEM);
+
+       INIT_LIST_HEAD(&helper->xlnx_crtcs);
+       mutex_init(&helper->lock);
+       helper->drm =3D drm;
+
+       return helper;
+}
+
+void xlnx_crtc_helper_fini(struct drm_device *drm,
+                          struct xlnx_crtc_helper *helper)
+{
+       if (WARN_ON(helper->drm !=3D drm))
+               return;
+
+       if (WARN_ON(!list_empty(&helper->xlnx_crtcs)))
+               return;
+
+       mutex_destroy(&helper->lock);
+       devm_kfree(drm->dev, helper);
+}
+
+void xlnx_crtc_register(struct drm_device *drm, struct xlnx_crtc *crtc)
+{
+       struct xlnx_crtc_helper *helper =3D xlnx_get_crtc_helper(drm);
+
+       mutex_lock(&helper->lock);
+       list_add_tail(&crtc->list, &helper->xlnx_crtcs);
+       mutex_unlock(&helper->lock);
+}
+EXPORT_SYMBOL_GPL(xlnx_crtc_register);
+
+void xlnx_crtc_unregister(struct drm_device *drm, struct xlnx_crtc *crtc)
+{
+       struct xlnx_crtc_helper *helper =3D xlnx_get_crtc_helper(drm);
+
+       mutex_lock(&helper->lock);
+       list_del(&crtc->list);
+       mutex_unlock(&helper->lock);
+}
+EXPORT_SYMBOL_GPL(xlnx_crtc_unregister);
diff --git a/drivers/gpu/drm/xlnx/xlnx_crtc.h b/drivers/gpu/drm/xlnx/xlnx_c=
rtc.h
new file mode 100644
index 0000000..1498e10
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_crtc.h
@@ -0,0 +1,78 @@
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
+ * @enable_vblank: Enable vblank
+ * @disable_vblank: Disable vblank
+ * @get_align: Get the alignment requirement of CRTC device
+ * @get_dma_mask: Get the dma mask of CRTC device
+ * @get_max_width: Get the maximum supported width
+ * @get_max_height: Get the maximum supported height
+ * @get_format: Get the current format of CRTC device
+ */
+struct xlnx_crtc {
+       struct drm_crtc crtc;
+       struct list_head list;
+       int (*enable_vblank)(struct xlnx_crtc *crtc);
+       void (*disable_vblank)(struct xlnx_crtc *crtc);
+       unsigned int (*get_align)(struct xlnx_crtc *crtc);
+       u64 (*get_dma_mask)(struct xlnx_crtc *crtc);
+       int (*get_max_width)(struct xlnx_crtc *crtc);
+       int (*get_max_height)(struct xlnx_crtc *crtc);
+       uint32_t (*get_format)(struct xlnx_crtc *crtc);
+};
+
+/*
+ * Helper functions: used within Xlnx DRM
+ */
+
+struct xlnx_crtc_helper;
+
+int xlnx_crtc_helper_enable_vblank(struct xlnx_crtc_helper *helper,
+                                  unsigned int crtc_id);
+void xlnx_crtc_helper_disable_vblank(struct xlnx_crtc_helper *helper,
+                                    unsigned int crtc_id);
+unsigned int xlnx_crtc_helper_get_align(struct xlnx_crtc_helper *helper);
+u64 xlnx_crtc_helper_get_dma_mask(struct xlnx_crtc_helper *helper);
+int xlnx_crtc_helper_get_max_width(struct xlnx_crtc_helper *helper);
+int xlnx_crtc_helper_get_max_height(struct xlnx_crtc_helper *helper);
+uint32_t xlnx_crtc_helper_get_format(struct xlnx_crtc_helper *helper);
+
+struct xlnx_crtc_helper *xlnx_crtc_helper_init(struct drm_device *drm);
+void xlnx_crtc_helper_fini(struct drm_device *drm,
+                          struct xlnx_crtc_helper *helper);
+
+/*
+ * CRTC registration: used by other sub-driver modules
+ */
+
+static inline struct xlnx_crtc *to_xlnx_crtc(struct drm_crtc *crtc)
+{
+       return container_of(crtc, struct xlnx_crtc, crtc);
+}
+
+void xlnx_crtc_register(struct drm_device *drm, struct xlnx_crtc *crtc);
+void xlnx_crtc_unregister(struct drm_device *drm, struct xlnx_crtc *crtc);
+
+#endif /* _XLNX_CRTC_H_ */
diff --git a/drivers/gpu/drm/xlnx/xlnx_drv.c b/drivers/gpu/drm/xlnx/xlnx_dr=
v.c
new file mode 100644
index 0000000..a350492
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_drv.c
@@ -0,0 +1,447 @@
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
+#define DRIVER_NAME    "xlnx"
+#define DRIVER_DESC    "Xilinx DRM KMS Driver"
+#define DRIVER_DATE    "20130509"
+#define DRIVER_MAJOR   1
+#define DRIVER_MINOR   0
+
+static uint xlnx_fbdev_vres =3D 2;
+module_param_named(fbdev_vres, xlnx_fbdev_vres, uint, 0444);
+MODULE_PARM_DESC(fbdev_vres,
+                "fbdev virtual resolution multiplier for fb (default: 2)")=
;
+
+/**
+ * struct xlnx_drm - Xilinx DRM private data
+ * @drm: DRM core
+ * @crtc: Xilinx DRM CRTC helper
+ * @fb: DRM fb helper
+ * @pdev: platform device
+ * @suspend_state: atomic state for suspend / resume
+ */
+struct xlnx_drm {
+       struct drm_device *drm;
+       struct xlnx_crtc_helper *crtc;
+       struct drm_fb_helper *fb;
+       struct platform_device *pdev;
+       struct drm_atomic_state *suspend_state;
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
+       struct xlnx_drm *xlnx_drm =3D drm->dev_private;
+
+       return xlnx_drm->crtc;
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
+       struct xlnx_drm *xlnx_drm =3D drm->dev_private;
+
+       return xlnx_crtc_helper_get_align(xlnx_drm->crtc);
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
+       struct xlnx_drm *xlnx_drm =3D drm->dev_private;
+
+       return xlnx_crtc_helper_get_format(xlnx_drm->crtc);
+}
+
+static void xlnx_output_poll_changed(struct drm_device *drm)
+{
+       struct xlnx_drm *xlnx_drm =3D drm->dev_private;
+
+       if (xlnx_drm->fb)
+               drm_fb_helper_hotplug_event(xlnx_drm->fb);
+}
+
+static const struct drm_mode_config_funcs xlnx_mode_config_funcs =3D {
+       .fb_create              =3D xlnx_fb_create,
+       .output_poll_changed    =3D xlnx_output_poll_changed,
+       .atomic_check           =3D drm_atomic_helper_check,
+       .atomic_commit          =3D drm_atomic_helper_commit,
+};
+
+static int xlnx_enable_vblank(struct drm_device *drm, unsigned int crtc)
+{
+       struct xlnx_drm *xlnx_drm =3D drm->dev_private;
+
+       return xlnx_crtc_helper_enable_vblank(xlnx_drm->crtc, crtc);
+}
+
+static void xlnx_disable_vblank(struct drm_device *drm, unsigned int crtc)
+{
+       struct xlnx_drm *xlnx_drm =3D drm->dev_private;
+
+       xlnx_crtc_helper_disable_vblank(xlnx_drm->crtc, crtc);
+}
+
+static void xlnx_mode_config_init(struct drm_device *drm)
+{
+       struct xlnx_drm *xlnx_drm =3D drm->dev_private;
+       struct xlnx_crtc_helper *crtc =3D xlnx_drm->crtc;
+
+       drm->mode_config.min_width =3D 0;
+       drm->mode_config.min_height =3D 0;
+       drm->mode_config.max_width =3D xlnx_crtc_helper_get_max_width(crtc)=
;
+       drm->mode_config.max_height =3D xlnx_crtc_helper_get_max_height(crt=
c);
+}
+
+static void xlnx_lastclose(struct drm_device *drm)
+{
+       struct xlnx_drm *xlnx_drm =3D drm->dev_private;
+
+       if (xlnx_drm->fb)
+               drm_fb_helper_restore_fbdev_mode_unlocked(xlnx_drm->fb);
+}
+
+static const struct file_operations xlnx_fops =3D {
+       .owner          =3D THIS_MODULE,
+       .open           =3D drm_open,
+       .release        =3D drm_release,
+       .unlocked_ioctl =3D drm_ioctl,
+       .mmap           =3D drm_gem_cma_mmap,
+       .poll           =3D drm_poll,
+       .read           =3D drm_read,
+#ifdef CONFIG_COMPAT
+       .compat_ioctl   =3D drm_compat_ioctl,
+#endif
+       .llseek         =3D noop_llseek,
+};
+
+static struct drm_driver xlnx_drm_driver =3D {
+       .driver_features                =3D DRIVER_MODESET | DRIVER_GEM |
+                                         DRIVER_ATOMIC | DRIVER_PRIME,
+       .lastclose                      =3D xlnx_lastclose,
+
+       .enable_vblank                  =3D xlnx_enable_vblank,
+       .disable_vblank                 =3D xlnx_disable_vblank,
+
+       .prime_handle_to_fd             =3D drm_gem_prime_handle_to_fd,
+       .prime_fd_to_handle             =3D drm_gem_prime_fd_to_handle,
+       .gem_prime_export               =3D drm_gem_prime_export,
+       .gem_prime_import               =3D drm_gem_prime_import,
+       .gem_prime_get_sg_table         =3D drm_gem_cma_prime_get_sg_table,
+       .gem_prime_import_sg_table      =3D drm_gem_cma_prime_import_sg_tab=
le,
+       .gem_prime_vmap                 =3D drm_gem_cma_prime_vmap,
+       .gem_prime_vunmap               =3D drm_gem_cma_prime_vunmap,
+       .gem_prime_mmap                 =3D drm_gem_cma_prime_mmap,
+       .gem_free_object                =3D drm_gem_cma_free_object,
+       .gem_vm_ops                     =3D &drm_gem_cma_vm_ops,
+       .dumb_create                    =3D xlnx_gem_cma_dumb_create,
+       .dumb_destroy                   =3D drm_gem_dumb_destroy,
+
+       .fops                           =3D &xlnx_fops,
+
+       .name                           =3D DRIVER_NAME,
+       .desc                           =3D DRIVER_DESC,
+       .date                           =3D DRIVER_DATE,
+       .major                          =3D DRIVER_MAJOR,
+       .minor                          =3D DRIVER_MINOR,
+};
+
+static int xlnx_bind(struct device *dev)
+{
+       struct xlnx_drm *xlnx_drm;
+       struct drm_device *drm;
+       const struct drm_format_info *info;
+       struct platform_device *pdev =3D to_platform_device(dev);
+       int ret;
+       u32 format;
+
+       drm =3D drm_dev_alloc(&xlnx_drm_driver, &pdev->dev);
+       if (IS_ERR(drm))
+               return PTR_ERR(drm);
+
+       xlnx_drm =3D devm_kzalloc(drm->dev, sizeof(*xlnx_drm), GFP_KERNEL);
+       if (!xlnx_drm) {
+               ret =3D -ENOMEM;
+               goto err_drm;
+       }
+
+       drm_mode_config_init(drm);
+       drm->mode_config.funcs =3D &xlnx_mode_config_funcs;
+
+       ret =3D drm_vblank_init(drm, 1);
+       if (ret) {
+               dev_err(&pdev->dev, "failed to initialize vblank\n");
+               goto err_xlnx_drm;
+       }
+
+       drm->irq_enabled =3D 1;
+       drm->dev_private =3D xlnx_drm;
+       xlnx_drm->drm =3D drm;
+       drm_kms_helper_poll_init(drm);
+       platform_set_drvdata(pdev, xlnx_drm);
+
+       xlnx_drm->crtc =3D xlnx_crtc_helper_init(drm);
+       if (IS_ERR(xlnx_drm->crtc)) {
+               ret =3D PTR_ERR(xlnx_drm->crtc);
+               goto err_xlnx_drm;
+       }
+
+       ret =3D component_bind_all(drm->dev, drm);
+       if (ret)
+               goto err_crtc;
+
+       xlnx_mode_config_init(drm);
+       drm_mode_config_reset(drm);
+       dma_set_mask(drm->dev, xlnx_crtc_helper_get_dma_mask(xlnx_drm->crtc=
));
+
+       format =3D xlnx_crtc_helper_get_format(xlnx_drm->crtc);
+       info =3D drm_format_info(format);
+       if (info && info->depth && info->cpp[0]) {
+               unsigned int align;
+
+               align =3D xlnx_crtc_helper_get_align(xlnx_drm->crtc);
+               xlnx_drm->fb =3D xlnx_fb_init(drm, info->cpp[0] * 8, 1, ali=
gn,
+                                           xlnx_fbdev_vres);
+               if (IS_ERR(xlnx_drm->fb)) {
+                       dev_err(&pdev->dev,
+                               "failed to initialize drm fb\n");
+                       xlnx_drm->fb =3D NULL;
+               }
+       } else {
+               /* fbdev emulation is optional */
+               dev_info(&pdev->dev, "fbdev is not initialized\n");
+       }
+
+       ret =3D drm_dev_register(drm, 0);
+       if (ret < 0)
+               goto err_fb;
+
+       return 0;
+
+err_fb:
+       if (xlnx_drm->fb)
+               xlnx_fb_fini(xlnx_drm->fb);
+       component_unbind_all(drm->dev, drm);
+err_crtc:
+       xlnx_crtc_helper_fini(drm, xlnx_drm->crtc);
+err_xlnx_drm:
+       drm_mode_config_cleanup(drm);
+err_drm:
+       drm_dev_unref(drm);
+       return ret;
+}
+
+static void xlnx_unbind(struct device *dev)
+{
+       struct xlnx_drm *xlnx_drm =3D dev_get_drvdata(dev);
+       struct drm_device *drm =3D xlnx_drm->drm;
+
+       drm_dev_unregister(drm);
+       if (xlnx_drm->fb)
+               xlnx_fb_fini(xlnx_drm->fb);
+       component_unbind_all(drm->dev, drm);
+       xlnx_crtc_helper_fini(drm, xlnx_drm->crtc);
+       drm_kms_helper_poll_fini(drm);
+       drm_mode_config_cleanup(drm);
+       drm_dev_unref(drm);
+}
+
+static const struct component_master_ops xlnx_master_ops =3D {
+       .bind   =3D xlnx_bind,
+       .unbind =3D xlnx_unbind,
+};
+
+static int xlnx_of_component_probe(struct device *dev,
+                                  int (*compare_of)(struct device *, void =
*),
+                                  const struct component_master_ops *m_ops=
)
+{
+       struct device_node *ep, *port, *remote, *parent;
+       struct component_match *match =3D NULL;
+       int i;
+
+       if (!dev->of_node)
+               return -EINVAL;
+
+       for (i =3D 0; ; i++) {
+               port =3D of_parse_phandle(dev->of_node, "ports", i);
+               if (!port)
+                       break;
+
+               parent =3D of_graph_get_port_parent(port);
+               if (!of_device_is_available(parent)) {
+                       of_node_put(port);
+                       continue;
+               }
+
+               component_match_add(dev, &match, compare_of, parent);
+               of_node_put(parent);
+               of_node_put(port);
+       }
+
+       if (i =3D=3D 0) {
+               dev_err(dev, "missing 'ports' property\n");
+               return -ENODEV;
+       }
+
+       if (!match) {
+               dev_err(dev, "no available port\n");
+               return -ENODEV;
+       }
+
+       for (i =3D 0; ; i++) {
+               port =3D of_parse_phandle(dev->of_node, "ports", i);
+               if (!port)
+                       break;
+
+               parent =3D of_graph_get_port_parent(port);
+               if (!of_device_is_available(parent)) {
+                       of_node_put(port);
+                       continue;
+               }
+
+               for_each_child_of_node(port, ep) {
+                       remote =3D of_graph_get_remote_port_parent(ep);
+                       if (!remote || !of_device_is_available(remote)) {
+                               of_node_put(remote);
+                               continue;
+                       } else if (!of_device_is_available(remote->parent))=
 {
+                               dev_warn(dev, "parent dev of %s unavailable=
\n",
+                                        remote->full_name);
+                               of_node_put(remote);
+                               continue;
+                       }
+                       component_match_add(dev, &match, compare_of, remote=
);
+                       of_node_put(remote);
+               }
+               of_node_put(port);
+       }
+
+       return component_master_add_with_match(dev, m_ops, match);
+}
+
+static int xlnx_compare_of(struct device *dev, void *data)
+{
+       return dev->of_node =3D=3D data;
+}
+
+static int xlnx_platform_probe(struct platform_device *pdev)
+{
+       return xlnx_of_component_probe(&pdev->dev, xlnx_compare_of,
+                                      &xlnx_master_ops);
+}
+
+static int xlnx_platform_remove(struct platform_device *pdev)
+{
+       component_master_del(&pdev->dev, &xlnx_master_ops);
+       return 0;
+}
+
+static void xlnx_platform_shutdown(struct platform_device *pdev)
+{
+       struct xlnx_drm *xlnx_drm =3D platform_get_drvdata(pdev);
+
+       drm_put_dev(xlnx_drm->drm);
+}
+
+static int __maybe_unused xlnx_pm_suspend(struct device *dev)
+{
+       struct xlnx_drm *xlnx_drm =3D dev_get_drvdata(dev);
+       struct drm_device *drm =3D xlnx_drm->drm;
+
+       drm_kms_helper_poll_disable(drm);
+
+       xlnx_drm->suspend_state =3D drm_atomic_helper_suspend(drm);
+       if (IS_ERR(xlnx_drm->suspend_state)) {
+               drm_kms_helper_poll_enable(drm);
+               return PTR_ERR(xlnx_drm->suspend_state);
+       }
+
+       return 0;
+}
+
+static int __maybe_unused xlnx_pm_resume(struct device *dev)
+{
+       struct xlnx_drm *xlnx_drm =3D dev_get_drvdata(dev);
+       struct drm_device *drm =3D xlnx_drm->drm;
+
+       drm_atomic_helper_resume(drm, xlnx_drm->suspend_state);
+       drm_kms_helper_poll_enable(drm);
+
+       return 0;
+}
+
+static const struct dev_pm_ops xlnx_pm_ops =3D {
+       SET_SYSTEM_SLEEP_PM_OPS(xlnx_pm_suspend, xlnx_pm_resume)
+};
+
+static const struct of_device_id xlnx_of_match[] =3D {
+       { .compatible =3D "xlnx,display", },
+       { /* end of table */ },
+};
+MODULE_DEVICE_TABLE(of, xlnx_of_match);
+
+static struct platform_driver xlnx_driver =3D {
+       .probe                  =3D xlnx_platform_probe,
+       .remove                 =3D xlnx_platform_remove,
+       .shutdown               =3D xlnx_platform_shutdown,
+       .driver                 =3D {
+               .name           =3D "xlnx-drm",
+               .pm             =3D &xlnx_pm_ops,
+               .of_match_table =3D xlnx_of_match,
+       },
+};
+
+module_platform_driver(xlnx_driver);
+
+MODULE_AUTHOR("Xilinx, Inc.");
+MODULE_DESCRIPTION("Xilinx DRM KMS Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/xlnx/xlnx_drv.h b/drivers/gpu/drm/xlnx/xlnx_dr=
v.h
new file mode 100644
index 0000000..8c320fd
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_drv.h
@@ -0,0 +1,30 @@
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
+uint32_t xlnx_get_format(struct drm_device *drm);
+unsigned int xlnx_get_align(struct drm_device *drm);
+struct xlnx_crtc_helper *xlnx_get_crtc_helper(struct drm_device *drm);
+struct xlnx_bridge_helper *xlnx_get_bridge_helper(struct drm_device *drm);
+
+#endif /* _XLNX_DRV_H_ */
diff --git a/drivers/gpu/drm/xlnx/xlnx_fb.c b/drivers/gpu/drm/xlnx/xlnx_fb.=
c
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
+#define XLNX_MAX_PLANES        4
+
+struct xlnx_fbdev {
+       struct drm_fb_helper fb_helper;
+       struct drm_framebuffer *fb;
+       unsigned int align;
+       unsigned int vres_mult;
+};
+
+static inline struct xlnx_fbdev *to_fbdev(struct drm_fb_helper *fb_helper)
+{
+       return container_of(fb_helper, struct xlnx_fbdev, fb_helper);
+}
+
+static struct drm_framebuffer_funcs xlnx_fb_funcs =3D {
+       .destroy        =3D drm_gem_fb_destroy,
+       .create_handle  =3D drm_gem_fb_create_handle,
+};
+
+static int
+xlnx_fb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
+{
+       struct drm_fb_helper *fb_helper =3D info->par;
+       unsigned int i;
+       int ret =3D 0;
+
+       switch (cmd) {
+       case FBIO_WAITFORVSYNC:
+               for (i =3D 0; i < fb_helper->crtc_count; i++) {
+                       struct drm_mode_set *mode_set;
+                       struct drm_crtc *crtc;
+
+                       mode_set =3D &fb_helper->crtc_info[i].mode_set;
+                       crtc =3D mode_set->crtc;
+                       ret =3D drm_crtc_vblank_get(crtc);
+                       if (!ret) {
+                               drm_crtc_wait_one_vblank(crtc);
+                               drm_crtc_vblank_put(crtc);
+                       }
+               }
+               return ret;
+       default:
+               return -ENOTTY;
+       }
+
+       return 0;
+}
+
+static struct fb_ops xlnx_fbdev_ops =3D {
+       .owner          =3D THIS_MODULE,
+       .fb_fillrect    =3D sys_fillrect,
+       .fb_copyarea    =3D sys_copyarea,
+       .fb_imageblit   =3D sys_imageblit,
+       .fb_check_var   =3D drm_fb_helper_check_var,
+       .fb_set_par     =3D drm_fb_helper_set_par,
+       .fb_blank       =3D drm_fb_helper_blank,
+       .fb_pan_display =3D drm_fb_helper_pan_display,
+       .fb_setcmap     =3D drm_fb_helper_setcmap,
+       .fb_ioctl       =3D xlnx_fb_ioctl,
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
+                            struct drm_fb_helper_surface_size *size)
+{
+       struct xlnx_fbdev *fbdev =3D to_fbdev(fb_helper);
+       struct drm_device *drm =3D fb_helper->dev;
+       struct drm_gem_cma_object *obj;
+       struct drm_framebuffer *fb;
+       unsigned int bytes_per_pixel;
+       unsigned long offset;
+       struct fb_info *fbi;
+       size_t bytes;
+       int ret;
+
+       dev_dbg(drm->dev, "surface width(%d), height(%d) and bpp(%d)\n",
+               size->surface_width, size->surface_height, size->surface_bp=
p);
+
+       size->surface_height *=3D fbdev->vres_mult;
+       bytes_per_pixel =3D DIV_ROUND_UP(size->surface_bpp, 8);
+       bytes =3D ALIGN(size->surface_width * bytes_per_pixel, fbdev->align=
);
+       bytes *=3D size->surface_height;
+
+       obj =3D drm_gem_cma_create(drm, bytes);
+       if (IS_ERR(obj))
+               return PTR_ERR(obj);
+
+       fbi =3D framebuffer_alloc(0, drm->dev);
+       if (!fbi) {
+               dev_err(drm->dev, "Failed to allocate framebuffer info.\n")=
;
+               ret =3D -ENOMEM;
+               goto err_drm_gem_cma_free_object;
+       }
+
+       fbdev->fb =3D drm_gem_fbdev_fb_create(drm, size, fbdev->align, &obj=
->base,
+                                           &xlnx_fb_funcs);
+       if (IS_ERR(fbdev->fb)) {
+               dev_err(drm->dev, "Failed to allocate DRM framebuffer.\n");
+               ret =3D PTR_ERR(fbdev->fb);
+               goto err_framebuffer_release;
+       }
+
+       fb =3D fbdev->fb;
+       fb_helper->fb =3D fb;
+       fb_helper->fbdev =3D fbi;
+       fbi->par =3D fb_helper;
+       fbi->flags =3D FBINFO_FLAG_DEFAULT;
+       fbi->fbops =3D &xlnx_fbdev_ops;
+
+       ret =3D fb_alloc_cmap(&fbi->cmap, 256, 0);
+       if (ret) {
+               dev_err(drm->dev, "Failed to allocate color map.\n");
+               goto err_fb_destroy;
+       }
+
+       drm_fb_helper_fill_fix(fbi, fb->pitches[0], fb->format->depth);
+       drm_fb_helper_fill_var(fbi, fb_helper, fb->width, fb->height);
+       fbi->var.yres =3D fb->height / fbdev->vres_mult;
+
+       offset =3D fbi->var.xoffset * bytes_per_pixel;
+       offset +=3D fbi->var.yoffset * fb->pitches[0];
+
+       drm->mode_config.fb_base =3D (resource_size_t)obj->paddr;
+       fbi->screen_base =3D (char __iomem *)(obj->vaddr + offset);
+       fbi->fix.smem_start =3D (unsigned long)(obj->paddr + offset);
+       fbi->screen_size =3D bytes;
+       fbi->fix.smem_len =3D bytes;
+
+       return 0;
+
+err_fb_destroy:
+       drm_framebuffer_unregister_private(fb);
+       drm_gem_fb_destroy(fb);
+err_framebuffer_release:
+       framebuffer_release(fbi);
+err_drm_gem_cma_free_object:
+       drm_gem_cma_free_object(&obj->base);
+       return ret;
+}
+
+static struct drm_fb_helper_funcs xlnx_fb_helper_funcs =3D {
+       .fb_probe =3D xlnx_fbdev_create,
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
+            unsigned int max_conn_count, unsigned int align,
+            unsigned int vres_mult)
+{
+       struct xlnx_fbdev *fbdev;
+       struct drm_fb_helper *fb_helper;
+       int ret;
+
+       fbdev =3D kzalloc(sizeof(*fbdev), GFP_KERNEL);
+       if (!fbdev)
+               return ERR_PTR(-ENOMEM);
+
+       fbdev->vres_mult =3D vres_mult;
+       fbdev->align =3D align;
+       fb_helper =3D &fbdev->fb_helper;
+       drm_fb_helper_prepare(drm, fb_helper, &xlnx_fb_helper_funcs);
+
+       ret =3D drm_fb_helper_init(drm, fb_helper, max_conn_count);
+       if (ret < 0) {
+               dev_err(drm->dev, "Failed to initialize drm fb helper.\n");
+               goto err_free;
+       }
+
+       ret =3D drm_fb_helper_single_add_all_connectors(fb_helper);
+       if (ret < 0) {
+               dev_err(drm->dev, "Failed to add connectors.\n");
+               goto err_drm_fb_helper_fini;
+       }
+
+       ret =3D drm_fb_helper_initial_config(fb_helper, preferred_bpp);
+       if (ret < 0) {
+               dev_err(drm->dev, "Failed to set initial hw configuration.\=
n");
+               goto err_drm_fb_helper_fini;
+       }
+
+       return fb_helper;
+
+err_drm_fb_helper_fini:
+       drm_fb_helper_fini(fb_helper);
+err_free:
+       kfree(fbdev);
+       return ERR_PTR(ret);
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
+       if (!fbi->fbdefio)
+               return;
+
+       fb_deferred_io_cleanup(fbi);
+       kfree(fbi->fbdefio);
+       kfree(fbi->fbops);
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
+       struct xlnx_fbdev *fbdev =3D to_fbdev(fb_helper);
+
+       drm_fb_helper_unregister_fbi(&fbdev->fb_helper);
+       if (fbdev->fb_helper.fbdev)
+               xlnx_fbdev_defio_fini(fbdev->fb_helper.fbdev);
+
+       if (fbdev->fb_helper.fb)
+               drm_framebuffer_remove(fbdev->fb_helper.fb);
+
+       drm_fb_helper_fini(&fbdev->fb_helper);
+       kfree(fbdev);
+}
+
+/**
+ * xlnx_fb_create - (struct drm_mode_config_funcs *)->fb_create callback
+ * @drm: DRM device
+ * @file_priv: drm file private data
+ * @mode_cmd: mode command for fb creation
+ *
+ * This functions creates a drm_framebuffer with xlnx_fb_funcs for given m=
ode
+ * @mode_cmd. This functions is intended to be used for the fb_create call=
back
+ * function of drm_mode_config_funcs.
+ *
+ * Return: a drm_framebuffer object if successful, or
+ * ERR_PTR from drm_gem_fb_create_with_funcs().
+ */
+struct drm_framebuffer *
+xlnx_fb_create(struct drm_device *drm, struct drm_file *file_priv,
+              const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+       return drm_gem_fb_create_with_funcs(drm, file_priv, mode_cmd,
+                                           &xlnx_fb_funcs);
+}
diff --git a/drivers/gpu/drm/xlnx/xlnx_fb.h b/drivers/gpu/drm/xlnx/xlnx_fb.=
h
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
+              const struct drm_mode_fb_cmd2 *mode_cmd);
+struct drm_fb_helper *
+xlnx_fb_init(struct drm_device *drm, int preferred_bpp,
+            unsigned int max_conn_count, unsigned int align,
+            unsigned int vres_mult);
+void xlnx_fb_fini(struct drm_fb_helper *fb_helper);
+
+#endif /* _XLNX_FB_H_ */
diff --git a/drivers/gpu/drm/xlnx/xlnx_gem.c b/drivers/gpu/drm/xlnx/xlnx_ge=
m.c
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
+int xlnx_gem_cma_dumb_create(struct drm_file *file_priv, struct drm_device=
 *drm,
+                            struct drm_mode_create_dumb *args)
+{
+       int pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
+       unsigned int align =3D xlnx_get_align(drm);
+
+       if (!args->pitch || !IS_ALIGNED(args->pitch, align))
+               args->pitch =3D ALIGN(pitch, align);
+
+       return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
+}
diff --git a/drivers/gpu/drm/xlnx/xlnx_gem.h b/drivers/gpu/drm/xlnx/xlnx_ge=
m.h
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
+                            struct drm_device *drm,
+                            struct drm_mode_create_dumb *args);
+
+#endif /* _XLNX_GEM_H_ */
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
