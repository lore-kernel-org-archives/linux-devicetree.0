From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Revert "console: don't prefer first registered if DT specifies stdout-path"
Date: Fri,  4 Nov 2016 13:11:35 +0100
Message-ID: <20161104121135.4780-2-hdegoede@redhat.com>
References: <20161104121135.4780-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161104121135.4780-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thorsten Leemhuis <regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This reverts commit 05fd007e4629 ("console: don't prefer first registered
if DT specifies stdout-path").

The reverted commit changes existing behavior on which many ARM boards
rely. Many ARM small-board-computers, like e.g. the Raspberry Pi have
both a video output and a serial console. Depending on whether the user
is using the device as a more regular computer; or as a headless device
we need to have the console on either one or the other.

Many users rely on the kernel behavior of the console being present on
both outputs, before the reverted commit the console setup with no
console= kernel arguments on an ARM board which sets stdout-path in dt
would look like this:

[root@localhost ~]# cat /proc/consoles
ttyS0                -W- (EC p a)    4:64
tty0                 -WU (E  p  )    4:1

Where as after the reverted commit, it looks like this:

[root@localhost ~]# cat /proc/consoles
ttyS0                -W- (EC p a)    4:64

This commit reverts commit 05fd007e4629 ("console: don't prefer first
registered if DT specifies stdout-path") restoring the original behavior.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/base.c       |  2 --
 include/linux/console.h |  6 ------
 kernel/printk/printk.c  | 13 +------------
 3 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d687e6d..a0bccb5 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2077,8 +2077,6 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 			name = of_get_property(of_aliases, "stdout", NULL);
 		if (name)
 			of_stdout = of_find_node_opts_by_path(name, &of_stdout_options);
-		if (of_stdout)
-			console_set_by_of();
 	}
 
 	if (!of_aliases)
diff --git a/include/linux/console.h b/include/linux/console.h
index 3672809..d530c46 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -173,12 +173,6 @@ static inline void console_sysfs_notify(void)
 #endif
 extern bool console_suspend_enabled;
 
-#ifdef CONFIG_OF
-extern void console_set_by_of(void);
-#else
-static inline void console_set_by_of(void) {}
-#endif
-
 /* Suspend and resume console messages over PM events */
 extern void suspend_console(void);
 extern void resume_console(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index de08fc9..5028f4f 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -253,17 +253,6 @@ static int preferred_console = -1;
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
-#ifdef CONFIG_OF
-static bool of_specified_console;
-
-void console_set_by_of(void)
-{
-	of_specified_console = true;
-}
-#else
-# define of_specified_console false
-#endif
-
 /* Flag: console code may call schedule() */
 static int console_may_schedule;
 
@@ -2657,7 +2646,7 @@ void register_console(struct console *newcon)
 	 *	didn't select a console we take the first one
 	 *	that registers here.
 	 */
-	if (preferred_console < 0 && !of_specified_console) {
+	if (preferred_console < 0) {
 		if (newcon->index < 0)
 			newcon->index = 0;
 		if (newcon->setup == NULL ||
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
