From: Akash Gajjar <Akash_Gajjar@mentor.com>
Subject: [PATCH 4/4] arm64: dts: rockchip: rockpro64 dts add usb regulator
Date: Wed, 13 Feb 2019 22:36:40 +0530
Message-ID: <20190213170651.3210-5-Akash_Gajjar@mentor.com>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Oskari Lemmela <oskari@lemmela.net>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Levin Du <djw@t-chip.com.cn>, Klaus Goger <klaus.goger@theobroma-systems.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

vcc5v0_host and vcc5v0_typec is supplied by vcc5v0_usb and not vcc5v0_sys.
add node for vcc5v0_usb fixed regulator.

Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index dab53d2eb676..745aad8ba2d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -114,7 +114,7 @@
 		pinctrl-0 = <&vcc5v0_host_en>;
 		regulator-name = "vcc5v0_host";
 		regulator-always-on;
-		vin-supply = <&vcc5v0_sys>;
+		vin-supply = <&vcc5v0_usb>;
 	};
 
 	vcc5v0_typec: vcc5v0-typec-regulator {
@@ -125,7 +125,7 @@
 		pinctrl-0 = <&vcc5v0_typec_en>;
 		regulator-name = "vcc5v0_typec";
 		regulator-always-on;
-		vin-supply = <&vcc5v0_sys>;
+		vin-supply = <&vcc5v0_usb>;
 	};
 
 	vcc5v0_sys: vcc5v0-sys {
@@ -138,6 +138,16 @@
 		vin-supply = <&vcc12v_dcin>;
 	};
 
+	vcc5v0_usb: vcc5v0-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
 	vdd_log: vdd-log {
 		compatible = "pwm-regulator";
 		pwms = <&pwm2 0 25000 1>;
-- 
2.17.1
