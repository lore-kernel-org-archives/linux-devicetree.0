From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v3 1/2] Documentation: dt: reset: Add TI SCI reset binding
Date: Fri, 4 Nov 2016 12:42:39 -0500
Message-ID: <20161104174240.9688-2-afd@ti.com>
References: <20161104174240.9688-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161104174240.9688-1-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Suman Anna <s-anna@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

Add TI SCI reset controller binding. This describes the DT binding
details for a reset controller node providing reset management services
to hardware blocks (reset consumers) using the Texas Instrument's System
Control Interface (TI SCI) protocol to communicate to a system controller
block present on the SoC.

Signed-off-by: Andrew F. Davis <afd@ti.com>
[s-anna@ti.com: revise the binding format]
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 .../devicetree/bindings/reset/ti,sci-reset.txt     | 65 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 include/dt-bindings/reset/k2g.h                    | 22 ++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti,sci-reset.txt
 create mode 100644 include/dt-bindings/reset/k2g.h

diff --git a/Documentation/devicetree/bindings/reset/ti,sci-reset.txt b/Documentation/devicetree/bindings/reset/ti,sci-reset.txt
new file mode 100644
index 0000000..cb00679
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/ti,sci-reset.txt
@@ -0,0 +1,65 @@
+Texas Instruments System Control Interface (TI-SCI) Reset Controller
+=====================================================================
+
+Some TI SoCs contain a system controller (like the Power Management Micro
+Controller (PMMC) on Keystone K2G SoC) that are responsible for controlling
+the state of the various hardware modules present on the SoC. Communication
+between the host processor running an OS and the system controller happens
+through a protocol called TI System Control Interface (TI-SCI protocol).
+For TI SCI details, please refer to the document,
+Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
+
+TI-SCI Reset Controller Node
+============================
+This reset controller node uses the TI SCI protocol to perform the reset
+management of various hardware modules present on the SoC.
+
+Required properties:
+--------------------
+ - compatible	: Should be "ti,sci-reset"
+ - #reset-cells	: Should be 2. Please see the reset consumer node below for
+		  usage details.
+
+TI-SCI Reset Consumer Nodes
+===========================
+Each of the reset consumer nodes should have the following properties,
+in addition to their own properties.
+
+Required properties:
+--------------------
+ - resets	: A phandle and reset specifier pair, one pair for each reset
+		  signal that affects the device, or that the device manages.
+		  The phandle should point to the TI-SCI reset controller node,
+		  and the reset specifier should have 2 cell-values. The first
+		  cell should contain the device ID, the values of which are
+		  specified in the <dt-bindings/genpd/<soc>.h> include file.
+		  The second cell should contain the reset mask value used by
+		  system controller, the values of which are specified in the
+		  include file <dt-bindings/reset/<soc>.h>, where <soc> is the
+		  name of the SoC involved, for example 'k2g'.
+
+Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
+common reset controller usage by consumers.
+
+Example:
+--------
+The following example demonstrates both a TI-SCI reset controller node and a
+consumer (a DSP device) on the K2G SoC.
+
+#include <dt-bindings/genpd/k2g.h>
+#include <dt-bindings/reset/k2g.h>
+
+pmmc: pmmc {
+	compatible = "ti,k2g-sci";
+
+	k2g_reset: k2g_reset {
+		compatible = "ti,sci-reset";
+		#reset-cells = <2>;
+	};
+};
+
+dsp0: dsp0 {
+	...
+	resets = <&k2g_reset K2G_DEV_CGEM0 K2G_DEV_CGEM0_DSP0_RESET>;
+	...
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 6e93976..accf991 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11899,6 +11899,8 @@ F:	drivers/soc/ti/ti_sci_pm_domains.c
 F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
 F:	include/dt-bindings/clock/k2g.h
 F:	drivers/clk/keystone/sci-clk.c
+F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
+F:	include/dt-bindings/reset/k2g.h
 
 THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
diff --git a/include/dt-bindings/reset/k2g.h b/include/dt-bindings/reset/k2g.h
new file mode 100644
index 0000000..00e2a9b
--- /dev/null
+++ b/include/dt-bindings/reset/k2g.h
@@ -0,0 +1,22 @@
+/*
+ * TI K2G SoC reset definitions
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
+#ifndef __DT_BINDINGS_RESET_K2G_H__
+#define __DT_BINDINGS_RESET_K2G_H__
+
+#define K2G_DEV_CGEM0_DSP0_RESET	0x1
+
+#endif
-- 
2.10.1
