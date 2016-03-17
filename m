From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v2 10/11] usb: musb: da8xx: Use devm in probe
Date: Wed, 16 Mar 2016 21:26:43 -0500
Message-ID: <1458181615-27782-11-git-send-email-david@lechnology.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458181615-27782-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Simplify things a bit by using devm functions where possible.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---

v2 changes: This is part of a previous patch that was split. No changes from
previous version.


 drivers/usb/musb/da8xx.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index b03d3b8..50f07a5 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -489,32 +489,27 @@ static int da8xx_probe(struct platform_device *pdev)
 	struct platform_device		*musb;
 	struct da8xx_glue		*glue;
 	struct platform_device_info	pinfo;
-	struct clk			*clk;
+	int				ret;
 
-	int				ret = -ENOMEM;
-
-	glue = kzalloc(sizeof(*glue), GFP_KERNEL);
+	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
 	if (!glue) {
 		dev_err(&pdev->dev, "failed to allocate glue context\n");
-		goto err0;
+		return -ENOMEM;
 	}
 
-	clk = clk_get(&pdev->dev, "usb20");
-	if (IS_ERR(clk)) {
+	glue->clk = devm_clk_get(&pdev->dev, "usb20");
+	if (IS_ERR(glue->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
-		ret = PTR_ERR(clk);
-		goto err3;
+		return PTR_ERR(glue->clk);
 	}
 
-	ret = clk_enable(clk);
+	ret = clk_enable(glue->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to enable clock\n");
 		goto err4;
 	}
 
 	glue->dev			= &pdev->dev;
-	glue->clk			= clk;
-
 	pdata->platform_ops		= &da8xx_ops;
 
 	glue->phy = usb_phy_generic_register();
@@ -557,15 +552,10 @@ err6:
 	usb_phy_generic_unregister(glue->phy);
 
 err5:
-	clk_disable(clk);
+	clk_disable(glue->clk);
 
 err4:
-	clk_put(clk);
-
-err3:
-	kfree(glue);
 
-err0:
 	return ret;
 }
 
@@ -576,8 +566,6 @@ static int da8xx_remove(struct platform_device *pdev)
 	platform_device_unregister(glue->musb);
 	usb_phy_generic_unregister(glue->phy);
 	clk_disable(glue->clk);
-	clk_put(glue->clk);
-	kfree(glue);
 
 	return 0;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
