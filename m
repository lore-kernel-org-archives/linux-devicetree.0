From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH v2 1/2] bmips: add BCM6358 support
Date: Sun, 21 Feb 2016 12:41:20 +0100
Message-ID: <1456054881-26787-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

BCM6358 has a shared TLB which conflicts with current SMP support, so i=
t must
be disabled for now.
BCM6358 uses >=3D 0xfffe0000 addresses for internal registers, which ne=
ed to be
remapped (by using a simplified version of BRCM63xx ioremap.h).

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: Use a different approach for remapping internal registers

 arch/mips/bmips/setup.c                    | 29 +++++++++++++++++-----=
-
 arch/mips/include/asm/mach-bmips/ioremap.h | 37 ++++++++++++++++++++++=
++++++++
 2 files changed, 59 insertions(+), 7 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-bmips/ioremap.h

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 3553528..f834a86 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -18,6 +18,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/smp.h>
+#include <linux/types.h>
 #include <asm/addrspace.h>
 #include <asm/bmips.h>
 #include <asm/bootinfo.h>
@@ -35,9 +36,12 @@
=20
 static const unsigned long kbase =3D VMLINUX_LOAD_ADDRESS & 0xfff00000=
;
=20
+phys_addr_t bmips_internal_registers;
+
 struct bmips_quirk {
-	const char		*compatible;
-	void			(*quirk_fn)(void);
+	const char *compatible;
+	void (*quirk_fn)(void);
+	const phys_addr_t regs;
 };
=20
 static void kbase_setup(void)
@@ -95,17 +99,27 @@ static void bcm6328_quirks(void)
 		bcm63xx_fixup_cpu1();
 }
=20
+static void bcm6358_quirks(void)
+{
+	/*
+	 * BCM6358 needs special handling for its shared TLB, so
+	 * disable SMP for now
+	 */
+	bmips_smp_enabled =3D 0;
+}
+
 static void bcm6368_quirks(void)
 {
 	bcm63xx_fixup_cpu1();
 }
=20
 static const struct bmips_quirk bmips_quirk_list[] =3D {
-	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
-	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
-	{ "brcm,bcm6328",		&bcm6328_quirks			},
-	{ "brcm,bcm6368",		&bcm6368_quirks			},
-	{ "brcm,bcm63168",		&bcm6368_quirks			},
+	{ "brcm,bcm3384-viper", &bcm3384_viper_quirks, 0 },
+	{ "brcm,bcm33843-viper", &bcm3384_viper_quirks, 0 },
+	{ "brcm,bcm6328", &bcm6328_quirks, 0 },
+	{ "brcm,bcm6358", &bcm6358_quirks, 0xfffe0000 },
+	{ "brcm,bcm6368", &bcm6368_quirks, 0 },
+	{ "brcm,bcm63168", &bcm6368_quirks, 0 },
 	{ },
 };
=20
@@ -162,6 +176,7 @@ void __init plat_mem_setup(void)
 	for (q =3D bmips_quirk_list; q->quirk_fn; q++) {
 		if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
 					     q->compatible)) {
+			bmips_internal_registers =3D q->regs;
 			q->quirk_fn();
 		}
 	}
diff --git a/arch/mips/include/asm/mach-bmips/ioremap.h b/arch/mips/inc=
lude/asm/mach-bmips/ioremap.h
new file mode 100644
index 0000000..5ffca94
--- /dev/null
+++ b/arch/mips/include/asm/mach-bmips/ioremap.h
@@ -0,0 +1,37 @@
+#ifndef __ASM_MACH_BMIPS_IOREMAP_H
+#define __ASM_MACH_BMIPS_IOREMAP_H
+
+#include <linux/types.h>
+
+extern phys_addr_t bmips_internal_registers;
+
+static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr,
+					     phys_addr_t size)
+{
+	return phys_addr;
+}
+
+static inline int is_bmips_internal_registers(phys_addr_t offset)
+{
+	if (bmips_internal_registers !=3D 0 && offset >=3D bmips_internal_reg=
isters)
+		return 1;
+	else
+		return 0;
+}
+
+static inline void __iomem *plat_ioremap(phys_addr_t offset,
+					 unsigned long size,
+					 unsigned long flags)
+{
+	if (is_bmips_internal_registers(offset))
+		return (void __iomem *) offset;
+
+	return NULL;
+}
+
+static inline int plat_iounmap(const volatile void __iomem *addr)
+{
+	return is_bmips_internal_registers((unsigned long) addr);
+}
+
+#endif /* __ASM_MACH_BMIPS_IOREMAP_H */
--=20
1.9.1
