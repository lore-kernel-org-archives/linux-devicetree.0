From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] ipmi: convert OF driver to platform driver
Date: Wed, 17 Nov 2010 17:50:22 -0600
Message-ID: <1290037824-24978-2-git-send-email-robherring2@gmail.com>
References: <1290037824-24978-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1290037824-24978-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

of_bus is deprecated in favor of the plain platform bus. This patch
converts the ipmi OF driver over to the platform bus.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 drivers/char/ipmi/ipmi_si_intf.c |   36 +++++++++++++++++++++---------------
 1 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 7cca8dd..9167e04 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -68,7 +68,6 @@
 
 #ifdef CONFIG_PPC_OF
 #include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #endif
@@ -311,7 +310,7 @@ static int pci_registered;
 static int pnp_registered;
 #endif
 #ifdef CONFIG_PPC_OF
-static int of_registered;
+static int plat_registered;
 #endif
 
 static unsigned int kipmid_max_busy_us[SI_MAX_PARMS];
@@ -2533,13 +2532,13 @@ static struct pci_driver ipmi_pci_driver = {
 
 
 #ifdef CONFIG_PPC_OF
-static int __devinit ipmi_of_probe(struct platform_device *dev,
-			 const struct of_device_id *match)
+static int __devinit ipmi_plat_probe(struct platform_device *dev)
 {
 	struct smi_info *info;
 	struct resource resource;
 	const __be32 *regsize, *regspacing, *regshift;
 	struct device_node *np = dev->dev.of_node;
+	const struct of_device_id *match;
 	int ret;
 	int proplen;
 
@@ -2569,6 +2568,13 @@ static int __devinit ipmi_of_probe(struct platform_device *dev,
 		return -EINVAL;
 	}
 
+	match = of_match_device(dev->dev.driver->of_match_table, &dev->dev);
+	if (!match) {
+		dev_err(&dev->dev,
+			"No match for OF device\n");
+		return -ENOMEM;
+	}
+
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 
 	if (!info) {
@@ -2612,7 +2618,7 @@ static int __devinit ipmi_of_probe(struct platform_device *dev,
 	return 0;
 }
 
-static int __devexit ipmi_of_remove(struct platform_device *dev)
+static int __devexit ipmi_plat_remove(struct platform_device *dev)
 {
 	cleanup_one_si(dev_get_drvdata(&dev->dev));
 	return 0;
@@ -2629,14 +2635,14 @@ static struct of_device_id ipmi_match[] =
 	{},
 };
 
-static struct of_platform_driver ipmi_of_platform_driver = {
+static struct platform_driver ipmi_platform_driver = {
 	.driver = {
-		.name = "ipmi",
+		.name = "ipmi-pltfm",
 		.owner = THIS_MODULE,
 		.of_match_table = ipmi_match,
 	},
-	.probe		= ipmi_of_probe,
-	.remove		= __devexit_p(ipmi_of_remove),
+	.probe		= ipmi_plat_probe,
+	.remove		= __devexit_p(ipmi_plat_remove),
 };
 #endif /* CONFIG_PPC_OF */
 
@@ -3376,8 +3382,8 @@ static __devinit int init_ipmi_si(void)
 #endif
 
 #ifdef CONFIG_PPC_OF
-	of_register_platform_driver(&ipmi_of_platform_driver);
-	of_registered = 1;
+	platform_driver_register(&ipmi_platform_driver);
+	plat_registered = 1;
 #endif
 
 	/* We prefer devices with interrupts, but in the case of a machine
@@ -3436,8 +3442,8 @@ static __devinit int init_ipmi_si(void)
 #endif
 
 #ifdef CONFIG_PPC_OF
-		if (of_registered)
-			of_unregister_platform_driver(&ipmi_of_platform_driver);
+		if (plat_registered)
+			platform_driver_unregister(&ipmi_platform_driver);
 #endif
 		driver_unregister(&ipmi_driver.driver);
 		printk(KERN_WARNING PFX
@@ -3537,8 +3543,8 @@ static __exit void cleanup_ipmi_si(void)
 #endif
 
 #ifdef CONFIG_PPC_OF
-	if (of_registered)
-		of_unregister_platform_driver(&ipmi_of_platform_driver);
+	if (plat_registered)
+		platform_driver_unregister(&ipmi_platform_driver);
 #endif
 
 	mutex_lock(&smi_infos_lock);
-- 
1.7.1
