From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/6] mfd: syscon: Add ingenic-tcu.h header
Date: Fri, 29 Dec 2017 13:59:37 +0100
Message-ID: <20171229125942.27305-2-paul@crapouillou.net>
References: <20171229125942.27305-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171229125942.27305-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This header contains macros for the registers that are present in the
regmap shared by all the drivers related to the TCU (Timer Counter Unit)
of the Ingenic JZ47xx SoCs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/linux/mfd/syscon/ingenic-tcu.h | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 include/linux/mfd/syscon/ingenic-tcu.h

diff --git a/include/linux/mfd/syscon/ingenic-tcu.h b/include/linux/mfd/syscon/ingenic-tcu.h
new file mode 100644
index 000000000000..5952fdd60005
--- /dev/null
+++ b/include/linux/mfd/syscon/ingenic-tcu.h
@@ -0,0 +1,53 @@
+#ifndef __LINUX_CLK_INGENIC_TCU_H_
+#define __LINUX_CLK_INGENIC_TCU_H_
+
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+
+enum ingenic_tcu_reg {
+	REG_WDT_TDR	= 0x00,
+	REG_WDT_TCER	= 0x04,
+	REG_WDT_TCNT	= 0x08,
+	REG_WDT_TCSR	= 0x0c,
+	REG_TER		= 0x10,
+	REG_TESR	= 0x14,
+	REG_TECR	= 0x18,
+	REG_TSR		= 0x1c,
+	REG_TFR		= 0x20,
+	REG_TFSR	= 0x24,
+	REG_TFCR	= 0x28,
+	REG_TSSR	= 0x2c,
+	REG_TMR		= 0x30,
+	REG_TMSR	= 0x34,
+	REG_TMCR	= 0x38,
+	REG_TSCR	= 0x3c,
+	REG_TDFR0	= 0x40,
+	REG_TDHR0	= 0x44,
+	REG_TCNT0	= 0x48,
+	REG_TCSR0	= 0x4c,
+	REG_OST_DR	= 0xe0,
+	REG_OST_CNTL	= 0xe4,
+	REG_OST_CNTH	= 0xe8,
+	REG_OST_TCSR	= 0xec,
+	REG_TSTR	= 0xf0,
+	REG_TSTSR	= 0xf4,
+	REG_TSTCR	= 0xf8,
+	REG_OST_CNTHBUF	= 0xfc,
+};
+
+#define TCSR_RESERVED_BITS		0x3f
+#define TCSR_PARENT_CLOCK_MASK		0x07
+#define TCSR_PRESCALE_LSB		3
+#define TCSR_PRESCALE_MASK		0x38
+
+#define TCSR_PWM_SD		BIT(9)  /* 0: Shutdown abruptly 1: gracefully */
+#define TCSR_PWM_INITL_HIGH	BIT(8)  /* Sets the initial output level */
+#define TCSR_PWM_EN		BIT(7)  /* PWM pin output enable */
+
+#define CHANNEL_STRIDE		0x10
+#define REG_TDFRc(c)		(REG_TDFR0 + ((c) * CHANNEL_STRIDE))
+#define REG_TDHRc(c)		(REG_TDHR0 + ((c) * CHANNEL_STRIDE))
+#define REG_TCNTc(c)		(REG_TCNT0 + ((c) * CHANNEL_STRIDE))
+#define REG_TCSRc(c)		(REG_TCSR0 + ((c) * CHANNEL_STRIDE))
+
+#endif /* __LINUX_CLK_INGENIC_TCU_H_ */
-- 
2.11.0
