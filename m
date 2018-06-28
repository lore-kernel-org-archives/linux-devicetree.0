From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: bd71837: Remove duplicate description from DT bindings" to the regulator tree
Date: Thu, 28 Jun 2018 12:46:51 +0100
Message-ID: <E1fYVNz-0006eT-DN@debutante>
References: <b4d847919a7c72365478240f443debd2601a073e.1530184909.git.matti.vaittinen@fi.rohmeurope.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b4d847919a7c72365478240f443debd2601a073e.1530184909.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.combroonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.shevchenko@gmail.com, axel.lin@ingics.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: bd71837: Remove duplicate description from DT bindings

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

>From 312ae0ae7479d30f8876bafbc4cca24f0605c65f Mon Sep 17 00:00:00 2001
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Date: Thu, 28 Jun 2018 14:23:04 +0300
Subject: [PATCH] regulator: bd71837: Remove duplicate description from DT
 bindings

Same general chip description was written in MFD and Regulator
binding documents for ROHM bd71837 PMIC. Remove description from
regulator binding as suggested by Rob H.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/rohm,bd71837-regulator.txt         | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
index 4edf3137d9f7..76ead07072b1 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
@@ -1,13 +1,5 @@
 ROHM BD71837 Power Management Integrated Circuit (PMIC) regulator bindings
 
-BD71837MWV is a programmable Power Management
-IC (PMIC) for powering single-core, dual-core, and
-quad-core SoC’s such as NXP-i.MX 8M. It is optimized
-for low BOM cost and compact solution footprint. It
-integrates 8 Buck regulators and 7 LDO’s to provide all
-the power rails required by the SoC and the commonly
-used peripherals.
-
 Required properties:
  - regulator-name: should be "buck1", ..., "buck8" and "ldo1", ..., "ldo7"
 
-- 
2.18.0.rc2
