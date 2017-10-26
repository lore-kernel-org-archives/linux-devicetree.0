From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: pfuze100: Remove leading zero from '@08' notation" to the regulator tree
Date: Thu, 26 Oct 2017 15:17:22 +0100 (BST)
Message-ID: <20171026141722.C3D1844005B@finisterre.ee.mobilebroadband>
References: <1508957833-22231-1-git-send-email-marco.franchi@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508957833-22231-1-git-send-email-marco.franchi@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Franchi <marco.franchi@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.combroonie@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, marcofrk@gmail.comlinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   ASoC: pfuze100: Remove leading zero from '@08' notation

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

>From 26284ca918e4e271bae4e96129fc3791b9bf0983 Mon Sep 17 00:00:00 2001
From: Marco Franchi <marco.franchi@nxp.com>
Date: Wed, 25 Oct 2017 16:57:13 -0200
Subject: [PATCH] ASoC: pfuze100: Remove leading zero from '@08' notation

Improve the binding example by removing the leading 0 from '@08' notation,
which fixes the following build warnings:

Warning (unit_address_format): Node /pfuze100@08 unit name should not have leading 0s
Warning (unit_address_format): Node /pfuze200@08 unit name should not have leading 0s
Warning (unit_address_format): Node /pfuze3000@08 unit name should not have leading 0s

Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/regulator/pfuze100.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index 444c47831a40..c6dd3f5e485b 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -21,7 +21,7 @@ Each regulator is defined using the standard binding for regulators.
 
 Example 1: PFUZE100
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
@@ -122,7 +122,7 @@ Example 1: PFUZE100
 
 Example 2: PFUZE200
 
-	pmic: pfuze200@08 {
+	pmic: pfuze200@8 {
 		compatible = "fsl,pfuze200";
 		reg = <0x08>;
 
@@ -216,7 +216,7 @@ Example 2: PFUZE200
 
 Example 3: PFUZE3000
 
-	pmic: pfuze3000@08 {
+	pmic: pfuze3000@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
-- 
2.14.1
