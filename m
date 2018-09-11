Return-Path: <SRS0=HlV8=LZ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 07/10] clk: renesas: Add r8a7744 CPG Core Clock Definitions
Date: Tue, 11 Sep 2018 11:12:48 +0100
Message-Id: <1536660771-32278-8-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add all RZ/G1N Clock Pulse Generator Core Clock Outputs, as listed in
Table 7.2b ("List of Clocks [RZ/G1M/N]") of the RZ/G1 Hardware User's
Manual.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 include/dt-bindings/clock/r8a7744-cpg-mssr.h | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a7744-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a7744-cpg-mssr.h b/include/dt-bindings/clock/r8a7744-cpg-mssr.h
new file mode 100644
index 0000000..2690be0
--- /dev/null
+++ b/include/dt-bindings/clock/r8a7744-cpg-mssr.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A7744_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A7744_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a7744 CPG Core Clocks */
+#define R8A7744_CLK_Z		0
+#define R8A7744_CLK_ZG		1
+#define R8A7744_CLK_ZTR		2
+#define R8A7744_CLK_ZTRD2	3
+#define R8A7744_CLK_ZT		4
+#define R8A7744_CLK_ZX		5
+#define R8A7744_CLK_ZS		6
+#define R8A7744_CLK_HP		7
+#define R8A7744_CLK_B		9
+#define R8A7744_CLK_LB		10
+#define R8A7744_CLK_P		11
+#define R8A7744_CLK_CL		12
+#define R8A7744_CLK_M2		13
+#define R8A7744_CLK_ZB3		15
+#define R8A7744_CLK_ZB3D2	16
+#define R8A7744_CLK_DDR		17
+#define R8A7744_CLK_SDH		18
+#define R8A7744_CLK_SD0		19
+#define R8A7744_CLK_SD2		20
+#define R8A7744_CLK_SD3		21
+#define R8A7744_CLK_MMC0	22
+#define R8A7744_CLK_MP		23
+#define R8A7744_CLK_QSPI	26
+#define R8A7744_CLK_CP		27
+#define R8A7744_CLK_RCAN	28
+#define R8A7744_CLK_R		29
+#define R8A7744_CLK_OSC		30
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7744_CPG_MSSR_H__ */
-- 
2.7.4
