From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 02/12] clocksource: sti: Provide support for the ST LPC Clocksource IP
Date: Thu,  7 May 2015 14:38:34 +0100
Message-ID: <1431005924-21777-3-git-send-email-lee.jones@linaro.org>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431005924-21777-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This IP is shared with Watchdog and RTC functionality.  Only one of
these IPs can be used at the same time.  We use the device-driver
model combined with a DT 'mode' property to enforce this.

The ST LPC Clocksource IP can be used as the system (tick) timer.

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clocksource/Kconfig         |   8 +++
 drivers/clocksource/Makefile        |   1 +
 drivers/clocksource/clksrc_st_lpc.c | 123 ++++++++++++++++++++++++++++=
++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 drivers/clocksource/clksrc_st_lpc.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 68161f7..ac424cf 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -250,4 +250,12 @@ config CLKSRC_PXA
 	help
 	  This enables OST0 support available on PXA and SA-11x0
 	  platforms.
+
+config CLKSRC_ST_LPC
+	bool
+	depends on ARCH_STI
+	select CLKSRC_OF if OF
+	help
+	  Enable this option to use the Low Power controller timer
+	  as clocksource.
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefil=
e
index 752d5c7..e08da4d 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -51,3 +51,4 @@ obj-$(CONFIG_ARCH_INTEGRATOR_AP)	+=3D timer-integrato=
r-ap.o
 obj-$(CONFIG_CLKSRC_VERSATILE)		+=3D versatile.o
 obj-$(CONFIG_CLKSRC_MIPS_GIC)		+=3D mips-gic-timer.o
 obj-$(CONFIG_ASM9260_TIMER)		+=3D asm9260_timer.o
+obj-$(CONFIG_CLKSRC_ST_LPC)		+=3D clksrc_st_lpc.o
diff --git a/drivers/clocksource/clksrc_st_lpc.c b/drivers/clocksource/=
clksrc_st_lpc.c
new file mode 100644
index 0000000..18a7dcd0
--- /dev/null
+++ b/drivers/clocksource/clksrc_st_lpc.c
@@ -0,0 +1,123 @@
+/*
+ * Clocksource using the Low Power Timer found in the Low Power Contro=
ller (LPC)
+ *
+ * Copyright (C) 2015 STMicroelectronics =E2=80=93 All Rights Reserved
+ *
+ * Author(s): Francesco Virlinzi <francesco.virlinzi-qxv4g6HH51o@public.gmane.org>
+ *	      Ajit Pal Singh <ajitpal.singh-qxv4g6HH51o@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/clk.h>
+#include <linux/clocksource.h>
+#include <linux/init.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/mfd/st-lpc.h>
+
+/* Low Power Timer */
+#define LPC_LPT_LSB_OFF		0x400
+#define LPC_LPT_MSB_OFF		0x404
+#define LPC_LPT_START_OFF	0x408
+
+static struct st_clksrc_ddata {
+	struct clk		*clk;
+	void __iomem		*base;
+} ddata;
+
+static void st_clksrc_reset(void)
+{
+	writel_relaxed(0, ddata.base + LPC_LPT_START_OFF);
+	writel_relaxed(0, ddata.base + LPC_LPT_MSB_OFF);
+	writel_relaxed(0, ddata.base + LPC_LPT_LSB_OFF);
+	writel_relaxed(1, ddata.base + LPC_LPT_START_OFF);
+}
+
+static int __init st_clksrc_init(void)
+{
+	unsigned long rate;
+	int ret;
+
+	st_clksrc_reset();
+
+	rate =3D clk_get_rate(ddata.clk);
+
+	ret =3D clocksource_mmio_init(ddata.base + LPC_LPT_LSB_OFF,
+				    "clksrc-st-lpc", rate, 300, 32,
+				    clocksource_mmio_readl_up);
+	if (ret) {
+		pr_err("clksrc-st-lpc: Failed to register clocksource\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int st_clksrc_setup_clk(struct device_node *np)
+{
+	struct clk *clk;
+	int ret;
+
+	clk =3D of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		pr_err("clksrc-st-lpc: Failed to get LPC clock\n");
+		ret =3D PTR_ERR(clk);
+		return ret;
+	}
+
+	if (clk_prepare_enable(clk)) {
+		pr_err("clksrc-st-lpc: Failed to enable LPC clock\n");
+		return -EINVAL;
+	}
+
+	if (!clk_get_rate(clk)) {
+		pr_err("clksrc-st-lpc: Failed to get LPC clock rate\n");
+		clk_disable_unprepare(clk);
+		return -EINVAL;
+	}
+
+	ddata.clk =3D clk;
+
+	return 0;
+}
+
+static void __init st_clksrc_of_register(struct device_node *np)
+{
+	int ret;
+	uint32_t mode;
+
+	ret =3D of_property_read_u32(np, "st,lpc-mode", &mode);
+	if (ret) {
+		pr_err("clksrc-st-lpc: An LPC mode must be provided\n");
+		return;
+	}
+
+	/* LPC can either run as a Clocksource or in RTC or WDT mode */
+	if (mode !=3D ST_LPC_MODE_CLKSRC)
+		return;
+
+	ddata.base =3D of_iomap(np, 0);
+	if (!ddata.base) {
+		pr_err("clksrc-st-lpc: Unable to map iomem\n");
+		return;
+	}
+
+	if (st_clksrc_setup_clk(np)) {
+		iounmap(ddata.base);
+		return;
+	}
+
+	if (st_clksrc_init()) {
+		iounmap(ddata.base);
+		return;
+	}
+
+	pr_info("clksrc-st-lpc: clocksource initialised - running @ %luHz\n",
+		clk_get_rate(ddata.clk));
+}
+CLOCKSOURCE_OF_DECLARE(ddata, "st,stih407-lpc", st_clksrc_of_register)=
;
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
