From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 04/20] mmc: mmci: Move signal directions bits into DT include file
Date: Fri, 21 Mar 2014 13:14:01 +0100
Message-ID: <1395404057-27835-5-git-send-email-ulf.hansson@linaro.org>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395404057-27835-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These bits is currently used from platform data, but will be needed
from DT as well, so let's make them available.

Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/mmc/mmci.h |   21 +++++++++++++++++++++
 include/linux/amba/mmci.h      |   14 +-------------
 2 files changed, 22 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/mmc/mmci.h

diff --git a/include/dt-bindings/mmc/mmci.h b/include/dt-bindings/mmc/mmci.h
new file mode 100644
index 0000000..8c55254
--- /dev/null
+++ b/include/dt-bindings/mmc/mmci.h
@@ -0,0 +1,21 @@
+/*
+ * This header provides constants for the mmci bindings.
+ *
+ */
+
+#ifndef _DT_BINDINGS_MMC_MMCI_H
+#define _DT_BINDINGS_MMC_MMCI_H
+
+/*
+ * Bus signal direction bits.
+ * The ST Micro version does not have ROD and reuse the voltage registers
+ * for direction settings.
+ */
+#define MCI_ST_DATA2DIREN	(1 << 2)
+#define MCI_ST_CMDDIREN		(1 << 3)
+#define MCI_ST_DATA0DIREN	(1 << 4)
+#define MCI_ST_DATA31DIREN	(1 << 5)
+#define MCI_ST_FBCLKEN		(1 << 7)
+#define MCI_ST_DATA74DIREN	(1 << 8)
+
+#endif
diff --git a/include/linux/amba/mmci.h b/include/linux/amba/mmci.h
index 32a89cf..47ff176 100644
--- a/include/linux/amba/mmci.h
+++ b/include/linux/amba/mmci.h
@@ -5,19 +5,7 @@
 #define AMBA_MMCI_H
 
 #include <linux/mmc/host.h>
-
-
-/*
- * These defines is places here due to access is needed from machine
- * configuration files. The ST Micro version does not have ROD and
- * reuse the voltage registers for direction settings.
- */
-#define MCI_ST_DATA2DIREN	(1 << 2)
-#define MCI_ST_CMDDIREN		(1 << 3)
-#define MCI_ST_DATA0DIREN	(1 << 4)
-#define MCI_ST_DATA31DIREN	(1 << 5)
-#define MCI_ST_FBCLKEN		(1 << 7)
-#define MCI_ST_DATA74DIREN	(1 << 8)
+#include <dt-bindings/mmc/mmci.h>
 
 /* Just some dummy forwarding */
 struct dma_chan;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
