From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: add R8A77980 CPG core clock
 definitions
Date: Thu, 15 Feb 2018 14:56:53 +0300
Message-ID: <7691d7f4-364d-bd7b-f9fe-ea49e7c2ab09@cogentembedded.com>
References: <644095ad-42c5-a4fc-728a-76377938d2f1@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <644095ad-42c5-a4fc-728a-76377938d2f1@cogentembedded.com>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference the R8A77980
CPG core clocks by index. The data come from the table 8.2e of the R-Car
Series, 3rd Generation User's Manual: Hardware (Rev. 0.80, Oct, 2017),
however I had to add the Z2 clock which is somehow present only on the
figure 8.1e...

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- wrapped the SPDX license ID in its own comment;
- added Geert's tag.

 include/dt-bindings/clock/r8a77980-cpg-mssr.h |   51 ++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

Index: renesas-drivers/include/dt-bindings/clock/r8a77980-cpg-mssr.h
===================================================================
--- /dev/null
+++ renesas-drivers/include/dt-bindings/clock/r8a77980-cpg-mssr.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R8A77980_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_R8A77980_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* r8a77980 CPG Core Clocks */
+#define R8A77980_CLK_Z2			0
+#define R8A77980_CLK_ZR			1
+#define R8A77980_CLK_ZTR		2
+#define R8A77980_CLK_ZTRD2		3
+#define R8A77980_CLK_ZT			4
+#define R8A77980_CLK_ZX			5
+#define R8A77980_CLK_S0D1		6
+#define R8A77980_CLK_S0D2		7
+#define R8A77980_CLK_S0D3		8
+#define R8A77980_CLK_S0D4		9
+#define R8A77980_CLK_S0D6		10
+#define R8A77980_CLK_S0D12		11
+#define R8A77980_CLK_S0D24		12
+#define R8A77980_CLK_S1D1		13
+#define R8A77980_CLK_S1D2		14
+#define R8A77980_CLK_S1D4		15
+#define R8A77980_CLK_S2D1		16
+#define R8A77980_CLK_S2D2		17
+#define R8A77980_CLK_S2D4		18
+#define R8A77980_CLK_S3D1		19
+#define R8A77980_CLK_S3D2		20
+#define R8A77980_CLK_S3D4		21
+#define R8A77980_CLK_LB			22
+#define R8A77980_CLK_CL			23
+#define R8A77980_CLK_ZB3		24
+#define R8A77980_CLK_ZB3D2		25
+#define R8A77980_CLK_ZB3D4		26
+#define R8A77980_CLK_SD0H		27
+#define R8A77980_CLK_SD0		28
+#define R8A77980_CLK_RPC		29
+#define R8A77980_CLK_RPCD2		30
+#define R8A77980_CLK_MSO		31
+#define R8A77980_CLK_CANFD		32
+#define R8A77980_CLK_CSI0		33
+#define R8A77980_CLK_CP			34
+#define R8A77980_CLK_CPEX		35
+#define R8A77980_CLK_R			36
+#define R8A77980_CLK_OSC		37
+
+#endif /* __DT_BINDINGS_CLOCK_R8A77980_CPG_MSSR_H__ */
