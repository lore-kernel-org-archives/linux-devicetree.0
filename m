From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] of: Add missing space at end of pr_fmt().
Date: Mon, 17 Oct 2016 12:21:23 -0700
Message-ID: <1476732083-13975-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Make pr_fmt() in fdt.c consistent with all other files in drivers/of/

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c89d5d231a0e..9f98e437e1f1 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -9,7 +9,7 @@
  * version 2 as published by the Free Software Foundation.
  */
 
-#define pr_fmt(fmt)	"OF: fdt:" fmt
+#define pr_fmt(fmt)	"OF: fdt: " fmt
 
 #include <linux/crc32.h>
 #include <linux/kernel.h>
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
