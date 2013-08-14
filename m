Return-Path: <devicetree-owner@vger.kernel.org>
Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]:9029
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760173Ab3HNUe7 (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 14 Aug 2013 16:34:59 -0400
From: <dinguyen@altera.com>
Subject: [PATCHv2 2/2] dts: Deprecate ALTR as a vendor prefix
Date: Wed, 14 Aug 2013 15:34:47 -0500
Message-ID: <1376512487-12002-2-git-send-email-dinguyen@altera.com>
In-Reply-To: <1376512487-12002-1-git-send-email-dinguyen@altera.com>
References: <1376512487-12002-1-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: dinh.linux@gmail.com
Cc: Dinh Nguyen <dinguyen@altera.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Dinh Nguyen <dinguyen@altera.com>

Deprecate the vendor prefix "ALTR" in place of "altr" for Altera Corp..

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Ian Campbell <ian.campbell@citrix.com>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/serial/altera_jtaguart.txt |    3 ++-
 .../devicetree/bindings/serial/altera_uart.txt     |    3 ++-
 .../devicetree/bindings/serio/altera_ps2.txt       |    3 ++-
 .../devicetree/bindings/spi/spi_altera.txt         |    3 ++-
 drivers/input/serio/altera_ps2.c                   |    1 +
 drivers/spi/spi-altera.c                           |    1 +
 drivers/tty/serial/altera_jtaguart.c               |    1 +
 drivers/tty/serial/altera_uart.c                   |    1 +
 8 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/altera_jtaguart.txt b/Documentation/devicetree/bindings/serial/altera_jtaguart.txt
index c152f65..55a9010 100644
--- a/Documentation/devicetree/bindings/serial/altera_jtaguart.txt
+++ b/Documentation/devicetree/bindings/serial/altera_jtaguart.txt
@@ -1,4 +1,5 @@
 Altera JTAG UART
 
 Required properties:
-- compatible : should be "ALTR,juart-1.0"
+- compatible : should be "ALTR,juart-1.0" <DEPRECATED>
+- compatible : should be "altr,juart-1.0"
diff --git a/Documentation/devicetree/bindings/serial/altera_uart.txt b/Documentation/devicetree/bindings/serial/altera_uart.txt
index 71cae3f..81bf7ff 100644
--- a/Documentation/devicetree/bindings/serial/altera_uart.txt
+++ b/Documentation/devicetree/bindings/serial/altera_uart.txt
@@ -1,7 +1,8 @@
 Altera UART
 
 Required properties:
-- compatible : should be "ALTR,uart-1.0"
+- compatible : should be "ALTR,uart-1.0" <DEPRECATED>
+- compatible : should be "altr,uart-1.0"
 
 Optional properties:
 - clock-frequency : frequency of the clock input to the UART
diff --git a/Documentation/devicetree/bindings/serio/altera_ps2.txt b/Documentation/devicetree/bindings/serio/altera_ps2.txt
index 4d9eecc..520199e 100644
--- a/Documentation/devicetree/bindings/serio/altera_ps2.txt
+++ b/Documentation/devicetree/bindings/serio/altera_ps2.txt
@@ -1,4 +1,5 @@
 Altera UP PS/2 controller
 
 Required properties:
-- compatible : should be "ALTR,ps2-1.0".
+- compatible : should be "ALTR,ps2-1.0". <DEPRECATED>
+- compatible : should be "altr,ps2-1.0".
diff --git a/Documentation/devicetree/bindings/spi/spi_altera.txt b/Documentation/devicetree/bindings/spi/spi_altera.txt
index dda3759..31319dc 100644
--- a/Documentation/devicetree/bindings/spi/spi_altera.txt
+++ b/Documentation/devicetree/bindings/spi/spi_altera.txt
@@ -1,4 +1,5 @@
 Altera SPI
 
 Required properties:
-- compatible : should be "ALTR,spi-1.0".
+- compatible : should be "ALTR,spi-1.0". <DEPRECATED>
+- compatible : should be "altr,spi-1.0".
diff --git a/drivers/input/serio/altera_ps2.c b/drivers/input/serio/altera_ps2.c
index a0a2657..4777a73 100644
--- a/drivers/input/serio/altera_ps2.c
+++ b/drivers/input/serio/altera_ps2.c
@@ -176,6 +176,7 @@ static int altera_ps2_remove(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id altera_ps2_match[] = {
 	{ .compatible = "ALTR,ps2-1.0", },
+	{ .compatible = "altr,ps2-1.0", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altera_ps2_match);
diff --git a/drivers/spi/spi-altera.c b/drivers/spi/spi-altera.c
index 81b9adb..7456eef 100644
--- a/drivers/spi/spi-altera.c
+++ b/drivers/spi/spi-altera.c
@@ -302,6 +302,7 @@ static int altera_spi_remove(struct platform_device *dev)
 #ifdef CONFIG_OF
 static const struct of_device_id altera_spi_match[] = {
 	{ .compatible = "ALTR,spi-1.0", },
+	{ .compatible = "altr,spi-1.0", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altera_spi_match);
diff --git a/drivers/tty/serial/altera_jtaguart.c b/drivers/tty/serial/altera_jtaguart.c
index c6bdb94..dbc7f12 100644
--- a/drivers/tty/serial/altera_jtaguart.c
+++ b/drivers/tty/serial/altera_jtaguart.c
@@ -470,6 +470,7 @@ static int altera_jtaguart_remove(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static struct of_device_id altera_jtaguart_match[] = {
 	{ .compatible = "ALTR,juart-1.0", },
+	{ .compatible = "altr,juart-1.0", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altera_jtaguart_match);
diff --git a/drivers/tty/serial/altera_uart.c b/drivers/tty/serial/altera_uart.c
index 1d46966..8b5a8a2 100644
--- a/drivers/tty/serial/altera_uart.c
+++ b/drivers/tty/serial/altera_uart.c
@@ -613,6 +613,7 @@ static int altera_uart_remove(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static struct of_device_id altera_uart_match[] = {
 	{ .compatible = "ALTR,uart-1.0", },
+	{ .compatible = "altr,uart-1.0", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, altera_uart_match);
-- 
1.7.9.5


