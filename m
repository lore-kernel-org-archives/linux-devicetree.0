From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 05/15] serial: 8250_ingenic: Add support for the JZ4770 SoC
Date: Wed,  7 Jun 2017 22:04:29 +0200
Message-ID: <20170607200439.24450-6-paul@crapouillou.net>
References: <20170607200439.24450-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170607200439.24450-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The JZ4770 SoC's UART is no different from the other JZ SoCs, so this
commit simply adds the ingenic,jz4770-uart compatible string.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/serial/ingenic,uart.txt | 3 ++-
 drivers/tty/serial/8250/8250_ingenic.c                    | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.txt b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
index 02cb7fe59cb7..75fd8b314af9 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.txt
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible : "ingenic,jz4740-uart", "ingenic,jz4760-uart",
-	"ingenic,jz4775-uart" or "ingenic,jz4780-uart"
+	"ingenic,jz4770-uart", "ingenic,jz4775-uart" or
+	"ingenic,jz4780-uart"
 - reg : offset and length of the register set for the device.
 - interrupts : should contain uart interrupt.
 - clocks : phandles to the module & baud clocks.
diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index 4d9dc10e265c..b31b2ca552d1 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -133,6 +133,10 @@ EARLYCON_DECLARE(jz4740_uart, ingenic_early_console_setup);
 OF_EARLYCON_DECLARE(jz4740_uart, "ingenic,jz4740-uart",
 		    ingenic_early_console_setup);
 
+EARLYCON_DECLARE(jz4770_uart, ingenic_early_console_setup);
+OF_EARLYCON_DECLARE(jz4770_uart, "ingenic,jz4770-uart",
+		    ingenic_early_console_setup);
+
 EARLYCON_DECLARE(jz4775_uart, ingenic_early_console_setup);
 OF_EARLYCON_DECLARE(jz4775_uart, "ingenic,jz4775-uart",
 		    ingenic_early_console_setup);
@@ -327,6 +331,7 @@ static const struct ingenic_uart_config jz4780_uart_config = {
 static const struct of_device_id of_match[] = {
 	{ .compatible = "ingenic,jz4740-uart", .data = &jz4740_uart_config },
 	{ .compatible = "ingenic,jz4760-uart", .data = &jz4760_uart_config },
+	{ .compatible = "ingenic,jz4770-uart", .data = &jz4760_uart_config },
 	{ .compatible = "ingenic,jz4775-uart", .data = &jz4760_uart_config },
 	{ .compatible = "ingenic,jz4780-uart", .data = &jz4780_uart_config },
 	{ /* sentinel */ }
-- 
2.11.0
