From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 7/8] ARM: at91: dts: sama5d3: add ov2640 camera sensor support
Date: Wed, 14 Jan 2015 10:41:54 +0800
Message-ID: <1421203315-27619-1-git-send-email-josh.wu@atmel.com>
References: <1420362153-500-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420362153-500-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, g.liakhovetski-Mmb7MZpHnFY@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

According to v4l2 dt document, we add:
  a camera host: ISI port.
  a i2c camera sensor: ov2640 port.
to sama5d3xmb.dtsi.

The ov2640 node defines the pinctrls, clocks and refer to isi port.
The ISI node also has a reference to the ov2640 port.

Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
v1 -> v2:
  1. move the chip common part of ISI DT node to sama5d3.dtsi.
  2. the pck1 pinctrl name is changed.

 arch/arm/boot/dts/sama5d3.dtsi    |  6 ++++++
 arch/arm/boot/dts/sama5d3xmb.dtsi | 31 +++++++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index ed734e9..af61d55 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -214,9 +214,15 @@
 				compatible = "atmel,at91sam9g45-isi";
 				reg = <0xf0034000 0x4000>;
 				interrupts = <37 IRQ_TYPE_LEVEL_HIGH 5>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_isi_data_0_7>;
 				clocks = <&isi_clk>;
 				clock-names = "isi_clk";
 				status = "disabled";
+				port {
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
 			};
 
 			mmc1: mmc@f8000000 {
diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sama5d3xmb.dtsi
index d9464fc..9fdb8a0 100644
--- a/arch/arm/boot/dts/sama5d3xmb.dtsi
+++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
@@ -52,6 +52,29 @@
 				};
 			};
 
+			i2c1: i2c@f0018000 {
+				ov2640: camera@0x30 {
+					compatible = "ovti,ov2640";
+					reg = <0x30>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_pck1_as_isi_mck &pinctrl_sensor_power &pinctrl_sensor_reset>;
+					resetb-gpios = <&pioE 24 GPIO_ACTIVE_LOW>;
+					pwdn-gpios = <&pioE 29 GPIO_ACTIVE_HIGH>;
+					/* use pck1 for the master clock of ov2640 */
+					clocks = <&pck1>;
+					clock-names = "xvclk";
+					assigned-clocks = <&pck1>;
+					assigned-clock-rates = <25000000>;
+
+					port {
+						ov2640_0: endpoint {
+							remote-endpoint = <&isi_0>;
+							bus-width = <8>;
+						};
+					};
+				};
+			};
+
 			usart1: serial@f0020000 {
 				dmas = <0>, <0>;	/*  Do not use DMA for usart1 */
 				pinctrl-names = "default";
@@ -60,8 +83,12 @@
 			};
 
 			isi: isi@f0034000 {
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_isi_data_0_7>;
+				port {
+					isi_0: endpoint {
+						remote-endpoint = <&ov2640_0>;
+						bus-width = <8>;
+					};
+				};
 			};
 
 			mmc1: mmc@f8000000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
