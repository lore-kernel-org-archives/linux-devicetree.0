From: NeilBrown <neil@brown.name>
Subject: [PATCH 1/3] TTY: use class_find_device to find port in
 uart_suspend/resume.
Date: Wed, 18 Mar 2015 16:58:31 +1100
Message-ID: <20150318055831.21025.27864.stgit@notabene.brown>
References: <20150318055437.21025.13990.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150318055437.21025.13990.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
Cc: GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

uart_{suspend,resume}_port seach the children of a uart device
to find a particular tty device.
This requires all the ttys to be direct children of the uart.

A future patch will allow a 'tty_slave' to intervene between
the port and the uart, voiding this requirement.

So change to use class_find_device.  This is made possibly by
exporting a "tty_find_device" from tty_io.c

Signed-off-by: NeilBrown <neil@brown.name>
---
 drivers/tty/serial/serial_core.c |   21 ++++++++-------------
 drivers/tty/tty_io.c             |    6 ++++++
 include/linux/tty.h              |    1 +
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 6a1055ae3437..7abb7474870a 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -1960,26 +1960,19 @@ struct uart_match {
 	struct uart_driver *driver;
 };
 
-static int serial_match_port(struct device *dev, void *data)
-{
-	struct uart_match *match = data;
-	struct tty_driver *tty_drv = match->driver->tty_driver;
-	dev_t devt = MKDEV(tty_drv->major, tty_drv->minor_start) +
-		match->port->line;
-
-	return dev->devt == devt; /* Actually, only one tty per port */
-}
 
 int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 {
 	struct uart_state *state = drv->state + uport->line;
 	struct tty_port *port = &state->port;
 	struct device *tty_dev;
-	struct uart_match match = {uport, drv};
+	dev_t devt = MKDEV(drv->tty_driver->major,
+			   drv->tty_driver->minor_start) +
+		uport->line;
 
 	mutex_lock(&port->mutex);
 
-	tty_dev = device_find_child(uport->dev, &match, serial_match_port);
+	tty_dev = tty_find_device(devt);
 	if (device_may_wakeup(tty_dev)) {
 		if (!enable_irq_wake(uport->irq))
 			uport->irq_wake = 1;
@@ -2039,12 +2032,14 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 	struct uart_state *state = drv->state + uport->line;
 	struct tty_port *port = &state->port;
 	struct device *tty_dev;
-	struct uart_match match = {uport, drv};
 	struct ktermios termios;
+	dev_t devt = MKDEV(drv->tty_driver->major,
+			   drv->tty_driver->minor_start) +
+		uport->line;
 
 	mutex_lock(&port->mutex);
 
-	tty_dev = device_find_child(uport->dev, &match, serial_match_port);
+	tty_dev = tty_find_device(devt);
 	if (!uport->suspended && device_may_wakeup(tty_dev)) {
 		if (uport->irq_wake) {
 			disable_irq_wake(uport->irq);
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 51f066aa375e..27632ad17d6f 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3077,6 +3077,12 @@ static struct device *tty_get_device(struct tty_struct *tty)
 	return class_find_device(tty_class, NULL, &devt, dev_match_devt);
 }
 
+struct device *tty_find_device(dev_t devt)
+{
+	return class_find_device(tty_class, NULL, &devt, dev_match_devt);
+}
+EXPORT_SYMBOL(tty_find_device);
+
 
 /**
  *	alloc_tty_struct
diff --git a/include/linux/tty.h b/include/linux/tty.h
index 358a337af598..04d5f1213700 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -461,6 +461,7 @@ extern void tty_vhangup(struct tty_struct *tty);
 extern int tty_hung_up_p(struct file *filp);
 extern void do_SAK(struct tty_struct *tty);
 extern void __do_SAK(struct tty_struct *tty);
+extern struct device *tty_find_device(dev_t devt);
 extern void no_tty(void);
 extern void tty_flush_to_ldisc(struct tty_struct *tty);
 extern void tty_buffer_free_all(struct tty_port *port);
