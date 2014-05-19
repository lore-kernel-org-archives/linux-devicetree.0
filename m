From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH V3 4/4] ARM: dts: Add usb 2.0 support on exynos5420
Date: Mon, 19 May 2014 16:49:16 +0530
Message-ID: <1400498356-26803-5-git-send-email-vikas.sajjan@samsung.com>
References: <1400498356-26803-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1400498356-26803-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, k.debski@samsung.com, kishon@ti.com, robh+dt@kernel.org, stern@rowland.harvard.edu, gautam.vivek@samsung.com
List-Id: devicetree@vger.kernel.org

From: Vivek Gautam <gautam.vivek@samsung.com>

Add required device node for ehci and ohci controllers to
enable USB 2.0 support.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 2eb00cb..921885a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -839,6 +839,36 @@
 		#phy-cells = <1>;
 	};
 
+	usbhost2: usb@12110000 {
+		compatible = "samsung,exynos4210-ehci";
+		reg = <0x12110000 0x100>;
+		interrupts = <0 71 0>;
+
+		clocks = <&clock CLK_USBH20>;
+		clock-names = "usbhost";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			phys = <&usb2_phy 1>;
+		};
+	};
+
+	usbhost1: usb@12120000 {
+		compatible = "samsung,exynos4210-ohci";
+		reg = <0x12120000 0x100>;
+		interrupts = <0 71 0>;
+
+		clocks = <&clock CLK_USBH20>;
+		clock-names = "usbhost";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			phys = <&usb2_phy 1>;
+		};
+	};
+
 	usb2_phy: phy@12130000 {
 		compatible = "samsung,exynos5250-usb2-phy";
 		reg = <0x12130000 0x100>;
-- 
1.7.9.5
