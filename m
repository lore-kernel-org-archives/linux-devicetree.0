From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 2/2] arm64: dts: rockchip: Define values for the IPA governor for rock960
Date: Tue,  4 Jun 2019 18:57:58 +0200
Message-ID: <20190604165802.7338-2-daniel.lezcano@linaro.org>
References: <20190604165802.7338-1-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604165802.7338-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, edubezval@gmail.com, manivannan.sadhasivam@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Rockchip SoC
        support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Currently the default thermal values for the rk3399-rock960 board is
inherited from the generic definition in rk3399.dtsi.

In order to ensure the rock960 has more room for througput before
being capped by the thermal framework and is correctly supported by
the IPA governor, let's define the power values and the right trip
points for better performances:

 - sustainable power is tested to be 1550mW

 - increase the first mitigation point to 75°C in order to get better
   performances

 - the first trip point is 65°C in order to let the IPA to collect
   enough data for the PID regulation when it reaches 75°C

 - restrict the cooling device to the big CPUs as the little CPUs
   contribution to the heating effect can be considered negligible

The intelligent power allocator PID coefficient to be set in sysfs
are:

    k_d: 0
    k_po: 79
    k_i: 10
    k_pu: 50

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../boot/dts/rockchip/rk3399-rock960.dts      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
index 12285c51cceb..701d5b5fad46 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
@@ -114,6 +114,45 @@
 	};
 };
 
+&thermal_zones {
+	cpu_thermal: cpu {
+		polling-delay-passive = <100>;
+		polling-delay = <1000>;
+		thermal-sensors = <&tsadc 0>;
+		sustainable-power = <1550>;
+
+		trips {
+			cpu_alert0: cpu_alert0 {
+				    temperature = <65000>;
+				    hysteresis = <2000>;
+				    type = "passive";
+			};
+
+			cpu_alert1: cpu_alert1 {
+				    temperature = <75000>;
+				    hysteresis = <2000>;
+				    type = "passive";
+			};
+
+			cpu_crit: cpu_crit {
+				  temperature = <95000>;
+				  hysteresis = <2000>;
+				  type = "critical";
+			};
+		};
+
+		cooling-maps {
+			     map0 {
+
+			     trip = <&cpu_alert1>;
+			     cooling-device =
+					<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu_b1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
 &usbdrd_dwc3_0 {
 	dr_mode = "otg";
 };
-- 
2.17.1
