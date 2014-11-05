From: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/2] powerpc: Add INA220 to device tree for supported boards
Date: Wed, 5 Nov 2014 14:59:53 +0800
Message-ID: <1415170793-13196-2-git-send-email-hongtao.jia@freescale.com>
References: <1415170793-13196-1-git-send-email-hongtao.jia@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415170793-13196-1-git-send-email-hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Including: P3041DS P5020DS P5040DS B4QDS

Signed-off-by: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/b4qds.dtsi  | 12 ++++++++++++
 arch/powerpc/boot/dts/p3041ds.dts | 20 ++++++++++++++++++++
 arch/powerpc/boot/dts/p5020ds.dts | 20 ++++++++++++++++++++
 arch/powerpc/boot/dts/p5040ds.dts | 20 ++++++++++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/arch/powerpc/boot/dts/b4qds.dtsi b/arch/powerpc/boot/dts/b4qds.dtsi
index bccc986..e5bde0b 100644
--- a/arch/powerpc/boot/dts/b4qds.dtsi
+++ b/arch/powerpc/boot/dts/b4qds.dtsi
@@ -153,6 +153,18 @@
 					};
 				};
 
+				i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+
+					ina220@40 {
+						compatible = "ti,ina220";
+						reg = <0x40>;
+						shunt-resistor = <1000>;
+					};
+				};
+
 				i2c@3 {
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/powerpc/boot/dts/p3041ds.dts b/arch/powerpc/boot/dts/p3041ds.dts
index 2fed3bc..394ea9c 100644
--- a/arch/powerpc/boot/dts/p3041ds.dts
+++ b/arch/powerpc/boot/dts/p3041ds.dts
@@ -98,6 +98,26 @@
 				reg = <0x68>;
 				interrupts = <0x1 0x1 0 0>;
 			};
+			ina220@40 {
+				compatible = "ti,ina220";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+			ina220@41 {
+				compatible = "ti,ina220";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+			ina220@44 {
+				compatible = "ti,ina220";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+			ina220@45 {
+				compatible = "ti,ina220";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 			adt7461@4c {
 				compatible = "adi,adt7461";
 				reg = <0x4c>;
diff --git a/arch/powerpc/boot/dts/p5020ds.dts b/arch/powerpc/boot/dts/p5020ds.dts
index 2869fea..b7f3057 100644
--- a/arch/powerpc/boot/dts/p5020ds.dts
+++ b/arch/powerpc/boot/dts/p5020ds.dts
@@ -98,6 +98,26 @@
 				reg = <0x68>;
 				interrupts = <0x1 0x1 0 0>;
 			};
+			ina220@40 {
+				compatible = "ti,ina220";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+			ina220@41 {
+				compatible = "ti,ina220";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+			ina220@44 {
+				compatible = "ti,ina220";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+			ina220@45 {
+				compatible = "ti,ina220";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 			adt7461@4c {
 				compatible = "adi,adt7461";
 				reg = <0x4c>;
diff --git a/arch/powerpc/boot/dts/p5040ds.dts b/arch/powerpc/boot/dts/p5040ds.dts
index 860b5cc..7e04bf4 100644
--- a/arch/powerpc/boot/dts/p5040ds.dts
+++ b/arch/powerpc/boot/dts/p5040ds.dts
@@ -95,6 +95,26 @@
 				reg = <0x68>;
 				interrupts = <0x1 0x1 0 0>;
 			};
+			ina220@40 {
+				compatible = "ti,ina220";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+			ina220@41 {
+				compatible = "ti,ina220";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+			ina220@44 {
+				compatible = "ti,ina220";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+			ina220@45 {
+				compatible = "ti,ina220";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
 			adt7461@4c {
 				compatible = "adi,adt7461";
 				reg = <0x4c>;
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
