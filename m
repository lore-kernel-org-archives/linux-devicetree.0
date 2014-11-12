From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V2 10/10] serial: pxa: Add OF_EARLYCON support
Date: Wed, 12 Nov 2014 12:54:07 -0800
Message-ID: <1415825647-6024-11-git-send-email-cernekee@gmail.com>
References: <1415825647-6024-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <1415825647-6024-1-git-send-email-cernekee@gmail.com>
Sender: linux-serial-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jslaby@suse.cz, robh@kernel.org
Cc: arnd@arndb.de, daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, grant.likely@linaro.org, f.fainelli@gmail.com, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Implement a bare bones earlycon; this assumes that the bootloader sets
up the tty parameters.  Matches all three compatible strings.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 drivers/tty/serial/pxa.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/tty/serial/pxa.c b/drivers/tty/serial/pxa.c
index 086b371..0140108 100644
--- a/drivers/tty/serial/pxa.c
+++ b/drivers/tty/serial/pxa.c
@@ -761,6 +761,51 @@ static struct console serial_pxa_console = {
 	.data		= &serial_pxa_reg,
 };
 
+static struct uart_pxa_port serial_pxa_early_port __initdata;
+
+static void __init early_wait_for_xmitr(struct uart_pxa_port *up)
+{
+	/* it's unsafe to call udelay() in the "early" variant */
+	while ((serial_in(up, UART_LSR) & BOTH_EMPTY) != BOTH_EMPTY)
+		;
+}
+
+static void __init serial_pxa_early_putchar(struct uart_port *port, int ch)
+{
+	struct uart_pxa_port *up = (struct uart_pxa_port *)port;
+
+	early_wait_for_xmitr(up);
+	serial_out(up, UART_TX, ch);
+}
+
+static void __init serial_pxa_early_write(struct console *con, const char *s,
+					  unsigned n)
+{
+	uart_console_write(&serial_pxa_early_port.port, s, n,
+			   serial_pxa_early_putchar);
+	early_wait_for_xmitr(&serial_pxa_early_port);
+}
+
+static int __init serial_pxa_early_console_setup(struct earlycon_device *device,
+						 const char *opt)
+{
+	if (!device->port.membase)
+		return -ENODEV;
+
+	serial_pxa_early_port.port.membase = device->port.membase;
+	serial_pxa_early_port.port.iotype = device->port.iotype;
+
+	device->con->write = serial_pxa_early_write;
+	return 0;
+}
+
+OF_EARLYCON_DECLARE(pxa_uart, "mrvl,pxa-uart",
+		    serial_pxa_early_console_setup);
+OF_EARLYCON_DECLARE(mmp_uart, "mrvl,mmp-uart",
+		    serial_pxa_early_console_setup);
+OF_EARLYCON_DECLARE(bcm7401_upg_uart, "brcm,bcm7401-upg-uart",
+		    serial_pxa_early_console_setup);
+
 #define PXA_CONSOLE	&serial_pxa_console
 #else
 #define PXA_CONSOLE	NULL
-- 
2.1.1

