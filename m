Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] clk: renesas: Add r8a77990 CPG Core Clock Definitions
Date: Wed, 11 Apr 2018 18:37:26 +0900
Message-Id: <1523439447-1084-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523439447-1084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439447-1084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, geert+renesas@glider.be, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds all R-Car E3 Clock Pulse Generator Core Clock Outputs.

Note that internal CPG clocks (S0, S1, S2, S3, SDSRC) are not included,
as they are used as internal clock sources only, and never referenced
from DT.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[shimoda: add SPDX-License-Identifier]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/dt-bindings/clock/r8a77990-cpg-mssr.h | 63 +++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a77990-cpg-mssr.h

diff --git a/include/dt-bindings/clock/r8a77990-cpg-mssr.h b/include/dt-bindings/clock/r8a77990-cpg-mssr.h
new file mode 100644
index 0000000..c806fce
--- /dev/null
+++ b/include/dt-bindings/clock/r8a77990-cpg-mssr.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a77990 CPG Core Clocks */
+#define R8A77990_CLK_Z2			0
+#define R8A77990_CLK_ZR			1
+#define R8A77990_CLK_ZG			2
+#define R8A77990_CLK_ZTR		3
+#define R8A77990_CLK_ZT			4
+#define R8A77990_CLK_ZX			5
+#define R8A77990_CLK_S0D1		6
+#define R8A77990_CLK_S0D3		7
+#define R8A77990_CLK_S0D6		8
+#define R8A77990_CLK_S0D12		9
+#define R8A77990_CLK_S0D24		10
+#define R8A77990_CLK_S1D1		11
+#define R8A77990_CLK_S1D2		12
+#define R8A77990_CLK_S1D4		13
+#define R8A77990_CLK_S2D1		14
+#define R8A77990_CLK_S2D2		15
+#define R8A77990_CLK_S2D4		16
+#define R8A77990_CLK_S3D1		17
+#define R8A77990_CLK_S3D2		18
+#define R8A77990_CLK_S3D4		19
+#define R8A77990_CLK_S0D6C		20
+#define R8A77990_CLK_S3D1C		21
+#define R8A77990_CLK_S3D2C		22
+#define R8A77990_CLK_S3D4C		23
+#define R8A77990_CLK_LB			24
+#define R8A77990_CLK_CL			25
+#define R8A77990_CLK_ZB3		26
+#define R8A77990_CLK_ZB3D2		27
+#define R8A77990_CLK_CR			28
+#define R8A77990_CLK_CRD2		29
+#define R8A77990_CLK_SD0H		30
+#define R8A77990_CLK_SD0		31
+#define R8A77990_CLK_SD1H		32
+#define R8A77990_CLK_SD1		33
+#define R8A77990_CLK_SD3H		34
+#define R8A77990_CLK_SD3		35
+#define R8A77990_CLK_RPC		36
+#define R8A77990_CLK_RPCD2		37
+#define R8A77990_CLK_ZA2		38
+#define R8A77990_CLK_ZA8		39
+#define R8A77990_CLK_Z2D		40
+#define R8A77990_CLK_CANFD		41
+#define R8A77990_CLK_MSO		42
+#define R8A77990_CLK_R			43
+#define R8A77990_CLK_OSC		44
+#define R8A77990_CLK_LV0		45
+#define R8A77990_CLK_LV1		46
+#define R8A77990_CLK_CSI0		47
+#define R8A77990_CLK_POST3		48
+#define R8A77990_CLK_CP			49
+#define R8A77990_CLK_CPEX		50
+
+#endif /* __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__ */
-- 
1.9.1
