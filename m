From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] Revert "ARM: dts: rockchip: set PWM delay backlight settings for Minnie"
Date: Fri, 14 Jun 2019 15:45:33 -0700
Message-ID: <20190614224533.169881-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Pavel Machek <pavel@ucw.cz>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

This reverts commit 288ceb85b505c19abe1895df068dda5ed20cf482.

According to the commit message the AUO B101EAN01 panel on minnie
requires a PWM delay of 200 ms, however this is not what the
datasheet says. The datasheet mentions a *max* delay of 200 ms
for T2 ("delay from LCDVDD to black video generation") and T3
("delay from LCDVDD to HPD high"), which aren't related to the
PWM. The backlight power sequence does not specify min/max
constraints for T15 (time from PWM on to BL enable) or T16
(time from BL disable to PWM off).

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Enric, if you think I misinterpreted the datasheet please holler!
---
 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index 468a1818545d..28cbe07f96ec 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -86,8 +86,6 @@
 			240 241 242 243 244 245 246 247
 			248 249 250 251 252 253 254 255>;
 	power-supply = <&backlight_regulator>;
-	post-pwm-on-delay-ms = <200>;
-	pwm-off-delay-ms = <200>;
 };
 
 &emmc {
-- 
2.22.0.410.gd8fdbe21b5-goog
