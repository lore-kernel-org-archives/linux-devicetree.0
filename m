From: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Subject: [PATCH 1/1] Consistently use xrealloc instead of realloc
Date: Sun,  2 Mar 2014 21:39:01 +0100
Message-ID: <1393792741-29043-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

fdtput.c:
Replace the remaining call to realloc by xrealloc.
Some redundant lines in encode_value can be saved.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 fdtput.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index 5226a4e..2a8d674 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -96,12 +96,7 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 		/* enlarge our value buffer by a suitable margin if needed */
 		if (upto + len > value_size) {
 			value_size = (upto + len) + 500;
-			value = realloc(value, value_size);
-			if (!value) {
-				fprintf(stderr, "Out of mmory: cannot alloc "
-					"%d bytes\n", value_size);
-				return -1;
-			}
+			value = xrealloc(value, value_size);
 		}
 
 		ptr = value + upto;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
