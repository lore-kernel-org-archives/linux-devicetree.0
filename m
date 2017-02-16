From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 2/3] ARM: shmobile: r7s72100: Enable L2 cache
Date: Thu, 16 Feb 2017 10:37:25 -0500
Message-ID: <20170216153726.22919-3-chris.brandt@renesas.com>
References: <20170216153726.22919-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170216153726.22919-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Brad Mouring <brad.mouring-acOepvfBmUk@public.gmane.org>, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Even though L2C is specified in the DT, you still need to add the aux
settings in the machine_desc.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v2:
* removed dummy l2c_write_sec function
---
 arch/arm/mach-shmobile/setup-r7s72100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-shmobile/setup-r7s72100.c b/arch/arm/mach-shmobile/setup-r7s72100.c
index d46639f..319ca95 100644
--- a/arch/arm/mach-shmobile/setup-r7s72100.c
+++ b/arch/arm/mach-shmobile/setup-r7s72100.c
@@ -26,6 +26,8 @@ static const char *const r7s72100_boards_compat_dt[] __initconst = {
 };
 
 DT_MACHINE_START(R7S72100_DT, "Generic R7S72100 (Flattened Device Tree)")
+	.l2c_aux_val    = 0,
+	.l2c_aux_mask   = ~0,
 	.init_early	= shmobile_init_delay,
 	.init_late	= shmobile_init_late,
 	.dt_compat	= r7s72100_boards_compat_dt,
-- 
2.10.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
