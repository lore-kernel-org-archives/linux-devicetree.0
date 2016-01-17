From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH 1/2] bmips: add BCM6358 support
Date: Sun, 17 Jan 2016 12:28:20 +0100
Message-ID: <1453030101-14794-1-git-send-email-noltari@gmail.com>
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
BCM6358 uses >=3D 0xfff00000 addresses for internal registers, which ne=
ed to be
remapped (by using a simplified version of BRCM63xx ioremap.h).

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/bmips/setup.c                    | 10 +++++++++
 arch/mips/include/asm/mach-bmips/ioremap.h | 33 ++++++++++++++++++++++=
++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-bmips/ioremap.h

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 3553528..38b5bd5 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -95,6 +95,15 @@ static void bcm6328_quirks(void)
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
@@ -104,6 +113,7 @@ static const struct bmips_quirk bmips_quirk_list[] =
=3D {
 	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
 	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
 	{ "brcm,bcm6328",		&bcm6328_quirks			},
+	{ "brcm,bcm6358",		&bcm6358_quirks			},
 	{ "brcm,bcm6368",		&bcm6368_quirks			},
 	{ "brcm,bcm63168",		&bcm6368_quirks			},
 	{ },
diff --git a/arch/mips/include/asm/mach-bmips/ioremap.h b/arch/mips/inc=
lude/asm/mach-bmips/ioremap.h
new file mode 100644
index 0000000..b1a75f8
--- /dev/null
+++ b/arch/mips/include/asm/mach-bmips/ioremap.h
@@ -0,0 +1,33 @@
+#ifndef __ASM_MACH_BMIPS_IOREMAP_H
+#define __ASM_MACH_BMIPS_IOREMAP_H
+
+#include <linux/types.h>
+
+static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, ph=
ys_addr_t size)
+{
+	return phys_addr;
+}
+
+static inline int is_bmips_internal_registers(phys_addr_t offset)
+{
+	if (offset >=3D 0xfff00000)
+		return 1;
+
+	return 0;
+}
+
+static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned =
long size,
+					 unsigned long flags)
+{
+	if (is_bmips_internal_registers(offset))
+		return (void __iomem *)offset;
+
+	return NULL;
+}
+
+static inline int plat_iounmap(const volatile void __iomem *addr)
+{
+	return is_bmips_internal_registers((unsigned long)addr);
+}
+
+#endif /* __ASM_MACH_BMIPS_IOREMAP_H */
--=20
1.9.1
