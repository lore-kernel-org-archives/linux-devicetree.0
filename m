From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 2/8] dt-bindings: ingenic: Add DT bindings for TCU clocks
Date: Sun, 18 Mar 2018 00:28:55 +0100
Message-ID: <20180317232901.14129-3-paul@crapouillou.net>
References: <20180110224838.16711-2-paul@crapouillou.net>
 <20180317232901.14129-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180317232901.14129-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>
Cc: James Hogan <jhogan@kernel.org>, Maarten ter Huurne <maarten@treewalker.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-doc@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This header provides clock numbers for the ingenic,tcu
DT binding.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/ingenic,tcu.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/clock/ingenic,tcu.h

 v2: Use SPDX identifier for the license
 v3: No change
 v4: No change

diff --git a/include/dt-bindings/clock/ingenic,tcu.h b/include/dt-bindings/clock/ingenic,tcu.h
new file mode 100644
index 000000000000..179815d7b3bb
--- /dev/null
+++ b/include/dt-bindings/clock/ingenic,tcu.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides clock numbers for the ingenic,tcu DT binding.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_INGENIC_TCU_H__
+#define __DT_BINDINGS_CLOCK_INGENIC_TCU_H__
+
+#define JZ4740_CLK_TIMER0	0
+#define JZ4740_CLK_TIMER1	1
+#define JZ4740_CLK_TIMER2	2
+#define JZ4740_CLK_TIMER3	3
+#define JZ4740_CLK_TIMER4	4
+#define JZ4740_CLK_TIMER5	5
+#define JZ4740_CLK_TIMER6	6
+#define JZ4740_CLK_TIMER7	7
+#define JZ4740_CLK_WDT		8
+#define JZ4740_CLK_LAST		JZ4740_CLK_WDT
+
+#define JZ4770_CLK_OST		9
+#define JZ4770_CLK_LAST		JZ4770_CLK_OST
+
+#endif /* __DT_BINDINGS_CLOCK_INGENIC_TCU_H__ */
-- 
2.11.0
