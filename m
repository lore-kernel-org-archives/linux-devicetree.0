From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] dt-bindings: Add header for the ingenic-drm driver bindings
Date: Thu, 28 Feb 2019 19:07:55 -0300
Message-ID: <20190228220756.20262-3-paul@crapouillou.net>
References: <20190228220756.20262-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228220756.20262-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add macros that can be used with the ingenic,lcd-mode property in the
devicetree node that corresponds to the ingenic-drm driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 include/dt-bindings/display/ingenic,drm.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/display/ingenic,drm.h

diff --git a/include/dt-bindings/display/ingenic,drm.h b/include/dt-bindings/display/ingenic,drm.h
new file mode 100644
index 000000000000..20c5399366c1
--- /dev/null
+++ b/include/dt-bindings/display/ingenic,drm.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Ingenic JZ47xx KMS driver
+ *
+ *  Copyright (C) 2019, Paul Cercueil <paul@crapouillou.net>
+ */
+#ifndef __INCLUDE_DT_BINDINGS_DISPLAY_INGENIC_DRM_H__
+#define __INCLUDE_DT_BINDINGS_DISPLAY_INGENIC_DRM_H__
+
+#define JZ_DRM_LCD_GENERIC_16BIT		0
+#define JZ_DRM_LCD_GENERIC_18BIT		16
+
+#define JZ_DRM_LCD_SPECIAL_TFT_1		1
+#define JZ_DRM_LCD_SPECIAL_TFT_2		2
+#define JZ_DRM_LCD_SPECIAL_TFT_3		3
+
+#define JZ_DRM_LCD_NON_INTERLACED_TV_OUT	4
+#define JZ_DRM_LCD_INTERLACED_TV_OUT		6
+
+#define JZ_DRM_LCD_SINGLE_COLOR_STN		8
+#define JZ_DRM_LCD_SINGLE_MONOCHROME_STN	9
+#define JZ_DRM_LCD_DUAL_COLOR_STN		10
+#define JZ_DRM_LCD_DUAL_MONOCHROME_STN		11
+
+#define JZ_LCD_TYPE_8BIT_SERIAL			12
+#define JZ_LCD_TYPE_LCM				13
+
+#endif /* __INCLUDE_DT_BINDINGS_DISPLAY_INGENIC_DRM_H__ */
-- 
2.11.0
