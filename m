From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 02/12] ARM: mvebu: Add UART1 as DEBUG_LL possible target
Date: Thu,  8 Jan 2015 18:38:04 +0100
Message-ID: <1420738694-6163-3-git-send-email-gregory.clement@free-electrons.com>
References: <1420738694-6163-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420738694-6163-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Some mvebu boards have the UART1 more easily accessible than the other UARTs
found on the system.

Add a debug_ll option for this case.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/Kconfig.debug | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index eb3991cf63ab..7bd1bbccc43c 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -489,6 +489,21 @@ choice
 		  when u-boot hands over to the kernel, the system
 		  silently crashes, with no serial output at all.
 
+	config DEBUG_MVEBU_UART1_ALTERNATE
+		bool "Kernel low-level debugging messages via MVEBU UART1 (new bootloaders)"
+		depends on ARCH_MVEBU
+		select DEBUG_UART_8250
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  on MVEBU based platforms on UART1.
+
+		  This option should be used with the new bootloaders
+		  that remap the internal registers at 0xf1000000.
+
+		  If the wrong DEBUG_MVEBU_UART* option is selected,
+		  when u-boot hands over to the kernel, the system
+		  silently crashes, with no serial output at all.
+
 	config DEBUG_VF_UART
 		bool "Vybrid UART"
 		depends on SOC_VF610
@@ -1297,6 +1312,7 @@ config DEBUG_UART_PHYS
 	default 0xf0000be0 if ARCH_EBSA110
 	default 0xf040ab00 if DEBUG_BRCMSTB_UART
 	default 0xf1012000 if DEBUG_MVEBU_UART0_ALTERNATE
+	default 0xf1012100 if DEBUG_MVEBU_UART1_ALTERNATE
 	default 0xf1012000 if ARCH_DOVE || ARCH_MV78XX0 || \
 				ARCH_ORION5X
 	default 0xf7fc9000 if DEBUG_BERLIN_UART
@@ -1378,6 +1394,7 @@ config DEBUG_UART_VIRT
 	default 0xfeb31000 if DEBUG_KEYSTONE_UART1
 	default 0xfec02000 if DEBUG_SOCFPGA_UART
 	default 0xfec12000 if DEBUG_MVEBU_UART0 || DEBUG_MVEBU_UART0_ALTERNATE
+	default 0xfec12100 if DEBUG_MVEBU_UART1_ALTERNATE
 	default 0xfec20000 if DEBUG_DAVINCI_DMx_UART0
 	default 0xfec90000 if DEBUG_RK32_UART2
 	default 0xfed0c000 if DEBUG_DAVINCI_DA8XX_UART1
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
