From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: pwm-regulator: fix example syntax" to the regulator tree
Date: Wed, 19 Jul 2017 12:27:35 +0100
Message-ID: <E1dXn8h-0002iw-9u@debutante>
References: <20170717131823.19687-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170717131823.19687-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, lgirdwood@gmail.combroonie@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.comlinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: pwm-regulator: fix example syntax

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

>From 760068be07c744a4355a0387be4dcd4127ad2523 Mon Sep 17 00:00:00 2001
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 17 Jul 2017 15:18:23 +0200
Subject: [PATCH] regulator: pwm-regulator: fix example syntax

The "Continuous Voltage" example specifies a pwm-dutycycle-range.
However, an equal sign is missing between the property name and value.
Fix this to allow copy and paste from the documentation when writing an
own .dts file with a pwm-regulator.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/regulator/pwm-regulator.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index bf85aa9ad6a7..3d78d507e29f 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -71,7 +71,7 @@ Continuous Voltage With Enable GPIO Example:
 		 * Inverted PWM logic, and the duty cycle range is limited
 		 * to 30%-70%.
 		 */
-		pwm-dutycycle-range <700 300>; /* */
+		pwm-dutycycle-range = <700 300>; /* */
 	};
 
 Voltage Table Example:
-- 
2.13.2
