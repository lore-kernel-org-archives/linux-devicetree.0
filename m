From: Janusz Uzycki <j.uzycki@elproma.com.pl>
Subject: [PATCH v4 4/4] serial: mxs-auart: enable PPS support
Date: Fri, 10 Oct 2014 18:53:27 +0200
Message-ID: <1412960007-28159-5-git-send-email-j.uzycki@elproma.com.pl>
References: <1412960007-28159-1-git-send-email-j.uzycki@elproma.com.pl>
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <1412960007-28159-1-git-send-email-j.uzycki@elproma.com.pl>
Sender: linux-serial-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Jiri Slaby <jslaby@suse.cz>, Richard Genoud <richard.genoud@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Janusz Uzycki <j.uzycki@elproma.com.pl>
List-Id: devicetree@vger.kernel.org

Enables PPS support in mxs-auart serial driver to make PPS API working.

Signed-off-by: Janusz Uzycki <j.uzycki@elproma.com.pl>
---
v3 -> v4 changelog:
* coding style: braces in both branches of condition

v2 -> v3 changelog:
* no changes

---
 drivers/tty/serial/mxs-auart.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 5ce4a50..840c1f7 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -784,6 +784,16 @@ static void mxs_auart_settermios(struct uart_port *u,
 		mxs_auart_disable_ms(u);
 }
 
+static void mxs_auart_set_ldisc(struct uart_port *port, int new)
+{
+	if (new == N_PPS) {
+		port->flags |= UPF_HARDPPS_CD;
+		mxs_auart_enable_ms(port);
+	} else {
+		port->flags &= ~UPF_HARDPPS_CD;
+	}
+}
+
 static irqreturn_t mxs_auart_irq_handle(int irq, void *context)
 {
 	u32 istat;
@@ -949,6 +959,7 @@ static struct uart_ops mxs_auart_ops = {
 	.startup	= mxs_auart_startup,
 	.shutdown       = mxs_auart_shutdown,
 	.set_termios    = mxs_auart_settermios,
+	.set_ldisc      = mxs_auart_set_ldisc,
 	.type	   	= mxs_auart_type,
 	.release_port   = mxs_auart_release_port,
 	.request_port   = mxs_auart_request_port,
-- 
1.7.11.3

