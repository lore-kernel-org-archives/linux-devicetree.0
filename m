From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 02/10] drm: xlnx: Add xlnx crtc of Xilinx DRM KMS
Date: Thu, 4 Jan 2018 18:05:51 -0800
Message-ID: <1515117959-18068-3-git-send-email-hyun.kwon@xilinx.com>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515117959-18068-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

xlnx_crtc is a part of Xilinx DRM KMS and a layer that
provides some interface between the Xilinx DRM KMS and
crtc drivers.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/xlnx/xlnx_crtc.c | 194 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_crtc.h |  70 ++++++++++++++
 2 files changed, 264 insertions(+)
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_crtc.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_crtc.h

diff --git a/drivers/gpu/drm/xlnx/xlnx_crtc.c b/drivers/gpu/drm/xlnx/xlnx_crtc.c
new file mode 100644
index 0000000..57ee939
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_crtc.c
@@ -0,0 +1,194 @@
+/*
+ * Xilinx DRM crtc driver
+ *
+ *  Copyright (C) 2017 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <drm/drmP.h>
+
+#include <linux/list.h>
+
+#include "xlnx_crtc.h"
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
+int xlnx_crtc_helper_enable_vblank(struct xlnx_crtc_helper *helper,
+				   unsigned int crtc_id)
+{
+	struct xlnx_crtc *crtc;
+
+	list_for_each_entry(crtc, &helper->xlnx_crtcs, list)
+		if (drm_crtc_index(&crtc->crtc) == crtc_id)
+			if (crtc->enable_vblank)
+				return crtc->enable_vblank(crtc);
+	return -ENODEV;
+}
+
+void xlnx_crtc_helper_disable_vblank(struct xlnx_crtc_helper *helper,
+				     unsigned int crtc_id)
+{
+	struct xlnx_crtc *crtc;
+
+	list_for_each_entry(crtc, &helper->xlnx_crtcs, list) {
+		if (drm_crtc_index(&crtc->crtc) == crtc_id) {
+			if (crtc->disable_vblank)
+				crtc->disable_vblank(crtc);
+			return;
+		}
+	}
+}
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
index 0000000..db7404e
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_crtc.h
@@ -0,0 +1,70 @@
+/*
+ * Xilinx DRM crtc header
+ *
+ *  Copyright (C) 2017 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0
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
+	struct drm_crtc crtc;
+	struct list_head list;
+	int (*enable_vblank)(struct xlnx_crtc *crtc);
+	void (*disable_vblank)(struct xlnx_crtc *crtc);
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
+int xlnx_crtc_helper_enable_vblank(struct xlnx_crtc_helper *helper,
+				   unsigned int crtc_id);
+void xlnx_crtc_helper_disable_vblank(struct xlnx_crtc_helper *helper,
+				     unsigned int crtc_id);
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
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
