From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: rockchip: add usb nodes on rk322x
Date: Wed, 31 May 2017 09:21:23 +0800
Message-ID: <1496193684-30449-2-git-send-email-william.wu@rock-chips.com>
References: <1496193684-30449-1-git-send-email-william.wu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496193684-30449-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds usb otg/host controllers and phys nodes on rk322x.

Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 arch/arm/boot/dts/rk322x.dtsi | 138 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index df57413..d4bfd3c 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -210,8 +210,61 @@
 	};
 
 	grf: syscon@11000000 {
-		compatible = "syscon";
+		compatible = "syscon", "simple-mfd";
 		reg = <0x11000000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		u2phy0: usb2-phy@760 {
+			compatible = "rockchip,rk322x-usb2phy";
+			reg = <0x0760 0x0c>;
+			clocks = <&cru SCLK_OTGPHY0>;
+			clock-names = "phyclk";
+			#clock-cells = <0>;
+			clock-output-names = "usb480m_phy0";
+			status = "disabled";
+
+			u2phy0_otg: otg-port {
+				#phy-cells = <0>;
+				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						  "linestate";
+				status = "disabled";
+			};
+
+			u2phy0_host: host-port {
+				#phy-cells = <0>;
+				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				status = "disabled";
+			};
+		};
+
+		u2phy1: usb2-phy@800 {
+			compatible = "rockchip,rk322x-usb2phy";
+			reg = <0x0800 0x0c>;
+			clocks = <&cru SCLK_OTGPHY1>;
+			clock-names = "phyclk";
+			#clock-cells = <0>;
+			clock-output-names = "usb480m_phy1";
+			status = "disabled";
+
+			u2phy1_otg: otg-port {
+				#phy-cells = <0>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				status = "disabled";
+			};
+
+			u2phy1_host: host-port {
+				#phy-cells = <0>;
+				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				status = "disabled";
+			};
+		};
 	};
 
 	uart0: serial@11010000 {
@@ -467,6 +520,89 @@
 		status = "disabled";
 	};
 
+	usb_otg: usb@30040000 {
+		compatible = "rockchip,rk322x-usb", "rockchip,rk3066-usb",
+			     "snps,dwc2";
+		reg = <0x30040000 0x40000>;
+		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_OTG>;
+		clock-names = "otg";
+		dr_mode = "otg";
+		g-np-tx-fifo-size = <16>;
+		g-rx-fifo-size = <280>;
+		g-tx-fifo-size = <256 128 128 64 32 16>;
+		g-use-dma;
+		phys = <&u2phy0_otg>;
+		phy-names = "usb2-phy";
+		status = "disabled";
+	};
+
+	usb_host0_ehci: usb@30080000 {
+		compatible = "generic-ehci";
+		reg = <0x30080000 0x20000>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST0>, <&u2phy0>;
+		clock-names = "usbhost", "utmi";
+		phys = <&u2phy0_host>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
+	usb_host0_ohci: usb@300a0000 {
+		compatible = "generic-ohci";
+		reg = <0x300a0000 0x20000>;
+		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST0>, <&u2phy0>;
+		clock-names = "usbhost", "utmi";
+		phys = <&u2phy0_host>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
+	usb_host1_ehci: usb@300c0000 {
+		compatible = "generic-ehci";
+		reg = <0x300c0000 0x20000>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST1>, <&u2phy1>;
+		clock-names = "usbhost", "utmi";
+		phys = <&u2phy1_otg>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
+	usb_host1_ohci: usb@300e0000 {
+		compatible = "generic-ohci";
+		reg = <0x300e0000 0x20000>;
+		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST1>, <&u2phy1>;
+		clock-names = "usbhost", "utmi";
+		phys = <&u2phy1_otg>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
+	usb_host2_ehci: usb@30100000 {
+		compatible = "generic-ehci";
+		reg = <0x30100000 0x20000>;
+		interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST2>, <&u2phy1>;
+		phys = <&u2phy1_host>;
+		phy-names = "usb";
+		clock-names = "usbhost", "utmi";
+		status = "disabled";
+	};
+
+	usb_host2_ohci: usb@30120000 {
+		compatible = "generic-ohci";
+		reg = <0x30120000 0x20000>;
+		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST2>, <&u2phy1>;
+		clock-names = "usbhost", "utmi";
+		phys = <&u2phy1_host>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
 	gmac: ethernet@30200000 {
 		compatible = "rockchip,rk3228-gmac";
 		reg = <0x30200000 0x10000>;
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
