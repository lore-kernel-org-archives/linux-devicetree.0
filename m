From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: anatop: Add support for "anatop-enable-bit"" to the regulator tree
Date: Tue, 24 Jan 2017 18:39:35 +0000
Message-ID: <E1cW60F-0006ff-CJ@debutante>
References: <20170110163015.22444-2-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110163015.22444-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, yurovsky@gmail.com, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: anatop: Add support for "anatop-enable-bit"

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

>From ca7734ad77b4ffb83a03c80b8d64d40c7ef49263 Mon Sep 17 00:00:00 2001
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 10 Jan 2017 08:30:14 -0800
Subject: [PATCH] regulator: anatop: Add support for "anatop-enable-bit"

Add code to support support for "anatop-enable-bit" device-tree
property. This property translates to LINREG_ENABLE bit in real hardware
and is present on 1p1, 2p5 and 3p0 regulators on i.MX6 and 1p0d regulator
on i.MX7.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/regulator/anatop-regulator.txt       |  1 +
 drivers/regulator/anatop-regulator.c                         | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
index 37c4ea076f88..1d58c8cfdbc0 100644
--- a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
@@ -14,6 +14,7 @@ Optional properties:
 - anatop-delay-bit-shift: Bit shift for the step time register
 - anatop-delay-bit-width: Number of bits used in the step time register
 - vin-supply: The supply for this regulator
+- anatop-enable-bit: Regulator enable bit offset
 
 Any property defined as part of the core regulator
 binding, defined in regulator.txt, can also be used.
diff --git a/drivers/regulator/anatop-regulator.c b/drivers/regulator/anatop-regulator.c
index 3a6d0290c54c..b041f277a38b 100644
--- a/drivers/regulator/anatop-regulator.c
+++ b/drivers/regulator/anatop-regulator.c
@@ -301,7 +301,19 @@ static int anatop_regulator_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 	} else {
+		u32 enable_bit;
+
 		rdesc->ops = &anatop_rops;
+
+		if (!of_property_read_u32(np, "anatop-enable-bit",
+					  &enable_bit)) {
+			anatop_rops.enable  = regulator_enable_regmap;
+			anatop_rops.disable = regulator_disable_regmap;
+			anatop_rops.is_enabled = regulator_is_enabled_regmap;
+
+			rdesc->enable_reg = sreg->control_reg;
+			rdesc->enable_mask = BIT(enable_bit);
+		}
 	}
 
 	/* register regulator */
-- 
2.11.0
