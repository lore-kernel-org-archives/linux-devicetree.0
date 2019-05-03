From: Pablo Greco <pgreco@centosproject.org>
Subject: [PATCH] ARM: dts: sun8i: r40: bananapi-m2-ultra: Remove regulator-always-on
Date: Fri,  3 May 2019 20:05:19 -0300
Message-ID: <1556924720-49372-1-git-send-email-pgreco@centosproject.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com
Cc: Pablo Greco <pgreco@centosproject.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that the regulators are tied to the GPIO bank, we can remove the
unneeded regulator-always-on in reg_aldo2

Signed-off-by: Pablo Greco <pgreco@centosproject.org>
---
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index 699579d..42d62d1 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -210,7 +210,6 @@
 };
 
 &reg_aldo2 {
-	regulator-always-on;
 	regulator-min-microvolt = <2500000>;
 	regulator-max-microvolt = <2500000>;
 	regulator-name = "vcc-pa";
-- 
1.8.3.1
