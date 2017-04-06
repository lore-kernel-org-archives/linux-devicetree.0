From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/4] drm: zte: move CSC register definitions into a common header
Date: Thu,  6 Apr 2017 23:01:08 +0800
Message-ID: <1491490870-6330-3-git-send-email-shawnguo@kernel.org>
References: <1491490870-6330-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491490870-6330-1-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Xin Zhou <zhou.xin8-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The CSC (Color Space Conversion) block in VOU is used by not only
Graphic Layer (plane) but also channel (CRTC) module.  Let's move
its register definitions into a common header, so that CRTC driver can
include it when needed.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/zte/zx_common_regs.h | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/zte/zx_plane.c       |  1 +
 drivers/gpu/drm/zte/zx_plane_regs.h  | 18 ------------------
 3 files changed, 32 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/zte/zx_common_regs.h

diff --git a/drivers/gpu/drm/zte/zx_common_regs.h b/drivers/gpu/drm/zte/zx_common_regs.h
new file mode 100644
index 000000000000..2afd80664c51
--- /dev/null
+++ b/drivers/gpu/drm/zte/zx_common_regs.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright (C) 2017 Sanechips Technology Co., Ltd.
+ * Copyright 2017 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ZX_COMMON_REGS_H__
+#define __ZX_COMMON_REGS_H__
+
+/* CSC registers */
+#define CSC_CTRL0			0x30
+#define CSC_COV_MODE_SHIFT		16
+#define CSC_COV_MODE_MASK		(0xffff << CSC_COV_MODE_SHIFT)
+#define CSC_BT601_IMAGE_RGB2YCBCR	0
+#define CSC_BT601_IMAGE_YCBCR2RGB	1
+#define CSC_BT601_VIDEO_RGB2YCBCR	2
+#define CSC_BT601_VIDEO_YCBCR2RGB	3
+#define CSC_BT709_IMAGE_RGB2YCBCR	4
+#define CSC_BT709_IMAGE_YCBCR2RGB	5
+#define CSC_BT709_VIDEO_RGB2YCBCR	6
+#define CSC_BT709_VIDEO_YCBCR2RGB	7
+#define CSC_BT2020_IMAGE_RGB2YCBCR	8
+#define CSC_BT2020_IMAGE_YCBCR2RGB	9
+#define CSC_BT2020_VIDEO_RGB2YCBCR	10
+#define CSC_BT2020_VIDEO_YCBCR2RGB	11
+#define CSC_WORK_ENABLE			BIT(0)
+
+#endif /* __ZX_COMMON_REGS_H__ */
diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
index d646ac931663..4a6252720c10 100644
--- a/drivers/gpu/drm/zte/zx_plane.c
+++ b/drivers/gpu/drm/zte/zx_plane.c
@@ -16,6 +16,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drmP.h>
 
+#include "zx_common_regs.h"
 #include "zx_drm_drv.h"
 #include "zx_plane.h"
 #include "zx_plane_regs.h"
diff --git a/drivers/gpu/drm/zte/zx_plane_regs.h b/drivers/gpu/drm/zte/zx_plane_regs.h
index 65f271aeabed..9c655f59f9f7 100644
--- a/drivers/gpu/drm/zte/zx_plane_regs.h
+++ b/drivers/gpu/drm/zte/zx_plane_regs.h
@@ -77,24 +77,6 @@
 #define LUMA_STRIDE(x)	 (((x) << LUMA_STRIDE_SHIFT) & LUMA_STRIDE_MASK)
 #define CHROMA_STRIDE(x) (((x) << CHROMA_STRIDE_SHIFT) & CHROMA_STRIDE_MASK)
 
-/* CSC registers */
-#define CSC_CTRL0			0x30
-#define CSC_COV_MODE_SHIFT		16
-#define CSC_COV_MODE_MASK		(0xffff << CSC_COV_MODE_SHIFT)
-#define CSC_BT601_IMAGE_RGB2YCBCR	0
-#define CSC_BT601_IMAGE_YCBCR2RGB	1
-#define CSC_BT601_VIDEO_RGB2YCBCR	2
-#define CSC_BT601_VIDEO_YCBCR2RGB	3
-#define CSC_BT709_IMAGE_RGB2YCBCR	4
-#define CSC_BT709_IMAGE_YCBCR2RGB	5
-#define CSC_BT709_VIDEO_RGB2YCBCR	6
-#define CSC_BT709_VIDEO_YCBCR2RGB	7
-#define CSC_BT2020_IMAGE_RGB2YCBCR	8
-#define CSC_BT2020_IMAGE_YCBCR2RGB	9
-#define CSC_BT2020_VIDEO_RGB2YCBCR	10
-#define CSC_BT2020_VIDEO_YCBCR2RGB	11
-#define CSC_WORK_ENABLE			BIT(0)
-
 /* RSZ registers */
 #define RSZ_SRC_CFG			0x00
 #define RSZ_DEST_CFG			0x04
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
