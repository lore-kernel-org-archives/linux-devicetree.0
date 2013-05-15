From: Libo Chen <clbchenlibo.chen@huawei.com>
Subject: [PATCH] usb: omap2430: fix memleak in err case
Date: Wed, 15 May 2013 09:35:12 +0800
Message-ID: <5192E650.3070303@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, rob.herring@calxeda.com
Cc: linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org


when omap_get_control_dev fail, we should release relational platform_device

Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 drivers/usb/musb/omap2430.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index 3551f1a..b626f19 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -549,7 +549,8 @@ static int omap2430_probe(struct platform_device *pdev)
 		glue->control_otghs = omap_get_control_dev();
 		if (IS_ERR(glue->control_otghs)) {
 			dev_vdbg(&pdev->dev, "Failed to get control device\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err2;
 		}
 	} else {
 		glue->control_otghs = ERR_PTR(-ENODEV);
-- 
1.7.1
