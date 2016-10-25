From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] of: fdt: Add a space to the pr_fmt string
Date: Tue, 25 Oct 2016 15:02:13 -0200
Message-ID: <1477414933-24050-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a space to the fdt messages so they can look a bit better:

OF: fdt: Machine model: Freescale i.MX28 Evaluation Kit

instead of

OF: fdt:Machine model: Freescale i.MX28 Evaluation Kit

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c89d5d2..9f98e43 100644
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
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
