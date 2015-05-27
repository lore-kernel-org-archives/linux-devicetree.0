From: <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 6/6] arm64: dts: mediatek: add xHCI & usb phy for mt8173
Date: Wed, 27 May 2015 19:48:03 +0800
Message-ID: <1432727283-20303-7-git-send-email-chunfeng.yun@mediatek.com>
References: <1432727283-20303-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432727283-20303-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 24 ++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index b1560c9..3adcdbf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -13,6 +13,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "mt8173.dtsi"
 
 / {
@@ -31,6 +32,15 @@
 	};
 
 	chosen { };
+
+	usb_p1_vbus: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 130 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &pwrap {
@@ -257,6 +267,10 @@
 	};
 };
 
+&u3phy {
+	reg-p1-vbus-supply = <&usb_p1_vbus>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 512e4eb..cd36bf3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -259,6 +259,30 @@
 			status = "disabled";
 		};
 
+		usb: usb30@11270000 {
+			compatible = "mediatek,mt8173-xhci", "generic-xhci";
+			reg = <0 0x11270000 0 0x1000>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+			usb-phy = <&u3phy>;
+			usb3-lpm-capable;
+		};
+
+		u3phy: usb-phy@11271000 {
+			compatible = "mediatek,mt8173-u3phy";
+			reg = <0 0x11271000 0 0x3000>,
+			      <0 0x11280000 0 0x20000>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+			reg-vusb33-supply = <&mt6397_vusb_reg>;
+			clocks = <&pericfg CLK_PERI_USB0>,
+				 <&pericfg CLK_PERI_USB1>,
+				 <&topckgen CLK_TOP_USB30_SEL>,
+				 <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+			clock-names = "wakeup_deb_p0",
+				      "wakeup_deb_p1",
+				      "sys_mac",
+				      "u3phya_ref";
+		};
+
 		mmsys: mmsys@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
