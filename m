Return-Path: <SRS0=K2f+=KA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr690071.outbound.protection.outlook.com ([40.107.69.71]:46586
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726343AbeGPFxs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Jul 2018 01:53:48 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv3 1/4] tty: serial: uartlite: Add structure for private data
Date: Mon, 16 Jul 2018 10:53:51 +0530
Message-ID: <1531718634-17939-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, jacmet@sunsite.dk, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Tanvi Desai <tanvi.desai@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add struct uartlite_data, to store the private data of the Uartlite
driver.

Signed-off-by: Tanvi Desai <tanvi.desai@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/tty/serial/uartlite.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index c47db78..0f798f7 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -54,6 +54,10 @@
 #define ULITE_CONTROL_RST_RX	0x02
 #define ULITE_CONTROL_IE	0x10
 
+struct uartlite_data {
+	const struct uartlite_reg_ops *reg_ops;
+};
+
 struct uartlite_reg_ops {
 	u32 (*in)(void __iomem *addr);
 	void (*out)(u32 val, void __iomem *addr);
@@ -91,16 +95,16 @@ static const struct uartlite_reg_ops uartlite_le = {
 
 static inline u32 uart_in32(u32 offset, struct uart_port *port)
 {
-	const struct uartlite_reg_ops *reg_ops = port->private_data;
+	struct uartlite_data *pdata = port->private_data;
 
-	return reg_ops->in(port->membase + offset);
+	return pdata->reg_ops->in(port->membase + offset);
 }
 
 static inline void uart_out32(u32 val, u32 offset, struct uart_port *port)
 {
-	const struct uartlite_reg_ops *reg_ops = port->private_data;
+	struct uartlite_data *pdata = port->private_data;
 
-	reg_ops->out(val, port->membase + offset);
+	pdata->reg_ops->out(val, port->membase + offset);
 }
 
 static struct uart_port ulite_ports[ULITE_NR_UARTS];
@@ -325,6 +329,7 @@ static void ulite_release_port(struct uart_port *port)
 
 static int ulite_request_port(struct uart_port *port)
 {
+	struct uartlite_data *pdata = port->private_data;
 	int ret;
 
 	pr_debug("ulite console: port=%p; port->mapbase=%llx\n",
@@ -342,13 +347,13 @@ static int ulite_request_port(struct uart_port *port)
 		return -EBUSY;
 	}
 
-	port->private_data = (void *)&uartlite_be;
+	pdata->reg_ops = &uartlite_be;
 	ret = uart_in32(ULITE_CONTROL, port);
 	uart_out32(ULITE_CONTROL_RST_TX, ULITE_CONTROL, port);
 	ret = uart_in32(ULITE_STATUS, port);
 	/* Endianess detection */
 	if ((ret & ULITE_STATUS_TXEMPTY) != ULITE_STATUS_TXEMPTY)
-		port->private_data = (void *)&uartlite_le;
+		pdata->reg_ops = &uartlite_le;
 
 	return 0;
 }
@@ -585,10 +590,12 @@ static struct uart_driver ulite_uart_driver = {
  * @id: requested id number.  Pass -1 for automatic port assignment
  * @base: base address of uartlite registers
  * @irq: irq number for uartlite
+ * @pdata: private data for uartlite
  *
  * Returns: 0 on success, <0 otherwise
  */
-static int ulite_assign(struct device *dev, int id, u32 base, int irq)
+static int ulite_assign(struct device *dev, int id, u32 base, int irq,
+			struct uartlite_data *pdata)
 {
 	struct uart_port *port;
 	int rc;
@@ -625,6 +632,7 @@ static int ulite_assign(struct device *dev, int id, u32 base, int irq)
 	port->dev = dev;
 	port->type = PORT_UNKNOWN;
 	port->line = id;
+	port->private_data = pdata;
 
 	dev_set_drvdata(dev, port);
 
@@ -675,6 +683,7 @@ MODULE_DEVICE_TABLE(of, ulite_of_match);
 static int ulite_probe(struct platform_device *pdev)
 {
 	struct resource *res;
+	struct uartlite_data *pdata;
 	int irq;
 	int id = pdev->id;
 #ifdef CONFIG_OF
@@ -684,6 +693,10 @@ static int ulite_probe(struct platform_device *pdev)
 	if (prop)
 		id = be32_to_cpup(prop);
 #endif
+	pdata = devm_kzalloc(&pdev->dev, sizeof(struct uartlite_data),
+			     GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -693,7 +706,7 @@ static int ulite_probe(struct platform_device *pdev)
 	if (irq <= 0)
 		return -ENXIO;
 
-	return ulite_assign(&pdev->dev, id, res->start, irq);
+	return ulite_assign(&pdev->dev, id, res->start, irq, pdata);
 }
 
 static int ulite_remove(struct platform_device *pdev)
-- 
2.7.4

