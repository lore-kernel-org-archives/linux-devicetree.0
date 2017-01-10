From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH] regulator: anatop: Add support for "anatop-enable-bit"
Date: Tue, 10 Jan 2017 08:30:14 -0800
Message-ID: <20170110163015.22444-2-andrew.smirnov@gmail.com>
References: <20170110163015.22444-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110163015.22444-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, yurovsky@gmail.com, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add code to support support for "anatop-enable-bit" device-tree
property. This property translates to LINREG_ENABLE bit in real hardware
and is present on 1p1, 2p5 and 3p0 regulators on i.MX6 and 1p0d regulator
on i.MX7.

Cc: yurovsky@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Note: "anatop-enable-bit" has already found its way into upstream tree
before this patch (probably not on purpose). See imx6ul.dtsi and
imx7s.dtsi for concrete examples

 .../devicetree/bindings/regulator/anatop-regulator.txt       |  1 +
 drivers/regulator/anatop-regulator.c                         | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
index 37c4ea0..1d58c8c 100644
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
index 3a6d029..b041f27 100644
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
2.9.3
