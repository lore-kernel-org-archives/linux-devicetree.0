From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v5 1/2] Documentation: dt: reset: Add TI syscon reset binding
Date: Mon, 27 Jun 2016 12:12:16 -0500
Message-ID: <20160627171217.4715-2-afd@ti.com>
References: <20160627171217.4715-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160627171217.4715-1-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

Add TI syscon reset controller binding. This will hook to the reset
framework and use syscon/regmap to set reset bits. This allows reset
control of individual SoC subsytems and devices with memory-mapped
reset registers in a common register memory space.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../devicetree/bindings/reset/ti-syscon-reset.txt  | 91 ++++++++++++++++++++++
 include/dt-bindings/reset/ti-syscon.h              | 38 +++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
 create mode 100644 include/dt-bindings/reset/ti-syscon.h

diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
new file mode 100644
index 0000000..164c7f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
@@ -0,0 +1,91 @@
+TI SysCon Reset Controller
+=======================
+
+Almost all SoCs have hardware modules that require reset control in addition
+to clock and power control for their functionality. The reset control is
+typically provided by means of memory-mapped I/O registers. These registers are
+sometimes a part of a larger register space region implementing various
+functionalities. This register range is best represented as a syscon node to
+allow multiple entities to access their relevant registers in the common
+register space.
+
+A SysCon Reset Controller node defines a device that uses a syscon node
+and provides reset management functionality for various hardware modules
+present on the SoC.
+
+SysCon Reset Controller Node
+============================
+Each of the reset provider/controller nodes should be a child of a syscon
+node and have the following properties.
+
+Required properties:
+--------------------
+ - compatible		: Should be,
+			    "ti,k2e-pscrst"
+			    "ti,k2l-pscrst"
+			    "ti,k2hk-pscrst"
+			    "ti,syscon-reset"
+ - #reset-cells		: Should be 1. Please see the reset consumer node below
+			  for usage details
+ - ti,reset-bits	: Contains the reset control register information
+			  Should contain 7 cells for each reset exposed to
+			  consumers, defined as:
+			    Cell #1 : offset of the reset assert control
+			              register from the syscon register base
+			    Cell #2 : bit position of the reset in the reset
+			              assert control register
+			    Cell #3 : offset of the reset deassert control
+			              register from the syscon register base
+			    Cell #4 : bit position of the reset in the reset
+			              deassert control register
+			    Cell #5 : offset of the reset status register
+			              from the syscon register base
+			    Cell #6 : bit position of the reset in the
+			              reset status register
+			    Cell #7 : Flags used to control reset behavior,
+			              availible flags defined in the DT include
+			              file <dt-bindings/reset/ti-syscon.h>
+
+SysCon Reset Consumer Nodes
+===========================
+Each of the reset consumer nodes should have the following properties,
+in addition to their own properties.
+
+Required properties:
+--------------------
+ - resets	: A phandle to the reset controller node and an index number
+		  to a reset specifier as defined above.
+
+Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
+common reset controller usage by consumers.
+
+Example:
+--------
+The following example demonstrates a syscon node, the reset controller node
+using the syscon node, and a consumer (a DSP device) on the TI Keystone 2
+Edison SoC.
+
+/ {
+	soc {
+		psc: power-sleep-controller@02350000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x02350000 0x1000>;
+
+			pscrst: psc-reset {
+				compatible = "ti,k2e-pscrst", "ti,syscon-reset";
+				#reset-cells = <1>;
+
+				ti,reset-bits = <
+					0xa3c 8 0xa3c 8 0x83c 8 (ASSERT_SET|DEASSERT_CLEAR|STATUS_SET)   /* 0: pcrst-dsp0 */
+					0xa40 5 0xa44 3 0     0 (ASSERT_SET|DEASSERT_CLEAR|STATUS_NONE)  /* 1: pcrst-example */
+				>;
+			};
+		};
+
+		dsp0: dsp0 {
+			...
+			resets = <&pscrst 0>;
+			...
+		};
+	};
+};
diff --git a/include/dt-bindings/reset/ti-syscon.h b/include/dt-bindings/reset/ti-syscon.h
new file mode 100644
index 0000000..884fd91
--- /dev/null
+++ b/include/dt-bindings/reset/ti-syscon.h
@@ -0,0 +1,38 @@
+/*
+ * TI Syscon Reset definitions
+ *
+ * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __DT_BINDINGS_RESET_TI_SYSCON_H__
+#define __DT_BINDINGS_RESET_TI_SYSCON_H__
+
+/*
+ * The reset does not support the feature and corresponding
+ * values are not valid
+ */
+#define ASSERT_NONE	(1 << 0)
+#define DEASSERT_NONE	(1 << 1)
+#define STATUS_NONE	(1 << 2)
+
+/* When set this function is activated by setting(vs clearing) this bit */
+#define ASSERT_SET	(1 << 3)
+#define DEASSERT_SET	(1 << 4)
+#define STATUS_SET	(1 << 5)
+
+/* The following are the inverse of the above and are added for consistency */
+#define ASSERT_CLEAR	(0 << 3)
+#define DEASSERT_CLEAR	(0 << 4)
+#define STATUS_CLEAR	(0 << 5)
+
+#endif
-- 
2.9.0
