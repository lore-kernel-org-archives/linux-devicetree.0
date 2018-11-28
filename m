From: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 01/17] ARM: Check ARCH_MULTI_V7 to
 differentiate ARMv5/v7 Allwinner SoCs
Date: Thu, 29 Nov 2018 01:33:11 +0300
Message-ID: <ec9d798e883d45d5dc0e01617e4bf217bc9a6be7.1543443475.git.mesihkilinc@gmail.com>
References: <cover.1543443475.git.mesihkilinc@gmail.com>
Reply-To: mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDI4VHO5SYLBBZVP7TPQKGQEZNRFEJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1543443475.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner also has some ARMv5 SoCs.

In order to add support for them, check ARM_MULTI_V7 before enabling
ARMv7 SoC's. Add help text for ARCH_SUNXI menuconfig.

Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-sunxi/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index d9c8ecf..185c573 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -9,9 +9,13 @@ menuconfig ARCH_SUNXI
 	select PM_OPP
 	select SUN4I_TIMER
 	select RESET_CONTROLLER
+	help
+	  Support for Allwinner ARM-based family of processors
 
 if ARCH_SUNXI
 
+if ARCH_MULTI_V7
+
 config MACH_SUN4I
 	bool "Allwinner A10 (sun4i) SoCs support"
 	default ARCH_SUNXI
@@ -56,3 +60,5 @@ config ARCH_SUNXI_MC_SMP
 	select ARM_CPU_SUSPEND
 
 endif
+
+endif
-- 
2.7.4
