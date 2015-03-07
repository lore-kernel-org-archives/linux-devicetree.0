From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: [RFC 04/18] omap3isp: DT support for clocks
Date: Sat,  7 Mar 2015 23:41:01 +0200
Message-ID: <1425764475-27691-5-git-send-email-sakari.ailus@iki.fi>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425764475-27691-1-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 drivers/media/platform/omap3isp/isp.c |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index a607f26..01356dd 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -279,9 +279,21 @@ static const struct clk_init_data isp_xclk_init_data = {
 	.num_parents = 1,
 };
 
+static struct clk *isp_xclk_src_get(struct of_phandle_args *clkspec, void *data)
+{
+	unsigned int idx = clkspec->args[0];
+	struct isp_device *isp = data;
+
+	if (idx >= ARRAY_SIZE(isp->xclks))
+		return ERR_PTR(-ENOENT);
+
+	return isp->xclks[idx].clk;
+}
+
 static int isp_xclk_init(struct isp_device *isp)
 {
 	struct isp_platform_data *pdata = isp->pdata;
+	struct device_node *np = isp->dev->of_node;
 	struct clk_init_data init;
 	unsigned int i;
 
@@ -312,6 +324,12 @@ static int isp_xclk_init(struct isp_device *isp)
 		if (IS_ERR(xclk->clk))
 			return PTR_ERR(xclk->clk);
 
+		/* When instantiated from DT we don't need to register clock
+		 * aliases.
+		 */
+		if (np)
+			continue;
+
 		if (pdata->xclks[i].con_id == NULL &&
 		    pdata->xclks[i].dev_id == NULL)
 			continue;
@@ -327,13 +345,20 @@ static int isp_xclk_init(struct isp_device *isp)
 		clkdev_add(xclk->lookup);
 	}
 
+	if (np)
+		of_clk_add_provider(np, isp_xclk_src_get, isp);
+
 	return 0;
 }
 
 static void isp_xclk_cleanup(struct isp_device *isp)
 {
+	struct device_node *np = isp->dev->of_node;
 	unsigned int i;
 
+	if (np)
+		of_clk_del_provider(np);
+
 	for (i = 0; i < ARRAY_SIZE(isp->xclks); ++i) {
 		struct isp_xclk *xclk = &isp->xclks[i];
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
