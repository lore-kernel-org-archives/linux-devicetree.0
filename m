From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] of: unittest: Remove bogus overlay mutex release from overlay_data_add()
Date: Mon, 27 Nov 2017 15:46:27 +0100
Message-ID: <1511793987-315-3-git-send-email-geert+renesas@glider.be>
References: <1511793987-315-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511793987-315-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

overlay_data_add() never takes the special overlay mutex, so it must not
be released in the error patch.

Presumably the call to of_overlay_mutex_unlock() is a relic from v1 of
the patch.

Fixes: f948d6d8b792bb90 ("of: overlay: avoid race condition between applying multiple overlays")
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/unittest.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e568b1e82501b832..0f8052f1355c0c09 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2165,7 +2165,6 @@ static int __init overlay_data_add(int onum)
 	ret = of_overlay_apply(info->np_overlay, &info->overlay_id);
 	if (ret < 0) {
 		pr_err("of_overlay_apply() (ret=%d), %d\n", ret, onum);
-		of_overlay_mutex_unlock();
 		goto out_free_np_overlay;
 	}
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
