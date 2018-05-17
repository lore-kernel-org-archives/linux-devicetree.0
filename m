From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: bindings: Add properties for coupled regulators" to the regulator tree
Date: Thu, 17 May 2018 17:41:31 +0100 (BST)
Message-ID: <20180517164131.5026444007E@finisterre.ee.mobilebroadband>
References: <1520598128-11768-3-git-send-email-m.purski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520598128-11768-3-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.orgMark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: bindings: Add properties for coupled regulators

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

>From f98618b34542706eddc3b66abc271f1c8d8c4a05 Mon Sep 17 00:00:00 2001
From: Maciej Purski <m.purski@samsung.com>
Date: Mon, 23 Apr 2018 16:33:38 +0200
Subject: [PATCH] regulator: bindings: Add properties for coupled regulators

Some regulators require keeping their voltage spread below defined
max_spread.

Add properties to provide information on regulators' coupling.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index c627aa08f0da..a7cd36877bfe 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -73,6 +73,11 @@ Optional properties:
 	0: Disable active discharge.
 	1: Enable active discharge.
 	Absence of this property will leave configuration to default.
+- regulator-coupled-with: Regulators with which the regulator
+  is coupled. The linkage is 2-way - all coupled regulators should be linked
+  with each other. A regulator should not be coupled with its supplier.
+- regulator-coupled-max-spread: Max spread between voltages of coupled regulators
+  in microvolts.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
-- 
2.17.0
