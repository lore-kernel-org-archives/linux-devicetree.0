From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: hi6421: Describe consumed platform device" to the regulator tree
Date: Wed, 07 Jun 2017 20:32:09 +0100
Message-ID: <E1dIggb-0003ma-2K@debutante>
References: <20170602085117.27474-5-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170602085117.27474-5-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.combroonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hw.wangxiaoyin@hisilicon.com, Jeremy Linton <lintonrjeremy@gmail.com>linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: hi6421: Describe consumed platform device

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

>From a8ea49d7f589fac1994a3b0af59f25cb284f3eb6 Mon Sep 17 00:00:00 2001
From: Guodong Xu <guodong.xu@linaro.org>
Date: Wed, 7 Jun 2017 15:06:04 +0800
Subject: [PATCH] regulator: hi6421: Describe consumed platform device

The hi6421-regulator driver consumes a similarly named platform device.
Adding that to the module device table, allows modprobe to locate this
driver once the device is created.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/hi6421-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/hi6421-regulator.c b/drivers/regulator/hi6421-regulator.c
index 62c5f5445d44..259c3a865ac6 100644
--- a/drivers/regulator/hi6421-regulator.c
+++ b/drivers/regulator/hi6421-regulator.c
@@ -621,7 +621,14 @@ static int hi6421_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id hi6421_regulator_table[] = {
+	{ .name = "hi6421-regulator" },
+	{},
+};
+MODULE_DEVICE_TABLE(platform, hi6421_regulator_table);
+
 static struct platform_driver hi6421_regulator_driver = {
+	.id_table = hi6421_regulator_table,
 	.driver = {
 		.name	= "hi6421-regulator",
 	},
-- 
2.11.0
