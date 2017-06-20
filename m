From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 08/17] serial: 8250_ingenic: Parse earlycon options
Date: Tue, 20 Jun 2017 17:18:46 +0200
Message-ID: <20170620151855.19399-8-paul@crapouillou.net>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170620151855.19399-1-paul@crapouillou.net>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20170620151855.19399-1-paul@crapouillou.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
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
 drivers/tty/serial/8250/8250_ingenic.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

 v2: Don't create temp. buffer, now that uart_parse_options takes a const char*

diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index b31b2ca552d1..be4a07a24342 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -99,14 +99,22 @@ static int __init ingenic_early_console_setup(struct earlycon_device *dev,
 					      const char *opt)
 {
 	struct uart_port *port = &dev->port;
-	unsigned int baud, divisor;
+	unsigned int divisor;
+	int baud = 115200;
 
 	if (!dev->port.membase)
 		return -ENODEV;
 
+	if (opt) {
+		unsigned int parity, bits, flow; /* unused for now */
+
+		uart_parse_options(opt, &baud, &parity, &bits, &flow);
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
