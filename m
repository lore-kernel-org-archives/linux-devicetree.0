From: Louis Yu <louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] ARM: mediatek: add mt2701 smp bringup code
Date: Thu, 7 Jan 2016 20:09:43 +0800
Message-ID: <1452168584-25394-2-git-send-email-louis.yu@mediatek.com>
References: <1452168584-25394-1-git-send-email-louis.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452168584-25394-1-git-send-email-louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for booting secondary CPUs on mt2701.

Signed-off-by: Louis Yu <louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/mach-mediatek/platsmp.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 8141f3f..44a5174 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -47,6 +47,7 @@ static const struct mtk_smp_boot_info mtk_mt6589_boot = {
 static const struct of_device_id mtk_tz_smp_boot_infos[] __initconst = {
 	{ .compatible   = "mediatek,mt8135", .data = &mtk_mt8135_tz_boot },
 	{ .compatible   = "mediatek,mt8127", .data = &mtk_mt8135_tz_boot },
+	{ .compatible   = "mediatek,mt2701", .data = &mtk_mt8135_tz_boot },
 };
 
 static const struct of_device_id mtk_smp_boot_infos[] __initconst = {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
