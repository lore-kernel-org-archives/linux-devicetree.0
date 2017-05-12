From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v6 06/14] MIPS: jz4740: DTS: Add nodes for ingenic pinctrl and gpio drivers
Date: Fri, 12 May 2017 18:52:59 +0200
Message-ID: <20170512165307.31369-6-paul@crapouillou.net>
References: <20170428200824.10906-2-paul@crapouillou.net>
 <20170512165307.31369-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170512165307.31369-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Maarten ter Huurne <maarten@treewalker.org>, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

For a description of the pinctrl devicetree node, please read
Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt

For a description of the gpio devicetree nodes, please read
Documentation/devicetree/bindings/gpio/ingenic,gpio.txt

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

 v2: Changed the devicetree bindings to match the new driver
 v3: No changes
 v4: Update the bindings for the v4 version of the drivers
 v5: Add 'reg' properties and rename pinctrl/gpio nodes
 v6: No changes

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 3e1587f1f77a..2ca7ce7481f1 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -55,6 +55,74 @@
 		clock-names = "rtc";
 	};
 
+	pinctrl: pin-controller@10010000 {
+		compatible = "ingenic,jz4740-pinctrl";
+		reg = <0x10010000 0x400>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpa: gpio@0 {
+			compatible = "ingenic,jz4740-gpio";
+			reg = <0>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <28>;
+		};
+
+		gpb: gpio@1 {
+			compatible = "ingenic,jz4740-gpio";
+			reg = <1>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 32 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <27>;
+		};
+
+		gpc: gpio@2 {
+			compatible = "ingenic,jz4740-gpio";
+			reg = <2>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 64 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <26>;
+		};
+
+		gpd: gpio@3 {
+			compatible = "ingenic,jz4740-gpio";
+			reg = <3>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 96 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <25>;
+		};
+	};
+
 	uart0: serial@10030000 {
 		compatible = "ingenic,jz4740-uart";
 		reg = <0x10030000 0x100>;
-- 
2.11.0
