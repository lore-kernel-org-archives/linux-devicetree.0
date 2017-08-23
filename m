From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] clk: renesas: add R8A7797 CPG core clock definitions
Date: Wed, 23 Aug 2017 15:52:28 +0300
Message-ID: <20170823125740.342120870@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=clk-renesas-add-R8A7797-CPG-core-clock-definitions.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference the R8A7797 CPG
clocks  by index.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/dt-bindings/clock/r8a7797-cpg-mssr.h |   48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

Index: linux/include/dt-bindings/clock/r8a7797-cpg-mssr.h
===================================================================
--- /dev/null
+++ linux/include/dt-bindings/clock/r8a7797-cpg-mssr.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A7797_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A7797_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a7797 CPG Core Clocks */
+#define R8A7797_CLK_Z2			0
+#define R8A7797_CLK_ZR			1
+#define R8A7797_CLK_ZTR			2
+#define R8A7797_CLK_ZTRD2		3
+#define R8A7797_CLK_ZT			4
+#define R8A7797_CLK_ZX			5
+#define R8A7797_CLK_S1D1		6
+#define R8A7797_CLK_S1D2		7
+#define R8A7797_CLK_S1D4		8
+#define R8A7797_CLK_S2D1		9
+#define R8A7797_CLK_S2D2		10
+#define R8A7797_CLK_S2D4		11
+#define R8A7797_CLK_LB			12
+#define R8A7797_CLK_CL			13
+#define R8A7797_CLK_ZB3			14
+#define R8A7797_CLK_ZB3D2		15
+#define R8A7797_CLK_DDR			16
+#define R8A7797_CLK_CR			17
+#define R8A7797_CLK_CRD2		18
+#define R8A7797_CLK_SD0H		19
+#define R8A7797_CLK_SD0			20
+#define R8A7797_CLK_RPC			21
+#define R8A7797_CLK_RPCD2		22
+#define R8A7797_CLK_MSO			23
+#define R8A7797_CLK_CANFD		24
+#define R8A7797_CLK_CSI0		25
+#define R8A7797_CLK_CSIREF		26
+#define R8A7797_CLK_FRAY		27
+#define R8A7797_CLK_CP			28
+#define R8A7797_CLK_CPEX		29
+#define R8A7797_CLK_R			30
+#define R8A7797_CLK_OSC			31
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7797_CPG_MSSR_H__ */
