Return-Path: <SRS0=HrxS=KF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-sn1nam01on0049.outbound.protection.outlook.com ([104.47.32.49]:4730
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727678AbeGUMmi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 21 Jul 2018 08:42:38 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCHv5 3/4] tty: serial: uartlite: Add support for suspend and resume
Date: Sat, 21 Jul 2018 17:19:06 +0530
Message-ID: <1532173747-19115-4-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1532173747-19115-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1532173747-19115-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org, shubhrajyoti.datta@gmail.com, robh+dt@kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add suspend and resume handlers for uartlite

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
patch added
v3- v5:
No change

 drivers/tty/serial/uartlite.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index b3a12be..98d3ead 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -690,9 +690,44 @@ static int ulite_release(struct device *dev)
 	return rc;
 }
 
+/**
+ * ulite_suspend - Stop the device.
+ *
+ * @dev: handle to the device structure.
+ * Return: 0 always.
+ */
+static int __maybe_unused ulite_suspend(struct device *dev)
+{
+	struct uart_port *port = dev_get_drvdata(dev);
+
+	if (port)
+		uart_suspend_port(&ulite_uart_driver, port);
+
+	return 0;
+}
+
+/**
+ * ulite_resume - Resume the device.
+ *
+ * @dev: handle to the device structure.
+ * Return: 0 on success, errno otherwise.
+ */
+static int __maybe_unused ulite_resume(struct device *dev)
+{
+	struct uart_port *port = dev_get_drvdata(dev);
+
+	if (port)
+		uart_resume_port(&ulite_uart_driver, port);
+
+	return 0;
+}
+
 /* ---------------------------------------------------------------------
  * Platform bus binding
  */
+
+static SIMPLE_DEV_PM_OPS(ulite_pm_ops, ulite_suspend, ulite_resume);
+
 #if defined(CONFIG_OF)
 /* Match table for of_platform binding */
 static const struct of_device_id ulite_of_match[] = {
@@ -768,6 +803,7 @@ static struct platform_driver ulite_platform_driver = {
 	.driver = {
 		.name  = "uartlite",
 		.of_match_table = of_match_ptr(ulite_of_match),
+		.pm = &ulite_pm_ops,
 	},
 };
 
-- 
2.7.4

