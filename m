From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: clock: add R8A77980 CPG core clock
 definitions
Date: Wed, 31 Jan 2018 23:27:47 +0300
Message-ID: <4281b305-ff0d-cf56-ce6b-dff4589c39f6@cogentembedded.com>
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5b7895ac-11c1-ac2d-837b-56726bc6226a-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference the R8A77980
CPG core clocks by index. The data come from the table 8.2e of the R-Car
Series, 3rd Generation User's Manual: Hardware (Rev. 0.80, Oct, 2017),
however I had to add the Z2 clock which is somehow present only on the
figure 8.1e...

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 include/dt-bindings/clock/r8a77980-cpg-mssr.h |   51 ++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

Index: renesas-drivers/include/dt-bindings/clock/r8a77980-cpg-mssr.h
===================================================================
--- /dev/null
+++ renesas-drivers/include/dt-bindings/clock/r8a77980-cpg-mssr.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0+
+ *
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
