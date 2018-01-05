From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 04/10] drm: xlnx: Add xlnx gem of Xilinx DRM KMS
Date: Thu, 4 Jan 2018 18:05:53 -0800
Message-ID: <1515117959-18068-5-git-send-email-hyun.kwon@xilinx.com>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515117959-18068-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Implement a simple wrapper around drm_gem_cma_dumb_create_internal()
for alignment.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/xlnx/xlnx_gem.c | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/xlnx_gem.h | 18 ++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_gem.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_gem.h

diff --git a/drivers/gpu/drm/xlnx/xlnx_gem.c b/drivers/gpu/drm/xlnx/xlnx_gem.c
new file mode 100644
index 0000000..af1abdc
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_gem.c
@@ -0,0 +1,38 @@
+/*
+ * Xilinx DRM KMS GEM helper
+ *
+ *  Copyright (C) 2015 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_gem_cma_helper.h>
+
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
index 0000000..bed8ff9
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/xlnx_gem.h
@@ -0,0 +1,18 @@
+/*
+ * Xilinx DRM KMS GEM helper header
+ *
+ *  Copyright (C) 2015 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0
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
