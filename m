From: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: mach-moxart: add MOXA ART UART debug files
Date: Mon, 17 Jun 2013 13:08:03 +0200
Message-ID: <1371467283-6981-3-git-send-email-jonas.jensen@gmail.com>
References: <1371467283-6981-1-git-send-email-jonas.jensen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371467283-6981-1-git-send-email-jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add MOXA ART kernel low-level debugging port support.

Signed-off-by: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/Kconfig.debug          |    8 ++++++++
 arch/arm/include/debug/moxart.S |   16 ++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/include/debug/moxart.S

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index e6a6ab1..d1ed6e5 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -447,6 +447,13 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on Allwinner A1X based platforms on the UART1.
 
+    config DEBUG_MOXART_UART0
+        bool "Kernel low-level debugging messages via MOXART UART0"
+        depends on ARCH_MOXART
+        help
+          Say Y here if you want kernel low-level debugging support
+          on MOXART based platforms on the UART0.
+
 	config DEBUG_TEGRA_UART
 		depends on ARCH_TEGRA
 		bool "Use Tegra UART for low-level debug"
@@ -668,6 +675,7 @@ config DEBUG_LL_INCLUDE
 	default "debug/sirf.S" if DEBUG_SIRFPRIMA2_UART1 || DEBUG_SIRFMARCO_UART1
 	default "debug/socfpga.S" if DEBUG_SOCFPGA_UART
 	default "debug/sunxi.S" if DEBUG_SUNXI_UART0 || DEBUG_SUNXI_UART1
+	default "debug/moxart.S" if DEBUG_MOXART_UART0
 	default "debug/tegra.S" if DEBUG_TEGRA_UART
 	default "debug/ux500.S" if DEBUG_UX500_UART
 	default "debug/vexpress.S" if DEBUG_VEXPRESS_UART0_DETECT || \
diff --git a/arch/arm/include/debug/moxart.S b/arch/arm/include/debug/moxart.S
new file mode 100644
index 0000000..7ac7c76
--- /dev/null
+++ b/arch/arm/include/debug/moxart.S
@@ -0,0 +1,16 @@
+/* Copyright (C) 2013 Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version. */
+
+#define MOXART_UART_DEBUG_PHYS_BASE		0x98200000
+#define MOXART_UART_DEBUG_VIRT_BASE		0xf9820000
+
+.macro	addruart, rp, rv, tmp
+	ldr	\rp, =MOXART_UART_DEBUG_PHYS_BASE
+	ldr \rv, =MOXART_UART_DEBUG_VIRT_BASE
+.endm
+
+#define UART_SHIFT	2
+#include <asm/hardware/debug-8250.S>
-- 
1.7.2.5
