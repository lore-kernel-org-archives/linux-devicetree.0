From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 1/2] of: overlay: Fix memory leak in of_overlay_apply() error path
Date: Mon,  4 Dec 2017 16:47:35 +0100
Message-ID: <1512402456-8176-2-git-send-email-geert+renesas@glider.be>
References: <1512402456-8176-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512402456-8176-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
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
  - Ignore uninitialized IDs (zero).

Reported-by: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Fixes: f948d6d8b792bb90 ("of: overlay: avoid race condition between applying multiple overlays")
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/overlay.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 3b7a3980ff50d6bf..312cd658bec0083b 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -630,11 +630,10 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
 {
 	int i;
 
-	if (!ovcs->cset.entries.next)
-		return;
-	of_changeset_destroy(&ovcs->cset);
+	if (ovcs->cset.entries.next)
+		of_changeset_destroy(&ovcs->cset);
 
-	if (ovcs->id)
+	if (ovcs->id > 0)
 		idr_remove(&ovcs_idr, ovcs->id);
 
 	for (i = 0; i < ovcs->count; i++) {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
