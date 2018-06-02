Return-Path: <SRS0=aeXI=IU=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dt-bindings: clock: imx6ul: Do not change the clock definition order
Date: Sat,  2 Jun 2018 11:02:02 -0300
Message-Id: <1527948122-32092-1-git-send-email-festevam@gmail.com>
To: sboyd@kernel.org
Cc: michael@amarulasolutions.com, stefan.wahren@i2se.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, anson.huang@nxp.com, stefan@agner.ch, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

Commit f5a4670de966 ("clk: imx: Add new clo01 and clo2 controlled
by CCOSR") introduced the CLK_CLKO definitions, but didn't put them
at the end of the list, which may cause dtb breakage when running an old
dtb with a newer kernel.

In order to avoid that, simply add the new CLK_CKO clock definitions
at the end of the list.

Fixes: f5a4670de966 ("clk: imx: Add new clo01 and clo2 controlled by CCOSR")
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Use 12 char for the commit id

 include/dt-bindings/clock/imx6ul-clock.h | 40 +++++++++++++++-----------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/include/dt-bindings/clock/imx6ul-clock.h b/include/dt-bindings/clock/imx6ul-clock.h
index 9564597..0aa1d9c 100644
--- a/include/dt-bindings/clock/imx6ul-clock.h
+++ b/include/dt-bindings/clock/imx6ul-clock.h
@@ -235,27 +235,25 @@
 #define IMX6UL_CLK_CSI_PODF		222
 #define IMX6UL_CLK_PLL3_120M		223
 #define IMX6UL_CLK_KPP			224
-#define IMX6UL_CLK_CKO1_SEL		225
-#define IMX6UL_CLK_CKO1_PODF		226
-#define IMX6UL_CLK_CKO1			227
-#define IMX6UL_CLK_CKO2_SEL		228
-#define IMX6UL_CLK_CKO2_PODF		229
-#define IMX6UL_CLK_CKO2			230
-#define IMX6UL_CLK_CKO			231
-
-/* For i.MX6ULL */
-#define IMX6ULL_CLK_ESAI_PRED		232
-#define IMX6ULL_CLK_ESAI_PODF		233
-#define IMX6ULL_CLK_ESAI_EXTAL		234
-#define IMX6ULL_CLK_ESAI_MEM		235
-#define IMX6ULL_CLK_ESAI_IPG		236
-#define IMX6ULL_CLK_DCP_CLK		237
-#define IMX6ULL_CLK_EPDC_PRE_SEL	238
-#define IMX6ULL_CLK_EPDC_SEL		239
-#define IMX6ULL_CLK_EPDC_PODF		240
-#define IMX6ULL_CLK_EPDC_ACLK		241
-#define IMX6ULL_CLK_EPDC_PIX		242
-#define IMX6ULL_CLK_ESAI_SEL		243
+#define IMX6ULL_CLK_ESAI_PRED		225
+#define IMX6ULL_CLK_ESAI_PODF		226
+#define IMX6ULL_CLK_ESAI_EXTAL		227
+#define IMX6ULL_CLK_ESAI_MEM		228
+#define IMX6ULL_CLK_ESAI_IPG		229
+#define IMX6ULL_CLK_DCP_CLK		230
+#define IMX6ULL_CLK_EPDC_PRE_SEL	231
+#define IMX6ULL_CLK_EPDC_SEL		232
+#define IMX6ULL_CLK_EPDC_PODF		233
+#define IMX6ULL_CLK_EPDC_ACLK		234
+#define IMX6ULL_CLK_EPDC_PIX		235
+#define IMX6ULL_CLK_ESAI_SEL		236
+#define IMX6UL_CLK_CKO1_SEL		237
+#define IMX6UL_CLK_CKO1_PODF		238
+#define IMX6UL_CLK_CKO1			239
+#define IMX6UL_CLK_CKO2_SEL		240
+#define IMX6UL_CLK_CKO2_PODF		241
+#define IMX6UL_CLK_CKO2			242
+#define IMX6UL_CLK_CKO			243
 #define IMX6UL_CLK_END			244
 
 #endif /* __DT_BINDINGS_CLOCK_IMX6UL_H */
-- 
2.7.4
