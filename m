From: Vasiliy Kulikov <segoon@openwall.com>
Subject: [PATCH] char: briq_panel: fix TOCTOU bug
Date: Sat,  9 Apr 2011 16:41:26 +0400
Message-ID: <1302352886-20847-1-git-send-email-segoon@openwall.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

There is a TOCTOU bug in briq_panel_write() code:

    if (vfd_cursor > 39)   <<<
	    scroll_vfd();
    vfd[vfd_cursor++] = c; <<<

It's possible to write to arbitrary memory location in case of more than
one process tries to call write() simultaneously.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 drivers/char/briq_panel.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/char/briq_panel.c b/drivers/char/briq_panel.c
index 095ab90..afad0a4 100644
--- a/drivers/char/briq_panel.c
+++ b/drivers/char/briq_panel.c
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 #include <linux/tty.h>
+#include <linux/mutex.h>
 #include <linux/timer.h>
 #include <linux/kernel.h>
 #include <linux/wait.h>
@@ -34,6 +35,7 @@ static int		vfd_is_open;
 static unsigned char	vfd[40];
 static int		vfd_cursor;
 static unsigned char	ledpb, led;
+static DEFINE_MUTEX(vfd_mutex);
 
 static void update_vfd(void)
 {
@@ -140,12 +142,15 @@ static ssize_t briq_panel_write(struct file *file, const char __user *buf, size_
 	if (!vfd_is_open)
 		return -EBUSY;
 
+	mutex_lock(&vfd_mutex);
 	for (;;) {
 		char c;
 		if (!indx)
 			break;
-		if (get_user(c, buf))
+		if (get_user(c, buf)) {
+			mutex_unlock(&vfd_mutex);
 			return -EFAULT;
+		}
 		if (esc) {
 			set_led(c);
 			esc = 0;
@@ -175,6 +180,7 @@ static ssize_t briq_panel_write(struct file *file, const char __user *buf, size_
 		buf++;
 	}
 	update_vfd();
+	mutex_unlock(&vfd_mutex);
 
 	return len;
 }
-- 
1.7.0.4
