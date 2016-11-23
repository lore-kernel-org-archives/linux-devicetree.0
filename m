From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: max77620: add documentation for MPOK property" to the regulator tree
Date: Wed, 23 Nov 2016 16:31:30 +0000
Message-ID: <E1c9aSI-0006aD-Hf@debutante>
References: <1479297161-7705-2-git-send-email-vreddytalla@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479297161-7705-2-git-send-email-vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.orgbroonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, svelpula-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: max77620: add documentation for MPOK property

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

>From 983779235a4d08f94e8cda073200423e0ff01d2e Mon Sep 17 00:00:00 2001
From: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Thu, 17 Nov 2016 23:24:36 +0530
Subject: [PATCH] regulator: max77620: add documentation for MPOK property

Adding documentation for maxim,power-ok-control dts property

Signed-off-by: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/max77620.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
index 2ad44f7e4880..9c16d51cc15b 100644
--- a/Documentation/devicetree/bindings/mfd/max77620.txt
+++ b/Documentation/devicetree/bindings/mfd/max77620.txt
@@ -106,6 +106,18 @@ Here supported time periods by device in microseconds are as follows:
 MAX77620 supports 40, 80, 160, 320, 640, 1280, 2560 and 5120 microseconds.
 MAX20024 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
 
+-maxim,power-ok-control: configure map power ok bit
+			1: Enables POK(Power OK) to control nRST_IO and GPIO1
+			POK function.
+			0: Disables POK control.
+			if property missing, do not configure MPOK bit.
+			If POK mapping is enabled for GPIO1/nRST_IO then,
+			GPIO1/nRST_IO pins are HIGH only if all rails
+			that have POK control enabled are HIGH.
+			If any of the rails goes down(which are enabled for POK
+			control) then, GPIO1/nRST_IO goes LOW.
+			this property is valid for max20024 only.
+
 For DT binding details of different sub modules like GPIO, pincontrol,
 regulator, power, please refer respective device-tree binding document
 under their respective sub-system directories.
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
