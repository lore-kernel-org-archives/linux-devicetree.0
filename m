From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] Revert "ARM: dts: rockchip: add startup delay to
 rk3288-veyron panel-regulators"
Date: Thu, 20 Jun 2019 11:20:56 -0700
Message-ID: <20190620182056.61552-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, mka@chromium.org, enric.balletbo@collabora.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This reverts commit 1f45e8c6d0161f044d679f242fe7514e2625af4a.

This 100 ms mystery delay is not on downstream kernels and no longer
seems needed on upstream kernels either [1].  Presumably something in the
meantime has made things better.  A few possibilities for patches that
have landed in the meantime that could have made this better are
commit 3157694d8c7f ("pwm-backlight: Add support for PWM delays
proprieties."), commit 5fb5caee92ba ("pwm-backlight: Enable/disable
the PWM before/after LCD enable toggle."), and commit 6d5922dd0d60
("ARM: dts: rockchip: set PWM delay backlight settings for Veyron")

Let's revert and get our 100 ms back.

[1] https://lkml.kernel.org/r/2226970.BAPq4liE1j@diego

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron-jaq.dts    | 1 -
 arch/arm/boot/dts/rk3288-veyron-jerry.dts  | 1 -
 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 1 -
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
index fcd119168cb6..5411ce148890 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
@@ -24,7 +24,6 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_enable_h>;
 		regulator-name = "panel_regulator";
-		startup-delay-us = <100000>;
 		vin-supply = <&vcc33_sys>;
 	};
 
diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
index 164561f04c1d..82ac9d23480e 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
@@ -26,7 +26,6 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_enable_h>;
 		regulator-name = "panel_regulator";
-		startup-delay-us = <100000>;
 		vin-supply = <&vcc33_sys>;
 	};
 
diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index b2cc70a08554..f29501d8ff07 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -33,7 +33,6 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_enable_h>;
 		regulator-name = "panel_regulator";
-		startup-delay-us = <100000>;
 		vin-supply = <&vcc33_sys>;
 	};
 
diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index 9b140db04456..a0f6fefc95f1 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -24,7 +24,6 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_enable_h>;
 		regulator-name = "panel_regulator";
-		startup-delay-us = <100000>;
 		vin-supply = <&vcc33_sys>;
 	};
 
-- 
2.22.0.410.gd8fdbe21b5-goog
