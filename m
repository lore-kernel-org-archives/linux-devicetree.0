From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] ARM: OF implies OF_FLATTREE
Date: Mon, 12 Oct 2015 16:06:58 +0200
Message-ID: <61301019.TKW9ocJ2jm@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On the ARM architecture, individual platforms select CONFIG_USE_OF if they
need it, but all device tree code is keyed off CONFIG_OF. When building
a platform without DT support and manually enabling CONFIG_OF, we now
get a number of build errors, e.g.

arch/arm/kernel/devtree.c: In function 'setup_machine_fdt':
arch/arm/kernel/devtree.c:215:19: error: implicit declaration of function 'early_init_dt_verify' [-Werror=implicit-function-declaration]

We could now try to separate the use case of booting from DT vs. the
case of using the dynamic implementation, but that seems more complicated
than it can gain us.

This simply changes the ARM Kconfig file to always enable OF_RESERVED_MEM
and OF_EARLY_FLATTREE when CONFIG_OF is enabled. These options add a little
extra code when we just want the dynamic OF implementation, but that seems
like a rather obscure case, and this version solves all CONFIG_OF related
randconfig regressions.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Fixes: 0166dc11be91 ("of: make CONFIG_OF user selectable")

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ee104950b30c..da71de8bba4f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -75,6 +75,8 @@ config ARM
 	select IRQ_FORCED_THREADING
 	select MODULES_USE_ELF_REL
 	select NO_BOOTMEM
+	select OF_EARLY_FLATTREE if OF
+	select OF_RESERVED_MEM if OF
 	select OLD_SIGACTION
 	select OLD_SIGSUSPEND3
 	select PERF_USE_VMALLOC
@@ -1695,8 +1697,6 @@ config USE_OF
 	bool "Flattened Device Tree support"
 	select IRQ_DOMAIN
 	select OF
-	select OF_EARLY_FLATTREE
-	select OF_RESERVED_MEM
 	help
 	  Include support for flattened device tree machine descriptions.
 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
