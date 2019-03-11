From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: rk3399: rock960: Add 12V DCIN regulator
Date: Mon, 11 Mar 2019 20:33:31 +0530
Message-ID: <20190311150332.19492-2-jagan@amarulasolutions.com>
References: <20190311150332.19492-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311150332.19492-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>, Akash Gajjar <akash@openedev.com>
List-Id: devicetree@vger.kernel.org

12V DCIN regulator is root source supply for the rest of regulators
in Rock960 power diagram.

Add support for it and attach same to supply vcc5v0_sys.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Akash Gajjar <akash@openedev.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index a268ec9f6b5e..68ca3bf9ea2f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -18,6 +18,15 @@
 		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
 	};
 
+	vcc12v_dcin: vcc12v-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vcc1v8_s0: vcc1v8-s0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc1v8_s0";
@@ -32,6 +41,7 @@
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
+		vin-supply = <&vcc12v_dcin>;
 	};
 
 	vcc3v3_sys: vcc3v3-sys {
-- 
2.18.0.321.gffc6fa0e3
