From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/3] ARM: berlin: use CPU_METHOD_OF_DECLARE for smp
Date: Thu,  3 Apr 2014 10:08:14 +0200
Message-ID: <1396512496-8030-2-git-send-email-antoine.tenart@free-electrons.com>
References: <1396512496-8030-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396512496-8030-1-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Get rid of the smp ops in the machine descriptor and select the cpu
enable method in the device tree.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-berlin/berlin.c  | 1 -
 arch/arm/mach-berlin/common.h  | 2 --
 arch/arm/mach-berlin/platsmp.c | 3 ++-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-berlin/berlin.c b/arch/arm/mach-berlin/berli=
n.c
index 1bbca793174d..3cc3e706719e 100644
--- a/arch/arm/mach-berlin/berlin.c
+++ b/arch/arm/mach-berlin/berlin.c
@@ -38,5 +38,4 @@ static const char * const berlin_dt_compat[] =3D {
 DT_MACHINE_START(BERLIN_DT, "Marvell Berlin")
 	.dt_compat	=3D berlin_dt_compat,
 	.init_machine	=3D berlin_init_machine,
-	.smp		=3D smp_ops(berlin_smp_ops),
 MACHINE_END
diff --git a/arch/arm/mach-berlin/common.h b/arch/arm/mach-berlin/commo=
n.h
index 57c97669af0a..8d585e2481f9 100644
--- a/arch/arm/mach-berlin/common.h
+++ b/arch/arm/mach-berlin/common.h
@@ -13,6 +13,4 @@
=20
 extern void berlin_secondary_startup(void);
=20
-extern struct smp_operations berlin_smp_ops;
-
 #endif
diff --git a/arch/arm/mach-berlin/platsmp.c b/arch/arm/mach-berlin/plat=
smp.c
index 5c83941b0918..86fe697577fd 100644
--- a/arch/arm/mach-berlin/platsmp.c
+++ b/arch/arm/mach-berlin/platsmp.c
@@ -132,8 +132,9 @@ static void __init berlin_smp_prepare_cpus(unsigned=
 int max_cpus)
 	iounmap(gpr_base);
 }
=20
-struct smp_operations berlin_smp_ops __initdata =3D {
+static struct smp_operations berlin_smp_ops __initdata =3D {
 	.smp_prepare_cpus	=3D berlin_smp_prepare_cpus,
 	.smp_secondary_init	=3D berlin_secondary_init,
 	.smp_boot_secondary	=3D berlin_boot_secondary,
 };
+CPU_METHOD_OF_DECLARE(berlin_smp, "marvell,88de31-smp", &berlin_smp_op=
s);
--=20
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
