From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v5 1/2] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Fri, 22 Jun 2018 18:15:48 +0300
Message-ID: <1529680549-22079-2-git-send-email-abel.vesa@nxp.com>
References: <1529680549-22079-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529680549-22079-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

This adds the binding for the i.MX8MQ pin controller, in the same
fashion as earlier i.MX SoCs.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Acked-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
new file mode 100644
index 0000000..e1c405d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
@@ -0,0 +1,32 @@
+* Freescale IMX8MQ IOMUX Controller
+
+Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+for common binding part and usage.
+
+Required properties:
+- compatible: "fsl,imx8mq-iomuxc"
+- fsl,pins: each entry consists of 6 integers and represents the mux and config
+  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
+  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
+  imx8mq-pinfunc.h under device tree source folder.  The last integer CONFIG is
+  the pad setting value like pull-up on this pin.  Please refer to i.MX8M Quad
+  Reference Manual for detailed CONFIG settings.
+
+Examples:
+
+&uart1 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&pinctrl_uart1>;
+};
+
+iomuxc: iomuxc@30330000 {
+        compatible = "fsl,imx8mq-iomuxc";
+        reg = <0x0 0x30330000 0x0 0x10000>;
+
+        pinctrl_uart1: uart1grp {
+                fsl,pins = <
+                        MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX             0x49
+                        MX8MQ_IOMUXC_UART1_TXD_UART1_DCE_TX             0x49
+                >;
+        };
+};
-- 
2.7.4
