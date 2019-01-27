From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/5] ARM: dts: sun5i: q8-tablet: Add LCD Panel enable GPIO
Date: Sun, 27 Jan 2019 22:48:36 +0800
Message-ID: <20190127144838.3578-4-wens@csie.org>
References: <20190127144838.3578-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190127144838.3578-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we support the AXP209 GPIOs, we can toggle the LCD panel enable
line. Add the GPIO phandle to the panel.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun5i-a13-q8-tablet.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
index 3a844dae26f7..ead159f89e74 100644
--- a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
+++ b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
@@ -50,7 +50,7 @@
 
 	panel: panel {
 		compatible = "urt,umsh-8596md-t", "simple-panel";
-		/* TODO: lcd panel uses axp gpio0 as enable pin */
+		enable-gpios = <&axp_gpio 0 GPIO_ACTIVE_HIGH>; /* AXP GPIO0 */
 		backlight = <&backlight>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.20.1
