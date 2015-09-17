From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 09/09] ARM: shmobile: Prioritize r8a7791 DT APMU support
Date: Thu, 17 Sep 2015 15:34:07 +0900
Message-ID: <20150917063407.26016.22959.sendpatchset@little-apple>
References: <20150917063240.26016.93772.sendpatchset@little-apple>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150917063240.26016.93772.sendpatchset@little-apple>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, keita.kobayashi.ym-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>

Adjust the r8a7791 SoC support code to not configure any non-DT SMP code
in case the DT-based enable-method has been installed already.

Signed-off-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
---

 Changes since V2:
 - None

 Changes since V1:
 - Broke out bits from former r8a7791-specific patch.

 arch/arm/mach-shmobile/setup-r8a7791.c |    1 +
 1 file changed, 1 insertion(+)

--- 0001/arch/arm/mach-shmobile/setup-r8a7791.c
+++ work/arch/arm/mach-shmobile/setup-r8a7791.c	2015-08-23 15:46:53.002366518 +0900
@@ -29,6 +29,7 @@ static const char *const r8a7791_boards_
 };
 
 DT_MACHINE_START(R8A7791_DT, "Generic R8A7791 (Flattened Device Tree)")
+	.smp_init	= shmobile_smp_init_fallback_ops,
 	.smp		= smp_ops(r8a7791_smp_ops),
 	.init_early	= shmobile_init_delay,
 	.init_time	= rcar_gen2_timer_init,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
