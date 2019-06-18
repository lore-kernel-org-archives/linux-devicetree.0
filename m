From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] Revert "ARM: dts: rockchip: set PWM delay backlight settings for Minnie"
Date: Tue, 18 Jun 2019 11:45:31 -0700
Message-ID: <20190618184531.1137-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Pavel Machek <pavel@ucw.cz>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

This reverts commit 288ceb85b505c19abe1895df068dda5ed20cf482.

The commit assumes that the minnie panel is a AUO B101EAN01.1 (LVDS
interface), however it is a AUO B101EAN01.8 (eDP interface). The eDP
panel doesn't need the 200 ms delay.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Changes in v2:
- updated commit message with details about the source of the
  confusion
- added Enric's "Reviewed-by" tag
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
