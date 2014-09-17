From: Janusz Uzycki <j.uzycki@elproma.com.pl>
Subject: [PATCH 4/4] serial: mxs-auart: add sysrq support
Date: Wed, 17 Sep 2014 11:15:33 +0200
Message-ID: <1410945333-26250-4-git-send-email-j.uzycki@elproma.com.pl>
References: <1410945333-26250-1-git-send-email-j.uzycki@elproma.com.pl>
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <1410945333-26250-1-git-send-email-j.uzycki@elproma.com.pl>
Sender: linux-serial-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, Janusz Uzycki <j.uzycki@elproma.com.pl>
List-Id: devicetree@vger.kernel.org

When using mxs-auart based console, sometime we need the sysrq function
to help debugging kernel. The sysrq code is basically there,
this patch just simply enable it.

Signed-off-by: Janusz Uzycki <j.uzycki@elproma.com.pl>
---
 drivers/tty/serial/mxs-auart.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index e298a52..ea1c901 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -14,6 +14,12 @@
  * http://www.gnu.org/copyleft/gpl.html
  */
 
+#if defined(CONFIG_SERIAL_MXS_AUART_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
+#include <linux/sysrq.h>
+/* define before linux/serial_core.h */
+#define SUPPORT_SYSRQ
+#endif
+
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/init.h>
-- 
1.7.11.3

