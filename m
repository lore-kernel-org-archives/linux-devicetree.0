From: Keerthy <j-keerthy@ti.com>
Subject: [RFC RESEND PATCH v2 3/4] arm64: dts: ti: am6-main: Add gpio nodes
Date: Thu, 6 Jun 2019 15:26:19 +0530
Message-ID: <20190606095620.6211-4-j-keerthy@ti.com>
References: <20190606095620.6211-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606095620.6211-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: t-kristo@ti.com, nm@ti.com, robh+dt@kernel.org
Cc: lokeshvutla@ti.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, j-keerthy@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add gpio0/1 nodes under main domain. They have 96 and 90 gpios
respectively and all are capable of generating banked interrupts.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 22154f401930..182efe70402b 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -350,4 +350,36 @@
 			ti,sci-rm-range-global-event = <0x1>;
 		};
 	};
+
+	main_gpio0:  main_gpio0@600000 {
+		compatible = "ti,am654-gpio", "ti,keystone-gpio";
+		reg = <0x0 0x600000 0x0 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&intr_main_gpio>;
+		interrupts = <57 256>, <57 257>, <57 258>, <57 259>, <57 260>,
+				<57 261>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ti,ngpio = <96>;
+		ti,davinci-gpio-unbanked = <0>;
+		clocks = <&k3_clks 57 0>;
+		clock-names = "gpio";
+	};
+
+	main_gpio1:  main_gpio1@601000 {
+		compatible = "ti,am654-gpio", "ti,keystone-gpio";
+		reg = <0x0 0x601000 0x0 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&intr_main_gpio>;
+		interrupts = <58 256>, <58 257>, <58 258>, <58 259>, <58 260>,
+				<58 261>;
+		interrupt-controller;
+			#interrupt-cells = <2>;
+		ti,ngpio = <90>;
+		ti,davinci-gpio-unbanked = <0>;
+		clocks = <&k3_clks 58 0>;
+		clock-names = "gpio";
+	};
 };
-- 
2.17.1
