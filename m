From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 1/5] phy: Rename phy-brcmstb-sata driver to phy-brcm-sata driver
Date: Tue, 16 Feb 2016 12:03:36 +0530
Message-ID: <1455604420-11300-2-git-send-email-anup.patel@broadcom.com>
References: <1455604420-11300-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455604420-11300-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jon.mason@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

Currently, we have a common SATA3 PHY driver for all Broadcom
STB SoCs. This driver can be extended and re-used for Broadcom
iProc SoCs having same SATA3 PHY.

This patch renames existing Broadcom STB SATA3 PHY driver to
common Broadcom SATA3 PHY driver to share this PHY driver across
Broadcom SoCs.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
---
 drivers/phy/Kconfig                                 | 18 +++++++++----=
-----
 drivers/phy/Makefile                                |  2 +-
 drivers/phy/{phy-brcmstb-sata.c =3D> phy-brcm-sata.c} |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)
 rename drivers/phy/{phy-brcmstb-sata.c =3D> phy-brcm-sata.c} (97%)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index e7e117d..4d926b8 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -388,15 +388,6 @@ config PHY_TUSB1210
 	help
 	  Support for TI TUSB1210 USB ULPI PHY.
=20
-config PHY_BRCMSTB_SATA
-	tristate "Broadcom STB SATA PHY driver"
-	depends on ARCH_BRCMSTB || BMIPS_GENERIC
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Enable this to support the SATA3 PHY on 28nm or 40nm Broadcom STB S=
oCs.
-	  Likely useful only with CONFIG_SATA_BRCMSTB enabled.
-
 config PHY_CYGNUS_PCIE
 	tristate "Broadcom Cygnus PCIe PHY driver"
 	depends on OF && (ARCH_BCM_CYGNUS || COMPILE_TEST)
@@ -406,4 +397,13 @@ config PHY_CYGNUS_PCIE
 	  Enable this to support the Broadcom Cygnus PCIe PHY.
 	  If unsure, say N.
=20
+config PHY_BRCM_SATA
+	tristate "Broadcom SATA PHY driver"
+	depends on ARCH_BRCMSTB || ARCH_BCM_IPROC || BMIPS_GENERIC || COMPILE=
_TEST
+	depends on OF
+	select GENERIC_PHY
+	default ARCH_BCM_IPROC
+	help
+	  Enable this to support the Broadcom SATA PHY.
+	  If unsure, say N.
 endmenu
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c80f09d..d67d609 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -47,6 +47,6 @@ obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs.o
 obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs-qmp-20nm.o
 obj-$(CONFIG_PHY_QCOM_UFS) 	+=3D phy-qcom-ufs-qmp-14nm.o
 obj-$(CONFIG_PHY_TUSB1210)		+=3D phy-tusb1210.o
-obj-$(CONFIG_PHY_BRCMSTB_SATA)		+=3D phy-brcmstb-sata.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+=3D phy-pistachio-usb.o
 obj-$(CONFIG_PHY_CYGNUS_PCIE)		+=3D phy-bcm-cygnus-pcie.o
+obj-$(CONFIG_PHY_BRCM_SATA)		+=3D phy-brcm-sata.o
diff --git a/drivers/phy/phy-brcmstb-sata.c b/drivers/phy/phy-brcm-sata=
=2Ec
similarity index 97%
rename from drivers/phy/phy-brcmstb-sata.c
rename to drivers/phy/phy-brcm-sata.c
index a23172f..c97b9d6 100644
--- a/drivers/phy/phy-brcmstb-sata.c
+++ b/drivers/phy/phy-brcm-sata.c
@@ -1,7 +1,7 @@
 /*
  * Broadcom SATA3 AHCI Controller PHY Driver
  *
- * Copyright =C2=A9 2009-2015 Broadcom Corporation
+ * Copyright (C) 2016 Broadcom
  *
  * This program is free software; you can redistribute it and/or modif=
y
  * it under the terms of the GNU General Public License as published b=
y
@@ -238,13 +238,13 @@ static struct platform_driver brcm_sata_phy_drive=
r =3D {
 	.probe	=3D brcm_sata_phy_probe,
 	.driver	=3D {
 		.of_match_table	=3D brcm_sata_phy_of_match,
-		.name		=3D "brcmstb-sata-phy",
+		.name		=3D "brcm-sata-phy",
 	}
 };
 module_platform_driver(brcm_sata_phy_driver);
=20
-MODULE_DESCRIPTION("Broadcom STB SATA PHY driver");
+MODULE_DESCRIPTION("Broadcom SATA PHY driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Marc Carino");
 MODULE_AUTHOR("Brian Norris");
-MODULE_ALIAS("platform:phy-brcmstb-sata");
+MODULE_ALIAS("platform:phy-brcm-sata");
--=20
1.9.1
