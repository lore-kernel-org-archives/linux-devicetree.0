From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] dt-bindings: pinctrl: Document the i.MX50 IOMUXC binding
Date: Tue, 29 Jan 2019 17:55:28 +0100
Message-ID: <20190129165530.7606-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Dong Aisheng <dong.aisheng@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

AFAICS from the i.MX50 Reference Manual, the i.MX50 IOMUXC works the
same as the one in i.MX51, so I copied fsl,imx51-pinctrl.txt and changed
the text to imx50.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Cc: Dong Aisheng <dong.aisheng@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/pinctrl/fsl,imx50-pinctrl.txt    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
new file mode 100644
index 000000000000..6da01d619d33
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
@@ -0,0 +1,32 @@
+* Freescale IMX50 IOMUX Controller
+
+Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
+and usage.
+
+Required properties:
+- compatible: "fsl,imx50-iomuxc"
+- fsl,pins: two integers array, represents a group of pins mux and config
+  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a
+  pin working on a specific function, CONFIG is the pad setting value like
+  pull-up for this pin. Please refer to imx50 datasheet for the valid pad
+  config settings.
+
+CONFIG bits definition:
+PAD_CTL_HVE			(1 << 13)
+PAD_CTL_HYS			(1 << 8)
+PAD_CTL_PKE			(1 << 7)
+PAD_CTL_PUE			(1 << 6)
+PAD_CTL_PUS_100K_DOWN		(0 << 4)
+PAD_CTL_PUS_47K_UP		(1 << 4)
+PAD_CTL_PUS_100K_UP		(2 << 4)
+PAD_CTL_PUS_22K_UP		(3 << 4)
+PAD_CTL_ODE			(1 << 3)
+PAD_CTL_DSE_LOW			(0 << 1)
+PAD_CTL_DSE_MED			(1 << 1)
+PAD_CTL_DSE_HIGH		(2 << 1)
+PAD_CTL_DSE_MAX			(3 << 1)
+PAD_CTL_SRE_FAST		(1 << 0)
+PAD_CTL_SRE_SLOW		(0 << 0)
+
+Refer to imx50-pinfunc.h in device tree source folder for all available
+imx50 PIN_FUNC_ID.
-- 
2.20.1
