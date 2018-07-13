Return-Path: <SRS0=0z1H=J5=gmail.com=shubhrajyoti.datta@kernel.org>
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv2 3/5] tty: serial: uartlite: Add clock adaptation
Date: Fri, 13 Jul 2018 16:00:08 +0530
Message-ID: <1531477810-23346-3-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1531477810-23346-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1531477810-23346-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, jacmet@sunsite.dk, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add support of Common Clock Framework for uartlite driver.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/tty/serial/uartlite.c | 49 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 0f798f7..b3a12be 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -21,6 +21,7 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
+#include <linux/clk.h>
 
 #define ULITE_NAME		"ttyUL"
 #define ULITE_MAJOR		204
@@ -56,6 +57,7 @@
 
 struct uartlite_data {
 	const struct uartlite_reg_ops *reg_ops;
+	struct clk *clk;
 };
 
 struct uartlite_reg_ops {
@@ -261,8 +263,15 @@ static void ulite_break_ctl(struct uart_port *port, int ctl)
 
 static int ulite_startup(struct uart_port *port)
 {
+	struct uartlite_data *pdata = port->private_data;
 	int ret;
 
+	ret = clk_enable(pdata->clk);
+	if (ret) {
+		dev_err(port->dev, "Failed to enable clock\n");
+		return ret;
+	}
+
 	ret = request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGER_RISING,
 			  "uartlite", port);
 	if (ret)
@@ -277,9 +286,12 @@ static int ulite_startup(struct uart_port *port)
 
 static void ulite_shutdown(struct uart_port *port)
 {
+	struct uartlite_data *pdata = port->private_data;
+
 	uart_out32(0, ULITE_CONTROL, port);
 	uart_in32(ULITE_CONTROL, port); /* dummy */
 	free_irq(port->irq, port);
+	clk_disable(pdata->clk);
 }
 
 static void ulite_set_termios(struct uart_port *port, struct ktermios *termios,
@@ -370,6 +382,17 @@ static int ulite_verify_port(struct uart_port *port, struct serial_struct *ser)
 	return -EINVAL;
 }
 
+static void ulite_pm(struct uart_port *port, unsigned int state,
+		     unsigned int oldstate)
+{
+	struct uartlite_data *pdata = port->private_data;
+
+	if (!state)
+		clk_enable(pdata->clk);
+	else
+		clk_disable(pdata->clk);
+}
+
 #ifdef CONFIG_CONSOLE_POLL
 static int ulite_get_poll_char(struct uart_port *port)
 {
@@ -405,6 +428,7 @@ static const struct uart_ops ulite_ops = {
 	.request_port	= ulite_request_port,
 	.config_port	= ulite_config_port,
 	.verify_port	= ulite_verify_port,
+	.pm		= ulite_pm,
 #ifdef CONFIG_CONSOLE_POLL
 	.poll_get_char	= ulite_get_poll_char,
 	.poll_put_char	= ulite_put_poll_char,
@@ -669,7 +693,6 @@ static int ulite_release(struct device *dev)
 /* ---------------------------------------------------------------------
  * Platform bus binding
  */
-
 #if defined(CONFIG_OF)
 /* Match table for of_platform binding */
 static const struct of_device_id ulite_of_match[] = {
@@ -684,7 +707,7 @@ static int ulite_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct uartlite_data *pdata;
-	int irq;
+	int irq, ret;
 	int id = pdev->id;
 #ifdef CONFIG_OF
 	const __be32 *prop;
@@ -706,11 +729,33 @@ static int ulite_probe(struct platform_device *pdev)
 	if (irq <= 0)
 		return -ENXIO;
 
+	pdata->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
+	if (IS_ERR(pdata->clk)) {
+		if (PTR_ERR(pdata->clk) != -ENOENT)
+			return PTR_ERR(pdata->clk);
+
+		/*
+		 * Clock framework support is optional, continue on
+		 * anyways if we don't find a matching clock.
+		 */
+		pdata->clk = NULL;
+	}
+
+	ret = clk_prepare(pdata->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to prepare clock\n");
+		return ret;
+	}
+
 	return ulite_assign(&pdev->dev, id, res->start, irq, pdata);
 }
 
 static int ulite_remove(struct platform_device *pdev)
 {
+	struct uart_port *port = dev_get_drvdata(&pdev->dev);
+	struct uartlite_data *pdata = port->private_data;
+
+	clk_disable_unprepare(pdata->clk);
 	return ulite_release(&pdev->dev);
 }
 
-- 
2.7.4
