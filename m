Return-Path: <SRS0=/YiW=SE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr740087.outbound.protection.outlook.com ([40.107.74.87]:18608
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725778AbfDBFGj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 2 Apr 2019 01:06:39 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv2 2/2] serial: uartps: Add support for nortscts
Date: Tue, 2 Apr 2019 10:36:18 +0530
Message-ID: <1554181578-13362-3-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1554181578-13362-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1554181578-13362-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Having modem control is configurable. Add support for the same by
adding a nortscts property.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/tty/serial/xilinx_uartps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index 9a7f943..1035339 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -193,6 +193,7 @@ struct cdns_uart {
 	int			id;
 	struct notifier_block	clk_rate_change_nb;
 	u32			quirks;
+	bool nortscts;
 };
 struct cdns_platform_data {
 	u32 quirks;
@@ -1004,6 +1005,11 @@ static void cdns_uart_config_port(struct uart_port *port, int flags)
  */
 static unsigned int cdns_uart_get_mctrl(struct uart_port *port)
 {
+	struct cdns_uart *cdns_uart_data = port->private_data;
+
+	if (cdns_uart_data->nortscts)
+		return 0;
+
 	return TIOCM_CTS | TIOCM_DSR | TIOCM_CAR;
 }
 
@@ -1011,6 +1017,10 @@ static void cdns_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
 	u32 val;
 	u32 mode_reg;
+	struct cdns_uart *cdns_uart_data = port->private_data;
+
+	if (cdns_uart_data->nortscts)
+		return;
 
 	val = readl(port->membase + CDNS_UART_MODEMCR);
 	mode_reg = readl(port->membase + CDNS_UART_MR);
@@ -1669,6 +1679,8 @@ static int cdns_uart_probe(struct platform_device *pdev)
 		console_port = NULL;
 #endif
 
+	cdns_uart_data->nortscts = of_property_read_bool(pdev->dev.of_node,
+							 "xlnx,uart-nortscts");
 	return 0;
 
 err_out_pm_disable:
-- 
2.1.1
