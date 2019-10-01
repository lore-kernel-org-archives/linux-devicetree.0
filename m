From: Mark Brown <broonie@kernel.org>
Subject: Applied "fixed-regulator: dt-bindings: Fixed building error for compatible property" to the regulator tree
Date: Tue,  1 Oct 2019 12:40:59 +0100 (BST)
Message-ID: <20191001114059.6B0572742A30@ypsilon.sirena.org.uk>
References: <1568875145-2864-1-git-send-email-pragnesh.patel@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568875145-2864-1-git-send-email-pragnesh.patel@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pragnesh Patel <pragnesh.patel@sifive.com>
Cc: broonie@kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.orgMark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

The patch

   fixed-regulator: dt-bindings: Fixed building error for compatible property

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

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

>From 04a99ce605a780c275e2e9d2547d43fbba3f4d24 Mon Sep 17 00:00:00 2001
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Thu, 19 Sep 2019 12:09:04 +0530
Subject: [PATCH] fixed-regulator: dt-bindings: Fixed building error for
 compatible property

Compatible property is not of type 'string', so remove const:
from it.

Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Acked-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/1568875145-2864-1-git-send-email-pragnesh.patel@sifive.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/regulator/fixed-regulator.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
index a78150c47aa2..f32416968197 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -30,8 +30,8 @@ if:
 properties:
   compatible:
     enum:
-      - const: regulator-fixed
-      - const: regulator-fixed-clock
+      - regulator-fixed
+      - regulator-fixed-clock
 
   regulator-name: true
 
-- 
2.20.1
