From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: [PATCHv2] Add devicetree support to altera_jtaguart
Date: Thu, 13 Jan 2011 02:18:55 +0100
Message-ID: <4D2E52FF.5060102@home.nl>
References: <4D2E287B.7000005@home.nl>
	<20110112230607.GA31712@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010708010905090801030303"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110112230607.GA31712-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------010708010905090801030303
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch adds devicetree support to the altera_jtaguart driver.
Tested on hardware on the nios2 architecture.

  


--------------010708010905090801030303
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="altera_jtaguart_fdt.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="altera_jtaguart_fdt.patch"

diff --git a/drivers/serial/altera_jtaguart.c b/drivers/serial/altera_jtaguart.c
index f9b49b5..238348e 100644
--- a/drivers/serial/altera_jtaguart.c
+++ b/drivers/serial/altera_jtaguart.c
@@ -433,15 +433,33 @@ static int __devinit altera_jtaguart_probe(struct platform_device *pdev)
 	struct uart_port *port;
 	int i;
 
-	for (i = 0; i < ALTERA_JTAGUART_MAXPORTS && platp[i].mapbase; i++) {
+	for (i = 0; i < ALTERA_JTAGUART_MAXPORTS; i++) {
 		port = &altera_jtaguart_ports[i].port;
 
+		if(platp)
+		{
+			if(!platp[i].mapbase)
+				break;
+
+			port->mapbase = platp[i].mapbase;
+			port->irq = platp[i].irq;
+		} else {
+#ifdef CONFIG_OF
+			struct resource *res_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+			struct resource *res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+			if((!res_mem) || (!res_irq))
+				break;
+
+			port->mapbase = res_mem->start;
+			port->irq = res_irq->start;
+#else
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
 
@@ -464,6 +482,15 @@ static int __devexit altera_jtaguart_remove(struct platform_device *pdev)
 
 	return 0;
 }
+#ifdef CONFIG_OF
+static struct of_device_id altera_jtaguart_match[] = {
+	{ 
+		.compatible = "altera,altera_juart",
+	},
+	{},
+}
+MODULE_DEVICE_TABLE(of, altera_jtaguart_match);
+#endif /* CONFIG_OF */
 
 static struct platform_driver altera_jtaguart_platform_driver = {
 	.probe	= altera_jtaguart_probe,
@@ -471,6 +498,9 @@ static struct platform_driver altera_jtaguart_platform_driver = {
 	.driver	= {
 		.name	= DRV_NAME,
 		.owner	= THIS_MODULE,
+#ifdef CONFIG_OF
+		.of_match_table = altera_jtaguart_match,
+#endif
 	},
 };
 

--------------010708010905090801030303
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--------------010708010905090801030303--
