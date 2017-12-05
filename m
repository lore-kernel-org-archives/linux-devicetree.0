From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: Add Spreadtrum SC2731 regulator documentation" to the regulator tree
Date: Tue,  5 Dec 2017 12:48:53 +0000 (GMT)
Message-ID: <20171205124853.7C09444006B@finisterre.ee.mobilebroadband>
References: <d1e3a79db9b9a0b6c3116e06b34942b92b629ccc.1512455819.git.erick.chen@spreadtrum.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1e3a79db9b9a0b6c3116e06b34942b92b629ccc.1512455819.git.erick.chen@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com, erick.chen@spreadtrum.comlinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: Add Spreadtrum SC2731 regulator documentation

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

>From 5149b685b122d3bee78bd3403997f9ddb1223f4a Mon Sep 17 00:00:00 2001
From: Erick Chen <erick.chen@spreadtrum.com>
Date: Tue, 5 Dec 2017 14:35:45 +0800
Subject: [PATCH] regulator: Add Spreadtrum SC2731 regulator documentation

This patch adds support for the Spreadtrum SC2731
voltage regulator device.

Signed-off-by: Erick Chen <erick.chen@spreadtrum.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/sprd,sc2731-regulator.txt   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/sprd,sc2731-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/sprd,sc2731-regulator.txt b/Documentation/devicetree/bindings/regulator/sprd,sc2731-regulator.txt
new file mode 100644
index 000000000000..63dc07877cd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sprd,sc2731-regulator.txt
@@ -0,0 +1,43 @@
+Spreadtrum SC2731 Voltage regulators
+
+The SC2731 integrates low-voltage and low quiescent current DCDC/LDO.
+14 LDO and 3 DCDCs are designed for external use. All DCDCs/LDOs have
+their own bypass (power-down) control signals. External tantalum or MLCC
+ceramic capacitors are recommended to use with these LDOs.
+
+Required properties:
+ - compatible: should be "sprd,sc27xx-regulator".
+
+List of regulators provided by this controller. It is named according to
+its regulator type, BUCK_<name> and LDO_<name>. The definition for each
+of these nodes is defined using the standard binding for regulators at
+Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for regulators are:
+BUCK:
+	BUCK_CPU0, BUCK_CPU1, BUCK_RF
+LDO:
+	LDO_CAMA0, LDO_CAMA1, LDO_CAMMOT, LDO_VLDO, LDO_EMMCCORE, LDO_SDCORE,
+	LDO_SDIO, LDO_WIFIPA, LDO_USB33, LDO_CAMD0, LDO_CAMD1, LDO_CON,
+	LDO_CAMIO, LDO_SRAM
+
+Example:
+	regulators {
+		compatible = "sprd,sc27xx-regulator";
+
+		vddarm0: BUCK_CPU0 {
+			regulator-name = "vddarm0";
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <1996875>;
+			regulator-ramp-delay = <25000>;
+			regulator-always-on;
+		};
+
+		vddcama0: LDO_CAMA0 {
+			regulator-name = "vddcama0";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <3750000>;
+			regulator-enable-ramp-delay = <100>;
+		};
+		...
+	};
-- 
2.15.0
