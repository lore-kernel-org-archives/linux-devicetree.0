From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 01/11] ARM: shmobile: r8a7792: add clock index macros
Date: Sat, 04 Jun 2016 00:12:05 +0300
Message-ID: <16467757.WJ9YPI9AuE@wasted.cogentembedded.com>
References: <3446154.oZ24315zaL@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3446154.oZ24315zaL-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add macros usable by the device tree sources to reference the R8A7792
clocks  by index.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
Changes in version 2:
- removed the SDH, SD0, and SD1 clocks;
- added RCAN and ADSP clock indeces;
- fixed SYS-DMAC0/1 clock indeces.

 include/dt-bindings/clock/r8a7792-clock.h |  103 ++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

Index: renesas/include/dt-bindings/clock/r8a7792-clock.h
===================================================================
--- /dev/null
+++ renesas/include/dt-bindings/clock/r8a7792-clock.h
@@ -0,0 +1,103 @@
+/*
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_R8A7792_H__
+#define __DT_BINDINGS_CLOCK_R8A7792_H__
+
+/* CPG */
+#define R8A7792_CLK_MAIN		0
+#define R8A7792_CLK_PLL0		1
+#define R8A7792_CLK_PLL1		2
+#define R8A7792_CLK_PLL3		3
+#define R8A7792_CLK_LB			4
+#define R8A7792_CLK_QSPI		5
+#define R8A7792_CLK_Z			6
+#define R8A7792_CLK_RCAN		7
+#define R8A7792_CLK_ADSP		8
+
+/* MSTP0 */
+#define R8A7792_CLK_MSIOF0		0
+
+/* MSTP1 */
+#define R8A7792_CLK_TMU1		11
+#define R8A7792_CLK_TMU3		21
+#define R8A7792_CLK_TMU2		22
+#define R8A7792_CLK_CMT0		24
+#define R8A7792_CLK_TMU0		25
+#define R8A7792_CLK_VSP1DU1		27
+#define R8A7792_CLK_VSP1DU0		28
+#define R8A7792_CLK_VSP1_SY		31
+
+/* MSTP2 */
+#define R8A7792_CLK_MSIOF1		8
+#define R8A7792_CLK_SYS_DMAC1		18
+#define R8A7792_CLK_SYS_DMAC0		19
+
+/* MSTP3 */
+#define R8A7792_CLK_TPU0		4
+#define R8A7792_CLK_SDHI0		14
+#define R8A7792_CLK_CMT1		29
+
+/* MSTP4 */
+#define R8A7792_CLK_IRQC		7
+
+/* MSTP5 */
+#define R8A7792_CLK_AUDIO_DMAC0		2
+#define R8A7792_CLK_THERMAL		22
+#define R8A7792_CLK_PWM			23
+
+/* MSTP7 */
+#define R8A7792_CLK_HSCIF1		16
+#define R8A7792_CLK_HSCIF0		17
+#define R8A7792_CLK_SCIF3		18
+#define R8A7792_CLK_SCIF2		19
+#define R8A7792_CLK_SCIF1		20
+#define R8A7792_CLK_SCIF0		21
+#define R8A7792_CLK_DU1			23
+#define R8A7792_CLK_DU0			24
+
+/* MSTP8 */
+#define R8A7792_CLK_VIN5		4
+#define R8A7792_CLK_VIN4		5
+#define R8A7792_CLK_VIN3		8
+#define R8A7792_CLK_VIN2		9
+#define R8A7792_CLK_VIN1		10
+#define R8A7792_CLK_VIN0		11
+#define R8A7792_CLK_ETHERAVB		12
+
+/* MSTP9 */
+#define R8A7792_CLK_GPIO7		4
+#define R8A7792_CLK_GPIO6		5
+#define R8A7792_CLK_GPIO5		7
+#define R8A7792_CLK_GPIO4		8
+#define R8A7792_CLK_GPIO3		9
+#define R8A7792_CLK_GPIO2		10
+#define R8A7792_CLK_GPIO1		11
+#define R8A7792_CLK_GPIO0		12
+#define R8A7792_CLK_GPIO11		13
+#define R8A7792_CLK_GPIO10		14
+#define R8A7792_CLK_CAN1		15
+#define R8A7792_CLK_CAN0		16
+#define R8A7792_CLK_QSPI_MOD		17
+#define R8A7792_CLK_GPIO9		19
+#define R8A7792_CLK_GPIO8		21
+#define R8A7792_CLK_I2C5		25
+#define R8A7792_CLK_IICDVFS		26
+#define R8A7792_CLK_I2C4		27
+#define R8A7792_CLK_I2C3		28
+#define R8A7792_CLK_I2C2		29
+#define R8A7792_CLK_I2C1		30
+#define R8A7792_CLK_I2C0		31
+
+/* MSTP10 */
+#define R8A7792_CLK_SSI_ALL		5
+#define R8A7792_CLK_SSI4		11
+#define R8A7792_CLK_SSI3		12
+
+#endif /* __DT_BINDINGS_CLOCK_R8A7792_H__ */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
