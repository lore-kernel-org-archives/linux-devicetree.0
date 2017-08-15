From: <weiyi.lu@mediatek.com>
Subject: [PATCH v1 5/9] dt-bindings: soc: add MT2712 power dt-bindings
Date: Tue, 15 Aug 2017 14:42:46 +0800
Message-ID: <1502779370-30150-6-git-send-email-weiyi.lu@mediatek.com>
References: <1502779370-30150-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1502779370-30150-1-git-send-email-weiyi.lu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Weiyi Lu <weiyi.lu@mediatek.com>

Add power dt-bindings for MT2712.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  3 +++
 include/dt-bindings/power/mt2712-power.h           | 26 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 include/dt-bindings/power/mt2712-power.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index b1d165b..031aa19 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -12,10 +12,12 @@ power/power_domain.txt. It provides the power domains defined in
 - include/dt-bindings/power/mt8173-power.h
 - include/dt-bindings/power/mt6797-power.h
 - include/dt-bindings/power/mt2701-power.h
+- include/dt-bindings/power/mt2712-power.h
 
 Required properties:
 - compatible: Should be one of:
 	- "mediatek,mt2701-scpsys"
+	- "mediatek,mt2712-scpsys"
 	- "mediatek,mt6797-scpsys"
 	- "mediatek,mt8173-scpsys"
 - #power-domain-cells: Must be 1
@@ -25,6 +27,7 @@ Required properties:
                       These are clocks which hardware needs to be
                       enabled before enabling certain power domains.
 	Required clocks for MT2701: "mm", "mfg", "ethif"
+	Required clocks for MT2712: "mm", "mfg", "venc", "jpgdec", "audio", "vdec"
 	Required clocks for MT6797: "mm", "mfg", "vdec"
 	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
 
diff --git a/include/dt-bindings/power/mt2712-power.h b/include/dt-bindings/power/mt2712-power.h
new file mode 100644
index 0000000..92b46d7
--- /dev/null
+++ b/include/dt-bindings/power/mt2712-power.h
@@ -0,0 +1,26 @@
+/*
+ * Copyright (C) 2017 MediaTek Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ * See http://www.gnu.org/licenses/gpl-2.0.html for more details.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT2712_POWER_H
+#define _DT_BINDINGS_POWER_MT2712_POWER_H
+
+#define MT2712_POWER_DOMAIN_MM		0
+#define MT2712_POWER_DOMAIN_VDEC	1
+#define MT2712_POWER_DOMAIN_VENC	2
+#define MT2712_POWER_DOMAIN_ISP		3
+#define MT2712_POWER_DOMAIN_AUDIO	4
+#define MT2712_POWER_DOMAIN_USB		5
+#define MT2712_POWER_DOMAIN_USB2	6
+#define MT2712_POWER_DOMAIN_MFG		7
+
+#endif /* _DT_BINDINGS_POWER_MT2712_POWER_H */
-- 
1.9.1
