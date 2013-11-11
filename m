From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] pinctrl: imx1-core populate subdevices
Date: Mon, 11 Nov 2013 19:19:47 +0100
Message-ID: <1384193987-20740-1-git-send-email-mpa@pengutronix.de>
References: <CACRpkda2dO6DvurEhaTVGJv8nDyEGOEeLCap-_+1e1mHtD0XyQ@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkda2dO6DvurEhaTVGJv8nDyEGOEeLCap-_+1e1mHtD0XyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support gpio devicetree subnodes to allow a more detailed DT hardware
description.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---

Hi,

This is an incremental patch for the imx1-core and imx27-pinctrl patches to
support the gpio nodes as iomux subdevices.

Linus, I can resend this integrated into the other two patches if you want.

Regards,

Markus Pargmann


 .../bindings/pinctrl/fsl,imx27-pinctrl.txt         | 22 ++++++++++++++++++++++
 drivers/pinctrl/pinctrl-imx1-core.c                |  7 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
index 353eca0..d1706ea 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
@@ -52,12 +52,25 @@ Required properties for pin configuration node:
   CONFIG can be 0 or 1, meaning Pullup disable/enable.
 
 
+The iomux controller has gpio child nodes which are embedded in the iomux
+control registers. They have to be defined as child nodes of the iomux device
+node. If gpio subnodes are defined "#address-cells", "#size-cells" and "ranges"
+properties for the iomux device node are required.
 
 Example:
 
 iomuxc: iomuxc@10015000 {
 	compatible = "fsl,imx27-iomuxc";
 	reg = <0x10015000 0x600>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+
+	gpio1: gpio@10015000 {
+		...
+	};
+
+	...
 
 	uart {
 		pinctrl_uart1: uart-1 {
@@ -83,6 +96,15 @@ The above example using macros:
 iomuxc: iomuxc@10015000 {
 	compatible = "fsl,imx27-iomuxc";
 	reg = <0x10015000 0x600>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+
+	gpio1: gpio@10015000 {
+		...
+	};
+
+	...
 
 	uart {
 		pinctrl_uart1: uart-1 {
diff --git a/drivers/pinctrl/pinctrl-imx1-core.c b/drivers/pinctrl/pinctrl-imx1-core.c
index 4d5a9e7..2eadba7 100644
--- a/drivers/pinctrl/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/pinctrl-imx1-core.c
@@ -638,6 +638,13 @@ int imx1_pinctrl_core_probe(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		pinctrl_unregister(ipctl->pctl);
+		dev_err(&pdev->dev, "Failed to populate subdevices\n");
+		return ret;
+	}
+
 	dev_info(&pdev->dev, "initialized IMX pinctrl driver\n");
 
 	return 0;
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
