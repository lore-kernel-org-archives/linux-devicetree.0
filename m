From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 1/2] of: overlay: Fix memory leak in of_overlay_apply() error path
Date: Tue,  5 Dec 2017 16:27:02 +0100
Message-ID: <1512487623-30450-2-git-send-email-geert+renesas@glider.be>
References: <1512487623-30450-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512487623-30450-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If of_resolve_phandles() fails, free_overlay_changeset() is called in
the error path.  However, that function returns early if the list hasn't
been initialized yet, before freeing the object.

Explicitly calling kfree() instead would solve that issue. However, that
complicates matter, by having to consider which of two different methods
to use to dispose of the same object.

Hence make free_overlay_changeset() consider initialization state of the
different parts of the object, making it always safe to call (once!) to
dispose of a (partially) initialized overlay_changeset:
  - Only destroy the changeset if the list was initialized,
  - Make init_overlay_changeset() store the ID in ovcs->id on success,
    to avoid calling idr_remove() with an error value or an already
    released ID.

Reported-by: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Fixes: f948d6d8b792bb90 ("of: overlay: avoid race condition between applying multiple overlays")
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v3:
  - Store into ovcs->id on success only, drop id > 0 check before
    release,

v2:
  - New.
---
 drivers/of/overlay.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index c150abb9049d776d..bdb9695ed2d889a7 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -522,7 +522,7 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 	struct device_node *node, *overlay_node;
 	struct fragment *fragment;
 	struct fragment *fragments;
-	int cnt, ret;
+	int cnt, id, ret;
 
 	/*
 	 * Warn for some issues.  Can not return -EINVAL for these until
@@ -543,9 +543,9 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 
 	of_changeset_init(&ovcs->cset);
 
-	ovcs->id = idr_alloc(&ovcs_idr, ovcs, 1, 0, GFP_KERNEL);
-	if (ovcs->id <= 0)
-		return ovcs->id;
+	id = idr_alloc(&ovcs_idr, ovcs, 1, 0, GFP_KERNEL);
+	if (id <= 0)
+		return id;
 
 	cnt = 0;
 
@@ -611,6 +611,7 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 		goto err_free_fragments;
 	}
 
+	ovcs->id = id;
 	ovcs->count = cnt;
 	ovcs->fragments = fragments;
 
@@ -619,7 +620,7 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 err_free_fragments:
 	kfree(fragments);
 err_free_idr:
-	idr_remove(&ovcs_idr, ovcs->id);
+	idr_remove(&ovcs_idr, id);
 
 	pr_err("%s() failed, ret = %d\n", __func__, ret);
 
@@ -630,9 +631,8 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
 {
 	int i;
 
-	if (!ovcs->cset.entries.next)
-		return;
-	of_changeset_destroy(&ovcs->cset);
+	if (ovcs->cset.entries.next)
+		of_changeset_destroy(&ovcs->cset);
 
 	if (ovcs->id)
 		idr_remove(&ovcs_idr, ovcs->id);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
