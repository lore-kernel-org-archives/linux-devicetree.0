From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next] mtd: orion_nand: convert to use devm_* APIs
Date: Wed, 17 Jul 2013 10:09:10 +0800
Message-ID: <CAPgLHd8upcmfnQqHAWnqP7YBVYDVyoYKQ3WCh3c5+uY-EKr1jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

Convert to use devm_* APIs to avoid resources leak on error handling case.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/mtd/nand/orion_nand.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 46f308d..ce711b4 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -85,25 +85,23 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
+	nc = devm_kzalloc(&pdev->dev,
+			  sizeof(struct nand_chip) + sizeof(struct mtd_info),
+			  GFP_KERNEL);
 	if (!nc) {
 		printk(KERN_ERR "orion_nand: failed to allocate device structure.\n");
-		ret = -ENOMEM;
-		goto no_res;
+		return -ENOMEM;
 	}
 	mtd = (struct mtd_info *)(nc + 1);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		ret = -ENODEV;
-		goto no_res;
-	}
+	if (!res)
+		return -ENODEV;
 
-	io_base = ioremap(res->start, resource_size(res));
+	io_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
 	if (!io_base) {
 		printk(KERN_ERR "orion_nand: ioremap failed\n");
-		ret = -EIO;
-		goto no_res;
+		return -EIO;
 	}
 
 	if (pdev->dev.of_node) {
@@ -111,8 +109,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 					GFP_KERNEL);
 		if (!board) {
 			printk(KERN_ERR "orion_nand: failed to allocate board structure.\n");
-			ret = -ENOMEM;
-			goto no_res;
+			return -ENOMEM;
 		}
 		if (!of_property_read_u32(pdev->dev.of_node, "cle", &val))
 			board->cle = (u8)val;
@@ -186,10 +183,6 @@ no_dev:
 		clk_disable_unprepare(clk);
 		clk_put(clk);
 	}
-	iounmap(io_base);
-no_res:
-	kfree(nc);
-
 	return ret;
 }
 
@@ -201,10 +194,6 @@ static int orion_nand_remove(struct platform_device *pdev)
 
 	nand_release(mtd);
 
-	iounmap(nc->IO_ADDR_W);
-
-	kfree(nc);
-
 	clk = clk_get(&pdev->dev, NULL);
 	if (!IS_ERR(clk)) {
 		clk_disable_unprepare(clk);
