From: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/7] Serial: Samsung: Fix uart clock init order The clk_get API
	returns -ENOENT when invoked from s3c24xx_serial_initconsole. This
	happens
	since the serial_console gets registered before the platform driver is
	registered.Defer the call to clk_get to s3c24xx_serial_probe so that
	the API returns a valid clock. Signed-off-by: Shaju Abraham
	<shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Mon, 20 Sep 2010 15:49:23 +0530
Message-ID: <1284977963-30717-1-git-send-email-shaju.abraham@linaro.org>
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

---
 drivers/serial/samsung.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
index a9d6c56..4c5eea0 100644
--- a/drivers/serial/samsung.c
+++ b/drivers/serial/samsung.c
@@ -1110,7 +1110,6 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 	if (ret > 0)
 		ourport->tx_irq = ret;
 
-	ourport->clk	= clk_get(&platdev->dev, "uart");
 
 	dbg("port: map=%08x, mem=%08x, irq=%d (%d,%d), clock=%ld\n",
 	    port->mapbase, port->membase, port->irq,
@@ -1154,6 +1153,7 @@ int s3c24xx_serial_probe(struct platform_device *dev,
 	if (ret < 0)
 		goto probe_err;
 
+	ourport->clk	= clk_get(&dev->dev, "uart");
 	dbg("%s: adding port\n", __func__);
 	uart_add_one_port(&s3c24xx_uart_drv, &ourport->port);
 	platform_set_drvdata(dev, &ourport->port);
-- 
1.7.2
