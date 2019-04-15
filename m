Return-Path: <SRS0=+UXU=SR=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "dt-bindings: regulator: Add stm32mp1 pwr regulators" to the regulator tree
In-Reply-To: <1555319855-2982-2-git-send-email-p.paillet@st.com>
Message-Id: <20190415095850.5E76111279F6@debutante.sirena.org.uk>
Date: Mon, 15 Apr 2019 10:58:50 +0100 (BST)
To: Pascal PAILLET-LME <p.paillet@st.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>, broonie@kernel.orgbroonie@kernel.org, devicetree@vger.kernel.orgdevicetree@vger.kernel.org, lgirdwood@gmail.comlgirdwood@gmail.com, linux-arm-kernel@lists.infradead.orglinux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.comlinux-stm32, @st-md-mailman.stormreply.comMarkBrownbroonie@kernel.org, mark.rutland@arm.commark.rutland@arm.com, mcoquelin.stm32@gmail.commcoquelin.stm32@gmail.com, robh+dt@kernel.orgrobh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   dt-bindings: regulator: Add stm32mp1 pwr regulators

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.2

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

>From c29687c354c58cd56fb2529fb89266c280206cf9 Mon Sep 17 00:00:00 2001
From: Pascal PAILLET-LME <p.paillet@st.com>
Date: Mon, 15 Apr 2019 09:17:37 +0000
Subject: [PATCH] dt-bindings: regulator: Add stm32mp1 pwr regulators

Document devicetree bindings for stm32mp1 pwr regulators.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../regulator/st,stm32mp1-pwr-reg.txt         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
new file mode 100644
index 000000000000..e372dd3f0c8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
@@ -0,0 +1,43 @@
+STM32MP1 PWR Regulators
+-----------------------
+
+Available Regulators in STM32MP1 PWR block are:
+  - reg11 for regulator 1V1
+  - reg18 for regulator 1V8
+  - usb33 for the swtich USB3V3
+
+Required properties:
+- compatible: Must be "st,stm32mp1,pwr-reg"
+- list of child nodes that specify the regulator reg11, reg18 or usb33
+  initialization data for defined regulators. The definition for each of
+  these nodes is defined using the standard binding for regulators found at
+  Documentation/devicetree/bindings/regulator/regulator.txt.
+- vdd-supply: phandle to the parent supply/regulator node for vdd input
+- vdd_3v3_usbfs-supply: phandle to the parent supply/regulator node for usb33
+
+Example:
+
+pwr_regulators: pwr@50001000 {
+	compatible = "st,stm32mp1,pwr-reg";
+	reg = <0x50001000 0x10>;
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+
+	reg11: reg11 {
+		regulator-name = "reg11";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+	};
+
+	reg18: reg18 {
+		regulator-name = "reg18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	usb33: usb33 {
+		regulator-name = "usb33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
-- 
2.20.1
