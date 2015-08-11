From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] of/configfs: Use %zu to format size_t
Date: Tue, 11 Aug 2015 14:44:28 +0200
Message-ID: <1439297068-28709-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 64-bit:

    drivers/of/configfs.c: In function 'cfs_overlay_item_dtbo_read':
    drivers/of/configfs.c:168:2: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' [-Wformat=]
      pr_debug("%s: buf=%p max_count=%u\n", __func__,
      ^

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
This is against "OF: DT-Overlay configfs interface (v4)", but it should
apply to "OF: DT-Overlay configfs interface (v5)", too.
---
 drivers/of/configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/configfs.c b/drivers/of/configfs.c
index 056191e238eb2772..7fd29d9dfdd1934b 100644
--- a/drivers/of/configfs.c
+++ b/drivers/of/configfs.c
@@ -165,7 +165,7 @@ static struct configfs_attribute *cfs_overlay_attrs[] = {
 ssize_t cfs_overlay_item_dtbo_read(struct cfs_overlay_item *overlay,
 		void *buf, size_t max_count)
 {
-	pr_debug("%s: buf=%p max_count=%u\n", __func__,
+	pr_debug("%s: buf=%p max_count=%zu\n", __func__,
 			buf, max_count);
 
 	if (overlay->dtbo == NULL)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
