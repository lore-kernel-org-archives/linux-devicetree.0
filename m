From: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 3/3] serial/imx: parse from device tree support
Date: Fri, 18 Feb 2011 16:12:10 +0800
Message-ID: <1298016730-22761-4-git-send-email-r64343@freescale.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1298016730-22761-1-git-send-email-r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/tty/serial/imx.c |   81 ++++++++++++++++++++++++++++++++++++++++------
 1 files changed, 71 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
old mode 100644
new mode 100755
index dfcf4b1..3388599
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -52,6 +52,10 @@
 #include <asm/irq.h>
 #include <mach/hardware.h>
 #include <mach/imx-uart.h>
+#ifdef CONFIG_OF
+#include <linux/of.h>
+#include <linux/of_address.h>
+#endif /* CONFIG_OF */
 
 /* Register definitions */
 #define URXD0 0x0  /* Receiver Register */
@@ -1224,6 +1228,54 @@ static int serial_imx_resume(struct platform_device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static int serial_imx_probe_dt(struct imx_port *sport,
+		struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	static int line;
+
+	if (!node)
+		return -ENODEV;
+
+	if (of_get_property(node, "rts-cts", NULL))
+		sport->have_rtscts = 1;
+
+#ifdef CONFIG_IRDA
+	if (of_get_property(node, "irda", NULL))
+		sport->use_irda = 1;
+#endif
+	sport->port.line = line++;
+
+	return 0;
+}
+#else
+static int serial_imx_probe_dt(struct imx_port *sport,
+		struct platform_device *pdev)
+{
+	return -ENODEV;
+}
+#endif
+
+static int serial_imx_probe_pdata(struct imx_port *sport,
+		struct platform_device *pdev)
+{
+	struct imxuart_platform_data *pdata = pdev->dev.platform_data;
+
+	if (!pdata)
+		return 0;
+
+	if (pdata->flags & IMXUART_HAVE_RTSCTS)
+		sport->have_rtscts = 1;
+
+#ifdef CONFIG_IRDA
+	if (pdata->flags & IMXUART_IRDA)
+		sport->use_irda = 1;
+#endif
+	sport->port.line = pdev->id;
+
+	return 0;
+}
 static int serial_imx_probe(struct platform_device *pdev)
 {
 	struct imx_port *sport;
@@ -1236,6 +1288,12 @@ static int serial_imx_probe(struct platform_device *pdev)
 	if (!sport)
 		return -ENOMEM;
 
+	ret = serial_imx_probe_dt(sport, pdev);
+	if (ret == -ENODEV)
+		ret = serial_imx_probe_pdata(sport, pdev);
+	if (ret)
+		goto free;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		ret = -ENODEV;
@@ -1260,7 +1318,6 @@ static int serial_imx_probe(struct platform_device *pdev)
 	sport->port.fifosize = 32;
 	sport->port.ops = &imx_pops;
 	sport->port.flags = UPF_BOOT_AUTOCONF;
-	sport->port.line = pdev->id;
 	init_timer(&sport->timer);
 	sport->timer.function = imx_timeout;
 	sport->timer.data     = (unsigned long)sport;
@@ -1274,17 +1331,13 @@ static int serial_imx_probe(struct platform_device *pdev)
 
 	sport->port.uartclk = clk_get_rate(sport->clk);
 
-	imx_ports[pdev->id] = sport;
+	if (imx_ports[sport->port.line]) {
+		ret = -EBUSY;
+		goto clkput;
+	}
+	imx_ports[sport->port.line] = sport;
 
 	pdata = pdev->dev.platform_data;
-	if (pdata && (pdata->flags & IMXUART_HAVE_RTSCTS))
-		sport->have_rtscts = 1;
-
-#ifdef CONFIG_IRDA
-	if (pdata && (pdata->flags & IMXUART_IRDA))
-		sport->use_irda = 1;
-#endif
-
 	if (pdata && pdata->init) {
 		ret = pdata->init(pdev);
 		if (ret)
@@ -1336,6 +1389,11 @@ static int serial_imx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id imx_uart_matches[] = {
+	{ .compatible = "imx-uart" },
+	{},
+};
+
 static struct platform_driver serial_imx_driver = {
 	.probe		= serial_imx_probe,
 	.remove		= serial_imx_remove,
@@ -1345,6 +1403,9 @@ static struct platform_driver serial_imx_driver = {
 	.driver		= {
 		.name	= "imx-uart",
 		.owner	= THIS_MODULE,
+#if defined(CONFIG_OF)
+		.of_match_table = imx_uart_matches,
+#endif
 	},
 };
 
-- 
1.7.0.4
