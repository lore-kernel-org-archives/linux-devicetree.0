From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/3] ARM: dts: sun6i: hummingbird: Rename AXP221 DC1SW and DC5LDO supply names
Date: Wed, 16 Sep 2015 11:05:32 +0800
Message-ID: <1442372732-27434-4-git-send-email-wens@csie.org>
References: <1442372732-27434-1-git-send-email-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442372732-27434-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

"dcdc1-supply" and "dcdc5-supply" are renamed to "dc1sw-supply" and
"dc5ldo-supply" respectively. Update the dts to reflect the new supply
names for the regulators.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
index 06d9391ca30e..144f563a3d6d 100644
--- a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
+++ b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
@@ -178,8 +178,8 @@
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 		#interrupt-cells = <1>;
-		dcdc1-supply = <&vcc_3v0>;
-		dcdc5-supply = <&vcc_dram>;
+		dc1sw-supply = <&vcc_3v0>;
+		dc5ldo-supply = <&vcc_dram>;
 
 		regulators {
 			x-powers,dcdc-freq = <3000>;
-- 
2.5.1
