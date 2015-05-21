From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH trivial] of/overlay: Grammar s/an negative/a negative/
Date: Thu, 21 May 2015 14:10:26 +0200
Message-ID: <1432210226-22446-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/overlay.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 9af4d8de91792cb3..8fb906d4cdecfa4f 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -442,7 +442,7 @@ static struct kset *ov_kset;
  * of the overlay in a list. This list can be used to prevent
  * illegal overlay removals.
  *
- * Returns the id of the created overlay, or an negative error number
+ * Returns the id of the created overlay, or a negative error number
  */
 int of_overlay_create(struct device_node *tree)
 {
@@ -607,7 +607,7 @@ static int overlay_removal_is_ok(struct of_overlay *ov)
  *
  * Removes an overlay if it is permissible.
  *
- * Returns 0 on success, or an negative error number
+ * Returns 0 on success, or a negative error number
  */
 int of_overlay_destroy(int id)
 {
@@ -656,7 +656,7 @@ EXPORT_SYMBOL_GPL(of_overlay_destroy);
  *
  * Removes all overlays from the system in the correct order.
  *
- * Returns 0 on success, or an negative error number
+ * Returns 0 on success, or a negative error number
  */
 int of_overlay_destroy_all(void)
 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
