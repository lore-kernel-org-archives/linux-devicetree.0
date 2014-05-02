From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH 3/3] media: mx2-emmaprp: Add devicetree support
Date: Fri,  2 May 2014 11:18:39 +0400
Message-ID: <1399015119-24000-1-git-send-email-shc_work@mail.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds devicetree support for the Freescale enhanced Multimedia
Accelerator (eMMA) video Pre-processor (PrP).

Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
---
 .../devicetree/bindings/media/fsl-imx-emmaprp.txt     | 19 +++++++++++++++++++
 drivers/media/platform/mx2_emmaprp.c                  |  8 ++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/fsl-imx-emmaprp.txt

diff --git a/Documentation/devicetree/bindings/media/fsl-imx-emmaprp.txt b/Documentation/devicetree/bindings/media/fsl-imx-emmaprp.txt
new file mode 100644
index 0000000..9e8238f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl-imx-emmaprp.txt
@@ -0,0 +1,19 @@
+* Freescale enhanced Multimedia Accelerator (eMMA) video Pre-processor (PrP)
+  for i.MX.
+
+Required properties:
+- compatible : Shall contain "fsl,imx21-emmaprp".
+- reg        : Offset and length of the register set for the device.
+- interrupts : Should contain eMMA PrP interrupt number.
+- clocks     : Should contain the ahb and ipg clocks, in the order
+               determined by the clock-names property.
+- clock-names: Should be "ahb", "ipg".
+
+Example:
+	emmaprp: emmaprp@10026400 {
+		compatible = "fsl,imx27-emmaprp", "fsl,imx21-emmaprp";
+		reg = <0x10026400 0x100>;
+		interrupts = <51>;
+		clocks = <&clks 49>, <&clks 68>;
+		clock-names = "ipg", "ahb";
+	};
diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/mx2_emmaprp.c
index fa8f7ca..0646bda 100644
--- a/drivers/media/platform/mx2_emmaprp.c
+++ b/drivers/media/platform/mx2_emmaprp.c
@@ -18,6 +18,7 @@
  */
 #include <linux/module.h>
 #include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -1005,12 +1006,19 @@ static int emmaprp_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id __maybe_unused emmaprp_dt_ids[] = {
+	{ .compatible = "fsl,imx21-emmaprp", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, emmaprp_dt_ids);
+
 static struct platform_driver emmaprp_pdrv = {
 	.probe		= emmaprp_probe,
 	.remove		= emmaprp_remove,
 	.driver		= {
 		.name	= MEM2MEM_NAME,
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(emmaprp_dt_ids),
 	},
 };
 module_platform_driver(emmaprp_pdrv);
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
