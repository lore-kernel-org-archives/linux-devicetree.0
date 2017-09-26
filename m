From: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: do not leak console options
Date: Tue, 26 Sep 2017 15:25:10 +0900
Message-ID: <20170926062510.4948-1-sergey.senozhatsky@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Do not strdup() console options. It seems that the only reason for
it to be strdup()-ed was a compilation warning: printk, UART and
console drivers, for some reason, expect char pointer instead of
const char pointer. So we can just pass `of_stdout_options', but
need to cast it to char pointer. A better fix would be to change
printk, console drivers and UART to accept const char `options';
but that will take time - there are lots of drivers to update.

The patch also fixes a possible memory leak: add_preferred_console()
can fail, but we don't kfree() options.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 260d33c0f26c..63897531cd75 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1781,8 +1781,12 @@ bool of_console_check(struct device_node *dn, char *name, int index)
 {
 	if (!dn || dn != of_stdout || console_set_on_cmdline)
 		return false;
-	return !add_preferred_console(name, index,
-				      kstrdup(of_stdout_options, GFP_KERNEL));
+
+	/*
+	 * XXX: cast `options' to char pointer to suppress complication
+	 * warnings: printk, UART and console drivers expect char pointer.
+	 */
+	return !add_preferred_console(name, index, (char *)of_stdout_options);
 }
 EXPORT_SYMBOL_GPL(of_console_check);
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
