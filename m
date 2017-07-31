From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 01/14] clk: rockchip: add more clk ids for rv1108
Date: Mon, 31 Jul 2017 18:06:42 +0800
Message-ID: <1501495602-21351-1-git-send-email-andy.yan@rock-chips.com>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501495449-21290-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Added the missing clock ids, make the clock more complete.

Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

 include/dt-bindings/clock/rv1108-cru.h | 128 ++++++++++++++++++++++++++++-----
 1 file changed, 109 insertions(+), 19 deletions(-)

diff --git a/include/dt-bindings/clock/rv1108-cru.h b/include/dt-bindings/clock/rv1108-cru.h
index ae26f81..e284b1e 100644
--- a/include/dt-bindings/clock/rv1108-cru.h
+++ b/include/dt-bindings/clock/rv1108-cru.h
@@ -43,12 +43,73 @@
 #define SCLK_SDMMC_SAMPLE		84
 #define SCLK_SDIO_SAMPLE		85
 #define SCLK_EMMC_SAMPLE		86
+#define SCLK_VENC_CORE			87
+#define SCLK_HEVC_CORE			88
+#define SCLK_HEVC_CABAC			89
+#define SCLK_PWM0_PMU			90
+#define SCLK_I2C0_PMU			91
+#define SCLK_WIFI			92
+#define SCLK_CIFOUT			93
+#define SCLK_MIPI_CSI_OUT		94
+#define SCLK_CIF0			95
+#define SCLK_CIF1			96
+#define SCLK_CIF2			97
+#define SCLK_CIF3			98
+#define SCLK_DSP			99
+#define SCLK_DSP_IOP			100
+#define SCLK_DSP_EPP			101
+#define SCLK_DSP_EDP			102
+#define SCLK_DSP_EDAP			103
+#define SCLK_CVBS_HOST			104
+#define SCLK_HDMI_SFR			105
+#define SCLK_HDMI_CEC			106
+#define SCLK_CRYPTO			107
+#define SCLK_SPI			108
+#define SCLK_SARADC			109
+#define SCLK_TSADC			110
+#define SCLK_MACPHY_PRE			111
+#define SCLK_MACPHY			112
+#define SCLK_MACPHY_RX			113
+#define SCLK_MAC_REF			114
+#define SCLK_MAC_REFOUT			115
+#define SCLK_DSP_PFM			116
+#define SCLK_RGA			117
+#define SCLK_I2C1			118
+#define SCLK_I2C2			119
+#define SCLK_I2C3			120
+#define SCLK_PWM1			121
+#define SCLK_ISP			122
+#define SCLK_USBPHY			123
+#define SCLK_I2S0_SRC			124
+#define SCLK_I2S1_SRC			125
+#define SCLK_I2S2_SRC			126
+#define SCLK_UART0_SRC			127
+#define SCLK_UART1_SRC			128
+#define SCLK_UART2_SRC			129
+
+#define DCLK_VOP_SRC			185
+#define DCLK_HDMIPHY			186
+#define DCLK_VOP			187
 
 /* aclk gates */
 #define ACLK_DMAC			192
-#define ACLK_PRE			193
+#define ACLK_BUS			193
 #define ACLK_CORE			194
 #define ACLK_ENMCORE			195
+#define ACLK_RKVENC			196
+#define ACLK_RKVDEC			197
+#define ACLK_VPU			198
+#define ACLK_CIF0			199
+#define ACLK_VIO0			200
+#define ACLK_VIO1			201
+#define ACLK_VOP			202
+#define ACLK_IEP			203
+#define ACLK_RGA			204
+#define ACLK_ISP			205
+#define ACLK_CIF1			206
+#define ACLK_CIF2			207
+#define ACLK_CIF3			208
+#define ACLK_PERI			209
 
 /* pclk gates */
 #define PCLK_GPIO1			256
@@ -59,18 +120,30 @@
 #define PCLK_I2C2			261
 #define PCLK_I2C3			262
 #define PCLK_SPI			263
-#define PCLK_SFC			264
 #define PCLK_UART0			265
 #define PCLK_UART1			266
 #define PCLK_UART2			267
 #define PCLK_TSADC			268
-#define PCLK_PWM			269
+#define PCLK_PWM1			269
 #define PCLK_TIMER			270
 #define PCLK_PERI			271
+#define PCLK_GPIO0_PMU			272
+#define PCLK_I2C0_PMU			273
+#define PCLK_PWM0_PMU			274
+#define PCLK_ISP			275
+#define PCLK_VIO			276
+#define PCLK_MIPI_DSI			277
+#define PCLK_HDMI_CTRL			278
+#define PCLK_SARADC			279
+#define PCLK_DSP_CFG			280
+#define PCLK_BUS			281
+#define PCLK_EFUSE0			282
+#define PCLK_EFUSE1			283
+#define PCLK_WDT			284
 
 /* hclk gates */
 #define HCLK_I2S0_8CH			320
-#define HCLK_I2S1_8CH			321
+#define HCLK_I2S1_2CH			321
 #define HCLK_I2S2_2CH			322
 #define HCLK_NANDC			323
 #define HCLK_SDMMC			324
@@ -78,20 +151,37 @@
 #define HCLK_EMMC			326
 #define HCLK_PERI			327
 #define HCLK_SFC			328
+#define HCLK_RKVENC			329
+#define HCLK_RKVDEC			330
+#define HCLK_CIF0			331
+#define HCLK_VIO			332
+#define HCLK_VOP			333
+#define HCLK_IEP			334
+#define HCLK_RGA			335
+#define HCLK_ISP			336
+#define HCLK_CRYPTO_MST			337
+#define HCLK_CRYPTO_SLV			338
+#define HCLK_HOST0			339
+#define HCLK_OTG			340
+#define HCLK_CIF1			341
+#define HCLK_CIF2			342
+#define HCLK_CIF3			343
+#define HCLK_BUS			344
+#define HCLK_VPU			345
 
-#define CLK_NR_CLKS			(HCLK_SFC + 1)
+#define CLK_NR_CLKS			(HCLK_VPU + 1)
 
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
 
@@ -158,9 +248,9 @@
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
@@ -178,7 +268,7 @@
 #define HRST_HOST0_AUX			96
 #define HRST_HOST0_ARB			97
 #define SRST_HOST0_EHCIPHY		98
-#define SRST_HOST0_UTMI		99
+#define SRST_HOST0_UTMI			99
 #define SRST_USBPOR			100
 #define SRST_UTMI0			101
 #define SRST_UTMI1			102
@@ -225,21 +315,21 @@
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
@@ -257,7 +347,7 @@
 #define SRST_PMU_I2C0			173
 #define PRST_PMU_I2C0			174
 #define PRST_PMU_GPIO0			175
-#define PRST_PMU_INTMEM		176
+#define PRST_PMU_INTMEM			176
 #define PRST_PMU_PWM0			177
 #define SRST_PMU_PWM0			178
 #define PRST_PMU_GRF			179
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
