From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RESEND PATCH v6, 5/5] arm64: dts: mediatek: add USB3 DRD driver
Date: Wed, 21 Sep 2016 13:54:37 +0800
Message-ID: <1474437277-27201-6-git-send-email-chunfeng.yun@mediatek.com>
References: <1474437277-27201-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1474437277-27201-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Oliver Neukum <oneukum-IBi9RG/b67k@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

USB3 DRD driver is added for MT8173-EVB, and xHCI driver
becomes its subnode

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts |   46 +++++++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi    |   29 +++++++++++++----
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 7453a47..682dfd7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -34,6 +34,11 @@
 
 	chosen { };
 
+	extcon_usb: extcon_iddig {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&pio 16 GPIO_ACTIVE_HIGH>;
+	};
+
 	usb_p1_vbus: regulator@0 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_vbus";
@@ -42,6 +47,16 @@
 		gpio = <&pio 130 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	usb_p0_vbus: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 };
 
 &i2c1 {
@@ -205,6 +220,20 @@
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
 		};
 	};
+
+	usb_id_pins_float: usb_iddig_pull_up {
+		pins_iddig {
+			pinmux = <MT8173_PIN_16_IDDIG__FUNC_IDDIG>;
+			bias-pull-up;
+		};
+	};
+
+	usb_id_pins_ground: usb_iddig_pull_down {
+		pins_iddig {
+			pinmux = <MT8173_PIN_16_IDDIG__FUNC_IDDIG>;
+			bias-pull-down;
+		};
+	};
 };
 
 &pwm0 {
@@ -431,12 +460,25 @@
 	status = "okay";
 };
 
+&ssusb {
+	vusb33-supply = <&mt6397_vusb_reg>;
+	vbus-supply = <&usb_p0_vbus>;
+	extcon = <&extcon_usb>;
+	dr_mode = "otg";
+	mediatek,enable-wakeup;
+	pinctrl-names = "default", "id_float", "id_ground";
+	pinctrl-0 = <&usb_id_pins_float>;
+	pinctrl-1 = <&usb_id_pins_float>;
+	pinctrl-2 = <&usb_id_pins_ground>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
 
-&usb30 {
+&usb_host {
 	vusb33-supply = <&mt6397_vusb_reg>;
 	vbus-supply = <&usb_p1_vbus>;
-	mediatek,wakeup-src = <1>;
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 10f638f..925948a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -668,11 +668,14 @@
 			status = "disabled";
 		};
 
-		usb30: usb@11270000 {
-			compatible = "mediatek,mt8173-xhci";
-			reg = <0 0x11270000 0 0x1000>,
+		ssusb: usb@11271000 {
+			compatible = "mediatek,mt8173-mtu3";
+			reg = <0 0x11271000 0 0x3000>,
 			      <0 0x11280700 0 0x0100>;
-			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&phy_port0 PHY_TYPE_USB3>,
+			       <&phy_port1 PHY_TYPE_USB2>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
 			clocks = <&topckgen CLK_TOP_USB30_SEL>,
 				 <&pericfg CLK_PERI_USB0>,
@@ -680,10 +683,22 @@
 			clock-names = "sys_ck",
 				      "wakeup_deb_p0",
 				      "wakeup_deb_p1";
-			phys = <&phy_port0 PHY_TYPE_USB3>,
-			       <&phy_port1 PHY_TYPE_USB2>;
 			mediatek,syscon-wakeup = <&pericfg>;
-			status = "okay";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			usb_host: xhci@11270000 {
+				compatible = "mediatek,mt8173-xhci";
+				reg = <0 0x11270000 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+				clocks = <&topckgen CLK_TOP_USB30_SEL>;
+				clock-names = "sys_ck";
+				status = "disabled";
+			};
 		};
 
 		u3phy: usb-phy@11290000 {
-- 
1.7.9.5
