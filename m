From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] of: Spelling s/changset/changeset/
Date: Tue, 28 Nov 2017 09:25:23 +0100
Message-ID: <1511857523-18241-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/dynamic.c | 4 ++--
 drivers/of/overlay.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index c454941b34ec8aa7..ab988d88704da0d2 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -695,7 +695,7 @@ int __of_changeset_apply_entries(struct of_changeset *ocs, int *ret_revert)
 /*
  * Returns 0 on success, a negative error value in case of an error.
  *
- * If multiple changset entry notification errors occur then only the
+ * If multiple changeset entry notification errors occur then only the
  * final notification error is reported.
  */
 int __of_changeset_apply_notify(struct of_changeset *ocs)
@@ -795,7 +795,7 @@ int __of_changeset_revert_entries(struct of_changeset *ocs, int *ret_apply)
 }
 
 /*
- * If multiple changset entry notification errors occur then only the
+ * If multiple changeset entry notification errors occur then only the
  * final notification error is reported.
  */
 int __of_changeset_revert_notify(struct of_changeset *ocs)
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 3b7a3980ff50d6bf..8676411bd3e6f29f 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -660,14 +660,14 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
  * A non-zero return value will not have created the changeset if error is from:
  *   - parameter checks
  *   - building the changeset
- *   - overlay changset pre-apply notifier
+ *   - overlay changeset pre-apply notifier
  *
  * If an error is returned by an overlay changeset pre-apply notifier
  * then no further overlay changeset pre-apply notifier will be called.
  *
  * A non-zero return value will have created the changeset if error is from:
  *   - overlay changeset entry notifier
- *   - overlay changset post-apply notifier
+ *   - overlay changeset post-apply notifier
  *
  * If an error is returned by an overlay changeset post-apply notifier
  * then no further overlay changeset post-apply notifier will be called.
@@ -871,7 +871,7 @@ static int overlay_removal_is_ok(struct overlay_changeset *remove_ovcs)
  *
  * A non-zero return value will not revert the changeset if error is from:
  *   - parameter checks
- *   - overlay changset pre-remove notifier
+ *   - overlay changeset pre-remove notifier
  *   - overlay changeset entry revert
  *
  * If an error is returned by an overlay changeset pre-remove notifier
@@ -882,7 +882,7 @@ static int overlay_removal_is_ok(struct overlay_changeset *remove_ovcs)
  *
  * A non-zero return value will revert the changeset if error is from:
  *   - overlay changeset entry notifier
- *   - overlay changset post-remove notifier
+ *   - overlay changeset post-remove notifier
  *
  * If an error is returned by an overlay changeset post-remove notifier
  * then no further overlay changeset post-remove notifier will be called.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
