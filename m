From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Thu,  1 Feb 2018 18:49:21 +0100
Message-ID: <20180201174923.7385-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, linux-imx-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds the binding for the i.MX8MQ pin controller, in the same
fashion as earlier i.MX SoCs.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
v2: switch to generic pinconf properties
---
 .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
new file mode 100644
index 000000000000..5c5d2d835d05
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
@@ -0,0 +1,39 @@
+* Freescale IMX8MQ IOMUX Controller
+
+Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+for common binding part and usage.
+
+=== Pin Controller Node ===
+
+Required properties:
+- compatible: "fsl,imx8mq-iomuxc"
+- reg: Must contain the base physical address and size of the iomuxc registers.
+
+=== Pin Configuration Node ===
+Required properties:
+- pinmux: Array of integersy, representing a group of pins mux setting.
+	The format is pinmux = <PIN_FUNC_ID>, PIN_FUNC_ID is a pin working on
+	a specific function.
+
+	Refer to imx8mq-pinfunc.h in device tree source folder for all available
+	imx8mq PIN_FUNC_ID.
+
+Optional Properties:
+- drive-strength		Integer: controls Drive Strength
+					0: driver disabled
+					1: 255 Ohm
+					2: 105 Ohm
+					3:  75 Ohm
+					4:  85 Ohm
+					5:  65 Ohm
+					6:  45 Ohm
+					7:  40 Ohm
+- slew-rate:			Integer: controls Slew Rate
+					0: Slow
+					1: Medium
+					2: Fast
+					3: Maximum
+- drive-open-drain		Bool: enable Open-drian
+- bias-pull-up			Bool: enable Pull-up
+- input-schmitt-enable		Bool: enable schmitt-trigger
+- input-enable			Bool: enable input, overriding module settings
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
