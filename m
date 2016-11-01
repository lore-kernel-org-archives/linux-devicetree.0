From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] of/platform: fix of_platform_device_destroy comment
Date: Tue,  1 Nov 2016 11:53:21 +0100
Message-ID: <1477997602-29652-1-git-send-email-johan@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the comment to of_platform_device_destroy() to reflect that it no
longer returns a status value.

Fixes: 75f353b61342 ("of/platform: Fix of_platform_device_destroy...")
Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/platform.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index e4bf07d20f9b..cb4c7800f37d 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -558,9 +558,6 @@ static int of_platform_device_destroy(struct device *dev, void *data)
  * of the given device (and, recurrently, their children) that have been
  * created from their respective device tree nodes (and only those,
  * leaving others - eg. manually created - unharmed).
- *
- * Returns 0 when all children devices have been removed or
- * -EBUSY when some children remained.
  */
 void of_platform_depopulate(struct device *parent)
 {
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
