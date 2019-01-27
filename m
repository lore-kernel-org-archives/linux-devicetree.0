From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 2/5] ARM: dts: sun5i: q8-tablet: Move panel properties to correct node level
Date: Sun, 27 Jan 2019 22:48:35 +0800
Message-ID: <20190127144838.3578-3-wens@csie.org>
References: <20190127144838.3578-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190127144838.3578-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The panel backlight and enable GPIO comments were incorrectly placed
in the input port, while it should have been in the panel node itself.

Move them to the correct position.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun5i-a13-q8-tablet.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
index a89f29fa3e40..3a844dae26f7 100644
--- a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
+++ b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
@@ -50,13 +50,13 @@
 
 	panel: panel {
 		compatible = "urt,umsh-8596md-t", "simple-panel";
+		/* TODO: lcd panel uses axp gpio0 as enable pin */
+		backlight = <&backlight>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		port@0 {
 			reg = <0>;
-			/* TODO: lcd panel uses axp gpio0 as enable pin */
-			backlight = <&backlight>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-- 
2.20.1
