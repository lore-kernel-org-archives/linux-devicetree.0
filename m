From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: DT: Add properties for asymmetric settling times" to the regulator tree
Date: Wed, 17 May 2017 10:53:48 +0100
Message-ID: <E1dAveO-0007AE-O9@debutante>
References: <20170501183715.35375-1-mka@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170501183715.35375-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: DT: Add properties for asymmetric settling times

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

>From 543853de356b8ce95d6d99757501d9d5c916ca09 Mon Sep 17 00:00:00 2001
From: Matthias Kaehlcke <mka@chromium.org>
Date: Tue, 16 May 2017 11:43:42 -0700
Subject: [PATCH] regulator: DT: Add properties for asymmetric settling times

Some regulators have different settling times for voltage increases and
decreases. Add DT properties to define separate settling times for up-
and downward voltage changes.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index d18edb075e1c..378f6dc8b8bd 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -24,6 +24,14 @@ Optional properties:
 - regulator-settling-time-us: Settling time, in microseconds, for voltage
   change if regulator have the constant time for any level voltage change.
   This is useful when regulator have exponential voltage change.
+- regulator-settling-time-up-us: Settling time, in microseconds, for voltage
+  increase if the regulator needs a constant time to settle after voltage
+  increases of any level. This is useful for regulators with exponential
+  voltage changes.
+- regulator-settling-time-down-us: Settling time, in microseconds, for voltage
+  decrease if the regulator needs a constant time to settle after voltage
+  decreases of any level. This is useful for regulators with exponential
+  voltage changes.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in memory,
-- 
2.11.0
