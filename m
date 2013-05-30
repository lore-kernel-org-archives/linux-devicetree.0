From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH -next v2] dmaengine: ste_dma40: fix error return code in
 d40_probe()
Date: Thu, 30 May 2013 12:32:45 +0800
Message-ID: <CAPgLHd-gjJ6ju3HyhiQi98YFGojvU3aYSTn7SOe4NhQPY1r++w@mail.gmail.com>
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
To: srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

In many of the error handling case, the return value 'ret' not set
and 0 will be return from d40_probe() even if error, but we should
return a negative error code instead in those error handling case.
This patch fixed them, and also removed useless variable 'err'.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
v1 -> v2: rebased on linux-next.git
---
 drivers/dma/ste_dma40.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 7f23d45..a241e25 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3506,7 +3506,6 @@ static int __init d40_probe(struct platform_device *pdev)
 {
 	struct stedma40_platform_data *plat_data = pdev->dev.platform_data;
 	struct device_node *np = pdev->dev.of_node;
-	int err;
 	int ret = -ENOENT;
 	struct d40_base *base = NULL;
 	struct resource *res = NULL;
@@ -3619,6 +3618,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		if (IS_ERR(base->lcpa_regulator)) {
 			d40_err(&pdev->dev, "Failed to get lcpa_regulator\n");
 			base->lcpa_regulator = NULL;
+			ret = PTR_ERR(base->lcpa_regulator);
 			goto failure;
 		}
 
@@ -3633,13 +3633,13 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 
 	base->initialized = true;
-	err = d40_dmaengine_init(base, num_reserved_chans);
-	if (err)
+	ret = d40_dmaengine_init(base, num_reserved_chans);
+	if (ret)
 		goto failure;
 
 	base->dev->dma_parms = &base->dma_parms;
-	err = dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
-	if (err) {
+	ret = dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
+	if (ret) {
 		d40_err(&pdev->dev, "Failed to set dma max seg size\n");
 		goto failure;
 	}
@@ -3647,8 +3647,8 @@ static int __init d40_probe(struct platform_device *pdev)
 	d40_hw_init(base);
 
 	if (np) {
-		err = of_dma_controller_register(np, d40_xlate, NULL);
-		if (err && err != -ENODEV)
+		ret = of_dma_controller_register(np, d40_xlate, NULL);
+		if (ret && ret != -ENODEV)
 			dev_err(&pdev->dev,
 				"could not register of_dma_controller\n");
 	}
