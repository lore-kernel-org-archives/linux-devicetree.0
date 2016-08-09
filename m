From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] console: Don't prefer first registered if DT specifies stdout-path
Date: Tue, 9 Aug 2016 13:50:10 +0100
Message-ID: <20160809125010.14150-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ivan Delalande <colona-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geliang Tang <geliangtang-9Onoh4P/yGk@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathias Krause <minipli-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If a device tree specifies a preferred device for kernel console output
via the stdout-path or linux,stdout-path chosen node properties or the
stdout alias then the kernel ought to honor it & output the kernel
console to that device. As it stands, this isn't the case. Whilst we
parse the stdout-path properties & set an of_stdout variable from
of_alias_scan(), and use that from of_console_check() to determine
whether to add a console device as a preferred console whilst
registering it, we also prefer the first registered console if no other
has been selected at the time of its registration.

This means that if a console other than the one the device tree selects
via stdout-path is registered first, we will switch to using it & when
the stdout-path console is later registered the call to
add_preferred_console() via of_console_check() is too late to do
anything useful. In practice this seems to mean that we switch to the
dummy console device fairly early & see no further console output:

    Console: colour dummy device 80x25
    console [tty0] enabled
    bootconsole [ns16550a0] disabled

Fix this by not automatically preferring the first registered console if
one is specified by the device tree. This allows consoles to be
registered but not enabled, and once the driver for the console selected
by stdout-path calls of_console_check() the driver will be added to the
list of preferred consoles before any other console has been enabled.
When that console is then registered via register_console() it will be
enabled as expected.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

---

 drivers/of/base.c       |  2 ++
 include/linux/console.h |  6 ++++++
 kernel/printk/printk.c  | 13 ++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ebf84e3..2ea6877 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1974,6 +1974,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 			name = of_get_property(of_aliases, "stdout", NULL);
 		if (name)
 			of_stdout = of_find_node_opts_by_path(name, &of_stdout_options);
+		if (of_stdout)
+			console_set_by_of();
 	}
 
 	if (!of_aliases)
diff --git a/include/linux/console.h b/include/linux/console.h
index 98c8615..71cc04f 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -166,6 +166,12 @@ static inline void console_sysfs_notify(void)
 #endif
 extern bool console_suspend_enabled;
 
+#ifdef CONFIG_OF
+extern void console_set_by_of(void);
+#else
+static inline void console_set_by_of(void);
+#endif
+
 /* Suspend and resume console messages over PM events */
 extern void suspend_console(void);
 extern void resume_console(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 60cdf63..f1f03ca 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -149,6 +149,17 @@ static int preferred_console = -1;
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
+#ifdef CONFIG_OF
+static bool of_specified_console;
+
+void console_set_by_of(void)
+{
+	of_specified_console = true;
+}
+#else
+# define of_specified_console false
+#endif
+
 /* Flag: console code may call schedule() */
 static int console_may_schedule;
 
@@ -2509,7 +2520,7 @@ void register_console(struct console *newcon)
 	 *	didn't select a console we take the first one
 	 *	that registers here.
 	 */
-	if (preferred_console < 0) {
+	if (preferred_console < 0 && !of_specified_console) {
 		if (newcon->index < 0)
 			newcon->index = 0;
 		if (newcon->setup == NULL ||
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
