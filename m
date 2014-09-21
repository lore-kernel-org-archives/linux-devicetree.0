From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/6] ARM: sunxi: Introduce Allwinner A80 support
Date: Sun, 21 Sep 2014 22:58:08 +0800
Message-ID: <1411311493-24344-2-git-send-email-wens@csie.org>
References: <1411311493-24344-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBFGP7OQAKGQEJRIZHMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1411311493-24344-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, yhf-HcjymKqD97rQT0dZR+AlfA@public.gmane.org, ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Allwinner A80 is a new Cortex octo-core A7/A15 big.LITTLE SoC.
While it's processor cores and interconnecting bus are new, it
re-uses many peripherals found in earlier Allwinner SoCs.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/mach-sunxi/Kconfig | 5 +++++
 arch/arm/mach-sunxi/sunxi.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 1aaa1e1..72f222b 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -42,4 +42,9 @@ config MACH_SUN8I
 	select MFD_SUN6I_PRCM
 	select RESET_CONTROLLER
 
+config MACH_SUN9I
+	bool "Allwinner A80 (sun9i) SoCs support"
+	default ARCH_SUNXI
+	select ARM_GIC
+
 endif
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index 42d4753..4bd2117 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -139,3 +139,12 @@ static const char * const sun8i_board_dt_compat[] = {
 DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i (A23) Family")
 	.dt_compat	= sun8i_board_dt_compat,
 MACHINE_END
+
+static const char * const sun9i_board_dt_compat[] = {
+	"allwinner,sun9i-a80",
+	NULL,
+};
+
+DT_MACHINE_START(SUN9I_DT, "Allwinner sun9i (A80) Family")
+	.dt_compat	= sun9i_board_dt_compat,
+MACHINE_END
-- 
2.1.0
