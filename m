From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] ARM: dts: rockchip: fix PWM clock found on RK3288 Socs
Date: Tue,  9 Apr 2019 13:47:07 -0700
Message-ID: <20190409204707.150347-4-dianders@chromium.org>
References: <20190409204707.150347-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409204707.150347-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Caesar Wang <caesar.wang@rock-chips.com>, linux-rockchip@lists.infradead.org, mka@chromium.org, ryandcase@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Caesar Wang <caesar.wang@rock-chips.com>

We use the new PWM IP on RK3288, but the PWM's clock indeed incorrect.

Signed-off-by: Caesar Wang <caesar.wang@rock-chips.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 8bce2fc49b24..efdfa3737561 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -677,7 +677,7 @@
 		#pwm-cells = <3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm0_pin>;
-		clocks = <&cru PCLK_PWM>;
+		clocks = <&cru PCLK_RKPWM>;
 		clock-names = "pwm";
 		status = "disabled";
 	};
@@ -688,7 +688,7 @@
 		#pwm-cells = <3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm1_pin>;
-		clocks = <&cru PCLK_PWM>;
+		clocks = <&cru PCLK_RKPWM>;
 		clock-names = "pwm";
 		status = "disabled";
 	};
@@ -699,7 +699,7 @@
 		#pwm-cells = <3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm2_pin>;
-		clocks = <&cru PCLK_PWM>;
+		clocks = <&cru PCLK_RKPWM>;
 		clock-names = "pwm";
 		status = "disabled";
 	};
@@ -710,7 +710,7 @@
 		#pwm-cells = <2>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm3_pin>;
-		clocks = <&cru PCLK_PWM>;
+		clocks = <&cru PCLK_RKPWM>;
 		clock-names = "pwm";
 		status = "disabled";
 	};
-- 
2.21.0.392.gf8f6787159e-goog
