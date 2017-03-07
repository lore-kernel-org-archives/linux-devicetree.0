From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: lm363x: Use generic DT property name for external control pins" to the regulator tree
Date: Tue, 07 Mar 2017 15:21:57 +0100
Message-ID: <E1clFzx-0006k7-RG@finisterre>
References: <20170228075041.7568-2-milo.kim@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170228075041.7568-2-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: lm363x: Use generic DT property name for external control pins

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

>From 9503b5085fd0e7cfc6e32b1a473a997303d7e26a Mon Sep 17 00:00:00 2001
From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Date: Tue, 28 Feb 2017 16:50:41 +0900
Subject: [PATCH] regulator: lm363x: Use generic DT property name for external
 control pins

Vpos and Vneg LDOs can be enabled or disabled by external GPIOs.
Use general DT property 'enable-gpios' for this usage.
Two enable pins are differentiable by selecting the index number.

Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/lm363x-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
index f53e63301a20..ce5f7d9ad475 100644
--- a/drivers/regulator/lm363x-regulator.c
+++ b/drivers/regulator/lm363x-regulator.c
@@ -227,9 +227,9 @@ static int lm363x_regulator_of_get_enable_gpio(struct device_node *np, int id)
 	 */
 	switch (id) {
 	case LM3632_LDO_POS:
-		return of_get_named_gpio(np, "ti,lcm-en1-gpio", 0);
+		return of_get_named_gpio(np, "enable-gpios", 0);
 	case LM3632_LDO_NEG:
-		return of_get_named_gpio(np, "ti,lcm-en2-gpio", 0);
+		return of_get_named_gpio(np, "enable-gpios", 1);
 	default:
 		return -EINVAL;
 	}
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
