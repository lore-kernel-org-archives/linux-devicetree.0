From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: Add document for MediaTek MT6380 regulator" to the regulator tree
Date: Tue, 15 Aug 2017 16:10:56 +0100
Message-ID: <E1dhdUe-0007bp-Vs@debutante>
References: <0325c83fa4eeb1dc9e887548c1ad5ae8ab912c91.1502779753.git.sean.wang@mediatek.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0325c83fa4eeb1dc9e887548c1ad5ae8ab912c91.1502779753.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Chenglin Xu <chenglin.xu@mediatek.com>, Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.combroonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, chen.zhong@mediatek.comchenglin.xu@mediatek.com, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: Add document for MediaTek MT6380 regulator

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

>From d57287b4fbf6bdb0386c839f2faa2ae4f6bad550 Mon Sep 17 00:00:00 2001
From: Sean Wang <sean.wang@mediatek.com>
Date: Tue, 15 Aug 2017 17:09:14 +0800
Subject: [PATCH] regulator: Add document for MediaTek MT6380 regulator

add dt-binding document for MediaTek MT6380 PMIC

Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/mt6380-regulator.txt        | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
new file mode 100644
index 000000000000..0058441f16d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
@@ -0,0 +1,89 @@
+MediaTek MT6380 Regulator
+
+All voltage regulators provided by the MT6380 PMIC are described as the
+subnodes of the MT6380 regulators node. Each regulator is named according
+to its regulator type, buck-<name> and ldo-<name>. The definition for each
+of these nodes is defined using the standard binding for regulators at
+Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for regulators are:
+BUCK:
+  buck-core1, buck-vcore, buck-vrf
+LDO:
+  ldo-vm ,ldo-va , ldo-vphy, ldo-vddr, ldo-vt
+
+Example:
+
+	regulators {
+		compatible = "mediatek,mt6380-regulator";
+
+		mt6380_vcpu_reg: buck-vcore1 {
+			regulator-name = "vcore1";
+			regulator-min-microvolt = < 600000>;
+			regulator-max-microvolt = <1393750>;
+			regulator-ramp-delay = <6250>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vcore_reg: buck-vcore {
+			regulator-name = "vcore";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <1393750>;
+			regulator-ramp-delay = <6250>;
+		};
+
+		mt6380_vrf_reg: buck-vrf {
+			regulator-name = "vrf";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1575000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vm_reg: ldo-vm {
+			regulator-name = "vm";
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1400000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_va_reg: ldo-va {
+			regulator-name = "va";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vphy_reg: ldo-vphy {
+			regulator-name = "vphy";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vddr_reg: ldo-vddr {
+			regulator-name = "vddr";
+			regulator-min-microvolt = <1240000>;
+			regulator-max-microvolt = <1840000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		mt6380_vt_reg: ldo-vt {
+			regulator-name = "vt";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-ramp-delay = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
-- 
2.13.3
