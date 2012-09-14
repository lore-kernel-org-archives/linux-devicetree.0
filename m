From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] usb: gadget: s3c-hsotg: Add device tree support
Date: Fri, 14 Sep 2012 17:18:58 +0530
Message-ID: <1347623338-14292-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: balbi-l0cyMroinI0@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree support for s3c-hsotg driver
used for Samsung platforms.

Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/usb/s3c-hsotg.txt          |   16 ++++++++++++++++
 drivers/usb/gadget/s3c-hsotg.c                     |   20 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/s3c-hsotg.txt

diff --git a/Documentation/devicetree/bindings/usb/s3c-hsotg.txt b/Documentation/devicetree/bindings/usb/s3c-hsotg.txt
new file mode 100644
index 0000000..30b26c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/s3c-hsotg.txt
@@ -0,0 +1,16 @@
+Samsung HSOTG controller s3c-hsotg
+
+Required properties:
+  - compatible : should be "samsung,exynos-hsotg".
+  - reg : should contain at least address and length of the standard HSOTG
+    register set for the device.
+  - interrupts : one HSOTG interrupt should be described here.
+
+Example (Samsung Origen):
+
+	usb@12480000 {
+		compatible = "samsung,exynos-hsotg";
+		reg = <0x12480000 0x20000>;
+		interrupts = <0 71 0>;
+	};
+
diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index b13e0bb..d7f557f 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -28,6 +28,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/regulator/consumer.h>
 
 #include <linux/usb/ch9.h>
@@ -3485,6 +3486,8 @@ static void s3c_hsotg_release(struct device *dev)
 	kfree(hsotg);
 }
 
+static u64 s3c_hsotg_dma_mask = DMA_BIT_MASK(32);
+
 /**
  * s3c_hsotg_probe - probe function for hsotg driver
  * @pdev: The platform information for the driver
@@ -3507,6 +3510,14 @@ static int __devinit s3c_hsotg_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/*
+	 * Right now device-tree probed devices don't get dma_mask set.
+	 */
+	if (!pdev->dev.dma_mask)
+		pdev->dev.dma_mask = &s3c_hsotg_dma_mask;
+	if (!pdev->dev.coherent_dma_mask)
+		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+
 	hsotg = devm_kzalloc(&pdev->dev, sizeof(struct s3c_hsotg), GFP_KERNEL);
 	if (!hsotg) {
 		dev_err(dev, "cannot get memory\n");
@@ -3701,10 +3712,19 @@ static int __devexit s3c_hsotg_remove(struct platform_device *pdev)
 #define s3c_hsotg_resume NULL
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id exynos_hsotg_match[] = {
+	{ .compatible = "samsung,exynos-hsotg" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_hsotg_match);
+#endif
+
 static struct platform_driver s3c_hsotg_driver = {
 	.driver		= {
 		.name	= "s3c-hsotg",
 		.owner	= THIS_MODULE,
+		.of_match_table	= of_match_ptr(exynos_hsotg_match),
 	},
 	.probe		= s3c_hsotg_probe,
 	.remove		= __devexit_p(s3c_hsotg_remove),
-- 
1.7.4.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
