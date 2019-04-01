Return-Path: <SRS0=O27d=SD=gmail.com=shubhrajyoti.datta@kernel.org>
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCH 2/2] serial: uartps: Add support for nomodem
Date: Mon, 1 Apr 2019 22:07:20 +0530
Message-ID: <1554136640-25194-3-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1554136640-25194-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1554136640-25194-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, gregkh@linuxfoundation.org, jslaby@suse.com, robh+dt@kernel.org, linux-serial@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Having modem control is configurable. Add support for the same by
adding a nomodem property.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/tty/serial/xilinx_uartps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index 9a7f943..3138d7e 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -193,6 +193,7 @@ struct cdns_uart {
 	int			id;
 	struct notifier_block	clk_rate_change_nb;
 	u32			quirks;
+	bool nomodem;
 };
 struct cdns_platform_data {
 	u32 quirks;
@@ -1004,6 +1005,11 @@ static void cdns_uart_config_port(struct uart_port *port, int flags)
  */
 static unsigned int cdns_uart_get_mctrl(struct uart_port *port)
 {
+	struct cdns_uart *cdns_uart_data = port->private_data;
+
+	if (cdns_uart_data->nomodem)
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
+	if (cdns_uart_data->nomodem)
+		return;
 
 	val = readl(port->membase + CDNS_UART_MODEMCR);
 	mode_reg = readl(port->membase + CDNS_UART_MR);
@@ -1669,6 +1679,8 @@ static int cdns_uart_probe(struct platform_device *pdev)
 		console_port = NULL;
 #endif
 
+	cdns_uart_data->nomodem = of_property_read_bool(pdev->dev.of_node,
+							"xlnx,uart-nomodem");
 	return 0;
 
 err_out_pm_disable:
-- 
2.1.1
