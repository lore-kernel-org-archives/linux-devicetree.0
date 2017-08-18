From: Rocco Folino <rocco.folino@gmail.com>
Subject: [PATCH] MIPS: ath79: support devicetree selection
Date: Fri, 18 Aug 2017 17:32:42 +0200
Message-ID: <b78cb3ef8df8531efdb7b011743ad3f38978015d.1503070362.git.rocco.folino@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rocco Folino <rocco.folino@gmail.com>
List-Id: devicetree@vger.kernel.org

Allow to choose devicetrees from Kconfig.

Signed-off-by: Rocco Folino <rocco.folino@gmail.com>
---
 arch/mips/ath79/Kconfig         | 44 +++++++++++++++++++++++++++++++++++++++++
 arch/mips/boot/dts/qca/Makefile | 10 +++++-----
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/arch/mips/ath79/Kconfig b/arch/mips/ath79/Kconfig
index dfc60209dc63..b43d116187af 100644
--- a/arch/mips/ath79/Kconfig
+++ b/arch/mips/ath79/Kconfig
@@ -1,5 +1,49 @@
 if ATH79
 
+menu "Atheros AR71XX/AR724X/AR913X devicetree selection"
+
+config DTB_ATH_DPT_MODULE
+	bool "DPTechnics DPT-Module"
+	select SOC_933X
+	select BUILTIN_DTB
+	help
+	  Say 'Y' if you want your kernel to support the
+	  DPTechnics DPT-Module board.
+
+config DTB_ATH_DRAGINO_MS14
+	bool "Dragino MS14 (Dragino 2)"
+	select SOC_AR933X
+	select BUILTIN_DTB
+	help
+	  Say 'Y' if you want your kernel to support the
+	  Dragino MS14 board.
+
+config DTB_ATH_OMEGA
+	bool "Onion Omega"
+	select SOC_AR933X
+	select BUILTIN_DTB
+	help
+	  Say 'Y' if you want your kernel to support the
+	  Onion Omega board.
+
+config DTB_ATH_TL_MR3020
+	bool "TP-Link TL-MR3020"
+	select SOC_AR933X
+	select BUILTIN_DTB
+	help
+	  Say 'Y' if you want your kernel to support the
+	  TP-Link TL-MR3020 board.
+
+config DTB_ATH_TL_WR1043ND_V1
+	bool "TP-Link TL-WR1043ND v1"
+	select SOC_AR913X
+	select BUILTIN_DTB
+	help
+	  Say 'Y' if you want your kernel to support the
+	  TP-Link TL-WR1043ND v1 board.
+
+endmenu
+
 menu "Atheros AR71XX/AR724X/AR913X machine selection"
 
 config ATH79_MACH_AP121
diff --git a/arch/mips/boot/dts/qca/Makefile b/arch/mips/boot/dts/qca/Makefile
index 63a9ddf048c9..acaf448e4516 100644
--- a/arch/mips/boot/dts/qca/Makefile
+++ b/arch/mips/boot/dts/qca/Makefile
@@ -1,9 +1,9 @@
 # All DTBs
-dtb-$(CONFIG_ATH79)			+= ar9132_tl_wr1043nd_v1.dtb
-dtb-$(CONFIG_ATH79)			+= ar9331_dpt_module.dtb
-dtb-$(CONFIG_ATH79)			+= ar9331_dragino_ms14.dtb
-dtb-$(CONFIG_ATH79)			+= ar9331_omega.dtb
-dtb-$(CONFIG_ATH79)			+= ar9331_tl_mr3020.dtb
+dtb-$(CONFIG_DTB_ATH_TL_WR1043ND_V1)	+= ar9132_tl_wr1043nd_v1.dtb
+dtb-$(CONFIG_DTB_ATH_DPT_MODULE)	+= ar9331_dpt_module.dtb
+dtb-$(CONFIG_DTB_ATH_DRAGINO_MS14)	+= ar9331_dragino_ms14.dtb
+dtb-$(CONFIG_DTB_ATH_OMEGA)		+= ar9331_omega.dtb
+dtb-$(CONFIG_DTB_ATH_TL_MR3020)		+= ar9331_tl_mr3020.dtb
 
 # Force kbuild to make empty built-in.o if necessary
 obj-				+= dummy.o
-- 
2.13.5
