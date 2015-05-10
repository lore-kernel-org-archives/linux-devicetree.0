From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/6] ARM: sunxi: Add Machine support for A33
Date: Sun, 10 May 2015 12:16:18 +0530
Message-ID: <1431240383-12763-2-git-send-email-vishnupatekar0510@gmail.com>
References: <1431240383-12763-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBB2X5XOVAKGQE2XY5EBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1431240383-12763-1-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinnner A33 quad core cortex-a7 based SOC.
It is similar to A23.

Renamed cpu method to "allwinner,sun8i" for common sun8i smp.
smp code is generic for A23, A33 and hopefully H3.

Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
 arch/arm/mach-sunxi/Kconfig                     | 2 +-
 arch/arm/mach-sunxi/platsmp.c                   | 2 +-
 arch/arm/mach-sunxi/sunxi.c                     | 4 ++--
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
index 42941fd..e32f082 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi.txt
@@ -9,4 +9,5 @@ using one of the following compatible strings:
   allwinner,sun6i-a31
   allwinner,sun7i-a20
   allwinner,sun8i-a23
+  allwinner,sun8i-a33
   allwinner,sun9i-a80
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 81502b9..38bedd8 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -35,7 +35,7 @@ config MACH_SUN7I
 	select SUN5I_HSTIMER
 
 config MACH_SUN8I
-	bool "Allwinner A23 (sun8i) SoCs support"
+	bool "Allwinner (sun8i) SoCs support"
 	default ARCH_SUNXI
 	select ARM_GIC
 	select MFD_SUN6I_PRCM
diff --git a/arch/arm/mach-sunxi/platsmp.c b/arch/arm/mach-sunxi/platsmp.c
index e8483ec..c56b501 100644
--- a/arch/arm/mach-sunxi/platsmp.c
+++ b/arch/arm/mach-sunxi/platsmp.c
@@ -189,4 +189,4 @@ struct smp_operations sun8i_smp_ops __initdata = {
 	.smp_prepare_cpus	= sun8i_smp_prepare_cpus,
 	.smp_boot_secondary	= sun8i_smp_boot_secondary,
 };
-CPU_METHOD_OF_DECLARE(sun8i_a23_smp, "allwinner,sun8i-a23", &sun8i_smp_ops);
+CPU_METHOD_OF_DECLARE(sun8i_smp, "allwinner,sun8i", &sun8i_smp_ops);
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index 1bc811a..8937d0d 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -66,11 +66,11 @@ DT_MACHINE_START(SUN7I_DT, "Allwinner sun7i (A20) Family")
 MACHINE_END
 
 static const char * const sun8i_board_dt_compat[] = {
-	"allwinner,sun8i-a23",
+	"allwinner,sun8i",
 	NULL,
 };
 
-DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i (A23) Family")
+DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i Family")
 	.dt_compat	= sun8i_board_dt_compat,
 	.init_late	= sunxi_dt_cpufreq_init,
 MACHINE_END
-- 
1.9.1
