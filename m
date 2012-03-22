From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] USB: Add DT probing support to ehci-spear and ohci-spear
Date: Thu, 22 Mar 2012 16:50:02 +0100
Message-ID: <1332431402-20606-1-git-send-email-sr@denx.de>
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
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support to configure the SPEAr EHCI & OHCI driver via
device-tree instead of platform_data.

Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/usb/spear-usb.txt          |   39 ++++++++++++++++++++
 drivers/usb/host/ehci-spear.c                      |   32 +++++++++++++---
 drivers/usb/host/ohci-spear.c                      |   32 +++++++++++++---
 3 files changed, 91 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/spear-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/spear-usb.txt b/Documentation/devicetree/bindings/usb/spear-usb.txt
new file mode 100644
index 0000000..f8a464a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/spear-usb.txt
@@ -0,0 +1,39 @@
+ST SPEAr SoC USB controllers:
+-----------------------------
+
+EHCI:
+-----
+
+Required properties:
+- compatible: "st,spear600-ehci"
+- interrupt-parent: Should be the phandle for the interrupt controller
+  that services interrupts for this device
+- interrupts: Should contain the EHCI interrupt
+
+Example:
+
+	ehci@e1800000 {
+		compatible = "st,spear600-ehci", "usb-ehci";
+		reg = <0xe1800000 0x1000>;
+		interrupt-parent = <&vic1>;
+		interrupts = <27>;
+	};
+
+
+OHCI:
+-----
+
+Required properties:
+- compatible: "st,spear600-ohci"
+- interrupt-parent: Should be the phandle for the interrupt controller
+  that services interrupts for this device
+- interrupts: Should contain the OHCI interrupt
+
+Example:
+
+	ohci@e1900000 {
+		compatible = "st,spear600-ohci", "usb-ohci";
+		reg = <0xe1800000 0x1000>;
+		interrupt-parent = <&vic1>;
+		interrupts = <26>;
+	};
diff --git a/drivers/usb/host/ehci-spear.c b/drivers/usb/host/ehci-spear.c
index 6e92855..2e3c89a 100644
--- a/drivers/usb/host/ehci-spear.c
+++ b/drivers/usb/host/ehci-spear.c
@@ -13,6 +13,7 @@
 
 #include <linux/clk.h>
 #include <linux/jiffies.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 
@@ -168,6 +169,8 @@ static int ehci_spear_drv_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(ehci_spear_pm_ops, ehci_spear_drv_suspend,
 		ehci_spear_drv_resume);
 
+static u64 spear_ehci_dma_mask = DMA_BIT_MASK(32);
+
 static int spear_ehci_hcd_drv_probe(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd ;
@@ -175,12 +178,9 @@ static int spear_ehci_hcd_drv_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct clk *usbh_clk;
 	const struct hc_driver *driver = &ehci_spear_hc_driver;
-	int *pdata = pdev->dev.platform_data;
 	int irq, retval;
 	char clk_name[20] = "usbh_clk";
-
-	if (pdata == NULL)
-		return -EFAULT;
+	static int instance = -1;
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -191,8 +191,22 @@ static int spear_ehci_hcd_drv_probe(struct platform_device *pdev)
 		goto fail_irq_get;
 	}
 
-	if (*pdata >= 0)
-		sprintf(clk_name, "usbh.%01d_clk", *pdata);
+	/*
+	 * Right now device-tree probed devices don't get dma_mask set.
+	 * Since shared usb code relies on it, set it here for now.
+	 * Once we have dma capability bindings this can go away.
+	 */
+	if (!pdev->dev.dma_mask)
+		pdev->dev.dma_mask = &spear_ehci_dma_mask;
+
+	/*
+	 * Increment the device instance, when probing via device-tree
+	 */
+	if (pdev->id < 0)
+		instance++;
+	else
+		instance = pdev->id;
+	sprintf(clk_name, "usbh.%01d_clk", instance);
 
 	usbh_clk = clk_get(NULL, clk_name);
 	if (IS_ERR(usbh_clk)) {
@@ -277,6 +291,11 @@ static int spear_ehci_hcd_drv_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id spear_ehci_id_table[] __devinitdata = {
+	{ .compatible = "st,spear600-ehci", },
+	{ },
+};
+
 static struct platform_driver spear_ehci_hcd_driver = {
 	.probe		= spear_ehci_hcd_drv_probe,
 	.remove		= spear_ehci_hcd_drv_remove,
@@ -285,6 +304,7 @@ static struct platform_driver spear_ehci_hcd_driver = {
 		.name = "spear-ehci",
 		.bus = &platform_bus_type,
 		.pm = &ehci_spear_pm_ops,
+		.of_match_table = of_match_ptr(spear_ehci_id_table),
 	}
 };
 
diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
index 95c1648..eb4640b 100644
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -14,6 +14,7 @@
 #include <linux/signal.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/of.h>
 
 struct spear_ohci {
 	struct ohci_hcd ohci;
@@ -90,6 +91,8 @@ static const struct hc_driver ohci_spear_hc_driver = {
 	.start_port_reset	= ohci_start_port_reset,
 };
 
+static u64 spear_ohci_dma_mask = DMA_BIT_MASK(32);
+
 static int spear_ohci_hcd_drv_probe(struct platform_device *pdev)
 {
 	const struct hc_driver *driver = &ohci_spear_hc_driver;
@@ -98,11 +101,8 @@ static int spear_ohci_hcd_drv_probe(struct platform_device *pdev)
 	struct spear_ohci *ohci_p;
 	struct resource *res;
 	int retval, irq;
-	int *pdata = pdev->dev.platform_data;
 	char clk_name[20] = "usbh_clk";
-
-	if (pdata == NULL)
-		return -EFAULT;
+	static int instance = -1;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
@@ -110,8 +110,22 @@ static int spear_ohci_hcd_drv_probe(struct platform_device *pdev)
 		goto fail_irq_get;
 	}
 
-	if (*pdata >= 0)
-		sprintf(clk_name, "usbh.%01d_clk", *pdata);
+	/*
+	 * Right now device-tree probed devices don't get dma_mask set.
+	 * Since shared usb code relies on it, set it here for now.
+	 * Once we have dma capability bindings this can go away.
+	 */
+	if (!pdev->dev.dma_mask)
+		pdev->dev.dma_mask = &spear_ohci_dma_mask;
+
+	/*
+	 * Increment the device instance, when probing via device-tree
+	 */
+	if (pdev->id < 0)
+		instance++;
+	else
+		instance = pdev->id;
+	sprintf(clk_name, "usbh.%01d_clk", instance);
 
 	usbh_clk = clk_get(NULL, clk_name);
 	if (IS_ERR(usbh_clk)) {
@@ -222,6 +236,11 @@ static int spear_ohci_hcd_drv_resume(struct platform_device *dev)
 }
 #endif
 
+static struct of_device_id spear_ohci_id_table[] __devinitdata = {
+	{ .compatible = "st,spear600-ohci", },
+	{ },
+};
+
 /* Driver definition to register with the platform bus */
 static struct platform_driver spear_ohci_hcd_driver = {
 	.probe =	spear_ohci_hcd_drv_probe,
@@ -233,6 +252,7 @@ static struct platform_driver spear_ohci_hcd_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
 		.name = "spear-ohci",
+		.of_match_table = of_match_ptr(spear_ohci_id_table),
 	},
 };
 
-- 
1.7.9.2
