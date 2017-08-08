From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 3/9] clk: rockchip: fix up the indentation stuff for RV1108 SoC
Date: Tue,  8 Aug 2017 15:15:41 +0800
Message-ID: <1502176547-30817-4-git-send-email-zhangqing@rock-chips.com>
References: <1502176547-30817-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502176547-30817-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Make the code look better.

Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 include/dt-bindings/clock/rv1108-cru.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/dt-bindings/clock/rv1108-cru.h b/include/dt-bindings/clock/rv1108-cru.h
index e8aa6d56990a..f269d833e41a 100644
--- a/include/dt-bindings/clock/rv1108-cru.h
+++ b/include/dt-bindings/clock/rv1108-cru.h
@@ -173,16 +173,16 @@
 #define CLK_NR_CLKS			(HCLK_VPU + 1)
 
 /* reset id */
-#define SRST_CORE_PO_AD		0
+#define SRST_CORE_PO_AD			0
 #define SRST_CORE_AD			1
 #define SRST_L2_AD			2
-#define SRST_CPU_NIU_AD		3
+#define SRST_CPU_NIU_AD			3
 #define SRST_CORE_PO			4
 #define SRST_CORE			5
-#define SRST_L2			6
+#define SRST_L2				6
 #define SRST_CORE_DBG			8
 #define PRST_DBG			9
-#define RST_DAP			10
+#define RST_DAP				10
 #define PRST_DBG_NIU			11
 #define ARST_STRC_SYS_AD		15
 
@@ -249,9 +249,9 @@
 #define HRST_SYSBUS			75
 #define PRST_USBGRF			76
 
-#define ARST_PERIPH_NIU		80
-#define HRST_PERIPH_NIU		81
-#define PRST_PERIPH_NIU		82
+#define ARST_PERIPH_NIU			80
+#define HRST_PERIPH_NIU			81
+#define PRST_PERIPH_NIU			82
 #define HRST_PERIPH			83
 #define HRST_SDMMC			84
 #define HRST_SDIO			85
@@ -269,7 +269,7 @@
 #define HRST_HOST0_AUX			96
 #define HRST_HOST0_ARB			97
 #define SRST_HOST0_EHCIPHY		98
-#define SRST_HOST0_UTMI		99
+#define SRST_HOST0_UTMI			99
 #define SRST_USBPOR			100
 #define SRST_UTMI0			101
 #define SRST_UTMI1			102
@@ -316,21 +316,21 @@
 #define HRST_VPU_NIU			141
 #define ARST_VPU			142
 #define HRST_VPU			143
-#define ARST_RKVDEC_NIU		144
-#define HRST_RKVDEC_NIU		145
+#define ARST_RKVDEC_NIU			144
+#define HRST_RKVDEC_NIU			145
 #define ARST_RKVDEC			146
 #define HRST_RKVDEC			147
 #define SRST_RKVDEC_CABAC		148
 #define SRST_RKVDEC_CORE		149
-#define ARST_RKVENC_NIU		150
-#define HRST_RKVENC_NIU		151
+#define ARST_RKVENC_NIU			150
+#define HRST_RKVENC_NIU			151
 #define ARST_RKVENC			152
 #define HRST_RKVENC			153
 #define SRST_RKVENC_CORE		154
 
 #define SRST_DSP_CORE			156
 #define SRST_DSP_SYS			157
-#define SRST_DSP_GLOBAL		158
+#define SRST_DSP_GLOBAL			158
 #define SRST_DSP_OECM			159
 #define PRST_DSP_IOP_NIU		160
 #define ARST_DSP_EPP_NIU		161
@@ -348,7 +348,7 @@
 #define SRST_PMU_I2C0			173
 #define PRST_PMU_I2C0			174
 #define PRST_PMU_GPIO0			175
-#define PRST_PMU_INTMEM		176
+#define PRST_PMU_INTMEM			176
 #define PRST_PMU_PWM0			177
 #define SRST_PMU_PWM0			178
 #define PRST_PMU_GRF			179
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
