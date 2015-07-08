From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 5/5] arm64: dts: mediatek: add xHCI & usb phy for mt8173
Date: Wed, 8 Jul 2015 17:41:07 +0800
Message-ID: <1436348468-4126-6-git-send-email-chunfeng.yun@mediatek.com>
References: <1436348468-4126-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1436348468-4126-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 27 +++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index f433c21..cb63dc3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -13,6 +13,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "mt8173.dtsi"
 
 / {
@@ -32,6 +33,15 @@
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
@@ -211,3 +221,8 @@
 &uart0 {
 	status = "okay";
 };
+
+&usb {
+	reg-vusb33-supply = <&mt6397_vusb_reg>;
+	reg-vbus-supply = <&usb_p1_vbus>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 0696f8f..452bd0a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset-controller/mt8173-resets.h>
+#include <dt-bindings/power/mt8173-power.h>
 #include "mt8173-pinfunc.h"
 
 / {
@@ -393,6 +394,32 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		usb: usb30@11270000 {
+			compatible = "mediatek,mt8173-xhci";
+			reg = <0 0x11270000 0 0x1000>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+			usb-phy = <&u3phy>;
+			usb3-lpm-capable;
+			clocks = <&topckgen CLK_TOP_USB30_SEL>;
+			clock-names = "sys_mac";
+		};
+
+		u3phy: usb-phy@11271000 {
+			compatible = "mediatek,mt8173-u3phy";
+			reg = <0 0x11271000 0 0x3000>,
+			      <0 0x11280000 0 0x20000>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+			usb-wakeup-ctrl = <&pericfg>;
+			wakeup-src = <1>;
+			u2port-num = <2>;
+			clocks = <&pericfg CLK_PERI_USB0>,
+				 <&pericfg CLK_PERI_USB1>,
+				 <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+			clock-names = "wakeup_deb_p0",
+				      "wakeup_deb_p1",
+				      "u3phya_ref";
+		};
 	};
 };
 
-- 
1.8.1.1.dirty
