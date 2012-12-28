From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] mfd: tps65090: remove suspend/resume callbacks
Date: Fri, 28 Dec 2012 14:59:41 +0530
Message-ID: <1356686981-4152-5-git-send-email-ldewangan@nvidia.com>
References: <1356686981-4152-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1356686981-4152-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, lrg-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

The tps65090 mfd driver implement the suspend/resume callbacks
which just disable and enable irqs in suspend/resume respectively.

This operation is already done in irq suspend and irq_resume and
hence it is not require to implement the same in the driver.

Remove this non-require code.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This change is based on Mark Brown's comment when reviewing tps80031 mfd driver
as we do not need suspend/resume just for disabling/enabling interrupts.

 drivers/mfd/tps65090.c |   23 -----------------------
 1 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index 3e987be..995e7b3 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -262,28 +262,6 @@ static int tps65090_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tps65090_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	if (client->irq)
-		disable_irq(client->irq);
-	return 0;
-}
-
-static int tps65090_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	if (client->irq)
-		enable_irq(client->irq);
-	return 0;
-}
-#endif
-
-static const struct dev_pm_ops tps65090_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tps65090_suspend, tps65090_resume)
-};
-
 static const struct i2c_device_id tps65090_id_table[] = {
 	{ "tps65090", 0 },
 	{ },
@@ -295,7 +273,6 @@ static struct i2c_driver tps65090_driver = {
 		.name	= "tps65090",
 		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(tps65090_of_match),
-		.pm	= &tps65090_pm_ops,
 	},
 	.probe		= tps65090_i2c_probe,
 	.remove		= tps65090_i2c_remove,
-- 
1.7.1.1
