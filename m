From: Akash Gajjar <Akash_Gajjar@mentor.com>
Subject: [PATCH 3/4] arm64: dts: rockchip: rockpro64 dts rename LED labels and default trigger
Date: Wed, 13 Feb 2019 22:36:39 +0530
Message-ID: <20190213170651.3210-4-Akash_Gajjar@mentor.com>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Oskari Lemmela <oskari@lemmela.net>, Levin Du <djw@t-chip.com.cn>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

rename white and red LEDs with status and heartbeat respectively.
replace red LED default state off with default-trigger heartbeat.

Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
---
 .../arm64/boot/dts/rockchip/rk3399-rockpro64.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index c9a2b26d7cad..dab53d2eb676 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -43,17 +43,17 @@
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-		pinctrl-0 = <&work_led_gpio>, <&diy_led_gpio>;
+		pinctrl-0 = <&status_led_gpio>, <&heartbeat_led_gpio>;
 
-		work-led {
-			label = "work";
+		status-led {
+			label = "rockpro64:white:status";
 			default-state = "on";
 			gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		};
 
-		diy-led {
-			label = "diy";
-			default-state = "off";
+		heartbeat-led {
+			label = "rockpor64:red:heartbeat";
+			linux,default-trigger = "heartbeat";
 			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
 		};
 	};
@@ -502,11 +502,11 @@
 	};
 
 	leds {
-		work_led_gpio: work_led-gpio {
+		status_led_gpio: status-led-gpio {
 			rockchip,pins = <0 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		diy_led_gpio: diy_led-gpio {
+		heartbeat_led_gpio: heartbeat-led-gpio {
 			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
-- 
2.17.1
