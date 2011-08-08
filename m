From: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Subject: [PATCH v2] USB: isp1362: Add devicetree support
Date: Mon,  8 Aug 2011 10:34:09 +0200
Message-ID: <1312792449-8491-1-git-send-email-tklauser@distanz.ch>
References: <1312292961-18309-1-git-send-email-tklauser@distanz.ch>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1312292961-18309-1-git-send-email-tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Acked-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---

Changes in v2:
 - Use sizeof(*pdata) to determine kzalloc size in isp1362_probe as Mike
   suggested.

 .../devicetree/bindings/usb/isp1362-hcd.txt        |   23 +++++
 drivers/usb/host/isp1362-hcd.c                     |   93 +++++++++++++++++++-
 2 files changed, 113 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/isp1362-hcd.txt

diff --git a/Documentation/devicetree/bindings/usb/isp1362-hcd.txt b/Documentation/devicetree/bindings/usb/isp1362-hcd.txt
new file mode 100644
index 0000000..9641a82
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/isp1362-hcd.txt
@@ -0,0 +1,23 @@
+NXP ISP1362 USB host controller
+
+Required properties :
+ - compatible : should be "nxp,usb-isp1362"
+ - reg : offset and length of the register set for the device
+ - interrupts : interrupt number
+
+Optional properties :
+ - nxp,sel15Kres: boolean; Enable internal pulldown resistors on downstream
+   ports.
+ - nxp,clknotstop: boolean; Clock cannot be stopped
+ - nxp,oc_enable: boolean; Enable on-chip overcurrent protection
+ - nxp,int_act_high: boolean; INT output polarity high
+ - nxp,int_edge_triggered: boolean; INT edge triggered
+ - nxp,dreq_act_high: boolean; DREQ output polarity high
+ - nxp,dack_act_high: boolean; DACK input polarity high
+ - nxp,remote_wakeup_connected: boolean; chip can be resumed via H_WAKEUP pin
+ - nxp,no_power_switching: boolean; Switch or not to switch (keep always
+   powered)
+ - nxp,power_switching_mode: boolean; Ganged port power switching (0) or
+   individual port power switching (1)
+ - nxp,potpg: Power on to power good time (duration the host controller has to
+   wait before accessing a power-on-port of the root hub) in units of 2 msecs.
diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index 9c37dad..055e0a3 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -78,6 +78,7 @@
 #include <linux/usb/isp1362.h>
 #include <linux/usb/hcd.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/io.h>
 #include <linux/bitmap.h>
@@ -2678,13 +2679,62 @@ static int __devexit isp1362_remove(struct platform_device *pdev)
 	usb_put_hcd(hcd);
 	DBG(0, "%s: Done\n", __func__);
 
+	/*
+	 * If we had no platform_data, we allocated the board struct
+	 * dynamically and filled it from device tree.
+	 */
+	if (!pdev->dev.platform_data)
+		kfree(isp1362_hcd->board);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+
+/*
+ * Translate device tree nodes to platform data.
+ */
+static int isp1362_get_devtree_pdata(struct platform_device *pdev,
+				     struct isp1362_platform_data *pdata)
+{
+	struct device_node *node = pdev->dev.of_node;
+	const __be32 *reg;
+	int len;
+
+	if (!node)
+		return -ENODEV;
+
+	pdata->sel15Kres = !!of_get_property(node, "nxp,sel15Kres", NULL);
+	pdata->clknotstop = !!of_get_property(node, "nxp,clknotstop", NULL);
+	pdata->oc_enable = !!of_get_property(node, "nxp,oc_enable", NULL);
+	pdata->int_act_high = !!of_get_property(node, "nxp,int_act_high", NULL);
+	pdata->int_edge_triggered =
+		!!of_get_property(node, "nxp,int_edge_triggered", NULL);
+	pdata->remote_wakeup_connected =
+		!!of_get_property(node, "nxp,remote_wakeup_connected", NULL);
+	pdata->no_power_switching =
+		!!of_get_property(node, "nxp,no_power_switching", NULL);
+	pdata->power_switching_mode =
+		!!of_get_property(node, "nxp,power_switching_mode", NULL);
+	reg = of_get_property(node, "nxp,potpg", &len);
+	if (reg && len == sizeof(__be32))
+		pdata->potpg = be32_to_cpup(reg);
+
 	return 0;
 }
+#else
+static int isp1362_get_devtree_pdata(struct platform_device *pdev,
+				     struct isp1362_platform_data *pdata)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_OF */
 
 static int __devinit isp1362_probe(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd;
 	struct isp1362_hcd *isp1362_hcd;
+	struct isp1362_platform_data *pdata;
 	struct resource *addr, *data;
 	void __iomem *addr_reg;
 	void __iomem *data_reg;
@@ -2755,12 +2805,31 @@ static int __devinit isp1362_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&isp1362_hcd->periodic);
 	INIT_LIST_HEAD(&isp1362_hcd->isoc);
 	INIT_LIST_HEAD(&isp1362_hcd->remove_list);
-	isp1362_hcd->board = pdev->dev.platform_data;
+
+	pdata = pdev->dev.platform_data;
+
+	/* If no platform data is available, try to get it from device tree */
+	if (!pdata) {
+		pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+		if (!pdata) {
+			retval = -ENOMEM;
+			goto err6;
+		}
+
+		retval = isp1362_get_devtree_pdata(pdev, pdata);
+		if (retval) {
+			kfree(pdata);
+			goto err6;
+		}
+	}
+
+	isp1362_hcd->board = pdata;
+
 #if USE_PLATFORM_DELAY
 	if (!isp1362_hcd->board->delay) {
 		dev_err(hcd->self.controller, "No platform delay function given\n");
 		retval = -ENODEV;
-		goto err6;
+		goto err7;
 	}
 #endif
 
@@ -2775,13 +2844,20 @@ static int __devinit isp1362_probe(struct platform_device *pdev)
 
 	retval = usb_add_hcd(hcd, irq, irq_flags | IRQF_DISABLED | IRQF_SHARED);
 	if (retval != 0)
-		goto err6;
+		goto err7;
 	pr_info("%s, irq %d\n", hcd->product_desc, irq);
 
 	create_debug_file(isp1362_hcd);
 
 	return 0;
 
+err7:
+	/*
+	 * If we have no platform_data, we allocated the board struct
+	 * dynamically.
+	 */
+	if (!pdev->dev.platform_data)
+		kfree(isp1362_hcd->board);
  err6:
 	DBG(0, "%s: Freeing dev %p\n", __func__, isp1362_hcd);
 	usb_put_hcd(hcd);
@@ -2852,6 +2928,16 @@ static int isp1362_resume(struct platform_device *pdev)
 #define	isp1362_resume	NULL
 #endif
 
+#ifdef CONFIG_OF
+static struct of_device_id isp1362_match[] = {
+	{ .compatible = "nxp,usb-isp1362", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, isp1362_match);
+#else
+#define isp1362_match NULL
+#endif /* CONFIG_OF */
+
 static struct platform_driver isp1362_driver = {
 	.probe = isp1362_probe,
 	.remove = __devexit_p(isp1362_remove),
@@ -2861,6 +2947,7 @@ static struct platform_driver isp1362_driver = {
 	.driver = {
 		.name = (char *)hcd_name,
 		.owner = THIS_MODULE,
+		.of_match_table = isp1362_match,
 	},
 };
 
-- 
1.7.5.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
