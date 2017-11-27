From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/2] of: overlay: Fix cleanup order in of_overlay_apply()
Date: Mon, 27 Nov 2017 15:46:26 +0100
Message-ID: <1511793987-315-2-git-send-email-geert+renesas@glider.be>
References: <1511793987-315-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511793987-315-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The special overlay mutex is taken first, hence it should be released
last in the error path.

Fixes: f948d6d8b792bb90 ("of: overlay: avoid race condition between applying multiple overlays")
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/overlay.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index c150abb9049d776d..3b7a3980ff50d6bf 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -760,14 +760,14 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 
 	goto out;
 
-err_overlay_unlock:
-	of_overlay_mutex_unlock();
-
 err_free_overlay_changeset:
 	free_overlay_changeset(ovcs);
 
 	mutex_unlock(&of_mutex);
 
+err_overlay_unlock:
+	of_overlay_mutex_unlock();
+
 out:
 	pr_debug("%s() err=%d\n", __func__, ret);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
