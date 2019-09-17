From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 12/13] arm64: dts: rockchip: add usb2phy for px30
Date: Tue, 17 Sep 2019 10:26:58 +0200
Message-ID: <20190917082659.25549-12-heiko@sntech.de>
References: <20190917082659.25549-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917082659.25549-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Add the usb2phy node on the px30 and hook it up to the usb controllers
it supplies.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9ad1c2f04ea9..837e421cc30f 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -701,6 +701,43 @@
 			<26000000>;
 	};
 
+	usb2phy_grf: syscon@ff2c0000 {
+		compatible = "rockchip,px30-usb2phy-grf", "syscon",
+			     "simple-mfd";
+		reg = <0x0 0xff2c0000 0x0 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		u2phy: usb2-phy@100 {
+			compatible = "rockchip,px30-usb2phy";
+			reg = <0x100 0x20>;
+			clocks = <&pmucru SCLK_USBPHY_REF>;
+			clock-names = "phyclk";
+			#clock-cells = <0>;
+			assigned-clocks = <&cru USB480M>;
+			assigned-clock-parents = <&u2phy>;
+			clock-output-names = "usb480m_phy";
+			status = "disabled";
+
+			u2phy_host: host-port {
+				#phy-cells = <0>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				status = "disabled";
+			};
+
+			u2phy_otg: otg-port {
+				#phy-cells = <0>;
+				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						  "linestate";
+				status = "disabled";
+			};
+		};
+	};
+
 	usb20_otg: usb@ff300000 {
 		compatible = "rockchip,px30-usb", "rockchip,rk3066-usb",
 			     "snps,dwc2";
@@ -713,6 +750,8 @@
 		g-rx-fifo-size = <280>;
 		g-tx-fifo-size = <256 128 128 64 32 16>;
 		g-use-dma;
+		phys = <&u2phy_otg>;
+		phy-names = "usb2-phy";
 		power-domains = <&power PX30_PD_USB>;
 		status = "disabled";
 	};
@@ -723,6 +762,8 @@
 		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_HOST>;
 		clock-names = "usbhost";
+		phys = <&u2phy_host>;
+		phy-names = "usb";
 		power-domains = <&power PX30_PD_USB>;
 		status = "disabled";
 	};
@@ -733,6 +774,8 @@
 		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_HOST>;
 		clock-names = "usbhost";
+		phys = <&u2phy_host>;
+		phy-names = "usb";
 		power-domains = <&power PX30_PD_USB>;
 		status = "disabled";
 	};
-- 
2.20.1
