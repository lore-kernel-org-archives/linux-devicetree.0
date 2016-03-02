From: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of/unittest: fix infinite loop in of_unittest_destroy_tracked_overlays()
Date: Wed,  2 Mar 2016 20:24:49 +0900
Message-ID: <1456917889-4416-1-git-send-email-sergey.senozhatsky@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_overlay_destroy() can return `-ENODEV' error code once it
failed to find the requested overlay in `ov_idr'. However,
of_unittest_destroy_tracked_overlays() does not handle this
error code correctly and continues to call of_overlay_destroy()
on the 'missing' overlay over and over again. This results in
a printk flood

[..]
[   33.497583] of_overlay_destroy: Could not find overlay #6
[   33.497583] of_overlay_destroy: Could not find overlay #6
[   33.497584] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497584] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497586] of_overlay_destroy: Could not find overlay #6
[   33.497586] of_overlay_destroy: Could not find overlay #6
[   33.497587] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[   33.497587] ### dt-test ### of_unittest_destroy_tracked_overlays: overlay destroy failed for #6
[..]

which is not really good due to printk design, and can lead to soft
lockups, hard lockups, etc. (depending on the context console_unlock()
is being called from). The problem has bee observed in real life
and reported by Ying Huang.

This patch does not address the root cause of missing overlay in
`ov_idr', it fixes the endless loop only.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reported-by: kernel test robot <ying.huang-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Link: lkml.kernel.org/r/87fuwk1c0o.fsf-5/hDr2MS57EDqwDYnZuMFFaTQe2KTcn/@public.gmane.org
---
 drivers/of/unittest.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 979b6e4..e986e6e 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1165,6 +1165,11 @@ static void of_unittest_destroy_tracked_overlays(void)
 				continue;
 
 			ret = of_overlay_destroy(id + overlay_first_id);
+			if (ret == -ENODEV) {
+				pr_warn("%s: no overlay to destroy for #%d\n",
+					__func__, id + overlay_first_id);
+				continue;
+			}
 			if (ret != 0) {
 				defers++;
 				pr_warn("%s: overlay destroy failed for #%d\n",
-- 
2.8.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
