From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] simplefb: add goto error path to probe
Date: Sun, 28 Sep 2014 14:43:37 +0200
Message-ID: <1411908218-20947-3-git-send-email-hdegoede@redhat.com>
References: <1411908218-20947-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORBCEFUCQQKGQEEGGSF3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1411908218-20947-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>

Signed-off-by: Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/video/fbdev/simplefb.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index ec112c1..b7d5c08 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -220,8 +220,8 @@ static int simplefb_probe(struct platform_device *pdev)
 
 	info->apertures = alloc_apertures(1);
 	if (!info->apertures) {
-		framebuffer_release(info);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto error_fb_release;
 	}
 	info->apertures->ranges[0].base = info->fix.smem_start;
 	info->apertures->ranges[0].size = info->fix.smem_len;
@@ -231,8 +231,8 @@ static int simplefb_probe(struct platform_device *pdev)
 	info->screen_base = ioremap_wc(info->fix.smem_start,
 				       info->fix.smem_len);
 	if (!info->screen_base) {
-		framebuffer_release(info);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto error_fb_release;
 	}
 	info->pseudo_palette = par->palette;
 
@@ -247,14 +247,20 @@ static int simplefb_probe(struct platform_device *pdev)
 	ret = register_framebuffer(info);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Unable to register simplefb: %d\n", ret);
-		iounmap(info->screen_base);
-		framebuffer_release(info);
-		return ret;
+		goto error_unmap;
 	}
 
 	dev_info(&pdev->dev, "fb%d: simplefb registered!\n", info->node);
 
 	return 0;
+
+ error_unmap:
+	iounmap(info->screen_base);
+
+ error_fb_release:
+	framebuffer_release(info);
+
+	return ret;
 }
 
 static int simplefb_remove(struct platform_device *pdev)
-- 
2.1.0
