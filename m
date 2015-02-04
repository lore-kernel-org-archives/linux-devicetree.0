From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 4/5] ARM: shmobile: r8a7740: Remove mapping of L2 cache controller registers
Date: Wed,  4 Feb 2015 15:15:14 +0100
Message-ID: <1423059315-28519-5-git-send-email-geert+renesas@glider.be>
References: <1423059315-28519-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423059315-28519-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now all r8a7740-based platforms have been migrated to the generic l2c OF
initialization, it's no longer needed to map the L2 cache controller
registers from .map_io().

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v2:
  - No changes.
---
 arch/arm/mach-shmobile/setup-r8a7740.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7740.c b/arch/arm/mach-shmobile/setup-r8a7740.c
index 3ebd4dfc8e853a9b..ab005e2a0cde6892 100644
--- a/arch/arm/mach-shmobile/setup-r8a7740.c
+++ b/arch/arm/mach-shmobile/setup-r8a7740.c
@@ -51,18 +51,6 @@ static struct map_desc r8a7740_io_desc[] __initdata = {
 		.length		= 160 << 20,
 		.type		= MT_DEVICE_NONSHARED
 	},
-#ifdef CONFIG_CACHE_L2X0
-	/*
-	 * for l2x0_init()
-	 * 0xf0100000-0xf0101000 -> 0xf0002000-0xf0003000
-	 */
-	{
-		.virtual	= 0xf0002000,
-		.pfn		= __phys_to_pfn(0xf0100000),
-		.length		= PAGE_SIZE,
-		.type		= MT_DEVICE_NONSHARED
-	},
-#endif
 };
 
 void __init r8a7740_map_io(void)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
