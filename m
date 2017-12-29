From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/6] dt-bindings: ingenic: Add DT bindings for TCU clocks
Date: Fri, 29 Dec 2017 13:59:38 +0100
Message-ID: <20171229125942.27305-3-paul@crapouillou.net>
References: <20171229125942.27305-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171229125942.27305-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This header provides clock numbers for the ingenic,tcu
DT binding.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/dt-bindings/clock/ingenic,tcu.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 include/dt-bindings/clock/ingenic,tcu.h

diff --git a/include/dt-bindings/clock/ingenic,tcu.h b/include/dt-bindings/clock/ingenic,tcu.h
new file mode 100644
index 000000000000..3d2a6552fcf1
--- /dev/null
+++ b/include/dt-bindings/clock/ingenic,tcu.h
@@ -0,0 +1,22 @@
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
