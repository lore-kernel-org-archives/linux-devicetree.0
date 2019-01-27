Return-Path: <SRS0=/1s5=QD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42509 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbfA0BES (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 26 Jan 2019 20:04:18 -0500
Received: by mail-lj1-f193.google.com with SMTP id l15-v6so11342137lja.9
        for <devicetree@vger.kernel.org>; Sat, 26 Jan 2019 17:04:17 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] serial: 8250: Add OF support for Xscale variant
Date: Sun, 27 Jan 2019 02:04:04 +0100
Message-Id: <20190127010404.7668-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This adds support for device tree probing for the Intel
Xscale 8250 variant needed to support device tree on
the Intel IXP4xx platforms.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250.txt | 1 +
 drivers/tty/serial/8250/8250_of.c                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
index da50321da34d..3cba12f855b7 100644
--- a/Documentation/devicetree/bindings/serial/8250.txt
+++ b/Documentation/devicetree/bindings/serial/8250.txt
@@ -21,6 +21,7 @@ Required properties:
 	- "altr,16550-FIFO128"
 	- "fsl,16550-FIFO64"
 	- "fsl,ns16550"
+	- "intel,xscale-uart"
 	- "ti,da830-uart"
 	- "aspeed,ast2400-vuart"
 	- "aspeed,ast2500-vuart"
diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index a1a85805d010..17da8af36aa1 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -327,6 +327,7 @@ static const struct of_device_id of_platform_serial_table[] = {
 	{ .compatible = "nvidia,tegra20-uart", .data = (void *)PORT_TEGRA, },
 	{ .compatible = "nxp,lpc3220-uart", .data = (void *)PORT_LPC3220, },
 	{ .compatible = "ralink,rt2880-uart", .data = (void *)PORT_RT2880, },
+	{ .compatible = "intel,xscale-uart", .data = (void *)PORT_XSCALE, },
 	{ .compatible = "altr,16550-FIFO32",
 		.data = (void *)PORT_ALTR_16550_F32, },
 	{ .compatible = "altr,16550-FIFO64",
-- 
2.20.1
