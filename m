From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: [PATCH] ARM: dts: armada-{370,xp}: drop "marvell,orion-spi" from SPI controllers
Date: Wed,  7 Dec 2016 16:21:09 +0100
Message-ID: <20161207152109.17545-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

The SPI controllers on Armada 370 and XP differ from the original Orion
SPI controllers (at least) in the configuration of the baud rate. So
it's wrong to claim compatibility which results in bogus baud rates.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/armada-370.dtsi | 4 ++--
 arch/arm/boot/dts/armada-xp.dtsi  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index b4258105e91f..b9377c11b379 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -435,13 +435,13 @@
  * board level if a different configuration is used.
  */
 &spi0 {
-	compatible = "marvell,armada-370-spi", "marvell,orion-spi";
+	compatible = "marvell,armada-370-spi";
 	pinctrl-0 = <&spi0_pins1>;
 	pinctrl-names = "default";
 };
 
 &spi1 {
-	compatible = "marvell,armada-370-spi", "marvell,orion-spi";
+	compatible = "marvell,armada-370-spi";
 	pinctrl-0 = <&spi1_pins>;
 	pinctrl-names = "default";
 };
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 4a5f99e65b51..3a416834d80b 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -367,13 +367,13 @@
 };
 
 &spi0 {
-	compatible = "marvell,armada-xp-spi", "marvell,orion-spi";
+	compatible = "marvell,armada-xp-spi";
 	pinctrl-0 = <&spi0_pins>;
 	pinctrl-names = "default";
 };
 
 &spi1 {
-	compatible = "marvell,armada-xp-spi", "marvell,orion-spi";
+	compatible = "marvell,armada-xp-spi";
 	pinctrl-0 = <&spi1_pins>;
 	pinctrl-names = "default";
 };
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
