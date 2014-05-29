From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/11] ARM: versatile: remove init_irq hook for DT boot
Date: Thu, 29 May 2014 17:40:15 -0500
Message-ID: <1401403221-27523-6-git-send-email-robherring2@gmail.com>
References: <1401403221-27523-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401403221-27523-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Now that versatile's irqchips are initialized from DT, the init_irq hook
can be removed.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
v2:
- no change
 arch/arm/mach-versatile/versatile_dt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-versatile/versatile_dt.c b/arch/arm/mach-versatile/versatile_dt.c
index 3621b00..9f9bc61 100644
--- a/arch/arm/mach-versatile/versatile_dt.c
+++ b/arch/arm/mach-versatile/versatile_dt.c
@@ -44,7 +44,6 @@ static const char *versatile_dt_match[] __initconst = {
 DT_MACHINE_START(VERSATILE_PB, "ARM-Versatile (Device Tree Support)")
 	.map_io		= versatile_map_io,
 	.init_early	= versatile_init_early,
-	.init_irq	= versatile_init_irq,
 	.init_machine	= versatile_dt_init,
 	.dt_compat	= versatile_dt_match,
 	.restart	= versatile_restart,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
