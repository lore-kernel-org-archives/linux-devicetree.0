From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] clk: renesas: Add r8a77995 CPG Core Clock Definitions
Date: Thu, 20 Jul 2017 14:40:06 +0200
Message-ID: <1500554409-22423-2-git-send-email-geert+renesas@glider.be>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add all R-Car D3 Clock Pulse Generator Core Clock Outputs, as listed
in Table 8.2f ("List of Clocks [R-Car D3]") of the R-Car Series, 3rd
Generation Hardware User's Manual (Rev. 0.55, Jun. 30, 2017).

Note that internal CPG clocks (S0, S1, S2, S3, S1C, S3C, SDSRC, and
SSPSRC) are not included, as they are used as internal clock sources
only, and never referenced from DT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org
---
 include/dt-bindings/clock/r8a77995-cpg-mssr.h | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a77995-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a77995-cpg-mssr.h b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
new file mode 100644
index 0000000000000000..4e8ae3dee5901b01
--- /dev/null
+++ b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
@@ -0,0 +1,57 @@
+/*
+ * Copyright (C) 2017 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A77995_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A77995_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a77995 CPG Core Clocks */
+#define R8A77995_CLK_Z2			0
+#define R8A77995_CLK_ZG			1
+#define R8A77995_CLK_ZTR		2
+#define R8A77995_CLK_ZT			3
+#define R8A77995_CLK_ZX			4
+#define R8A77995_CLK_S0D1		5
+#define R8A77995_CLK_S1D1		6
+#define R8A77995_CLK_S1D2		7
+#define R8A77995_CLK_S1D4		8
+#define R8A77995_CLK_S2D1		9
+#define R8A77995_CLK_S2D2		10
+#define R8A77995_CLK_S2D4		11
+#define R8A77995_CLK_S3D1		12
+#define R8A77995_CLK_S3D2		13
+#define R8A77995_CLK_S3D4		14
+#define R8A77995_CLK_S1D4C		15
+#define R8A77995_CLK_S3D1C		16
+#define R8A77995_CLK_S3D2C		17
+#define R8A77995_CLK_S3D4C		18
+#define R8A77995_CLK_LB			19
+#define R8A77995_CLK_CL			20
+#define R8A77995_CLK_ZB3		21
+#define R8A77995_CLK_ZB3D2		22
+#define R8A77995_CLK_CR			23
+#define R8A77995_CLK_CRD2		24
+#define R8A77995_CLK_SD0H		25
+#define R8A77995_CLK_SD0		26
+#define R8A77995_CLK_SSP2		27
+#define R8A77995_CLK_SSP1		28
+#define R8A77995_CLK_RPC		29
+#define R8A77995_CLK_RPCD2		30
+#define R8A77995_CLK_ZA2		31
+#define R8A77995_CLK_ZA8		32
+#define R8A77995_CLK_Z2D		33
+#define R8A77995_CLK_CANFD		34
+#define R8A77995_CLK_MSO		35
+#define R8A77995_CLK_R			36
+#define R8A77995_CLK_OSC		37
+#define R8A77995_CLK_LV0		38
+#define R8A77995_CLK_LV1		39
+#define R8A77995_CLK_CP			40
+
+#endif /* __DT_BINDINGS_CLOCK_R8A77995_CPG_MSSR_H__ */
-- 
2.7.4

