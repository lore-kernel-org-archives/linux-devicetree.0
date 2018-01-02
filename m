From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 05/15] dt-bindings: clock: Add jz4770-cgu.h header
Date: Tue,  2 Jan 2018 16:08:38 +0100
Message-ID: <20180102150848.11314-5-paul@crapouillou.net>
References: <20180102150848.11314-1-paul@crapouillou.net>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20180102150848.11314-1-paul@crapouillou.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This will be used from the devicetree bindings to specify the clocks
that should be obtained from the jz4770-cgu driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
---
 include/dt-bindings/clock/jz4770-cgu.h | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 include/dt-bindings/clock/jz4770-cgu.h

 v3: New patch in this series
 v4: No change
 v5: Use SPDX license identifier

diff --git a/include/dt-bindings/clock/jz4770-cgu.h b/include/dt-bindings/clock/jz4770-cgu.h
new file mode 100644
index 000000000000..d68a7695a1f8
--- /dev/null
+++ b/include/dt-bindings/clock/jz4770-cgu.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides clock numbers for the ingenic,jz4770-cgu DT binding.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_JZ4770_CGU_H__
+#define __DT_BINDINGS_CLOCK_JZ4770_CGU_H__
+
+#define JZ4770_CLK_EXT		0
+#define JZ4770_CLK_OSC32K	1
+#define JZ4770_CLK_PLL0		2
+#define JZ4770_CLK_PLL1		3
+#define JZ4770_CLK_CCLK		4
+#define JZ4770_CLK_H0CLK	5
+#define JZ4770_CLK_H1CLK	6
+#define JZ4770_CLK_H2CLK	7
+#define JZ4770_CLK_C1CLK	8
+#define JZ4770_CLK_PCLK		9
+#define JZ4770_CLK_MMC0_MUX	10
+#define JZ4770_CLK_MMC0		11
+#define JZ4770_CLK_MMC1_MUX	12
+#define JZ4770_CLK_MMC1		13
+#define JZ4770_CLK_MMC2_MUX	14
+#define JZ4770_CLK_MMC2		15
+#define JZ4770_CLK_CIM		16
+#define JZ4770_CLK_UHC		17
+#define JZ4770_CLK_GPU		18
+#define JZ4770_CLK_BCH		19
+#define JZ4770_CLK_LPCLK_MUX	20
+#define JZ4770_CLK_GPS		21
+#define JZ4770_CLK_SSI_MUX	22
+#define JZ4770_CLK_PCM_MUX	23
+#define JZ4770_CLK_I2S		24
+#define JZ4770_CLK_OTG		25
+#define JZ4770_CLK_SSI0		26
+#define JZ4770_CLK_SSI1		27
+#define JZ4770_CLK_SSI2		28
+#define JZ4770_CLK_PCM0		29
+#define JZ4770_CLK_PCM1		30
+#define JZ4770_CLK_DMA		31
+#define JZ4770_CLK_I2C0		32
+#define JZ4770_CLK_I2C1		33
+#define JZ4770_CLK_I2C2		34
+#define JZ4770_CLK_UART0	35
+#define JZ4770_CLK_UART1	36
+#define JZ4770_CLK_UART2	37
+#define JZ4770_CLK_UART3	38
+#define JZ4770_CLK_IPU		39
+#define JZ4770_CLK_ADC		40
+#define JZ4770_CLK_AIC		41
+#define JZ4770_CLK_AUX		42
+#define JZ4770_CLK_VPU		43
+#define JZ4770_CLK_UHC_PHY	44
+#define JZ4770_CLK_OTG_PHY	45
+#define JZ4770_CLK_EXT512	46
+#define JZ4770_CLK_RTC		47
+
+#endif /* __DT_BINDINGS_CLOCK_JZ4770_CGU_H__ */
-- 
2.11.0
