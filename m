From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson-gx: add support for simplefb
Date: Mon, 10 Dec 2018 10:06:40 +0100
Message-ID: <20181210090640.4495-2-mjourdan@baylibre.com>
References: <20181210090640.4495-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210090640.4495-1-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SimpleFB allows transferring a framebuffer from the firmware/bootloader
to the kernel, while making sure the related clocks and power supplies
stay enabled.

Add nodes for CVBS and HDMI Simple Framebuffers.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 25 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 25 +++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 1ade7e486828..4bc7dd5ba141 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -13,6 +13,31 @@
 / {
 	compatible = "amlogic,meson-gxbb";
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@0 {
+			compatible = "amlogic,simple-framebuffer",
+				     "simple-framebuffer";
+			amlogic,pipeline = "vpu-cvbs";
+			power-domains = <&pwrc_vpu>;
+			status = "disabled";
+		};
+
+		framebuffer@1 {
+			compatible = "amlogic,simple-framebuffer",
+				     "simple-framebuffer";
+			amlogic,pipeline = "vpu-hdmi";
+			clocks = <&clkc CLKID_HDMI_PCLK>,
+				 <&clkc CLKID_CLK81>,
+				 <&clkc CLKID_GCLK_VENCI_INT0>;
+			power-domains = <&pwrc_vpu>;
+			status = "disabled";
+		};
+	};
+
 	soc {
 		usb0_phy: phy@c0000000 {
 			compatible = "amlogic,meson-gxbb-usb2-phy";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 8f0bb3c44bd6..f7ef8e0cf96e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -13,6 +13,31 @@
 / {
 	compatible = "amlogic,meson-gxl";
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@0 {
+			compatible = "amlogic,simple-framebuffer",
+				     "simple-framebuffer";
+			amlogic,pipeline = "vpu-cvbs";
+			power-domains = <&pwrc_vpu>;
+			status = "disabled";
+		};
+
+		framebuffer@1 {
+			compatible = "amlogic,simple-framebuffer",
+				     "simple-framebuffer";
+			amlogic,pipeline = "vpu-hdmi";
+			clocks = <&clkc CLKID_HDMI_PCLK>,
+				 <&clkc CLKID_CLK81>,
+				 <&clkc CLKID_GCLK_VENCI_INT0>;
+			power-domains = <&pwrc_vpu>;
+			status = "disabled";
+		};
+	};
+
 	soc {
 		usb0: usb@c9000000 {
 			status = "disabled";
-- 
2.19.2
