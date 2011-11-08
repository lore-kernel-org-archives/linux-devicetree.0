From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC 5/6] ARM: vexpress: Initial RS1 memory map support
Date: Tue,  8 Nov 2011 13:16:08 +0000
Message-ID: <1320758169-22668-6-git-send-email-pawel.moll@arm.com>
References: <1320758169-22668-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320758169-22668-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for RS1 memory map based Versatile Express
motherboard. As the RAM location has changed, the ZRE values and
PLAT_PHYS_OFFSET defaults are changed to the new address (all
future tiles will use RS1 map) and enforces AUTO_ZRELADD and
ARM_PATCH_PHYS_VIRT when legacy devices are being used.

Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/mach-vexpress/Kconfig                    |    5 +++
 arch/arm/mach-vexpress/Makefile.boot              |    6 ++--
 arch/arm/mach-vexpress/core.h                     |    1 +
 arch/arm/mach-vexpress/include/mach/debug-macro.S |   37 ++++++++++++++++++--
 arch/arm/mach-vexpress/include/mach/uncompress.h  |   13 +++++++-
 arch/arm/mach-vexpress/v2m.c                      |   29 ++++++++++++++++
 6 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
index 27c1294..9747125 100644
--- a/arch/arm/mach-vexpress/Kconfig
+++ b/arch/arm/mach-vexpress/Kconfig
@@ -3,6 +3,11 @@ menu "Versatile Express platform type"
 
 config ARCH_VEXPRESS_LEGACY
 	bool
+	select AUTO_ZRELADDR
+	select ARM_PATCH_PHYS_VIRT
+
+config ARCH_VEXPRESS_RS1
+	bool
 
 config ARCH_VEXPRESS_CA9X4
 	bool "Versatile Express Cortex-A9x4 tile"
diff --git a/arch/arm/mach-vexpress/Makefile.boot b/arch/arm/mach-vexpress/Makefile.boot
index 8630b3d..3278615 100644
--- a/arch/arm/mach-vexpress/Makefile.boot
+++ b/arch/arm/mach-vexpress/Makefile.boot
@@ -1,3 +1,3 @@
-   zreladdr-y	+= 0x60008000
-params_phys-y	:= 0x60000100
-initrd_phys-y	:= 0x60800000
+   zreladdr-y	+= 0x80008000
+params_phys-y	:= 0x80000100
+initrd_phys-y	:= 0x80800000
diff --git a/arch/arm/mach-vexpress/core.h b/arch/arm/mach-vexpress/core.h
index 0ea502a..0b5c886 100644
--- a/arch/arm/mach-vexpress/core.h
+++ b/arch/arm/mach-vexpress/core.h
@@ -33,6 +33,7 @@ extern struct sys_timer v2m_timer;
 
 enum v2m_memory_map {
 	v2m_memory_map_legacy,
+	v2m_memory_map_rs1,
 };
 
 void __init v2m_dt_map_io(enum v2m_memory_map map);
diff --git a/arch/arm/mach-vexpress/include/mach/debug-macro.S b/arch/arm/mach-vexpress/include/mach/debug-macro.S
index fd9e6c7..adc94ce 100644
--- a/arch/arm/mach-vexpress/include/mach/debug-macro.S
+++ b/arch/arm/mach-vexpress/include/mach/debug-macro.S
@@ -10,12 +10,41 @@
  * published by the Free Software Foundation.
  */
 
-#define DEBUG_LL_UART_OFFSET	0x00009000
+#define VEXPRESS_PHYS_BASE_LEGACY	0x10000000
+#define VEXPRESS_UART_OFFSET_LEGACY	0x00009000
+
+#define VEXPRESS_PHYS_BASE_RS1		0x1c000000
+#define VEXPRESS_UART_OFFSET_RS1	0x00090000
+
+#define VEXPRESS_VIRT_BASE		0xf8000000
 
 		.macro	addruart,rp,rv,tmp
-		mov	\rp, #DEBUG_LL_UART_OFFSET
-		orr	\rv, \rp, #0xf8000000	@ virtual base
-		orr	\rp, \rp, #0x10000000	@ physical base
+
+		@ Check the MMU state
+#if defined(CONFIG_MMU)
+		mrc	p15, 0, \tmp, c1, c0	@ SCTRL
+		tst	\tmp, #1		@ MMU enabled?
+		moveq	\tmp, #VEXPRESS_PHYS_BASE_LEGACY
+		movne	\tmp, #VEXPRESS_VIRT_BASE
+#else
+		mov	\tmp, #VEXPRESS_PHYS_BASE_LEGACY
+#endif
+
+		@ PL011 present in "legacy place"?
+		orr	\tmp, \tmp, #VEXPRESS_UART_OFFSET_LEGACY
+		ldr	\tmp, [\tmp, #0xfe0]	@ PeriphID0
+		teq	\tmp, #0x11		@ PL011
+
+		@ Legacy memory map
+		moveq	\rp, #VEXPRESS_UART_OFFSET_LEGACY
+		orreq	\rv, \rp, #VEXPRESS_VIRT_BASE
+		orreq	\rp, \rp, #VEXPRESS_PHYS_BASE_LEGACY
+
+		@ RS1 memory map
+		movne	\rp, #VEXPRESS_UART_OFFSET_RS1
+		orrne	\rv, \rp, #VEXPRESS_VIRT_BASE
+		orrne	\rp, \rp, #VEXPRESS_PHYS_BASE_RS1
+
 		.endm
 
 #include <asm/hardware/debug-pl01x.S>
diff --git a/arch/arm/mach-vexpress/include/mach/uncompress.h b/arch/arm/mach-vexpress/include/mach/uncompress.h
index 7972c57..0ac6ba5 100644
--- a/arch/arm/mach-vexpress/include/mach/uncompress.h
+++ b/arch/arm/mach-vexpress/include/mach/uncompress.h
@@ -22,7 +22,18 @@
 #define AMBA_UART_CR(base)	(*(volatile unsigned char *)((base) + 0x30))
 #define AMBA_UART_FR(base)	(*(volatile unsigned char *)((base) + 0x18))
 
-#define get_uart_base()	(0x10000000 + 0x00009000)
+#define AMBA_PERIPH_ID0(base)	(*(volatile unsigned char *)((base) + 0xfe0))
+
+#define UART_BASE_LEGACY	0x10009000
+#define UART_BASE_RS1		0x1c090000
+
+static unsigned long get_uart_base(void)
+{
+	if (AMBA_PERIPH_ID0(UART_BASE_LEGACY) == 0x11)
+		return UART_BASE_LEGACY;
+	else
+		return UART_BASE_RS1;
+}
 
 /*
  * This does not append a newline
diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
index 39900c4..b3bbf43 100644
--- a/arch/arm/mach-vexpress/v2m.c
+++ b/arch/arm/mach-vexpress/v2m.c
@@ -34,6 +34,7 @@
 
 #include "core.h"
 
+/* Legacy memory map values for non-DT code */
 #define V2M_PA_CS0	0x40000000
 #define V2M_PA_CS1	0x44000000
 #define V2M_PA_CS2	0x48000000
@@ -494,12 +495,24 @@ static unsigned long __init v2m_dt_periph_offset(const char *alias)
 	return be32_to_cpup(reg);
 }
 
+static struct map_desc v2m_rs1_io_desc[] __initdata = {
+	{
+		.virtual	= V2M_PERIPH,
+		.pfn		= __phys_to_pfn(0x1c000000),
+		.length		= SZ_2M,
+		.type		= MT_DEVICE,
+	},
+};
+
 void __init v2m_dt_map_io(enum v2m_memory_map map)
 {
 	switch (map) {
 	case v2m_memory_map_legacy:
 		iotable_init(v2m_io_desc, ARRAY_SIZE(v2m_io_desc));
 		break;
+	case v2m_memory_map_rs1:
+		iotable_init(v2m_rs1_io_desc, ARRAY_SIZE(v2m_rs1_io_desc));
+		break;
 	default:
 		panic("%s: Unknown memory map requested!\n", __func__);
 		break;
@@ -533,11 +546,27 @@ static struct of_dev_auxdata v2m_legacy_dt_auxdata_lookup[] __initdata = {
 	{}
 };
 
+static struct of_dev_auxdata v2m_rs1_dt_auxdata_lookup[] __initdata = {
+	OF_DEV_AUXDATA("arm,vexpress-flash", 0x08000000, "physmap-flash",
+			&v2m_flash_data),
+	OF_DEV_AUXDATA("arm,primecell", 0x1c0f0000, "mb:wdt", NULL),
+	OF_DEV_AUXDATA("arm,primecell", 0x1c050000, "mb:mmci", &v2m_mmci_data),
+	OF_DEV_AUXDATA("arm,primecell", 0x1c060000, "mb:kmi0", NULL),
+	OF_DEV_AUXDATA("arm,primecell", 0x1c070000, "mb:kmi1", NULL),
+	OF_DEV_AUXDATA("arm,primecell", 0x1c090000, "mb:uart0", NULL),
+	OF_DEV_AUXDATA("arm,primecell", 0x1c0a0000, "mb:uart1", NULL),
+	OF_DEV_AUXDATA("arm,primecell", 0x1c0b0000, "mb:uart2", NULL),
+	OF_DEV_AUXDATA("arm,primecell", 0x1c0c0000, "mb:uart3", NULL),
+	{}
+};
+
 struct of_dev_auxdata * __init v2m_dt_get_auxdata(enum v2m_memory_map map)
 {
 	switch (map) {
 	case v2m_memory_map_legacy:
 		return v2m_legacy_dt_auxdata_lookup;
+	case v2m_memory_map_rs1:
+		return v2m_rs1_dt_auxdata_lookup;
 	default:
 		panic("%s: Unknown memory map requested!\n", __func__);
 		return NULL;
-- 
1.6.3.3
