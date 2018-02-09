From: Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 1/2] dt-bindings: clocks: add APB RTC gate for SC9860
Date: Fri,  9 Feb 2018 17:48:10 +0800
Message-ID: <1518169691-14870-1-git-send-email-zhang.lyra@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>

Added index of RTC gate clocks which are used by some devices on aon
area of SC9860, for example the Watchdog timer.

Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
 include/dt-bindings/clock/sprd,sc9860-clk.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/sprd,sc9860-clk.h b/include/dt-bindings/clock/sprd,sc9860-clk.h
index 4cb202f..f2ab463 100644
--- a/include/dt-bindings/clock/sprd,sc9860-clk.h
+++ b/include/dt-bindings/clock/sprd,sc9860-clk.h
@@ -229,7 +229,26 @@
 #define	CLK_SDIO1_2X_EN		65
 #define	CLK_SDIO2_2X_EN		66
 #define	CLK_EMMC_2X_EN		67
-#define CLK_AON_GATE_NUM	(CLK_EMMC_2X_EN + 1)
+#define	CLK_ARCH_RTC_EB		68
+#define	CLK_KPB_RTC_EB		69
+#define	CLK_AON_SYST_RTC_EB	70
+#define	CLK_AP_SYST_RTC_EB	71
+#define	CLK_AON_TMR_RTC_EB	72
+#define	CLK_AP_TMR0_RTC_EB	73
+#define	CLK_EIC_RTC_EB		74
+#define	CLK_EIC_RTCDV5_EB	75
+#define	CLK_AP_WDG_RTC_EB	76
+#define	CLK_AP_TMR1_RTC_EB	77
+#define	CLK_AP_TMR2_RTC_EB	78
+#define	CLK_DCXO_TMR_RTC_EB	79
+#define	CLK_BB_CAL_RTC_EB	80
+#define	CLK_AVS_BIG_RTC_EB	81
+#define	CLK_AVS_LIT_RTC_EB	82
+#define	CLK_AVS_GPU0_RTC_EB	83
+#define	CLK_AVS_GPU1_RTC_EB	84
+#define	CLK_GPU_TS_EB		85
+#define	CLK_RTCDV10_EB		86
+#define	CLK_AON_GATE_NUM	(CLK_RTCDV10_EB + 1)
 
 #define	CLK_LIT_MCU		0
 #define	CLK_BIG_MCU		1
-- 
2.7.4
