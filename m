From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: keystone: add dsp gpio controllers nodes
Date: Thu, 18 Sep 2014 20:15:23 +0300
Message-ID: <1411060524-25077-3-git-send-email-grygorii.strashko@ti.com>
References: <1411060524-25077-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411060524-25077-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Keystone 2 DSP GPIO nodes for SoCs:
k2hk:
 DSP GPIO banks 0-7 correspond to DSP0-DSP7
k2l:
 DSP GPIO banks 0-3 correspond to DSP0-DSP3
k2e:
 DSP GPIO bank 0 corresponds to DSP0

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/k2e.dtsi  |  7 ++++++
 arch/arm/boot/dts/k2hk.dtsi | 56 +++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/k2l.dtsi  | 28 +++++++++++++++++++++++
 3 files changed, 91 insertions(+)

diff --git a/arch/arm/boot/dts/k2e.dtsi b/arch/arm/boot/dts/k2e.dtsi
index 03d0190..13cf35a 100644
--- a/arch/arm/boot/dts/k2e.dtsi
+++ b/arch/arm/boot/dts/k2e.dtsi
@@ -76,5 +76,12 @@
 				usb-phy = <&usb1_phy>, <&usb1_phy>;
 			};
 		};
+
+		dspgpio0: keystone_dsp_gpio@02620240 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x240>;
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/k2hk.dtsi b/arch/arm/boot/dts/k2hk.dtsi
index c73899c..d721f4b 100644
--- a/arch/arm/boot/dts/k2hk.dtsi
+++ b/arch/arm/boot/dts/k2hk.dtsi
@@ -42,5 +42,61 @@
 
 	soc {
 		/include/ "k2hk-clocks.dtsi"
+
+		dspgpio0: keystone_dsp_gpio@02620240 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x240>;
+		};
+
+		dspgpio1: keystone_dsp_gpio@2620244 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x244>;
+		};
+
+		dspgpio2: keystone_dsp_gpio@2620248 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x248>;
+		};
+
+		dspgpio3: keystone_dsp_gpio@262024c {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x24c>;
+		};
+
+		dspgpio4: keystone_dsp_gpio@2620250 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x250>;
+		};
+
+		dspgpio5: keystone_dsp_gpio@2620254 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x254>;
+		};
+
+		dspgpio6: keystone_dsp_gpio@2620258 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x258>;
+		};
+
+		dspgpio7: keystone_dsp_gpio@262025c {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x25c>;
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/k2l.dtsi b/arch/arm/boot/dts/k2l.dtsi
index 1f7f479..e3bb142 100644
--- a/arch/arm/boot/dts/k2l.dtsi
+++ b/arch/arm/boot/dts/k2l.dtsi
@@ -51,5 +51,33 @@
 			clocks	= <&clkuart3>;
 			interrupts = <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>;
 		};
+
+		dspgpio0: keystone_dsp_gpio@02620240 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x240>;
+		};
+
+		dspgpio1: keystone_dsp_gpio@2620244 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x244>;
+		};
+
+		dspgpio2: keystone_dsp_gpio@2620248 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x248>;
+		};
+
+		dspgpio3: keystone_dsp_gpio@262024c {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x24c>;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
