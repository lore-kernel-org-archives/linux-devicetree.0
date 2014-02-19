From: klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org
Subject: [PATCH v6 2/4] Power: Reset: Generalize qnap-poweroff to work on Synology devices.
Date: Thu, 20 Feb 2014 04:59:12 +1000
Message-ID: <1392836354-28886-3-git-send-email-klightspeed@killerwolves.net>
References: <1392836354-28886-1-git-send-email-klightspeed@killerwolves.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392836354-28886-1-git-send-email-klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

The Synology NAS devices use a very similar mechanism to QNAP NAS
devices to power off. Both send a single charactor command to a PIC,
over the second serial port. However the baud rate and the command
differ. Generalize the driver to support this.

Signed-off-by: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
---
 .../bindings/power_supply/qnap-poweroff.txt        |  5 ++-
 drivers/power/reset/qnap-poweroff.c                | 49 ++++++++++++++++------
 2 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt b/Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt
index 0347d83..af25e77 100644
--- a/Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt
+++ b/Documentation/devicetree/bindings/power_supply/qnap-poweroff.txt
@@ -6,8 +6,11 @@ Orion5x SoCs. Sending the character 'A', at 19200 baud, tells the
 microcontroller to turn the power off. This driver adds a handler to
 pm_power_off which is called to turn the power off.
 
+Synology NAS devices use a similar scheme, but a different baud rate,
+9600, and a different character, '1'.
+
 Required Properties:
-- compatible: Should be "qnap,power-off"
+- compatible: Should be "qnap,power-off" or "synology,power-off"
 
 - reg: Address and length of the register set for UART1
 - clocks: tclk clock
diff --git a/drivers/power/reset/qnap-poweroff.c b/drivers/power/reset/qnap-poweroff.c
index 37f56f7..a75db7f 100644
--- a/drivers/power/reset/qnap-poweroff.c
+++ b/drivers/power/reset/qnap-poweroff.c
@@ -1,5 +1,5 @@
 /*
- * QNAP Turbo NAS Board power off
+ * QNAP Turbo NAS Board power off. Can also be used on Synology devices.
  *
  * Copyright (C) 2012 Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
  *
@@ -25,17 +25,43 @@
 
 #define UART1_REG(x)	(base + ((UART_##x) << 2))
 
+struct power_off_cfg {
+	u32 baud;
+	char cmd;
+};
+
+static const struct power_off_cfg qnap_power_off_cfg = {
+	.baud = 19200,
+	.cmd = 'A',
+};
+
+static const struct power_off_cfg synology_power_off_cfg = {
+	.baud = 9600,
+	.cmd = '1',
+};
+
+static const struct of_device_id qnap_power_off_of_match_table[] = {
+	{ .compatible = "qnap,power-off",
+	  .data = &qnap_power_off_cfg,
+	},
+	{ .compatible = "synology,power-off",
+	  .data = &synology_power_off_cfg,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, qnap_power_off_of_match_table);
+
 static void __iomem *base;
 static unsigned long tclk;
+static const struct power_off_cfg *cfg;
 
 static void qnap_power_off(void)
 {
-	/* 19200 baud divisor */
-	const unsigned divisor = ((tclk + (8 * 19200)) / (16 * 19200));
+	const unsigned divisor = ((tclk + (8 * cfg->baud)) / (16 * cfg->baud));
 
 	pr_err("%s: triggering power-off...\n", __func__);
 
-	/* hijack UART1 and reset into sane state (19200,8n1) */
+	/* hijack UART1 and reset into sane state */
 	writel(0x83, UART1_REG(LCR));
 	writel(divisor & 0xff, UART1_REG(DLL));
 	writel((divisor >> 8) & 0xff, UART1_REG(DLM));
@@ -44,16 +70,21 @@ static void qnap_power_off(void)
 	writel(0x00, UART1_REG(FCR));
 	writel(0x00, UART1_REG(MCR));
 
-	/* send the power-off command 'A' to PIC */
-	writel('A', UART1_REG(TX));
+	/* send the power-off command to PIC */
+	writel(cfg->cmd, UART1_REG(TX));
 }
 
 static int qnap_power_off_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct resource *res;
 	struct clk *clk;
 	char symname[KSYM_NAME_LEN];
 
+	const struct of_device_id *match =
+		of_match_node(qnap_power_off_of_match_table, np);
+	cfg = match->data;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "Missing resource");
@@ -94,12 +125,6 @@ static int qnap_power_off_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id qnap_power_off_of_match_table[] = {
-	{ .compatible = "qnap,power-off", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, qnap_power_off_of_match_table);
-
 static struct platform_driver qnap_power_off_driver = {
 	.probe	= qnap_power_off_probe,
 	.remove	= qnap_power_off_remove,
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
