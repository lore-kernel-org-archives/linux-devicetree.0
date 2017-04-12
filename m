From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: tps65132: add device-tree binding" to the regulator tree
Date: Wed, 12 Apr 2017 17:00:34 +0100
Message-ID: <E1cyKh8-00068Q-0n@debutante>
References: <1491992104-21921-1-git-send-email-vreddytalla@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491992104-21921-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.combroonie@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, vreddytalla@nvidia.com, ldewangan@nvidia.comlinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: tps65132: add device-tree binding

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

>From 682d33c65c28bca28238e84dc3f3b629008d1079 Mon Sep 17 00:00:00 2001
From: Venkat Reddy Talla <vreddytalla@nvidia.com>
Date: Wed, 12 Apr 2017 15:45:04 +0530
Subject: [PATCH] regulator: tps65132: add device-tree binding

Add tps65132 regulator device-tree binding documentation

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/tps65132-regulator.txt      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65132-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt b/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt
new file mode 100644
index 000000000000..3a3505520c69
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps65132-regulator.txt
@@ -0,0 +1,46 @@
+TPS65132 regulators
+
+Required properties:
+- compatible: "ti,tps65132"
+- reg: I2C slave address
+
+Optional Subnode:
+Device supports two regulators OUTP and OUTN. A sub node within the
+   device node describe the properties of these regulators. The sub-node
+   names must be as follows:
+	-For regulator outp, the sub node name should be "outp".
+	-For regulator outn, the sub node name should be "outn".
+
+-enable-gpios:(active high, output) Regulators are controlled by the input pins.
+   If it is connected to GPIO through host system then provide the
+   gpio number as per gpio.txt.
+-active-discharge-gpios: (active high, output) Some configurations use delay mechanisms
+  on the enable pin, to keep the regulator enabled for some time after
+  the enable signal goes low. This GPIO is used to actively discharge
+  the delay mechanism. Requires specification of ti,active-discharge-time-us
+-ti,active-discharge-time-us: how long the active discharge gpio should be
+  asserted for during active discharge, in microseconds.
+
+Each regulator is defined using the standard binding for regulators.
+
+Example:
+
+	tps65132@3e {
+		compatible = "ti,tps65132";
+		reg = <0x3e>;
+
+		outp {
+			regulator-name = "outp";
+			regulator-boot-on;
+			regulator-always-on;
+			enable-gpios = <&gpio 23 0>;
+		};
+
+		outn {
+			regulator-name = "outn";
+			regulator-boot-on;
+			regulator-always-on;
+			regulator-active-discharge = <0>;
+			enable-gpios = <&gpio 40 0>;
+		};
+	};
-- 
2.11.0
