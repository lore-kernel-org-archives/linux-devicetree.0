From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of: unittest: Remove error printing on OOM
Date: Thu,  2 May 2019 14:45:35 +0200
Message-ID: <20190502124535.6292-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

There is no need to print a backtrace or other error message if
kzalloc(), kmemdup(), or devm_kzalloc() fails, as the memory allocation
core already takes care of that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/unittest.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 2f8e43876c3da70c..a3d31103962b7dd9 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -344,7 +344,7 @@ static void __init of_unittest_check_phandles(void)
 		}
 
 		nh = kzalloc(sizeof(*nh), GFP_KERNEL);
-		if (WARN_ON(!nh))
+		if (!nh)
 			return;
 
 		nh->np = np;
@@ -1199,12 +1199,9 @@ static int __init unittest_data_add(void)
 
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
@@ -1845,10 +1842,8 @@ static int unittest_i2c_bus_probe(struct platform_device *pdev)
 	dev_dbg(dev, "%s for node @%pOF\n", __func__, np);
 
 	std = devm_kzalloc(dev, sizeof(*std), GFP_KERNEL);
-	if (!std) {
-		dev_err(dev, "Failed to allocate unittest i2c data\n");
+	if (!std)
 		return -ENOMEM;
-	}
 
 	/* link them together */
 	std->pdev = pdev;
-- 
2.17.1
