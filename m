From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v9 3/4] arm64: dts: rockchip: add usb2-phy support for rk3399
Date: Fri, 22 Jul 2016 15:00:45 +0800
Message-ID: <1469170846-15617-4-git-send-email-frank.wang@rock-chips.com>
References: <1469170846-15617-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469170846-15617-1-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Add usb2-phy nodes and specify phys phandle for ehci.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---

Changes in v9:
 - Move the usb gpio config to rk3399-evb.dts
 - Fix ehci phy-names property.

 arch/arm64/boot/dts/rockchip/rk3399.dtsi |   42 +++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index d7f8e06..843d51c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -221,6 +221,8 @@
 		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
 		clock-names = "hclk_host0", "hclk_host0_arb";
+		phys = <&u2phy0_host>;
+		phy-names = "usb";
 		status = "disabled";
 	};
 
@@ -239,6 +241,8 @@
 		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>;
 		clock-names = "hclk_host1", "hclk_host1_arb";
+		phys = <&u2phy1_host>;
+		phy-names = "usb";
 		status = "disabled";
 	};
 
@@ -481,8 +485,44 @@
 	};
 
 	grf: syscon@ff770000 {
-		compatible = "rockchip,rk3399-grf", "syscon";
+		compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
 		reg = <0x0 0xff770000 0x0 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		u2phy0: usb2-phy@e450 {
+			compatible = "rockchip,rk3399-usb2phy";
+			reg = <0xe450 0x10>;
+			clocks = <&cru SCLK_USB2PHY0_REF>;
+			clock-names = "phyclk";
+			#clock-cells = <0>;
+			clock-output-names = "clk_usbphy0_480m";
+			status = "disabled";
+
+			u2phy0_host: host-port {
+				#phy-cells = <0>;
+				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				status = "disabled";
+			};
+		};
+
+		u2phy1: usb2-phy@e460 {
+			compatible = "rockchip,rk3399-usb2phy";
+			reg = <0xe460 0x10>;
+			clocks = <&cru SCLK_USB2PHY1_REF>;
+			clock-names = "phyclk";
+			#clock-cells = <0>;
+			clock-output-names = "clk_usbphy1_480m";
+			status = "disabled";
+
+			u2phy1_host: host-port {
+				#phy-cells = <0>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				status = "disabled";
+			};
+		};
 	};
 
 	watchdog@ff840000 {
-- 
1.7.9.5
