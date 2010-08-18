From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 07/14] drivers/smsc911x: add DT support
Date: Wed, 18 Aug 2010 19:59:53 +0100
Message-ID: <1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-7-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

When OF is enabled the device driver should initialize the match table
in order to be probable from the device tree. Furthermore, HW properties
should be retrieved from the device tree node, so a device tree probe
function is required to parse node properties at run-time. To avoid
preprocessor macros, open firmware functions are defined in a separate
C file that is optionally compiled-in.

This patch adds the infrastructure needed to enable device tree parsing
to smsc911 platform driver, inclusive of Makefile and device tree
parsing functions. Driver properties should be defined and retrieved
from the device tree if OF is enabled, otherwise the driver would fall
back to platform data static initialization.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 drivers/net/Makefile      |    3 +-
 drivers/net/smsc911x-of.c |   53 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/smsc911x.c    |   28 ++++++++++++++++-------
 drivers/net/smsc911x.h    |    8 ++++++
 4 files changed, 82 insertions(+), 10 deletions(-)
 create mode 100644 drivers/net/smsc911x-of.c

diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 0a0512a..0d2faf9 100644
--- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -243,7 +243,8 @@ obj-$(CONFIG_VXGE) += vxge/
 obj-$(CONFIG_MYRI10GE) += myri10ge/
 obj-$(CONFIG_SMC91X) += smc91x.o
 obj-$(CONFIG_SMC911X) += smc911x.o
-obj-$(CONFIG_SMSC911X) += smsc911x.o
+smsc911x_of-$(CONFIG_OF) := smsc911x-of.o
+obj-$(CONFIG_SMSC911X) += smsc911x.o $(smsc911x_of-y)
 obj-$(CONFIG_BFIN_MAC) += bfin_mac.o
 obj-$(CONFIG_DM9000) += dm9000.o
 obj-$(CONFIG_PASEMI_MAC) += pasemi_mac_driver.o
diff --git a/drivers/net/smsc911x-of.c b/drivers/net/smsc911x-of.c
new file mode 100644
index 0000000..b8751cf
--- /dev/null
+++ b/drivers/net/smsc911x-of.c
@@ -0,0 +1,53 @@
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/smsc911x.h>
+#include <linux/kernel.h>
+
+#include "smsc911x.h"
+
+
+int smsc911x_probe_dt(struct smsc911x_platform_config *cfg,
+		struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	int ret = -ENODEV;
+	const u32 *prop;
+
+	if (!node)
+		goto err;
+
+	prop = of_get_property(node, "flags", NULL);
+	if (!prop)
+		goto err;
+
+	cfg->flags = of_read_number(prop, 1);
+
+	prop = of_get_property(node, "irq-polarity", NULL);
+	if (!prop)
+		goto err;
+
+	cfg->irq_polarity = of_read_number(prop, 1);
+
+	prop = of_get_property(node, "irq-type", NULL);
+	if (!prop)
+		goto err;
+
+	cfg->irq_type = of_read_number(prop, 1);
+
+	prop = of_get_property(node, "phy-interface", NULL);
+	if (!prop)
+		goto err;
+
+	cfg->phy_interface = of_read_number(prop, 1);
+
+	pr_info("%s: Parsed FDT info\n", node->name);
+	pr_info("FLAGS %d\n", cfg->flags);
+	pr_info("IRQ-POLARITY %d\n", cfg->irq_polarity);
+	pr_info("IRQ-TYPE %d\n", cfg->irq_type);
+	pr_info("PHY IF %d\n", cfg->phy_interface);
+	return 0;
+err:
+	return ret;
+}
diff --git a/drivers/net/smsc911x.c b/drivers/net/smsc911x.c
index cc55974..c56b8f7 100644
--- a/drivers/net/smsc911x.c
+++ b/drivers/net/smsc911x.c
@@ -50,6 +50,7 @@
 #include <linux/phy.h>
 #include <linux/smsc911x.h>
 #include <linux/device.h>
+
 #include "smsc911x.h"
 
 #define SMSC_CHIPNAME		"smsc911x"
@@ -1945,13 +1946,6 @@ static int __devinit smsc911x_drv_probe(struct platform_device *pdev)
 
 	pr_info("%s: Driver version %s.\n", SMSC_CHIPNAME, SMSC_DRV_VERSION);
 
-	/* platform data specifies irq & dynamic bus configuration */
-	if (!pdev->dev.platform_data) {
-		pr_warning("%s: platform_data not provided\n", SMSC_CHIPNAME);
-		retval = -ENODEV;
-		goto out_0;
-	}
-
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 					   "smsc911x-memory");
 	if (!res)
@@ -1988,12 +1982,22 @@ static int __devinit smsc911x_drv_probe(struct platform_device *pdev)
 
 	pdata = netdev_priv(dev);
 
+	if (smsc911x_probe_dt(&pdata->config, pdev) == -ENODEV) {
+		/* platform data specifies irq & dynamic bus configuration */
+		if (!pdev->dev.platform_data) {
+			pr_warning("%s: platform_data not provided\n",
+					SMSC_CHIPNAME);
+			retval = -ENODEV;
+			goto out_0;
+		}
+		/* copy config parameters across to pdata */
+		memcpy(&pdata->config, config, sizeof(pdata->config));
+	}
+
 	dev->irq = irq_res->start;
 	irq_flags = irq_res->flags & IRQF_TRIGGER_MASK;
 	pdata->ioaddr = ioremap_nocache(res->start, res_size);
 
-	/* copy config parameters across to pdata */
-	memcpy(&pdata->config, config, sizeof(pdata->config));
 
 	pdata->dev = dev;
 	pdata->msg_enable = ((1 << debug) - 1);
@@ -2150,6 +2154,11 @@ static const struct dev_pm_ops smsc911x_pm_ops = {
 #define SMSC911X_PM_OPS NULL
 #endif
 
+static struct of_device_id smsc911x_matches[] = {
+	{ .compatible = "smc,smsc-911"},
+	{},
+};
+
 static struct platform_driver smsc911x_driver = {
 	.probe = smsc911x_drv_probe,
 	.remove = __devexit_p(smsc911x_drv_remove),
@@ -2163,6 +2172,7 @@ static struct platform_driver smsc911x_driver = {
 /* Entry point for loading the module */
 static int __init smsc911x_init_module(void)
 {
+	platform_init_match(&smsc911x_driver, smsc911x_matches);
 	return platform_driver_register(&smsc911x_driver);
 }
 
diff --git a/drivers/net/smsc911x.h b/drivers/net/smsc911x.h
index 016360c..5ec9a8b 100644
--- a/drivers/net/smsc911x.h
+++ b/drivers/net/smsc911x.h
@@ -394,4 +394,12 @@
 #define LPA_PAUSE_ALL			(LPA_PAUSE_CAP | \
 					 LPA_PAUSE_ASYM)
 
+#ifndef CONFIG_OF
+static inline int smsc911x_probe_dt(struct smsc911x_platform_config *cfg,
+		struct platform_device *pdev) { return -ENODEV; }
+#else
+extern int smsc911x_probe_dt(struct smsc911x_platform_config *cfg,
+		struct platform_device *pdev);
+#endif
+
 #endif				/* __SMSC911X_H__ */
-- 
1.6.3.3
