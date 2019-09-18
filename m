From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH 1/2] dt-bindings: documentation: add clock bindings information for Agilex
Date: Tue, 17 Sep 2019 20:34:58 -0500
Message-ID: <20190918013459.15966-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: dinguyen@kernel.org, devicetree@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, Dinh Nguyen <dinh.nguyen@intel.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinh.nguyen@intel.com>

Document the Agilex clock bindings, and add the clock header file. The
clock header is an enumeration of all the different clocks on the Agilex
platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 .../devicetree/bindings/clock/intc_agilex.txt | 20 ++++++
 include/dt-bindings/clock/agilex-clock.h      | 70 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/intc_agilex.txt
 create mode 100644 include/dt-bindings/clock/agilex-clock.h

diff --git a/Documentation/devicetree/bindings/clock/intc_agilex.txt b/Documentation/devicetree/bindings/clock/intc_agilex.txt
new file mode 100644
index 000000000000..bfec71420511
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/intc_agilex.txt
@@ -0,0 +1,20 @@
+Device Tree Clock bindings for Intel's SoCFPGA Agilex platform
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be
+	"intel,agilex-clkmgr"
+
+- reg : shall be the control register offset from CLOCK_MANAGER's base for the clock.
+
+- #clock-cells : from common clock binding, shall be set to 1.
+
+Example:
+	clkmgr: clock-controller@ffd10000 {
+		compatible = "intel,agilex-clkmgr";
+		reg = <0xffd10000 0x1000>;
+		#clock-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/agilex-clock.h b/include/dt-bindings/clock/agilex-clock.h
new file mode 100644
index 000000000000..f19cf8ccbdd2
--- /dev/null
+++ b/include/dt-bindings/clock/agilex-clock.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019, Intel Corporation
+ */
+
+#ifndef __AGILEX_CLOCK_H
+#define __AGILEX_CLOCK_H
+
+/* fixed rate clocks */
+#define AGILEX_OSC1			0
+#define AGILEX_CB_INTOSC_HS_DIV2_CLK	1
+#define AGILEX_CB_INTOSC_LS_CLK		2
+#define AGILEX_L4_SYS_FREE_CLK		3
+#define AGILEX_F2S_FREE_CLK		4
+
+/* PLL clocks */
+#define AGILEX_MAIN_PLL_CLK		5
+#define AGILEX_MAIN_PLL_C0_CLK		6
+#define AGILEX_MAIN_PLL_C1_CLK		7
+#define AGILEX_MAIN_PLL_C2_CLK		8
+#define AGILEX_MAIN_PLL_C3_CLK		9
+#define AGILEX_PERIPH_PLL_CLK		10
+#define AGILEX_PERIPH_PLL_C0_CLK	11
+#define AGILEX_PERIPH_PLL_C1_CLK	12
+#define AGILEX_PERIPH_PLL_C2_CLK	13
+#define AGILEX_PERIPH_PLL_C3_CLK	14
+#define AGILEX_MPU_FREE_CLK		15
+#define AGILEX_MPU_CCU_CLK		16
+#define AGILEX_BOOT_CLK			17
+
+/* fixed factor clocks */
+#define AGILEX_L3_MAIN_FREE_CLK		18
+#define AGILEX_NOC_FREE_CLK		19
+#define AGILEX_S2F_USR0_CLK		20
+#define AGILEX_NOC_CLK			21
+#define AGILEX_EMAC_A_FREE_CLK		22
+#define AGILEX_EMAC_B_FREE_CLK		23
+#define AGILEX_EMAC_PTP_FREE_CLK	24
+#define AGILEX_GPIO_DB_FREE_CLK		25
+#define AGILEX_SDMMC_FREE_CLK		26
+#define AGILEX_S2F_USER0_FREE_CLK	27
+#define AGILEX_S2F_USER1_FREE_CLK	28
+#define AGILEX_PSI_REF_FREE_CLK		29
+
+/* Gate clocks */
+#define AGILEX_MPU_CLK			30
+#define AGILEX_MPU_L2RAM_CLK		31
+#define AGILEX_MPU_PERIPH_CLK		32
+#define AGILEX_L4_MAIN_CLK		33
+#define AGILEX_L4_MP_CLK		34
+#define AGILEX_L4_SP_CLK		35
+#define AGILEX_CS_AT_CLK		36
+#define AGILEX_CS_TRACE_CLK		37
+#define AGILEX_CS_PDBG_CLK		38
+#define AGILEX_CS_TIMER_CLK		39
+#define AGILEX_S2F_USER0_CLK		40
+#define AGILEX_EMAC0_CLK		41
+#define AGILEX_EMAC1_CLK		43
+#define AGILEX_EMAC2_CLK		44
+#define AGILEX_EMAC_PTP_CLK		45
+#define AGILEX_GPIO_DB_CLK		46
+#define AGILEX_NAND_CLK			47
+#define AGILEX_PSI_REF_CLK		48
+#define AGILEX_S2F_USER1_CLK		49
+#define AGILEX_SDMMC_CLK		50
+#define AGILEX_SPI_M_CLK		51
+#define AGILEX_USB_CLK			52
+#define AGILEX_NUM_CLKS			53
+
+#endif	/* __AGILEX_CLOCK_H */
-- 
2.20.0
