From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v2] MIPS: Fix CONFIG_CMDLINE handling
Date: Thu, 27 Sep 2018 22:59:18 +0000
Message-ID: <20180927225829.6612-1-paul.burton@mips.com>
References: <CAL_JsqKZYiDpH8900Mw+ADiUx--GbqF7j1MYoqbcJYCmbjvY4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKZYiDpH8900Mw+ADiUx--GbqF7j1MYoqbcJYCmbjvY4g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>
Cc: Paul Burton <pburton@wavecomp.com>, Frank Rowand <frowand.list@gmail.com>, Jaedon Shin <jaedon.shin@gmail.com>, Mathieu Malaterre <malat@debian.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Commit 8ce355cf2e38 ("MIPS: Setup boot_command_line before
plat_mem_setup") fixed a problem for systems which have
CONFIG_CMDLINE_BOOL=3Dy & use a DT with a chosen node that has either no
bootargs property or an empty one. In this configuration
early_init_dt_scan_chosen() copies CONFIG_CMDLINE into
boot_command_line, but the MIPS code doesn't know this so it appends
CONFIG_CMDLINE (via builtin_cmdline) to boot_command_line again. The
result is that boot_command_line contains the arguments from
CONFIG_CMDLINE twice.

That commit took the approach of simply setting up boot_command_line
from the MIPS code before early_init_dt_scan_chosen() runs, causing it
not to copy CONFIG_CMDLINE to boot_command_line if a chosen node with no
bootargs property is found.

Unfortunately this is problematic for systems which do have a non-empty
bootargs property & CONFIG_CMDLINE_BOOL=3Dy. There
early_init_dt_scan_chosen() will overwrite boot_command_line with the
arguments from DT, which means we lose those from CONFIG_CMDLINE
entirely. This breaks CONFIG_MIPS_CMDLINE_DTB_EXTEND. If we have
CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER or
CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND selected and the DT has a bootargs
property which we should ignore, it will instead be honoured breaking
those configurations too.

Fix this by reverting commit 8ce355cf2e38 ("MIPS: Setup
boot_command_line before plat_mem_setup") to restore the former
behaviour, and fixing the CONFIG_CMDLINE duplication issue by
initializing boot_command_line to a non-empty string that
early_init_dt_scan_chosen() will not overwrite with CONFIG_CMDLINE.

This is a little ugly, but cleanup in this area is on its way. In the
meantime this is at least easy to backport & contains the ugliness
within arch/mips/.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 8ce355cf2e38 ("MIPS: Setup boot_command_line before plat_mem_setup")
References: https://patchwork.linux-mips.org/patch/18804/
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Jaedon Shin <jaedon.shin@gmail.com>
Cc: Mathieu Malaterre <malat@debian.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: stable@vger.kernel.org # v4.16+
---
This isn't pretty, but further cleanup is underway [1] and this fixes
the regression in an easily backportable manner without adding another
per-architecture function like v1.

[1] https://www.spinics.net/lists/kernel/msg2918275.html

Changes in v2:
 - Drop the arch-specific function & just initialize boot_command_line
   such that early_init_dt_scan_chosen() won't overwrite it with
   CONFIG_CMDLINE.

v1: https://marc.info/?l=3Dlinux-mips&m=3D153634652318477&w=3D2
    https://marc.info/?l=3Dlinux-mips&m=3D153634653718485&w=3D2
---
 arch/mips/kernel/setup.c | 48 +++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index c71d1eb7da59..8aaaa42f91ed 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -846,6 +846,34 @@ static void __init arch_mem_init(char **cmdline_p)
 	struct memblock_region *reg;
 	extern void plat_mem_setup(void);
=20
+	/*
+	 * Initialize boot_command_line to an innocuous but non-empty string in
+	 * order to prevent early_init_dt_scan_chosen() from copying
+	 * CONFIG_CMDLINE into it without our knowledge. We handle
+	 * CONFIG_CMDLINE ourselves below & don't want to duplicate its
+	 * content because repeating arguments can be problematic.
+	 */
+	strlcpy(boot_command_line, " ", COMMAND_LINE_SIZE);
+
+	/* call board setup routine */
+	plat_mem_setup();
+
+	/*
+	 * Make sure all kernel memory is in the maps.  The "UP" and
+	 * "DOWN" are opposite for initdata since if it crosses over
+	 * into another memory section you don't want that to be
+	 * freed when the initdata is freed.
+	 */
+	arch_mem_addpart(PFN_DOWN(__pa_symbol(&_text)) << PAGE_SHIFT,
+			 PFN_UP(__pa_symbol(&_edata)) << PAGE_SHIFT,
+			 BOOT_MEM_RAM);
+	arch_mem_addpart(PFN_UP(__pa_symbol(&__init_begin)) << PAGE_SHIFT,
+			 PFN_DOWN(__pa_symbol(&__init_end)) << PAGE_SHIFT,
+			 BOOT_MEM_INIT_RAM);
+
+	pr_info("Determined physical RAM map:\n");
+	print_memory_map();
+
 #if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
 	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
 #else
@@ -873,26 +901,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	}
 #endif
 #endif
-
-	/* call board setup routine */
-	plat_mem_setup();
-
-	/*
-	 * Make sure all kernel memory is in the maps.  The "UP" and
-	 * "DOWN" are opposite for initdata since if it crosses over
-	 * into another memory section you don't want that to be
-	 * freed when the initdata is freed.
-	 */
-	arch_mem_addpart(PFN_DOWN(__pa_symbol(&_text)) << PAGE_SHIFT,
-			 PFN_UP(__pa_symbol(&_edata)) << PAGE_SHIFT,
-			 BOOT_MEM_RAM);
-	arch_mem_addpart(PFN_UP(__pa_symbol(&__init_begin)) << PAGE_SHIFT,
-			 PFN_DOWN(__pa_symbol(&__init_end)) << PAGE_SHIFT,
-			 BOOT_MEM_INIT_RAM);
-
-	pr_info("Determined physical RAM map:\n");
-	print_memory_map();
-
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
=20
 	*cmdline_p =3D command_line;
--=20
2.19.0
