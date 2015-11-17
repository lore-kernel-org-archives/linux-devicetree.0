From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/2] of/configfs: Use %zu to format size_t
Date: Tue, 17 Nov 2015 13:43:59 +0100
Message-ID: <1447764240-10709-2-git-send-email-geert+renesas@glider.be>
References: <1447764240-10709-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447764240-10709-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 64-bit:

    drivers/of/configfs.c: In function 'cfs_overlay_item_dtbo_read':
    drivers/of/configfs.c:153:2: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' [-Wformat=]
      pr_debug("%s: buf=%p max_count=%u\n", __func__,
      ^

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Fixes: 353733fae1932992 ("OF: DT-Overlay configfs interface (v6)")
---
Against
https://github.com/pantoniou/linux-beagle-track-mainline.git/bbb-overlays
---
 drivers/of/configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/configfs.c b/drivers/of/configfs.c
index b68dea8f4ce1e508..563663eefe17c9f1 100644
--- a/drivers/of/configfs.c
+++ b/drivers/of/configfs.c
@@ -150,7 +150,7 @@ ssize_t cfs_overlay_item_dtbo_read(struct config_item *item, void *buf,
 {
 	struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
 
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
