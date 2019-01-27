From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 5/5] ARM: dts: sun5i: q8-tablet: Use bananapi,s070wv20-ct16 panel compatible
Date: Sun, 27 Jan 2019 22:48:38 +0800
Message-ID: <20190127144838.3578-6-wens@csie.org>
References: <20190127144838.3578-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190127144838.3578-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The compatible string for the LCD panel used for the Q8 tablets are just
a placeholder that was shown to be compatible with the actual panels
found on these devices. The real panels do not have any identifiable
markings and vary between production runs.

The compatibe string previously used had a pixel clock that could not
be accurately reproduced on Allwinner hardware, and discussions on
whether a margin should be added to the display drivers and how large
a margin was acceptable had stalled.

Now that we have a panel model that is actually used with Allwinner
hardware, has the same dimensions, and the timings have been shown to
work with the nameless panels, we can use that one instead.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun5i-a13-q8-tablet.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
index c77c0758145a..7257f39b31ce 100644
--- a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
+++ b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
@@ -49,7 +49,7 @@
 	compatible = "allwinner,q8-a13", "allwinner,sun5i-a13";
 
 	panel: panel {
-		compatible = "urt,umsh-8596md-t", "simple-panel";
+		compatible = "bananapi,s070wv20-ct16", "simple-panel";
 		power-supply = <&reg_vcc3v3>;
 		enable-gpios = <&axp_gpio 0 GPIO_ACTIVE_HIGH>; /* AXP GPIO0 */
 		backlight = <&backlight>;
-- 
2.20.1
