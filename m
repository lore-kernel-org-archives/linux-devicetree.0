From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: max8973: add DT binding details for junction warn temp" to the regulator tree
Date: Wed, 13 Apr 2016 17:21:43 +0100
Message-ID: <E1aqNXz-00083y-M2@debutante>
References: <1457087274-15785-1-git-send-email-ldewangan@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457087274-15785-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: max8973: add DT binding details for junction warn temp

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

>From 19dd159ce8086293b70bd8e1aeebe06aff8d7df8 Mon Sep 17 00:00:00 2001
From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Wed, 13 Apr 2016 15:29:44 +0530
Subject: [PATCH] regulator: max8973: add DT binding details for junction warn
 temp

The driver MAX8973 supports the driver for Maxim MAX77621.
MAX77621 supports the junction temp warning at 120 degC and
140 degC which is configurable. It generates alert signal when
junction temperature crosses these threshold.

Add DT properties and its binding details to make this
configuration from DT.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/max8973-regulator.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
index f80ea2fe27e6..c2c68fcc1b41 100644
--- a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
@@ -32,6 +32,13 @@ Optional properties:
 
 Enhanced transient response (ETR) will affect the configuration of CKADV.
 
+-junction-warn-millicelsius: u32, junction warning temperature threshold
+		in millicelsius. If die temperature crosses this level then
+		device generates the warning interrupts.
+
+Please note that thermal functionality is only supported on MAX77621. The
+supported threshold warning temperature for MAX77621 are 120 degC and 140 degC.
+
 Example:
 
 	max8973@1b {
-- 
2.8.0.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
