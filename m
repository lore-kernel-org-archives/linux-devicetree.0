From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 3/4] soc: mediatek: Add MT2701 power dt-bindings
Date: Wed, 20 Jan 2016 14:08:16 +0800
Message-ID: <1453270097-53853-4-git-send-email-jamesjj.liao@mediatek.com>
References: <1453270097-53853-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453270097-53853-1-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add power dt-bindings for MT2701.

Signed-off-by: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  6 +++--
 include/dt-bindings/power/mt2701-power.h           | 27 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/power/mt2701-power.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index a6c8afc..807d87f 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -9,10 +9,12 @@ domain control.
 
 The driver implements the Generic PM domain bindings described in
 power/power_domain.txt. It provides the power domains defined in
-include/dt-bindings/power/mt8173-power.h.
+include/dt-bindings/power/mt8173-power.h and mt2701-power.h.
 
 Required properties:
-- compatible: Must be "mediatek,mt8173-scpsys"
+- compatible: Should be:
+	- "mediatek,mt8173-scpsys"
+	- "mediatek,mt2701-scpsys"
 - #power-domain-cells: Must be 1
 - reg: Address range of the SCPSYS unit
 - infracfg: must contain a phandle to the infracfg controller
diff --git a/include/dt-bindings/power/mt2701-power.h b/include/dt-bindings/power/mt2701-power.h
new file mode 100644
index 0000000..64cc826
--- /dev/null
+++ b/include/dt-bindings/power/mt2701-power.h
@@ -0,0 +1,27 @@
+/*
+ * Copyright (C) 2015 MediaTek Inc.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT2701_POWER_H
+#define _DT_BINDINGS_POWER_MT2701_POWER_H
+
+#define MT2701_POWER_DOMAIN_CONN	0
+#define MT2701_POWER_DOMAIN_DISP	1
+#define MT2701_POWER_DOMAIN_MFG		2
+#define MT2701_POWER_DOMAIN_VDEC	3
+#define MT2701_POWER_DOMAIN_ISP		4
+#define MT2701_POWER_DOMAIN_BDP		5
+#define MT2701_POWER_DOMAIN_ETH		6
+#define MT2701_POWER_DOMAIN_HIF		7
+#define MT2701_POWER_DOMAIN_IFR_MSC	8
+
+#endif /* _DT_BINDINGS_POWER_MT2701_POWER_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
