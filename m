From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: [PATCH v3 2/9] dt-bindings: ingenic: Add DT bindings for TCU clocks
Date: Wed, 10 Jan 2018 23:48:31 +0100
Message-ID: <20180110224838.16711-2-paul@crapouillou.net>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110224838.16711-1-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This header provides clock numbers for the ingenic,tcu
DT binding.

Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/clock/ingenic,tcu.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/clock/ingenic,tcu.h

 v2: Use SPDX identifier for the license
 v3: No change

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
