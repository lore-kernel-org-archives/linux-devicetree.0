From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v9 4/4] arm64: dts: rockchip: configure usb2-phy support for rk3399-evb
Date: Fri, 22 Jul 2016 15:00:46 +0800
Message-ID: <1469170846-15617-5-git-send-email-frank.wang@rock-chips.com>
References: <1469170846-15617-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469170846-15617-1-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Add vcc5v0_host regulator for usb2-phy and enable host-port support.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts |   44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
index 1a3eb14..56aeedb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
@@ -69,6 +69,25 @@
 		regulator-max-microvolt = <3300000>;
 	};
 
+	vcc5v0_sys: vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_host: vcc5v0-host-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 25 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&host_vbus_drv>;
+		regulator-name = "vcc5v0_host";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc_phy: vcc-phy-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_phy";
@@ -89,6 +108,24 @@
 	status = "okay";
 };
 
+&u2phy0 {
+	status = "okay";
+
+	u2phy0_host: host-port {
+		phy-supply = <&vcc5v0_host>;
+		status = "okay";
+	};
+};
+
+&u2phy1 {
+	status = "okay";
+
+	u2phy1_host: host-port {
+		phy-supply = <&vcc5v0_host>;
+		status = "okay";
+	};
+};
+
 &uart2 {
 	status = "okay";
 };
@@ -121,4 +158,11 @@
 				<1 18 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
+
+	usb2 {
+		host_vbus_drv: host-vbus-drv {
+			rockchip,pins =
+				<4 25 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
-- 
1.7.9.5
