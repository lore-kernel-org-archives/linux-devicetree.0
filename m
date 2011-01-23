From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: [PATCH v3] Add devicetree support to altera_jtaguart
Date: Sun, 23 Jan 2011 14:17:27 +0100
Message-ID: <4D3C2A67.6030408@home.nl>
References: <4D2E287B.7000005@home.nl>
	<20110112230607.GA31712@angua.secretlab.ca>
	<4D2E52FF.5060102@home.nl> <20110118173557.48407296@fermion>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000208080208020304020006"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110118173557.48407296@fermion>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tobias Klauser <klto-xXYtEe5Xh1A@public.gmane.org>
Cc: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------000208080208020304020006
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

New version of devicetree patch for altera jtag uart.
Fixed comments in v2 and added version nr as discussed in the altera_ps2 
patch.


--------------000208080208020304020006
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="altera_jtaguart_fdt.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="altera_jtaguart_fdt.patch"

diff --git a/drivers/serial/altera_jtaguart.c b/drivers/serial/altera_jtaguart.c
index f9b49b5..a5902fb 100644
--- a/drivers/serial/altera_jtaguart.c
+++ b/drivers/serial/altera_jtaguart.c
@@ -432,23 +432,47 @@ static int __devinit altera_jtaguart_probe(struct platform_device *pdev)
 	struct altera_jtaguart_platform_uart *platp = pdev->dev.platform_data;
 	struct uart_port *port;
 	int i;
+	int res = 0;
 
-	for (i = 0; i < ALTERA_JTAGUART_MAXPORTS && platp[i].mapbase; i++) {
+	for (i = 0; i < ALTERA_JTAGUART_MAXPORTS; i++) {
 		port = &altera_jtaguart_ports[i].port;
 
+		if(platp)
+		{
+			if(!platp[i].mapbase) {
+				res = -ENODEV;
+				break;
+			}
+			port->mapbase = platp[i].mapbase;
+			port->irq = platp[i].irq;
+		} else {
+#ifdef CONFIG_OF
+			struct resource *res_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+			struct resource *res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+			if((!res_mem) || (!res_irq))
+			{
+				res = -ENODEV;
+				break;
+			}
+
+			port->mapbase = res_mem->start;
+			port->irq = res_irq->start;
+#else
+			res = -ENODEV;
+			break;
+#endif
+		}
 		port->line = i;
 		port->type = PORT_ALTERA_JTAGUART;
-		port->mapbase = platp[i].mapbase;
 		port->membase = ioremap(port->mapbase, ALTERA_JTAGUART_SIZE);
 		port->iotype = SERIAL_IO_MEM;
-		port->irq = platp[i].irq;
 		port->ops = &altera_jtaguart_ops;
 		port->flags = ASYNC_BOOT_AUTOCONF;
 
 		uart_add_one_port(&altera_jtaguart_driver, port);
 	}
 
-	return 0;
+	return res;
 }
 
 static int __devexit altera_jtaguart_remove(struct platform_device *pdev)
@@ -464,6 +488,15 @@ static int __devexit altera_jtaguart_remove(struct platform_device *pdev)
 
 	return 0;
 }
+#ifdef CONFIG_OF
+static struct of_device_id altera_jtaguart_match[] = {
+	{ 
+		.compatible = "altr,juart-1.0",
+	},
+	{},
+}
+MODULE_DEVICE_TABLE(of, altera_jtaguart_match);
+#endif /* CONFIG_OF */
 
 static struct platform_driver altera_jtaguart_platform_driver = {
 	.probe	= altera_jtaguart_probe,
@@ -471,6 +504,9 @@ static struct platform_driver altera_jtaguart_platform_driver = {
 	.driver	= {
 		.name	= DRV_NAME,
 		.owner	= THIS_MODULE,
+#ifdef CONFIG_OF
+		.of_match_table = altera_jtaguart_match,
+#endif
 	},
 };
 

--------------000208080208020304020006
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--------------000208080208020304020006--
