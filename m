Return-Path: <SRS0=GHC0=L2=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/3] clk: renesas: Add r8a774c0 CPG Core Clock Definitions
Date: Wed, 12 Sep 2018 11:41:52 +0100
Message-Id: <1536748914-27416-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536748914-27416-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1536748914-27416-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add all RZ/G2E (a.k.a. R8A774C0) Clock Pulse Generator Core
Clock Outputs, as listed in Table 8.2g ("List of Clocks
[RZ/G2E]") of the RZ/G2 Hardware User's Manual.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 include/dt-bindings/clock/r8a774c0-cpg-mssr.h | 60 +++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a774c0-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a774c0-cpg-mssr.h b/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
new file mode 100644
index 0000000..8fe51b6
--- /dev/null
+++ b/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A774C0_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A774C0_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a774c0 CPG Core Clocks */
+#define R8A774C0_CLK_Z2			0
+#define R8A774C0_CLK_ZG			1
+#define R8A774C0_CLK_ZTR		2
+#define R8A774C0_CLK_ZT			3
+#define R8A774C0_CLK_ZX			4
+#define R8A774C0_CLK_S0D1		5
+#define R8A774C0_CLK_S0D3		6
+#define R8A774C0_CLK_S0D6		7
+#define R8A774C0_CLK_S0D12		8
+#define R8A774C0_CLK_S0D24		9
+#define R8A774C0_CLK_S1D1		10
+#define R8A774C0_CLK_S1D2		11
+#define R8A774C0_CLK_S1D4		12
+#define R8A774C0_CLK_S2D1		13
+#define R8A774C0_CLK_S2D2		14
+#define R8A774C0_CLK_S2D4		15
+#define R8A774C0_CLK_S3D1		16
+#define R8A774C0_CLK_S3D2		17
+#define R8A774C0_CLK_S3D4		18
+#define R8A774C0_CLK_S0D6C		19
+#define R8A774C0_CLK_S3D1C		20
+#define R8A774C0_CLK_S3D2C		21
+#define R8A774C0_CLK_S3D4C		22
+#define R8A774C0_CLK_LB			23
+#define R8A774C0_CLK_CL			24
+#define R8A774C0_CLK_ZB3		25
+#define R8A774C0_CLK_ZB3D2		26
+#define R8A774C0_CLK_CR			27
+#define R8A774C0_CLK_CRD2		28
+#define R8A774C0_CLK_SD0H		29
+#define R8A774C0_CLK_SD0		30
+#define R8A774C0_CLK_SD1H		31
+#define R8A774C0_CLK_SD1		32
+#define R8A774C0_CLK_SD3H		33
+#define R8A774C0_CLK_SD3		34
+#define R8A774C0_CLK_RPC		35
+#define R8A774C0_CLK_RPCD2		36
+#define R8A774C0_CLK_ZA2		37
+#define R8A774C0_CLK_ZA8		38
+#define R8A774C0_CLK_Z2D		39
+#define R8A774C0_CLK_MSO		40
+#define R8A774C0_CLK_R			41
+#define R8A774C0_CLK_OSC		42
+#define R8A774C0_CLK_LV0		43
+#define R8A774C0_CLK_LV1		44
+#define R8A774C0_CLK_CSI0		45
+#define R8A774C0_CLK_CP			46
+#define R8A774C0_CLK_CPEX		47
+
+#endif /* __DT_BINDINGS_CLOCK_R8A774C0_CPG_MSSR_H__ */
-- 
2.7.4
