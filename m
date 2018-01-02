From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH] pinctrl: imx6ul: add IOMUXC SNVS pinctrl driver for i.MX 6ULL
Date: Tue,  2 Jan 2018 17:40:59 +0100
Message-ID: <20180102164059.14641-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>

On i.MX 6ULL, the BOOT_MODEx and TAMPERx pin MUX and CTRL registers
are available in a separate IOMUXC_SNVS module. Add support for the
IOMUXC_SNVS module to the i.MX 6UL pinctrl driver.

Signed-off-by: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 .../bindings/pinctrl/fsl,imx6ul-pinctrl.txt        |  3 +-
 drivers/pinctrl/freescale/pinctrl-imx6ul.c         | 52 +++++++++++++++++++++-
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.txt
index a81bbf37ed66..7ca4f6118d9a 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.txt
@@ -4,7 +4,8 @@ Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
 and usage.
 
 Required properties:
-- compatible: "fsl,imx6ul-iomuxc"
+- compatible: "fsl,imx6ul-iomuxc" for main IOMUX controller or
+  "fsl,imx6ull-iomuxc-snvs" for i.MX 6ULL's SNVS IOMUX controller.
 - fsl,pins: each entry consists of 6 integers and represents the mux and config
   setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
   input_val> are specified using a PIN_FUNC_ID macro, which can be found in
diff --git a/drivers/pinctrl/freescale/pinctrl-imx6ul.c b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
index 1aeb840aae1d..cbad1c69226d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6ul.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6ul.c
@@ -150,6 +150,21 @@ enum imx6ul_pads {
 	MX6UL_PAD_CSI_DATA07 = 128,
 };
 
+enum imx6ull_lpsr_pads {
+	MX6ULL_PAD_BOOT_MODE0 = 0,
+	MX6ULL_PAD_BOOT_MODE1 = 1,
+	MX6ULL_PAD_SNVS_TAMPER0 = 2,
+	MX6ULL_PAD_SNVS_TAMPER1 = 3,
+	MX6ULL_PAD_SNVS_TAMPER2 = 4,
+	MX6ULL_PAD_SNVS_TAMPER3 = 5,
+	MX6ULL_PAD_SNVS_TAMPER4 = 6,
+	MX6ULL_PAD_SNVS_TAMPER5 = 7,
+	MX6ULL_PAD_SNVS_TAMPER6 = 8,
+	MX6ULL_PAD_SNVS_TAMPER7 = 9,
+	MX6ULL_PAD_SNVS_TAMPER8 = 10,
+	MX6ULL_PAD_SNVS_TAMPER9 = 11,
+};
+
 /* Pad names for the pinmux subsystem */
 static const struct pinctrl_pin_desc imx6ul_pinctrl_pads[] = {
 	IMX_PINCTRL_PIN(MX6UL_PAD_RESERVE0),
@@ -283,20 +298,53 @@ static const struct pinctrl_pin_desc imx6ul_pinctrl_pads[] = {
 	IMX_PINCTRL_PIN(MX6UL_PAD_CSI_DATA07),
 };
 
+/* pad for i.MX6ULL lpsr pinmux */
+static struct pinctrl_pin_desc imx6ull_snvs_pinctrl_pads[] = {
+	IMX_PINCTRL_PIN(MX6ULL_PAD_BOOT_MODE0),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_BOOT_MODE1),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER0),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER1),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER2),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER3),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER4),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER5),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER6),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER7),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER8),
+	IMX_PINCTRL_PIN(MX6ULL_PAD_SNVS_TAMPER9),
+};
+
 static struct imx_pinctrl_soc_info imx6ul_pinctrl_info = {
 	.pins = imx6ul_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx6ul_pinctrl_pads),
 	.gpr_compatible = "fsl,imx6ul-iomuxc-gpr",
 };
 
+static struct imx_pinctrl_soc_info imx6ull_snvs_pinctrl_info = {
+	.pins = imx6ull_snvs_pinctrl_pads,
+	.npins = ARRAY_SIZE(imx6ull_snvs_pinctrl_pads),
+	.flags = ZERO_OFFSET_VALID,
+};
+
 static struct of_device_id imx6ul_pinctrl_of_match[] = {
-	{ .compatible = "fsl,imx6ul-iomuxc", },
+	{ .compatible = "fsl,imx6ul-iomuxc", .data = &imx6ul_pinctrl_info, },
+	{ .compatible = "fsl,imx6ull-iomuxc-snvs", .data = &imx6ull_snvs_pinctrl_info, },
 	{ /* sentinel */ }
 };
 
 static int imx6ul_pinctrl_probe(struct platform_device *pdev)
 {
-	return imx_pinctrl_probe(pdev, &imx6ul_pinctrl_info);
+	const struct of_device_id *match;
+	struct imx_pinctrl_soc_info *pinctrl_info;
+
+	match = of_match_device(imx6ul_pinctrl_of_match, &pdev->dev);
+
+	if (!match)
+		return -ENODEV;
+
+	pinctrl_info = (struct imx_pinctrl_soc_info *) match->data;
+
+	return imx_pinctrl_probe(pdev, pinctrl_info);
 }
 
 static struct platform_driver imx6ul_pinctrl_driver = {
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
