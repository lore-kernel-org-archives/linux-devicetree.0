From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: [RFC 01/18] omap3isp: Fix error handling in probe
Date: Sat,  7 Mar 2015 23:40:58 +0200
Message-ID: <1425764475-27691-2-git-send-email-sakari.ailus@iki.fi>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425764475-27691-1-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

The mutex was not destroyed correctly if dma_coerce_mask_and_coherent()
failed for some reason.

Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
---
 drivers/media/platform/omap3isp/isp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index deca809..fb193b6 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2252,7 +2252,7 @@ static int isp_probe(struct platform_device *pdev)
 
 	ret = dma_coerce_mask_and_coherent(isp->dev, DMA_BIT_MASK(32));
 	if (ret)
-		return ret;
+		goto error;
 
 	platform_set_drvdata(pdev, isp);
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
