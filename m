From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2 1/2] mfd: stmpe: Use devm_*() routines
Date: Thu, 22 Nov 2012 10:40:29 +0530
Message-ID: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
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
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch frees stmpe driver from tension of freeing resources :)
devm_* derivatives of multiple routines are used while allocating resources,
which would be freed automatically by kernel.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

V1->V2:
------
- Rebased over latest for-next from Samuel
- updated additional kzalloc with devm_kzalloc(), first one seen below.

 drivers/mfd/stmpe.c | 60 +++++++++++++++++++----------------------------------
 1 file changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index ba157d4..c0df4b9 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1052,17 +1052,17 @@ int __devinit stmpe_probe(struct stmpe_client_info *ci, int partnum)
 	int ret;
 
 	if (!pdata) {
-		if (np) {
-			pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
-			if (!pdata)
-				return -ENOMEM;
-
-			stmpe_of_probe(pdata, np);
-		} else
+		if (!np)
 			return -EINVAL;
+
+		pdata = devm_kzalloc(ci->dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata)
+			return -ENOMEM;
+
+		stmpe_of_probe(pdata, np);
 	}
 
-	stmpe = kzalloc(sizeof(struct stmpe), GFP_KERNEL);
+	stmpe = devm_kzalloc(ci->dev, sizeof(struct stmpe), GFP_KERNEL);
 	if (!stmpe)
 		return -ENOMEM;
 
@@ -1084,11 +1084,12 @@ int __devinit stmpe_probe(struct stmpe_client_info *ci, int partnum)
 		ci->init(stmpe);
 
 	if (pdata->irq_over_gpio) {
-		ret = gpio_request_one(pdata->irq_gpio, GPIOF_DIR_IN, "stmpe");
+		ret = devm_gpio_request_one(ci->dev, pdata->irq_gpio,
+				GPIOF_DIR_IN, "stmpe");
 		if (ret) {
 			dev_err(stmpe->dev, "failed to request IRQ GPIO: %d\n",
 					ret);
-			goto out_free;
+			return ret;
 		}
 
 		stmpe->irq = gpio_to_irq(pdata->irq_gpio);
@@ -1105,48 +1106,37 @@ int __devinit stmpe_probe(struct stmpe_client_info *ci, int partnum)
 			dev_err(stmpe->dev,
 				"%s does not support no-irq mode!\n",
 				stmpe->variant->name);
-			ret = -ENODEV;
-			goto free_gpio;
+			return -ENODEV;
 		}
 		stmpe->variant = stmpe_noirq_variant_info[stmpe->partnum];
 	}
 
 	ret = stmpe_chip_init(stmpe);
 	if (ret)
-		goto free_gpio;
+		return ret;
 
 	if (stmpe->irq >= 0) {
 		ret = stmpe_irq_init(stmpe, np);
 		if (ret)
-			goto free_gpio;
+			return ret;
 
-		ret = request_threaded_irq(stmpe->irq, NULL, stmpe_irq,
-				pdata->irq_trigger | IRQF_ONESHOT,
+		ret = devm_request_threaded_irq(ci->dev, stmpe->irq, NULL,
+				stmpe_irq, pdata->irq_trigger | IRQF_ONESHOT,
 				"stmpe", stmpe);
 		if (ret) {
 			dev_err(stmpe->dev, "failed to request IRQ: %d\n",
 					ret);
-			goto free_gpio;
+			return ret;
 		}
 	}
 
 	ret = stmpe_devices_init(stmpe);
-	if (ret) {
-		dev_err(stmpe->dev, "failed to add children\n");
-		goto out_removedevs;
-	}
-
-	return 0;
+	if (!ret)
+		return 0;
 
-out_removedevs:
+	dev_err(stmpe->dev, "failed to add children\n");
 	mfd_remove_devices(stmpe->dev);
-	if (stmpe->irq >= 0)
-		free_irq(stmpe->irq, stmpe);
-free_gpio:
-	if (pdata->irq_over_gpio)
-		gpio_free(pdata->irq_gpio);
-out_free:
-	kfree(stmpe);
+
 	return ret;
 }
 
@@ -1154,14 +1144,6 @@ int stmpe_remove(struct stmpe *stmpe)
 {
 	mfd_remove_devices(stmpe->dev);
 
-	if (stmpe->irq >= 0)
-		free_irq(stmpe->irq, stmpe);
-
-	if (stmpe->pdata->irq_over_gpio)
-		gpio_free(stmpe->pdata->irq_gpio);
-
-	kfree(stmpe);
-
 	return 0;
 }
 
-- 
1.7.12.rc2.18.g61b472e
