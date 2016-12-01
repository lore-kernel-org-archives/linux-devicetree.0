From: Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drivers/of: fix missing pr_cont()s in of_print_phandle_args
Date: Thu, 1 Dec 2016 09:00:55 +0100
Message-ID: <1480579255-28446-1-git-send-email-marcin.nowakowski@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Since the KERN_CONT changes, the current debug printks have a lot of
empty lines making the log messages very hard to read.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/base.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 0810c5e..bae07f5 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1566,9 +1566,12 @@ void of_print_phandle_args(const char *msg, const struct of_phandle_args *args)
 {
 	int i;
 	printk("%s %s", msg, of_node_full_name(args->np));
-	for (i = 0; i < args->args_count; i++)
-		printk(i ? ",%08x" : ":%08x", args->args[i]);
-	printk("\n");
+	for (i = 0; i < args->args_count; i++) {
+		const char delim = i ? ',' : ':';
+
+		pr_cont("%c%08x", delim, args->args[i]);
+	}
+	pr_cont("\n");
 }
 
 int of_phandle_iterator_init(struct of_phandle_iterator *it,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
