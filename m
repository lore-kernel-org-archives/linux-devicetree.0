From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Mon, 18 Apr 2011 10:50:54 +0200
Message-ID: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding OF binding to genirq.
Version string is setup to the "devicetree".

Compatible string is not setup for now but you can add your
custom compatible string to uio_of_genirq_match structure.

For example with "uio" compatible string:
static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
	{ .compatible = "uio", },
	{ /* empty for now */ },
};

Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>

---

v3: Fix irq binding
    Use "devicetree" as version string

v2: Remove additional resource binding
    Setup correct version string
    Clear compatible string
---
 drivers/uio/uio_pdrv_genirq.c |   42 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
index 7174d51..c8d565a 100644
--- a/drivers/uio/uio_pdrv_genirq.c
+++ b/drivers/uio/uio_pdrv_genirq.c
@@ -23,6 +23,10 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+
 #define DRIVER_NAME "uio_pdrv_genirq"
 
 struct uio_pdrv_genirq_platdata {
@@ -97,6 +101,30 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 	int ret = -EINVAL;
 	int i;
 
+	if (!uioinfo) {
+		int irq;
+
+		/* alloc uioinfo for one device */
+		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
+		if (!uioinfo) {
+			ret = -ENOMEM;
+			dev_err(&pdev->dev, "unable to kmalloc\n");
+			goto bad2;
+		}
+		uioinfo->name = pdev->dev.of_node->name;
+		uioinfo->version = "devicetree";
+
+		/* Multiple IRQs are not supported */
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0) {
+			uioinfo->irq = UIO_IRQ_NONE;
+			dev_info(&pdev->dev, "no IRQ found\n");
+		} else {
+			uioinfo->irq = irq;
+			dev_info(&pdev->dev, "irq %d\n", (u32)uioinfo->irq);
+		}
+	}
+
 	if (!uioinfo || !uioinfo->name || !uioinfo->version) {
 		dev_err(&pdev->dev, "missing platform_data\n");
 		goto bad0;
@@ -180,6 +208,10 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 	kfree(priv);
 	pm_runtime_disable(&pdev->dev);
  bad0:
+	/* kfree uioinfo for CONFIG_OF */
+	if (!pdev->dev.platform_data)
+		kfree(uioinfo);
+ bad2:
 	return ret;
 }
 
@@ -215,6 +247,15 @@ static const struct dev_pm_ops uio_pdrv_genirq_dev_pm_ops = {
 	.runtime_resume = uio_pdrv_genirq_runtime_nop,
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
+	{ /* empty for now */ },
+};
+MODULE_DEVICE_TABLE(of, uio_of_genirq_match);
+#else
+# define uio_of_genirq_match NULL
+#endif
+
 static struct platform_driver uio_pdrv_genirq = {
 	.probe = uio_pdrv_genirq_probe,
 	.remove = uio_pdrv_genirq_remove,
@@ -222,6 +263,7 @@ static struct platform_driver uio_pdrv_genirq = {
 		.name = DRIVER_NAME,
 		.owner = THIS_MODULE,
 		.pm = &uio_pdrv_genirq_dev_pm_ops,
+		.of_match_table = uio_of_genirq_match,
 	},
 };
 
-- 
1.5.5.6
