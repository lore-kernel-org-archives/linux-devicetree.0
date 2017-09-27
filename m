From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: [RFC 1/4] dt-bindings: Add Ingenic X1000 SoC clock define
Date: Wed, 27 Sep 2017 20:45:24 +0530
Message-ID: <20170927151527.25570-2-prasannatsmkumar@gmail.com>
References: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, paul@crapouillou.net, malat@debian.org, dom.peklo@gmail.com
Cc: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Ingenic X1000 SoC has different set of peripherals than JZ4780 and
JZ4740. Add a new device tree binding for the clock.

Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---
 include/dt-bindings/clock/x1000-cgu.h | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 include/dt-bindings/clock/x1000-cgu.h

diff --git a/include/dt-bindings/clock/x1000-cgu.h b/include/dt-bindings/clock/x1000-cgu.h
new file mode 100644
index 0000000..17f05bc
--- /dev/null
+++ b/include/dt-bindings/clock/x1000-cgu.h
@@ -0,0 +1,46 @@
+/*
+ * Copyright (C) 2016 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_X1000_CGU_H__
+#define __DT_BINDINGS_CLOCK_X1000_CGU_H__
+
+/* Add details for other peripherals when their support is added */
+#define X1000_CLK_EXCLK		0
+#define X1000_CLK_RTCLK		(X1000_CLK_EXCLK + 1)
+#define X1000_CLK_APLL		(X1000_CLK_RTCLK + 1)
+#define X1000_CLK_MPLL		(X1000_CLK_APLL + 1)
+
+#define X1000_CLK_SCLKA		(X1000_CLK_MPLL + 1)
+#define X1000_CLK_CPUMUX	(X1000_CLK_SCLKA + 1)
+#define X1000_CLK_CPU		(X1000_CLK_CPUMUX + 1)
+#define X1000_CLK_L2CACHE	(X1000_CLK_CPU + 1)
+#define X1000_CLK_AHB0		(X1000_CLK_L2CACHE + 1)
+#define X1000_CLK_AHB2PMUX	(X1000_CLK_AHB0 + 1)
+#define X1000_CLK_AHB2		(X1000_CLK_AHB2PMUX + 1)
+#define X1000_CLK_PCLK		(X1000_CLK_AHB2 + 1)
+#define X1000_CLK_DDR		(X1000_CLK_PCLK + 1)
+#define X1000_CLK_MSCMUX	(X1000_CLK_DDR + 1)
+#define X1000_CLK_MSC0		(X1000_CLK_MSCMUX + 1)
+#define X1000_CLK_MSC1		(X1000_CLK_MSC0 + 1)
+#define X1000_CLK_CIMMCLK	(X1000_CLK_MSC1 + 1)
+#define X1000_CLK_PCMPLL	(X1000_CLK_CIMMCLK + 1)
+#define X1000_CLK_PCM		(X1000_CLK_PCMPLL + 1)
+#define X1000_CLK_NEMC		(X1000_CLK_PCM + 1)
+#define X1000_CLK_UART0		(X1000_CLK_NEMC + 1)
+#define X1000_CLK_UART1		(X1000_CLK_UART0 + 1)
+#define X1000_CLK_UART2		(X1000_CLK_UART1 + 1)
+#define X1000_CLK_PDMA		(X1000_CLK_UART2 + 1)
+#define X1000_CLK_CIM		(X1000_CLK_PDMA + 1)
+#define X1000_CLK_DDR0		(X1000_CLK_CIM + 1)
+#define X1000_CLK_DDR1		(X1000_CLK_DDR0 + 1)
+#define X1000_CLK_CORE1		(X1000_CLK_DDR1	+ 1)
+
+#define X1000_CLK_I2SPLL	(X1000_CLK_CORE1 + 1)
+#define X1000_CLK_I2S		(X1000_CLK_I2SPLL + 1)
+
+#endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
-- 
2.10.0
