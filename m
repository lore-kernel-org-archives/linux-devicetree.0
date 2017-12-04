From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 2/2] of: overlay: Fix cleanup order in of_overlay_apply()
Date: Mon,  4 Dec 2017 16:47:36 +0100
Message-ID: <1512402456-8176-3-git-send-email-geert+renesas@glider.be>
References: <1512402456-8176-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512402456-8176-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The special overlay mutex is taken first, hence it should be released
last in the error path.

Move "mutex_lock(&of_mutex)" up, as suggested by Frank, as
free_overlay_changeset() should be called with that mutex held if any
non-trivial cleanup is to be done.

Merge the two tail statements of the success and error paths, now they
became identical.

Fixes: f948d6d8b792bb90 ("of: overlay: avoid race condition between applying multiple overlays")
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
This is v2 of commit bd80e2555c5c9d45 ("of: overlay: Fix cleanup order
in of_overlay_apply()"), which was dropped by Rob.
---
 drivers/of/overlay.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 312cd658bec0083b..0ddb7748ac85498f 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -705,12 +705,11 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 	}
 
 	of_overlay_mutex_lock();
+	mutex_lock(&of_mutex);
 
 	ret = of_resolve_phandles(tree);
 	if (ret)
-		goto err_overlay_unlock;
-
-	mutex_lock(&of_mutex);
+		goto err_free_overlay_changeset;
 
 	ret = init_overlay_changeset(ovcs, tree);
 	if (ret)
@@ -754,17 +753,13 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 			ret = ret_tmp;
 	}
 
-	mutex_unlock(&of_mutex);
-	of_overlay_mutex_unlock();
-
-	goto out;
+	goto out_unlock;
 
 err_free_overlay_changeset:
 	free_overlay_changeset(ovcs);
 
+out_unlock:
 	mutex_unlock(&of_mutex);
-
-err_overlay_unlock:
 	of_overlay_mutex_unlock();
 
 out:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
