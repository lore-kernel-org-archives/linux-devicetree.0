From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: support the usb2phy for rk3399 evb
Date: Thu,  7 Jul 2016 12:46:40 +0800
Message-ID: <1467866800-24794-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

This patch adds the usb2phy needed dts node information for rk3399.

USB2.0 PHY is comprised of one Host port and one OTG port.
Host Port is for USB2.0 host controller; OTG port is for USB2.0 part of
USB3.0 OTG controller, and as a part to construct a fully feature TypeC
subsystem.

The USB2.0 vbus gpio is board specific, it's no same with all rk3399
boards, so move it into evb voard.

Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm64/boot/dts/rockchip/rk3399-evb.dts |  4 ++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi    | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
index d33aa06..9be3715 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
@@ -105,6 +105,10 @@
 	status = "okay";
 };
 
+&usb2phy {
+	vbus_drv-gpio = <&gpio4 25 GPIO_ACTIVE_HIGH>;
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 4c84229..21d147f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -242,6 +242,25 @@
 		status = "disabled";
 	};
 
+	usb2phy: usb2phy {
+		compatible = "rockchip,rk3399-usb-phy";
+		rockchip,grf = <&grf>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb2phy0: usb2-phy0 {
+			#phy-cells = <0>;
+			#clock-cells = <0>;
+			reg = <0xe458>;
+		};
+
+		usb2phy1: usb2-phy1 {
+			#phy-cells = <0>;
+			#clock-cells = <0>;
+			reg = <0xe468>;
+		};
+	};
+
 	usb_host0_ehci: usb@fe380000 {
 		compatible = "generic-ehci";
 		reg = <0x0 0xfe380000 0x0 0x20000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
