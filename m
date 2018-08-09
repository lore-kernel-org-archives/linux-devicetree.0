From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v4 2/3] clk: meson: add DT documentation for emmc clock controller
Date: Thu, 9 Aug 2018 15:07:22 +0800
Message-ID: <20180809070724.11935-3-yixun.lan@amlogic.com>
References: <20180809070724.11935-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180809070724.11935-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the MMC sub clock controller driver, the potential consumer
of this driver is MMC or NAND. Also add four clock bindings IDs which
provided by this driver.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 .../bindings/clock/amlogic,mmc-clkc.txt       | 31 +++++++++++++++++++
 include/dt-bindings/clock/amlogic,mmc-clkc.h  | 17 ++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
 create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
new file mode 100644
index 000000000000..9e6d34389be8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
@@ -0,0 +1,31 @@
+* Amlogic MMC Sub Clock Controller Driver
+
+The Amlogic MMC clock controller generates and supplies clock to support
+MMC and NAND controller
+
+Required Properties:
+
+- compatible: should be:
+		"amlogic,gx-mmc-clkc"
+		"amlogic,axg-mmc-clkc"
+
+- #clock-cells: should be 1.
+- clocks: phandles to clocks corresponding to the clock-names property
+- clock-names: list of parent clock names
+	- "clkin0", "clkin1"
+
+Parent node should have the following properties :
+- compatible: "amlogic,axg-mmc-clkc", "syscon".
+- reg: base address and size of the MMC control register space.
+
+Example: Clock controller node:
+
+sd_mmc_c_clkc: clock-controller@7000 {
+	compatible = "amlogic,axg-mmc-clkc", "syscon";
+	reg = <0x0 0x7000 0x0 0x4>;
+	#clock-cells = <1>;
+
+	clock-names = "clkin0", "clkin1";
+	clocks = <&clkc CLKID_SD_MMC_C_CLK0>,
+		 <&clkc CLKID_FCLK_DIV2>;
+};
diff --git a/include/dt-bindings/clock/amlogic,mmc-clkc.h b/include/dt-bindings/clock/amlogic,mmc-clkc.h
new file mode 100644
index 000000000000..162b94949119
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,mmc-clkc.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Meson MMC sub clock tree IDs
+ *
+ * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
+ * Author: Yixun Lan <yixun.lan@amlogic.com>
+ */
+
+#ifndef __MMC_CLKC_H
+#define __MMC_CLKC_H
+
+#define CLKID_MMC_DIV				1
+#define CLKID_MMC_PHASE_CORE			2
+#define CLKID_MMC_PHASE_TX			3
+#define CLKID_MMC_PHASE_RX			4
+
+#endif
-- 
2.17.1
