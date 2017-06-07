From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 06/15] serial: 8250_ingenic: Parse earlycon options
Date: Wed,  7 Jun 2017 22:04:30 +0200
Message-ID: <20170607200439.24450-7-paul@crapouillou.net>
References: <20170607200439.24450-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170607200439.24450-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

In the devicetree, it is possible to specify the baudrate, parity,
bits, flow of the early console, by passing a configuration string like
this:

aliases {
	serial0 = &uart0;
};

chosen {
	stdout-path = "serial0:57600n8";
};

This, for instance, will configure the early console for a baudrate of
57600 bps, no parity, and 8 bits per baud.

This patches implements parsing of this configuration string in the
8250_ingenic driver, which previously just ignored it.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/tty/serial/8250/8250_ingenic.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index b31b2ca552d1..59f3e632df49 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -99,14 +99,24 @@ static int __init ingenic_early_console_setup(struct earlycon_device *dev,
 					      const char *opt)
 {
 	struct uart_port *port = &dev->port;
-	unsigned int baud, divisor;
+	unsigned int divisor;
+	int baud = 115200;
 
 	if (!dev->port.membase)
 		return -ENODEV;
 
+	if (opt) {
+		char options[256];
+		unsigned int parity, bits, flow; /* unused for now */
+
+		strlcpy(options, opt, sizeof(options));
+		uart_parse_options(options, &baud, &parity, &bits, &flow);
+	}
+
 	ingenic_early_console_setup_clock(dev);
 
-	baud = dev->baud ?: 115200;
+	if (dev->baud)
+		baud = dev->baud;
 	divisor = DIV_ROUND_CLOSEST(port->uartclk, 16 * baud);
 
 	early_out(port, UART_IER, 0);
-- 
2.11.0
