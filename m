From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: add fixes with MT6397 dt-bindings shouldn't reference driver" to the regulator tree
Date: Tue, 15 Aug 2017 18:15:39 +0100
Message-ID: <E1dhfRL-0003ju-Bv@debutante>
References: <fa0e11110ad8dcae5a833593f0266af0dc44910e.1502790160.git.sean.wang@mediatek.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa0e11110ad8dcae5a833593f0266af0dc44910e.1502790160.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.combroonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: add fixes with MT6397 dt-bindings shouldn't reference driver

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

>From 723310d46e6d40ced439ac52da18dd4d7b72c105 Mon Sep 17 00:00:00 2001
From: Sean Wang <sean.wang@mediatek.com>
Date: Tue, 15 Aug 2017 17:46:28 +0800
Subject: [PATCH] regulator: add fixes with MT6397 dt-bindings shouldn't
 reference driver

DT bindings shouldn't reference drivers and they should be OS-agnostic.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/regulator/mt6397-regulator.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
index a42b1d6e9863..01141fb00875 100644
--- a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
@@ -1,4 +1,4 @@
-Mediatek MT6397 Regulator Driver
+Mediatek MT6397 Regulator
 
 Required properties:
 - compatible: "mediatek,mt6397-regulator"
-- 
2.13.3
