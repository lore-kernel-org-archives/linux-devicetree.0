Return-Path: <SRS0=xn9O=GR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  05/12] clk: renesas: Add r8a77470 CPG Core Clock Definitions
Date: Tue, 27 Mar 2018 15:37:16 +0100
Message-Id: <1522161443-54428-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add all RZ/G1C Clock Pulse Generator Core Clock Outputs, as listed in
Table 7.2 ("List of Clocks [RZ/G1C]") of the RZ/G1C Hardware User's
Manual.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 include/dt-bindings/clock/r8a7747x-cpg-mssr.h | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a7747x-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a7747x-cpg-mssr.h b/include/dt-bindings/clock/r8a7747x-cpg-mssr.h
new file mode 100644
index 0000000..57a4de3
--- /dev/null
+++ b/include/dt-bindings/clock/r8a7747x-cpg-mssr.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A7747X_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A7747X_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a77470 CPG Core Clocks */
+#define R8A77470_CLK_Z2		0
+#define R8A77470_CLK_ZTR	2
+#define R8A77470_CLK_ZTRD2	3
+#define R8A77470_CLK_ZT		4
+#define R8A77470_CLK_ZX		5
+#define R8A77470_CLK_ZS		6
+#define R8A77470_CLK_HP		7
+#define R8A77470_CLK_B		9
+#define R8A77470_CLK_LB		10
+#define R8A77470_CLK_P		11
+#define R8A77470_CLK_CL		12
+#define R8A77470_CLK_CP		13
+#define R8A77470_CLK_M2		14
+#define R8A77470_CLK_ZB3	16
+#define R8A77470_CLK_SDH	19
+#define R8A77470_CLK_SD0	20
+#define R8A77470_CLK_SD1	21
+#define R8A77470_CLK_SD2	22
+#define R8A77470_CLK_MP		24
+#define R8A77470_CLK_QSPI	25
+#define R8A77470_CLK_CPEX	26
+#define R8A77470_CLK_RCAN	27
+#define R8A77470_CLK_R		28
+#define R8A77470_CLK_OSC	29
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7747X_CPG_MSSR_H__ */
-- 
2.7.4
