From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] clk: new driver for efm32 SoC
Date: Tue,  8 Oct 2013 09:57:20 +0200
Message-ID: <1381219040-7378-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20131008074003.GL10079@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008074003.GL10079-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for the clocks provided by the Clock Management
Unit of Energy Micro's efm32 Giant Gecko SoCs including device tree
bindings.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/clock/efm32-clock.txt      | 11 +++
 drivers/clk/Makefile                               |  1 +
 drivers/clk/clk-efm32gg.c                          | 81 ++++++++++++++=
++++++++
 include/dt-bindings/clock/efm32-cmu.h              | 42 +++++++++++
 4 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/efm32-clock=
=2Etxt
 create mode 100644 drivers/clk/clk-efm32gg.c
 create mode 100644 include/dt-bindings/clock/efm32-cmu.h

diff --git a/Documentation/devicetree/bindings/clock/efm32-clock.txt b/=
Documentation/devicetree/bindings/clock/efm32-clock.txt
new file mode 100644
index 0000000..263d293
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/efm32-clock.txt
@@ -0,0 +1,11 @@
+* Clock bindings for Energy Micro efm32 Giant Gecko's Clock Management=
 Unit
+
+Required properties:
+- compatible: Should be "efm32gg,cmu"
+- reg: Base address and length of the register set
+- interrupts: Interrupt used by the CMU
+- #clock-cells: Should be <1>
+
+The clock consumer should specify the desired clock by having the cloc=
k ID in
+its "clocks" phandle cell. The header efm32-clk.h contains a list of a=
vailable
+IDs.
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 7b11106..40c2225 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_COMMON_CLK)	+=3D clk-composite.o
=20
 # SoCs specific
 obj-$(CONFIG_ARCH_BCM2835)	+=3D clk-bcm2835.o
+obj-$(CONFIG_ARCH_EFM32)	+=3D clk-efm32gg.o
 obj-$(CONFIG_ARCH_NOMADIK)	+=3D clk-nomadik.o
 obj-$(CONFIG_ARCH_HIGHBANK)	+=3D clk-highbank.o
 obj-$(CONFIG_ARCH_NSPIRE)	+=3D clk-nspire.o
diff --git a/drivers/clk/clk-efm32gg.c b/drivers/clk/clk-efm32gg.c
new file mode 100644
index 0000000..bac2ddf
--- /dev/null
+++ b/drivers/clk/clk-efm32gg.c
@@ -0,0 +1,81 @@
+/*
+ * Copyright (C) 2013 Pengutronix
+ * Uwe Kleine-Koenig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it under
+ * the terms of the GNU General Public License version 2 as published =
by the
+ * Free Software Foundation.
+ */
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#include <dt-bindings/clock/efm32-cmu.h>
+
+#define CMU_HFPERCLKEN0		0x44
+
+static struct clk *clk[37];
+static struct clk_onecell_data clk_data =3D {
+	.clks =3D clk,
+	.clk_num =3D ARRAY_SIZE(clk),
+};
+
+static int __init efm32gg_cmu_init(struct device_node *np)
+{
+	int i;
+	void __iomem *base;
+
+	for (i =3D 0; i < ARRAY_SIZE(clk); ++i)
+		clk[i] =3D ERR_PTR(-ENOENT);
+
+	base =3D of_iomap(np, 0);
+	if (!base) {
+		pr_warn("Failed to map address range for efm32gg,cmu node\n");
+		return -EADDRNOTAVAIL;
+	}
+
+	clk[clk_HFXO] =3D clk_register_fixed_rate(NULL, "HFXO", NULL,
+			CLK_IS_ROOT, 48000000);
+
+	clk[clk_HFPERCLKUSART0] =3D clk_register_gate(NULL, "HFPERCLK.USART0"=
,
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 0, 0, NULL);
+	clk[clk_HFPERCLKUSART1] =3D clk_register_gate(NULL, "HFPERCLK.USART1"=
,
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 1, 0, NULL);
+	clk[clk_HFPERCLKUSART2] =3D clk_register_gate(NULL, "HFPERCLK.USART2"=
,
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 2, 0, NULL);
+	clk[clk_HFPERCLKUART0] =3D clk_register_gate(NULL, "HFPERCLK.UART0",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 3, 0, NULL);
+	clk[clk_HFPERCLKUART1] =3D clk_register_gate(NULL, "HFPERCLK.UART1",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 4, 0, NULL);
+	clk[clk_HFPERCLKTIMER0] =3D clk_register_gate(NULL, "HFPERCLK.TIMER0"=
,
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 5, 0, NULL);
+	clk[clk_HFPERCLKTIMER1] =3D clk_register_gate(NULL, "HFPERCLK.TIMER1"=
,
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 6, 0, NULL);
+	clk[clk_HFPERCLKTIMER2] =3D clk_register_gate(NULL, "HFPERCLK.TIMER2"=
,
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 7, 0, NULL);
+	clk[clk_HFPERCLKTIMER3] =3D clk_register_gate(NULL, "HFPERCLK.TIMER3"=
,
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 8, 0, NULL);
+	clk[clk_HFPERCLKACMP0] =3D clk_register_gate(NULL, "HFPERCLK.ACMP0",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 9, 0, NULL);
+	clk[clk_HFPERCLKACMP1] =3D clk_register_gate(NULL, "HFPERCLK.ACMP1",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 10, 0, NULL);
+	clk[clk_HFPERCLKI2C0] =3D clk_register_gate(NULL, "HFPERCLK.I2C0",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 11, 0, NULL);
+	clk[clk_HFPERCLKI2C1] =3D clk_register_gate(NULL, "HFPERCLK.I2C1",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 12, 0, NULL);
+	clk[clk_HFPERCLKGPIO] =3D clk_register_gate(NULL, "HFPERCLK.GPIO",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 13, 0, NULL);
+	clk[clk_HFPERCLKVCMP] =3D clk_register_gate(NULL, "HFPERCLK.VCMP",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 14, 0, NULL);
+	clk[clk_HFPERCLKPRS] =3D clk_register_gate(NULL, "HFPERCLK.PRS",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 15, 0, NULL);
+	clk[clk_HFPERCLKADC0] =3D clk_register_gate(NULL, "HFPERCLK.ADC0",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 16, 0, NULL);
+	clk[clk_HFPERCLKDAC0] =3D clk_register_gate(NULL, "HFPERCLK.DAC0",
+			"HFXO", 0, base + CMU_HFPERCLKEN0, 17, 0, NULL);
+
+	return of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+}
+CLK_OF_DECLARE(efm32ggcmu, "efm32gg,cmu", efm32gg_cmu_init);
diff --git a/include/dt-bindings/clock/efm32-cmu.h b/include/dt-binding=
s/clock/efm32-cmu.h
new file mode 100644
index 0000000..b21b91e
--- /dev/null
+++ b/include/dt-bindings/clock/efm32-cmu.h
@@ -0,0 +1,42 @@
+#ifndef __DT_BINDINGS_CLOCK_EFM32_CMU_H
+#define __DT_BINDINGS_CLOCK_EFM32_CMU_H
+
+#define clk_HFXO		0
+#define clk_HFRCO		1
+#define clk_LFXO		2
+#define clk_LFRCO		3
+#define clk_ULFRCO		4
+#define clk_AUXHFRCO		5
+#define clk_HFCLKNODIV		6
+#define clk_HFCLK		7
+#define clk_HFPERCLK		8
+#define clk_HFCORECLK		9
+#define clk_LFACLK		10
+#define clk_LFBCLK		11
+#define clk_WDOGCLK		12
+#define clk_HFCORECLKDMA	13
+#define clk_HFCORECLKAES	14
+#define clk_HFCORECLKUSBC	15
+#define clk_HFCORECLKUSB	16
+#define clk_HFCORECLKLE		17
+#define clk_HFCORECLKEBI	18
+#define clk_HFPERCLKUSART0	19
+#define clk_HFPERCLKUSART1	20
+#define clk_HFPERCLKUSART2	21
+#define clk_HFPERCLKUART0	22
+#define clk_HFPERCLKUART1	23
+#define clk_HFPERCLKTIMER0	24
+#define clk_HFPERCLKTIMER1	25
+#define clk_HFPERCLKTIMER2	26
+#define clk_HFPERCLKTIMER3	27
+#define clk_HFPERCLKACMP0	28
+#define clk_HFPERCLKACMP1	29
+#define clk_HFPERCLKI2C0	30
+#define clk_HFPERCLKI2C1	31
+#define clk_HFPERCLKGPIO	32
+#define clk_HFPERCLKVCMP	33
+#define clk_HFPERCLKPRS		34
+#define clk_HFPERCLKADC0	35
+#define clk_HFPERCLKDAC0	36
+
+#endif /* __DT_BINDINGS_CLOCK_EFM32_CMU_H */
--=20
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
