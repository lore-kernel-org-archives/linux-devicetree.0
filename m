From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 5/7] ARM64: meson-gxbb: add USB Nodes
Date: Sun,  4 Sep 2016 23:31:50 +0200
Message-ID: <20160904213152.25837-6-martin.blumenstingl@googlemail.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160904213152.25837-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the nodes for the dwc2 USB controller and the related USB PHYs.
Currently we force usb0 to host mode because OTG is currently not
working in our PHY driver.

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 2e8a3d9..02dfc54 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -151,6 +151,34 @@
 		#size-cells = <2>;
 		ranges;
 
+		usb-phys@c0000000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xc0000000 0x0 0x40>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xc0000000 0x0 0x40>;
+
+			usb0_phy: usb_phy@0 {
+				compatible = "amlogic,meson-gxbb-usb2-phy";
+				#phy-cells = <0>;
+				reg = <0x0 0x0 0x0 0x20>;
+				resets = <&reset 34>;
+				clocks = <&clkc CLKID_USB &clkc CLKID_USB0>;
+				clock-names = "usb_general", "usb";
+				status = "disabled";
+			};
+
+			usb1_phy: usb_phy@20 {
+				compatible = "amlogic,meson-gxbb-usb2-phy";
+				#phy-cells = <0>;
+				reg = <0x0 0x20 0x0 0x20>;
+				resets = <&reset 34>;
+				clocks = <&clkc CLKID_USB &clkc CLKID_USB1>;
+				clock-names = "usb_general", "usb";
+				status = "disabled";
+			};
+		};
+
 		cbus: cbus@c1100000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc1100000 0x0 0x100000>;
@@ -496,6 +524,30 @@
 			};
 		};
 
+		usb0: usb-controller@c9000000 {
+			compatible = "amlogic,meson-gxbb-usb", "snps,dwc2";
+			reg = <0x0 0xc9000000 0x0 0x40000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLKID_USB0_DDR_BRIDGE>;
+			clock-names = "otg";
+			phys = <&usb0_phy>;
+			phy-names = "usb2-phy";
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb1: usb-controller@c9100000 {
+			compatible = "amlogic,meson-gxbb-usb", "snps,dwc2";
+			reg = <0x0 0xc9100000 0x0 0x40000>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
+			clock-names = "otg";
+			phys = <&usb1_phy>;
+			phy-names = "usb2-phy";
+			dr_mode = "host";
+			status = "disabled";
+		};
+
 		ethmac: ethernet@c9410000 {
 			compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
