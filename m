From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: lm363x: Use generic property for hardware enable pins" to the regulator tree
Date: Tue, 07 Mar 2017 15:21:54 +0100
Message-ID: <E1clFzu-0006jD-1u@finisterre>
References: <20170228075041.7568-1-milo.kim@ti.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170228075041.7568-1-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: lm363x: Use generic property for hardware enable pins

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 45493684f5953d83cb2621027ad0792d167bedab Mon Sep 17 00:00:00 2001
From: Milo Kim <milo.kim@ti.com>
Date: Tue, 28 Feb 2017 16:50:40 +0900
Subject: [PATCH] regulator: lm363x: Use generic property for hardware enable
 pins

With index usages, device specific properties can be replaced with generic
one. Vpos is index 0 and Vneg is index 1.
DT examples are added as well.

Signed-off-by: Milo Kim <milo.kim@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/lm363x-regulator.txt        | 78 +++++++++++++++++++++-
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
index 8f14df9d1205..cc5a6151d85f 100644
--- a/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
@@ -8,8 +8,8 @@ Required property:
 
 Optional properties:
   LM3632 has external enable pins for two LDOs.
-  - ti,lcm-en1-gpio: A GPIO specifier for Vpos control pin.
-  - ti,lcm-en2-gpio: A GPIO specifier for Vneg control pin.
+  - enable-gpios: Two GPIO specifiers for Vpos and Vneg control pins.
+                  The first entry is Vpos, the second is Vneg enable pin.
 
 Child nodes:
   LM3631
@@ -30,5 +30,79 @@ Child nodes:
 
 Examples: Please refer to ti-lmu dt-bindings [2].
 
+lm3631@29 {
+	compatible = "ti,lm3631";
+	reg = <0x29>;
+
+	regulators {
+		compatible = "ti,lm363x-regulator";
+
+		vboost {
+			regulator-name = "lcd_boost";
+			regulator-min-microvolt = <4500000>;
+			regulator-max-microvolt = <6350000>;
+			regulator-always-on;
+		};
+
+		vcont {
+			regulator-name = "lcd_vcont";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		voref {
+			regulator-name = "lcd_voref";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+		};
+
+		vpos {
+			regulator-name = "lcd_vpos";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+			regulator-boot-on;
+		};
+
+		vneg {
+			regulator-name = "lcd_vneg";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+			regulator-boot-on;
+		};
+	};
+};
+
+lm3632@11 {
+	compatible = "ti,lm3632";
+	reg = <0x11>;
+
+	regulators {
+		compatible = "ti,lm363x-regulator";
+
+		/* GPIO1_16 for Vpos, GPIO1_28 is for Vneg */
+		enable-gpios = <&gpio1 16 GPIO_ACTIVE_HIGH>,
+				<&gpio1 28 GPIO_ACTIVE_HIGH>;
+
+		vboost {
+			regulator-name = "lcd_boost";
+			regulator-min-microvolt = <4500000>;
+			regulator-max-microvolt = <6400000>;
+			regulator-always-on;
+		};
+
+		vpos {
+			regulator-name = "lcd_vpos";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+		};
+
+		vneg {
+			regulator-name = "lcd_vneg";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+		};
+	};
+};
+
 [1] ../regulator/regulator.txt
 [2] ../mfd/ti-lmu.txt
-- 
2.11.0
