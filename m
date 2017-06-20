From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 06/17] serial: core: Make uart_parse_options take const char* argument
Date: Tue, 20 Jun 2017 17:18:44 +0200
Message-ID: <20170620151855.19399-6-paul@crapouillou.net>
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

The pointed string is never modified from within uart_parse_options, so
it should be marked as const in the function prototype.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/tty/serial/serial_core.c | 5 +++--
 include/linux/serial_core.h      | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

 v2: New patch in this series

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 13bfd5dcffce..95d3770bdb37 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1954,9 +1954,10 @@ EXPORT_SYMBOL_GPL(uart_parse_earlycon);
  *	eg: 115200n8r
  */
 void
-uart_parse_options(char *options, int *baud, int *parity, int *bits, int *flow)
+uart_parse_options(const char *options, int *baud, int *parity,
+		   int *bits, int *flow)
 {
-	char *s = options;
+	const char *s = options;
 
 	*baud = simple_strtoul(s, NULL, 10);
 	while (*s >= '0' && *s <= '9')
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 64d892f1e5cd..67f88fb53195 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -386,7 +386,7 @@ struct uart_port *uart_get_console(struct uart_port *ports, int nr,
 				   struct console *c);
 int uart_parse_earlycon(char *p, unsigned char *iotype, resource_size_t *addr,
 			char **options);
-void uart_parse_options(char *options, int *baud, int *parity, int *bits,
+void uart_parse_options(const char *options, int *baud, int *parity, int *bits,
 			int *flow);
 int uart_set_options(struct uart_port *port, struct console *co, int baud,
 		     int parity, int bits, int flow);
-- 
2.11.0
