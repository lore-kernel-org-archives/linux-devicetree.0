From: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 7/7] Samsung: Probe the serial driver using Device tree.
Date: Mon, 20 Sep 2010 15:50:18 +0530
Message-ID: <1284978018-30867-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

 Added the match table for probing the serial devices from the device tree.
 Serial/samsung.c file is modified to support OF probing .Get the platform data
 from the static array as done in the case of  s3c24xx_serial_init_port.Also the
 clock API (clk_get) might fail if platform  id remains at -1.Since the
 struct device information is passed to the uart_add_one_port, get the struct device
 from the platform_device passed to the probe routine by the device tree probing.

Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/plat-samsung/init.c |    3 ++-
 drivers/serial/s5pv210.c     |   16 ++++++++++++++--
 drivers/serial/samsung.c     |   10 +++++++++-
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index 6790edf..2c58acd 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -152,8 +152,9 @@ static int __init s3c_arch_init(void)
 	ret = (cpu->init)();
 	if (ret != 0)
 		return ret;
-
+#ifndef CONFIG_USE_OF
 	ret = platform_add_devices(s3c24xx_uart_devs, nr_uarts);
+#endif /*CONFIG_USE_OF*/
 	return ret;
 }
 
diff --git a/drivers/serial/s5pv210.c b/drivers/serial/s5pv210.c
index 4a789e5..7f8bd18 100644
--- a/drivers/serial/s5pv210.c
+++ b/drivers/serial/s5pv210.c
@@ -119,15 +119,27 @@ static int s5p_serial_probe(struct platform_device *pdev)
 	return s3c24xx_serial_probe(pdev, s5p_uart_inf[pdev->id]);
 }
 
+#ifdef CONFIG_USE_OF
+static struct of_device_id s5p_uart_matches[] = {
+	{	.compatible = "samsung,s5pv210-uart_sh"},
+		{},
+	};
+#endif /*CONFIG_USE_OF*/
+
 static struct platform_driver s5p_serial_driver = {
 	.probe		= s5p_serial_probe,
 	.remove		= __devexit_p(s3c24xx_serial_remove),
 	.driver		= {
-		.name	= "s5pv210-uart",
-		.owner	= THIS_MODULE,
+	.name		= "s5pv210-uart",
+	.owner		= THIS_MODULE,
+#ifdef CONFIG_USE_OF
+	.of_match_table	= s5p_uart_matches,
+
+#endif /*CONFIG_USE_OF */
 	},
 };
 
+
 static int __init s5pv210_serial_console_init(void)
 {
 	return s3c24xx_serial_initconsole(&s5p_serial_driver, s5p_uart_inf);
diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
index 4c5eea0..317bd08 100644
--- a/drivers/serial/samsung.c
+++ b/drivers/serial/samsung.c
@@ -1059,7 +1059,6 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 		return -ENODEV;
 
 	cfg = s3c24xx_dev_to_cfg(&platdev->dev);
-
 	if (port->mapbase != 0)
 		return 0;
 
@@ -1145,6 +1144,15 @@ int s3c24xx_serial_probe(struct platform_device *dev,
 	dbg("s3c24xx_serial_probe(%p, %p) %d\n", dev, info, probe_index);
 
 	ourport = &s3c24xx_serial_ports[probe_index];
+
+#ifdef CONFIG_USE_OF
+	struct uart_port *port = &ourport->port;
+	dev->id = probe_index;
+	dev->dev.platform_data =
+			s3c24xx_uart_devs[probe_index]->dev.platform_data;
+	port->dev       = &dev->dev;
+#endif /*CONFIG_USE_OF */
+
 	probe_index++;
 
 	dbg("%s: initialising port %p...\n", __func__, ourport);
-- 
1.7.2
