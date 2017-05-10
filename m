From: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: [PATCH] of/unittest: Delete an error message for a failed memory
 allocation in three functions
Date: Wed, 10 May 2017 22:33:22 +0200
Message-ID: <958edc32-bc4d-4f3b-52d5-8a13aa36fd61@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Date: Wed, 10 May 2017 22:20:52 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
---
 drivers/of/unittest.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 987a1530282a..9554f83a0260 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -914,12 +914,9 @@ static int __init unittest_data_add(void)
 
 	/* creating copy */
 	unittest_data = kmemdup(__dtb_testcases_begin, size, GFP_KERNEL);
-
-	if (!unittest_data) {
-		pr_warn("%s: Failed to allocate memory for unittest_data; "
-			"not running tests\n", __func__);
+	if (!unittest_data)
 		return -ENOMEM;
-	}
+
 	of_fdt_unflatten_tree(unittest_data, NULL, &unittest_data_node);
 	if (!unittest_data_node) {
 		pr_warn("%s: No tree to attach; not running tests\n", __func__);
@@ -1593,12 +1590,9 @@ static int unittest_i2c_bus_probe(struct platform_device *pdev)
 	}
 
 	dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
-
 	std = devm_kzalloc(dev, sizeof(*std), GFP_KERNEL);
-	if (!std) {
-		dev_err(dev, "Failed to allocate unittest i2c data\n");
+	if (!std)
 		return -ENOMEM;
-	}
 
 	/* link them together */
 	std->pdev = pdev;
@@ -2062,10 +2056,8 @@ static int __init overlay_data_add(int onum)
 	 * will create pointers to the passed in FDT in the EDT.
 	 */
 	info->data = kmemdup(info->dtb_begin, size, GFP_KERNEL);
-	if (!info->data) {
-		pr_err("unable to allocate memory for data, %d\n", onum);
+	if (!info->data)
 		return 0;
-	}
 
 	of_fdt_unflatten_tree(info->data, NULL, &info->np_overlay);
 	if (!info->np_overlay) {
-- 
2.12.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
