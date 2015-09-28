From: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v7 6/7] pinctrl: freescale: imx7d: support iomux lpsr controller
Date: Mon, 28 Sep 2015 16:56:40 -0500
Message-ID: <1443477401-17238-6-git-send-email-aalonso@freescale.com>
References: <1443477401-17238-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443477401-17238-1-git-send-email-aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yibin.gong-KZfg59tc24xl57MIdRCFDg@public.gmane.org, nitin.garg-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

iMX7D has two iomuxc controllers, iomuxc controller similar as
previous iMX SoC generation and iomuxc-lpsr which provides low
power state rentetion capabilities on gpios that are part of
iomuxc-lpsr

Add iomuxc-lpsr gpio group id's

Signed-off-by: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Changes for V2: Add imx7d_lpsr_pads enums
Changes for V3: Resend
Changes for V4: Resend
Changes for V5: Remove flags SHARE_INPUT_SELECT_REG and
 ZERO_OFFSET_VALID.
Changes for V6: Restore ZERO_OFFSET_VALID flag.
Changes for V7: Resend

 drivers/pinctrl/freescale/pinctrl-imx7d.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx7d.c b/drivers/pinctrl/freescale/pinctrl-imx7d.c
index 1fa7530..16dc925 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7d.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7d.c
@@ -174,6 +174,17 @@ enum imx7d_pads {
 	MX7D_PAD_ENET1_COL = 154,
 };
 
+enum imx7d_lpsr_pads {
+	MX7D_PAD_GPIO1_IO00 = 0,
+	MX7D_PAD_GPIO1_IO01 = 1,
+	MX7D_PAD_GPIO1_IO02 = 2,
+	MX7D_PAD_GPIO1_IO03 = 3,
+	MX7D_PAD_GPIO1_IO04 = 4,
+	MX7D_PAD_GPIO1_IO05 = 5,
+	MX7D_PAD_GPIO1_IO06 = 6,
+	MX7D_PAD_GPIO1_IO07 = 7,
+};
+
 /* Pad names for the pinmux subsystem */
 static const struct pinctrl_pin_desc imx7d_pinctrl_pads[] = {
 	IMX_PINCTRL_PIN(MX7D_PAD_RESERVE0),
@@ -333,13 +344,32 @@ static const struct pinctrl_pin_desc imx7d_pinctrl_pads[] = {
 	IMX_PINCTRL_PIN(MX7D_PAD_ENET1_COL),
 };
 
+/* Pad names for the pinmux subsystem */
+static const struct pinctrl_pin_desc imx7d_lpsr_pinctrl_pads[] = {
+	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO00),
+	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO01),
+	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO02),
+	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO03),
+	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO04),
+	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO05),
+	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO06),
+	IMX_PINCTRL_PIN(MX7D_PAD_GPIO1_IO07),
+};
+
 static struct imx_pinctrl_soc_info imx7d_pinctrl_info = {
 	.pins = imx7d_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx7d_pinctrl_pads),
 };
 
+static struct imx_pinctrl_soc_info imx7d_lpsr_pinctrl_info = {
+	.pins = imx7d_lpsr_pinctrl_pads,
+	.npins = ARRAY_SIZE(imx7d_lpsr_pinctrl_pads),
+	.flags = ZERO_OFFSET_VALID,
+};
+
 static struct of_device_id imx7d_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx7d-iomuxc", .data = &imx7d_pinctrl_info, },
+	{ .compatible = "fsl,imx7d-iomuxc-lpsr", .data = &imx7d_lpsr_pinctrl_info },
 	{ /* sentinel */ }
 };
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
