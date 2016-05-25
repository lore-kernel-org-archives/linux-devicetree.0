From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 3/5] EDAC, altera: Handle Arria10 SDRAM child node.
Date: Wed, 25 May 2016 11:29:41 -0500
Message-ID: <1464193783-5071-4-git-send-email-tthayer@opensource.altera.com>
References: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464193783-5071-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Separate the device match arrays for each platform to prevent
CycloneV matches when calling of_platform_populate() on the
Arria10 ECC manager node.
If the SDRAM is a child node of ECC manager, call probe function
via of_platform_populate().

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 drivers/edac/altera_edac.c |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 3eb73bc..dfd5d1b 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -688,11 +688,9 @@ static void altr_create_edacdev_dbgfs(struct edac_device_ctl_info *edac_dci,
 static const struct of_device_id altr_edac_device_of_match[] = {
 #ifdef CONFIG_EDAC_ALTERA_L2C
 	{ .compatible = "altr,socfpga-l2-ecc", .data = &l2ecc_data },
-	{ .compatible = "altr,socfpga-a10-l2-ecc", .data = &a10_l2ecc_data },
 #endif
 #ifdef CONFIG_EDAC_ALTERA_OCRAM
 	{ .compatible = "altr,socfpga-ocram-ecc", .data = &ocramecc_data },
-	{ .compatible = "altr,socfpga-a10-ocram-ecc", .data = &a10_ocramecc_data },
 #endif
 	{},
 };
@@ -1054,6 +1052,17 @@ const struct edac_device_prv_data a10_l2ecc_data = {
 #endif	/* CONFIG_EDAC_ALTERA_L2C */
 
 /********************* Arria10 EDAC Device Functions *************************/
+static const struct of_device_id altr_edac_a10_device_of_match[] = {
+#ifdef CONFIG_EDAC_ALTERA_L2C
+	{ .compatible = "altr,socfpga-a10-l2-ecc", .data = &a10_l2ecc_data },
+#endif
+#ifdef CONFIG_EDAC_ALTERA_OCRAM
+	{ .compatible = "altr,socfpga-a10-ocram-ecc",
+	  .data = &a10_ocramecc_data },
+#endif
+	{},
+};
+MODULE_DEVICE_TABLE(of, altr_edac_a10_device_of_match);
 
 /*
  * The Arria10 EDAC Device Functions differ from the Cyclone5/Arria5
@@ -1123,7 +1132,7 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
 	const struct edac_device_prv_data *prv;
 	/* Get matching node and check for valid result */
 	const struct of_device_id *pdev_id =
-		of_match_node(altr_edac_device_of_match, np);
+		of_match_node(altr_edac_a10_device_of_match, np);
 	if (IS_ERR_OR_NULL(pdev_id))
 		return -ENODEV;
 
@@ -1324,6 +1333,11 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 		else if (of_device_is_compatible(child,
 						 "altr,socfpga-a10-ocram-ecc"))
 			altr_edac_a10_device_add(edac, child);
+		else if (of_device_is_compatible(child,
+						 "altr,sdram-edac-a10"))
+			of_platform_populate(pdev->dev.of_node,
+					     altr_sdram_ctrl_of_match,
+					     NULL, &pdev->dev);
 	}
 
 	return 0;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
