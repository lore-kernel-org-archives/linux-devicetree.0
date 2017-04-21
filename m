From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: anatop: make regulator name property required" to the regulator tree
Date: Fri, 21 Apr 2017 18:28:50 +0100
Message-ID: <E1d1cMU-00024R-Az@debutante>
References: <1492180234-2496-1-git-send-email-aisheng.dong@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1492180234-2496-1-git-send-email-aisheng.dong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: anatop: make regulator name property required

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

>From 0e69c2eceb7c71327086c6f48db42a0ba2378cbb Mon Sep 17 00:00:00 2001
From: Dong Aisheng <aisheng.dong@nxp.com>
Date: Fri, 21 Apr 2017 10:53:52 +0800
Subject: [PATCH] regulator: anatop: make regulator name property required

We actually can't allow the missing of the regualor name, thus update
the binding doc to make regulator-name property to be required.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/regulator/anatop-regulator.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
index 37c4ea076f88..312060658a53 100644
--- a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
@@ -2,6 +2,7 @@ Anatop Voltage regulators
 
 Required properties:
 - compatible: Must be "fsl,anatop-regulator"
+- regulator-name: A string used as a descriptive name for regulator outputs
 - anatop-reg-offset: Anatop MFD register offset
 - anatop-vol-bit-shift: Bit shift for the register
 - anatop-vol-bit-width: Number of bits used in the register
-- 
2.11.0
