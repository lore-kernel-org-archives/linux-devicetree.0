Return-Path: <SRS0=x/N+=MJ=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "dt-bindings: spi: rspi: Add R7S9210 support" to the spi tree
In-Reply-To: <20180927143519.104631-1-chris.brandt@renesas.com>
Message-Id: <20180927224026.F2F12440078@finisterre.ee.mobilebroadband>
Date: Thu, 27 Sep 2018 23:40:26 +0100 (BST)
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>linux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   dt-bindings: spi: rspi: Add R7S9210 support

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

>From 73569a50959e4ec63bcf05839a030e799a350de1 Mon Sep 17 00:00:00 2001
From: Chris Brandt <chris.brandt@renesas.com>
Date: Thu, 27 Sep 2018 09:35:19 -0500
Subject: [PATCH] dt-bindings: spi: rspi: Add R7S9210 support

Add support for RZ/A2

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/spi/spi-rspi.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-rspi.txt b/Documentation/devicetree/bindings/spi/spi-rspi.txt
index 96fd58548f69..dd5c36a0b9ac 100644
--- a/Documentation/devicetree/bindings/spi/spi-rspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-rspi.txt
@@ -3,7 +3,7 @@ Device tree configuration for Renesas RSPI/QSPI driver
 Required properties:
 - compatible       : For Renesas Serial Peripheral Interface on legacy SH:
 		     "renesas,rspi-<soctype>", "renesas,rspi" as fallback.
-		     For Renesas Serial Peripheral Interface on RZ/A1H:
+		     For Renesas Serial Peripheral Interface on RZ/A:
 		     "renesas,rspi-<soctype>", "renesas,rspi-rz" as fallback.
 		     For Quad Serial Peripheral Interface on R-Car Gen2 and
 		     RZ/G1 devices:
@@ -11,6 +11,7 @@ Required properties:
 		     Examples with soctypes are:
 		        - "renesas,rspi-sh7757" (SH)
 			- "renesas,rspi-r7s72100" (RZ/A1H)
+			- "renesas,rspi-r7s9210" (RZ/A2)
 			- "renesas,qspi-r8a7743" (RZ/G1M)
 			- "renesas,qspi-r8a7745" (RZ/G1E)
 			- "renesas,qspi-r8a7790" (R-Car H2)
-- 
2.19.0
