From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: [RFC 18/18] omap3isp: Deprecate platform data support
Date: Sat,  7 Mar 2015 23:41:15 +0200
Message-ID: <1425764475-27691-19-git-send-email-sakari.ailus@iki.fi>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425764475-27691-1-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Print a warning when the driver is used with platform data. Existing
platform data user should move to DT now.

Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
---
 drivers/media/platform/omap3isp/isp.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 2c9bc0d..e4a78bb 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2447,6 +2447,8 @@ static int isp_probe(struct platform_device *pdev)
 		isp->syscon = syscon_regmap_lookup_by_pdevname("syscon.0");
 		if (IS_ERR(isp->syscon))
 			return PTR_ERR(isp->syscon);
+		dev_warn(&pdev->dev,
+			 "Platform data support is deprecated! Please move to DT now!\n");
 	}
 
 	isp->autoidle = autoidle;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
