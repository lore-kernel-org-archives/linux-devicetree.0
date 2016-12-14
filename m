From: Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: add clk-480m for ehci and ohci of rk3399
Date: Wed, 14 Dec 2016 18:11:41 +0800
Message-ID: <1481710301-1454-4-git-send-email-zhengxing@rock-chips.com>
References: <1481710301-1454-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481710301-1454-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: dianders@google.com, heiko@sntech.de, William wu <wulf@rock-chips.com>, Xing Zheng <zhengxing@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, Caesar Wang <wxt@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, David Wu <david.wu@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: William wu <wulf@rock-chips.com>

We found that the suspend process was blocked when it run into
ehci/ohci module due to clk-480m of usb2-phy was disabled.

The root cause is that usb2-phy suspended earlier than ehci/ohci
(usb2-phy will be auto suspended if no devices plug-in). and the
clk-480m provided by it was disabled if no module used. However,
some suspend process related ehci/ohci are base on this clock,
so we should refer it into ehci/ohci driver to prevent this case.

Signed-off-by: William wu <wulf@rock-chips.com>
Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index b65c193..228c764 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -315,8 +315,10 @@
 		compatible = "generic-ehci";
 		reg = <0x0 0xfe380000 0x0 0x20000>;
 		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
-		clock-names = "hclk_host0", "hclk_host0_arb";
+		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
+			 <&cru SCLK_USBPHY0_480M_SRC>;
+		clock-names = "hclk_host0", "hclk_host0_arb",
+			      "usbphy0_480m";
 		phys = <&u2phy0_host>;
 		phy-names = "usb";
 		status = "disabled";
@@ -326,8 +328,12 @@
 		compatible = "generic-ohci";
 		reg = <0x0 0xfe3a0000 0x0 0x20000>;
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
-		clock-names = "hclk_host0", "hclk_host0_arb";
+		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
+			 <&cru SCLK_USBPHY0_480M_SRC>;
+		clock-names = "hclk_host0", "hclk_host0_arb",
+			      "usbphy0_480m";
+		phys = <&u2phy0_host>;
+		phy-names = "usb";
 		status = "disabled";
 	};
 
@@ -335,8 +341,10 @@
 		compatible = "generic-ehci";
 		reg = <0x0 0xfe3c0000 0x0 0x20000>;
 		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>;
-		clock-names = "hclk_host1", "hclk_host1_arb";
+		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
+			 <&cru SCLK_USBPHY1_480M_SRC>;
+		clock-names = "hclk_host1", "hclk_host1_arb",
+			      "usbphy1_480m";
 		phys = <&u2phy1_host>;
 		phy-names = "usb";
 		status = "disabled";
@@ -346,8 +354,12 @@
 		compatible = "generic-ohci";
 		reg = <0x0 0xfe3e0000 0x0 0x20000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH 0>;
-		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>;
-		clock-names = "hclk_host1", "hclk_host1_arb";
+		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
+			 <&cru SCLK_USBPHY1_480M_SRC>;
+		clock-names = "hclk_host1", "hclk_host1_arb",
+			      "usbphy1_480m";
+		phys = <&u2phy1_host>;
+		phy-names = "usb";
 		status = "disabled";
 	};
 
-- 
2.7.4
