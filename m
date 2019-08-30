From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 11/11] arm64: dts: mt2712: use non-empty ranges for usb-phy
Date: Fri, 30 Aug 2019 15:14:58 +0800
Message-ID: <1567149298-29366-11-git-send-email-chunfeng.yun@mediatek.com>
References: <1567149298-29366-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567149298-29366-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use non-empty ranges for usb-phy to make the layout of
its registers clearer;
Replace deprecated compatible by generic

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: use generic compatible
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 42 ++++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 43307bad3f0d..e24f2f2f6004 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -697,30 +697,31 @@
 	};
 
 	u3phy0: usb-phy@11290000 {
-		compatible = "mediatek,mt2712-u3phy";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
+		compatible = "mediatek,mt2712-tphy",
+			     "mediatek,generic-tphy-v2";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0x11290000 0x9000>;
 		status = "okay";
 
-		u2port0: usb-phy@11290000 {
-			reg = <0 0x11290000 0 0x700>;
+		u2port0: usb-phy@0 {
+			reg = <0x0 0x700>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
 			status = "okay";
 		};
 
-		u2port1: usb-phy@11298000 {
-			reg = <0 0x11298000 0 0x700>;
+		u2port1: usb-phy@8000 {
+			reg = <0x8000 0x700>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
 			status = "okay";
 		};
 
-		u3port0: usb-phy@11298700 {
-			reg = <0 0x11298700 0 0x900>;
+		u3port0: usb-phy@8700 {
+			reg = <0x8700 0x900>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
@@ -760,30 +761,31 @@
 	};
 
 	u3phy1: usb-phy@112e0000 {
-		compatible = "mediatek,mt2712-u3phy";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
+		compatible = "mediatek,mt2712-tphy",
+			     "mediatek,generic-tphy-v2";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0x112e0000 0x9000>;
 		status = "okay";
 
-		u2port2: usb-phy@112e0000 {
-			reg = <0 0x112e0000 0 0x700>;
+		u2port2: usb-phy@0 {
+			reg = <0x0 0x700>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
 			status = "okay";
 		};
 
-		u2port3: usb-phy@112e8000 {
-			reg = <0 0x112e8000 0 0x700>;
+		u2port3: usb-phy@8000 {
+			reg = <0x8000 0x700>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
 			status = "okay";
 		};
 
-		u3port1: usb-phy@112e8700 {
-			reg = <0 0x112e8700 0 0x900>;
+		u3port1: usb-phy@8700 {
+			reg = <0x8700 0x900>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
-- 
2.23.0
