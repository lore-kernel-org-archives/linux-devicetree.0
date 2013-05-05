From: chenlibo.3@gmail.com
Subject: [PATCH] bestcomm: no need to free when kzalloc fail
Date: Sun,  5 May 2013 01:38:24 -0700
Message-ID: <1367743104-3448-1-git-send-email-libo.chen@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, rob.herring@calxeda.com
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Libo Chen <libo.chen@huawei.com>
List-Id: devicetree@vger.kernel.org

From: Libo Chen <libo.chen@huawei.com>

There is no need to free bcom_eng if kzalloc fail

Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 drivers/dma/bestcomm/bestcomm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index a8c2e29..300ee2d 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -400,7 +400,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 		printk(KERN_ERR DRIVER_NAME ": "
 			"Can't allocate state structure\n");
 		rv = -ENOMEM;
-		goto error_sramclean;
+		goto error_kzalloc;
 	}
 
 	/* Save the node */
@@ -449,6 +449,7 @@ error_release:
 	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
 error_sramclean:
 	kfree(bcom_eng);
+error_kzalloc:
 	bcom_sram_cleanup();
 error_ofput:
 	of_node_put(op->dev.of_node);
-- 
1.8.1.2
