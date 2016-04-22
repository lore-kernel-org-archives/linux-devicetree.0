From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: max77620: Add details of device specific ramp rate setting" to the regulator tree
Date: Fri, 22 Apr 2016 16:27:36 +0100
Message-ID: <E1atczY-0007mI-PJ@debutante>
References: <1461328781-22768-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461328781-22768-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: max77620: Add details of device specific ramp rate setting

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

>From e7fc278ceb5725070e4e3ecfc2f259ab2101c30e Mon Sep 17 00:00:00 2001
From: Laxman Dewangan <ldewangan@nvidia.com>
Date: Fri, 22 Apr 2016 18:09:40 +0530
Subject: [PATCH] regulator: max77620: Add details of device specific ramp rate
 setting

It is observed that the ramp rate measured on platform is not same as
advertised ramp rate due to platform design variation. On this case,
measured ramp rate is provided with property regulator-ramp-rate.

For such cases, add DT property for device specific configurations.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/regulator-max77620.txt      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
index b3c8ca672024..1c4bfe786736 100644
--- a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
@@ -94,6 +94,28 @@ Following are additional properties:
 					This is applicable if suspend state
 					FPS source is selected as FPS0, FPS1 or
 					FPS2.
+- maxim,ramp-rate-setting:		integer, ramp rate(uV/us) setting to be
+					configured to the device.
+					The platform may have different ramp
+					rate than advertised ramp rate if it has
+					design variation from Maxim's
+					recommended. On this case, platform
+					specific ramp rate is used for ramp time
+					calculation and this property is used
+					for device register configurations.
+					The measured ramp rate of platform is
+					provided by the regulator-ramp-delay
+					as described in <devicetree/bindings/
+					regulator/regulator.txt>.
+					Maxim Max77620 supports following ramp
+					delay:
+					  SD: 13.75mV/us, 27.5mV/us, 55mV/us
+					  LDOs: 5mV/us, 100mV/us
+
+Note: If the measured ramp delay is same as advertised ramp delay then it is not
+required to provide the ramp delay with property "maxim,ramp-rate-setting". The
+ramp rate can be provided by the regulator-ramp-delay which will be used for
+ramp time calculation for voltage change as well as for device configuration.
 
 Example:
 --------
-- 
2.8.0.rc3
