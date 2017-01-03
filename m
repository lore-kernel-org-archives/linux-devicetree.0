From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3] soc: zte: Add header for PM domains specifiers
Date: Tue,  3 Jan 2017 17:15:11 +0800
Message-ID: <1483434911-29421-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds header with values used for zx96718
SoC's power domain driver.

Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/soc/zte,pm_domains.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/soc/zte,pm_domains.h

diff --git a/include/dt-bindings/soc/zte,pm_domains.h b/include/dt-bindings/soc/zte,pm_domains.h
new file mode 100644
index 0000000..a64cfb8
--- /dev/null
+++ b/include/dt-bindings/soc/zte,pm_domains.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2015 Linaro Ltd.
+ *
+ * Author: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+ * License terms: GNU General Public License (GPL) version 2
+ */
+#ifndef _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H
+#define _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H
+
+#define DM_ZX296718_SAPPU	0
+#define DM_ZX296718_VDE		1  /* g1v6 */
+#define DM_ZX296718_VCE		2  /* h1v6 */
+#define DM_ZX296718_HDE		3  /* g2v2 */
+#define DM_ZX296718_VIU		4
+#define DM_ZX296718_USB20	5
+#define DM_ZX296718_USB21	6
+#define DM_ZX296718_USB30	7
+#define DM_ZX296718_HSIC	8
+#define DM_ZX296718_GMAC	9
+#define DM_ZX296718_TS		10
+#define DM_ZX296718_VOU		11
+
+#endif /* _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
