From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/8] dt: bindings: ux500: Add header for PM domains specifiers
Date: Tue, 14 Oct 2014 11:12:55 +0200
Message-ID: <1413277981-27451-3-git-send-email-ulf.hansson@linaro.org>
References: <1413277981-27451-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413277981-27451-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jinkun Hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/arm/ux500_pm_domains.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/dt-bindings/arm/ux500_pm_domains.h

diff --git a/include/dt-bindings/arm/ux500_pm_domains.h b/include/dt-bindings/arm/ux500_pm_domains.h
new file mode 100644
index 0000000..398a6c0
--- /dev/null
+++ b/include/dt-bindings/arm/ux500_pm_domains.h
@@ -0,0 +1,15 @@
+/*
+ * Copyright (C) 2014 Linaro Ltd.
+ *
+ * Author: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+ * License terms: GNU General Public License (GPL) version 2
+ */
+#ifndef _DT_BINDINGS_ARM_UX500_PM_DOMAINS_H
+#define _DT_BINDINGS_ARM_UX500_PM_DOMAINS_H
+
+#define DOMAIN_VAPE		0
+
+/* Number of PM domains. */
+#define NR_DOMAINS		(DOMAIN_VAPE + 1)
+
+#endif
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
