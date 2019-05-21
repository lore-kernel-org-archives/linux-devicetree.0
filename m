From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: arizona: Update device tree binding to support Madera CODECs" to the regulator tree
Date: Tue, 21 May 2019 21:33:00 +0100 (BST)
Message-ID: <20190521203300.1463A1126D17@debutante.sirena.org.uk>
References: <20190521100439.27383-1-ckeepax@opensource.cirrus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521100439.27383-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.orgMark Brown <broonie@kernel.org>, mark.rutland@arm.com, patches@opensource.cirrus.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: arizona: Update device tree binding to support Madera CODECs

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

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

>From 46f4050a6587ea3e59e6f47f06513c00689b9d40 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Tue, 21 May 2019 11:04:37 +0100
Subject: [PATCH] regulator: arizona: Update device tree binding to support
 Madera CODECs

The Arizona regulator drivers are now also used by the Cirrus Logic
Madera audio CODECs, update the binding document to link to the primary
binding document for these as well as the existing Arizona document.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/regulator/arizona-regulator.txt        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/arizona-regulator.txt b/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
index 443564d7784f..69bf41949b01 100644
--- a/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
@@ -5,7 +5,8 @@ of analogue I/O.
 
 This document lists regulator specific bindings, see the primary binding
 document:
-  ../mfd/arizona.txt
+  For Wolfson Microelectronic Arizona codecs: ../mfd/arizona.txt
+  For Cirrus Logic Madera codecs: ../mfd/madera.txt
 
 Optional properties:
   - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
-- 
2.20.1
