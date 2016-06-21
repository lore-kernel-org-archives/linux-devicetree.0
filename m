From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v5] Documentation: dt: reset: Add TI syscon reset binding
Date: Tue, 21 Jun 2016 15:06:45 -0500
Message-ID: <20160621200645.13057-1-afd@ti.com>
References: <20160621192512.GA29836@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160621192512.GA29836@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add TI syscon reset controller binding. This will hook to the reset
framework and use syscon/regmap to set reset bits. This allows reset
control of individual SoC subsytems and devices with memory-mapped
reset registers in a common register memory space.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
[s-anna-l0cyMroinI0@public.gmane.org: revise the binding format]
Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/reset/ti-syscon-reset.txt  | 87 ++++++++++++++++++++++
 include/dt-bindings/reset/ti-syscon.h              | 30 ++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
 create mode 100644 include/dt-bindings/reset/ti-syscon.h

diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
new file mode 100644
index 0000000..5a0b86c
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
@@ -0,0 +1,87 @@
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
+			    "syscon-reset"
+ - #reset-cells		: Should be 1. Please see the reset consumer node below
+			  for usage details
+ - ti,reset-bits	: Contains the reset control register information
+			  Should contain 5 cells for each reset exposed to
+			  consumers, defined as:
+			    Cell #1 : register offset of the reset control
+			              register from the syscon register base
+			    Cell #2 : bit shift value for the reset in the
+			              respective reset control register
+			    Cell #3 : register offset of the reset status
+			              register from the syscon register base
+			    Cell #4 : bit shift value for the reset in the
+			              respective reset status register
+			    Cell #5 : Flags used to control reset behavior,
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
+ - resets	: A phandle to the reset controller node and a phandle to a
+		  reset specifier node as defined above.
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
+				compatible = "ti,k2e-pscrst", "syscon-reset";
+				#reset-cells = <1>;
+
+				ti,reset-bits = <
+					0xa3c 8 0x83c 8 RESET_ASSERT_CLEAR  /* 0: pcrst-dsp0 */
+					0xa40 5 0     0 RESET_TRIGGER_SET   /* 1: pcrst-example */
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
index 0000000..fedcfb7
--- /dev/null
+++ b/include/dt-bindings/reset/ti-syscon.h
@@ -0,0 +1,30 @@
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
+/* The reset is asserted by setting (vs clearing) the described bit */
+#define RESET_SET		(1 << 0)
+/* This reset does not have a readable status bit */
+#define RESET_TRIGGER		(1 << 1)
+
+#define RESET_ASSERT_CLEAR	0
+#define RESET_ASSERT_SET	RESET_SET
+#define RESET_TRIGGER_CLEAR	RESET_TRIGGER
+#define RESET_TRIGGER_SET	(RESET_TRIGGER | RESET_SET)
+
+#endif
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
