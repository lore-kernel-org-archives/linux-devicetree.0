From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 3/4] ARM: dt: axp209: Add AXP209 GPIO driver
Date: Wed, 20 Jul 2016 16:11:38 +0200
Message-ID: <20160720141139.25098-4-maxime.ripard@free-electrons.com>
References: <20160720141139.25098-1-maxime.ripard@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160720141139.25098-1-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Add the AXP209 GPIO node to our AXP209 DTSI so that boards can use it.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/axp209.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/axp209.dtsi b/arch/arm/boot/dts/axp209.dtsi
index afbe89c01df5..675bb0f30825 100644
--- a/arch/arm/boot/dts/axp209.dtsi
+++ b/arch/arm/boot/dts/axp209.dtsi
@@ -53,6 +53,12 @@
 	interrupt-controller;
 	#interrupt-cells = <1>;
 
+	axp_gpio: gpio {
+		compatible = "x-powers,axp209-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	regulators {
 		/* Default work frequency for buck regulators */
 		x-powers,dcdc-freq = <1500>;
-- 
2.9.0

