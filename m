From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/10] ARM: sunxi: Introduce Allwinner H3 support
Date: Fri, 15 May 2015 18:38:55 +0200
Message-ID: <1431707940-19372-6-git-send-email-jenskuske@gmail.com>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBNGC3CVAKGQENJLZD7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1431707940-19372-1-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Allwinner H3 is a quad-core Cortex-A7-based SoC. It is very similar
to other sun8i family SoCs like the A23.

Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
 arch/arm/mach-sunxi/Kconfig                     | 2 +-
 arch/arm/mach-sunxi/sunxi.c                     | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
index 42941fd..3cb4b94 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi.txt
@@ -9,4 +9,5 @@ using one of the following compatible strings:
   allwinner,sun6i-a31
   allwinner,sun7i-a20
   allwinner,sun8i-a23
+  allwinner,sun8i-h3
   allwinner,sun9i-a80
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 81502b9..4efe2d4 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -35,7 +35,7 @@ config MACH_SUN7I
 	select SUN5I_HSTIMER
 
 config MACH_SUN8I
-	bool "Allwinner A23 (sun8i) SoCs support"
+	bool "Allwinner sun8i Family SoCs support"
 	default ARCH_SUNXI
 	select ARM_GIC
 	select MFD_SUN6I_PRCM
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index 1bc811a..8270902 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -67,10 +67,12 @@ MACHINE_END
 
 static const char * const sun8i_board_dt_compat[] = {
 	"allwinner,sun8i-a23",
+	"allwinner,sun8i-h3",
 	NULL,
 };
 
-DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i (A23) Family")
+DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i Family")
+	.init_time	= sun6i_timer_init,
 	.dt_compat	= sun8i_board_dt_compat,
 	.init_late	= sunxi_dt_cpufreq_init,
 MACHINE_END
-- 
2.4.0
