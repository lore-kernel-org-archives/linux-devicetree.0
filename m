From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: pwm-regulator: Re-write bindings" to the regulator tree
Date: Tue, 07 Jul 2015 19:31:02 +0100
Message-ID: <E1ZCXe2-0001Wx-Va@debutante>
References: <1436281613-899-7-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436281613-899-7-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: pwm-regulator: Re-write bindings

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

>From 02258b8bcbb98b28064cc829f7062455da398633 Mon Sep 17 00:00:00 2001
From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 7 Jul 2015 16:06:50 +0100
Subject: [PATCH] regulator: pwm-regulator: Re-write bindings

* Add support for continuous-voltage mode
* Put more meat on the bones with regards to voltage-table mode
* Sort out formatting for ease of consumption

Cc: devicetree@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/pwm-regulator.txt           | 68 ++++++++++++++++++----
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index ce91f61feb12..892b36655b3d 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -1,27 +1,71 @@
-pwm regulator bindings
+Bindings for the Generic PWM Regulator
+======================================
+
+Currently supports 2 modes of operation:
+
+voltage-table:		When in this mode, a voltage table (See below) of
+			predefined voltage <=> duty-cycle values must be
+			provided via DT. Limitations are that the regulator can
+			only operate at the voltages supplied in the table.
+			Intermediary duty-cycle values which would normally
+			allow finer grained voltage selection are ignored and
+			rendered useless.  Although more control is given to
+			the user if the assumptions made in continuous-voltage
+			mode do not reign true.
+
+continuous-voltage:	This mode uses the regulator's maximum and minimum
+			supplied voltages specified in the
+			regulator-{min,max}-microvolt properties to calculate
+			appropriate duty-cycle values.  This allows for a much
+			more fine grained solution when compared with
+			voltage-table mode above.  This solution does make an
+			assumption that a %50 duty-cycle value will cause the
+			regulator voltage to run at half way between the
+			supplied max_uV and min_uV values.
 
 Required properties:
-- compatible: Should be "pwm-regulator"
-- pwms: OF device-tree PWM specification (see PWM binding pwm.txt)
-- voltage-table: voltage and duty table, include 2 members in each set of
-  brackets, first one is voltage(unit: uv), the next is duty(unit: percent)
+--------------------
+- compatible:		Should be "pwm-regulator"
+
+- pwms:			PWM specification (See: ../pwm/pwm.txt)
+
+One of these must be provided:
+- voltage-table: 	Voltage and Duty-Cycle table consisting of 2 cells
+			    First cell is voltage in microvolts (uV)
+			    Second cell is duty-cycle in percent (%)
+
+- max-duty-cycle:	Maximum Duty-Cycle value -- this will normally be
+  			255 (0xff) for an 8 bit PWM device
 
-Any property defined as part of the core regulator binding defined in
-regulator.txt can also be used.
+If both are provided, the current default is voltage-table mode.
 
-Example:
+Any property defined as part of the core regulator binding can also be used.
+(See: ../regulator/regulator.txt)
+
+Continuous Voltage Example:
 	pwm_regulator {
 		compatible = "pwm-regulator;
 		pwms = <&pwm1 0 8448 0>;
+		regulator-min-microvolt = <1016000>;
+		regulator-max-microvolt = <1114000>;
+		regulator-name = "vdd_logic";
+
+		max-duty-cycle = <255>; /* 8bit PWM */
+	};
 
+Voltage Table Example:
+	pwm_regulator {
+		compatible = "pwm-regulator;
+		pwms = <&pwm1 0 8448 0>;
+		regulator-min-microvolt = <1016000>;
+		regulator-max-microvolt = <1114000>;
+		regulator-name = "vdd_logic";
+
+			      /* Voltage Duty-Cycle */
 		voltage-table = <1114000 0>,
 				<1095000 10>,
 				<1076000 20>,
 				<1056000 30>,
 				<1036000 40>,
 				<1016000 50>;
-
-		regulator-min-microvolt = <1016000>;
-		regulator-max-microvolt = <1114000>;
-		regulator-name = "vdd_logic";
 	};
-- 
2.1.4
