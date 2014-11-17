From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 06/11] ARM: STi: DT: STiH410: Add defines for STiH410 DT clocks
Date: Mon, 17 Nov 2014 16:47:59 +0000
Message-ID: <1416242884-5261-7-git-send-email-peter.griffin@linaro.org>
References: <1416242884-5261-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416242884-5261-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Although most clock outputs are the same as stih407 SoC, stih410
also has some additional new clock outputs.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/clock/stih410-clks.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/clock/stih410-clks.h

diff --git a/include/dt-bindings/clock/stih410-clks.h b/include/dt-bindings/clock/stih410-clks.h
new file mode 100644
index 0000000..2097a4b
--- /dev/null
+++ b/include/dt-bindings/clock/stih410-clks.h
@@ -0,0 +1,25 @@
+/*
+ * This header provides constants clk index STMicroelectronics
+ * STiH410 SoC.
+ */
+#ifndef _DT_BINDINGS_CLK_STIH410
+#define _DT_BINDINGS_CLK_STIH410
+
+#include "stih407-clks.h"
+
+/* STiH410 introduces new clock outputs compared to STiH407 */
+
+/* CLOCKGEN C0 */
+#define CLK_TX_ICN_HADES	32
+#define CLK_RX_ICN_HADES	33
+#define CLK_ICN_REG_16		34
+#define CLK_PP_HADES		35
+#define CLK_CLUST_HADES		36
+#define CLK_HWPE_HADES		37
+#define CLK_FC_HADES		38
+
+/* CLOCKGEN D0 */
+#define CLK_PCMR10_MASTER	4
+#define CLK_USB2_PHY		5
+
+#endif
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
