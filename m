From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 2/2] ARM: dts: sun9i: cubieboard4: Drop sunxi-common-regulators.dtsi
Date: Fri,  3 Jun 2016 14:50:51 +0800
Message-ID: <1464936651-25911-3-git-send-email-wens@csie.org>
References: <1464936651-25911-1-git-send-email-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464936651-25911-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

sunxi-common-regulators.dtsi provided dummy regulators vcc3v0, vcc3v3,
vcc5v0. 3.0V/3.3V and 5.0V are commonly used voltages in Allwinner
devices. These dummy regulators provide a stand-in when bindings that
require one, but the real regulator is not supported yet.

Since these are no longer needed, we can drop the include file.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
index 8d8af1189d87..db770d06c31e 100644
--- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
+++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
@@ -45,7 +45,6 @@
 
 /dts-v1/;
 #include "sun9i-a80.dtsi"
-#include "sunxi-common-regulators.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
-- 
2.8.1
