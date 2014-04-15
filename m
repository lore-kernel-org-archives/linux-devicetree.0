From: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V8 9/9] SPEAr13xx: defconfig: Update
Date: Tue, 15 Apr 2014 17:19:51 +0530
Message-ID: <ff9f1a8a515daf56f31c67b3be832b93e3642324.1397555158.git.mohit.kumar__45574.0967802287$1397562802$gmane$org@st.com>
References: <cover.1397555158.git.mohit.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1397555158.git.mohit.kumar-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable PCIe, EABI, VFP and NFS configs in default configuration file for
SPEAr13xx.

Signed-off-by: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Acked-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
 arch/arm/configs/spear13xx_defconfig |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/spear13xx_defconfig b/arch/arm/configs/spear13xx_defconfig
index 82eaa55..d271b26 100644
--- a/arch/arm/configs/spear13xx_defconfig
+++ b/arch/arm/configs/spear13xx_defconfig
@@ -11,13 +11,24 @@ CONFIG_ARCH_SPEAR13XX=y
 CONFIG_MACH_SPEAR1310=y
 CONFIG_MACH_SPEAR1340=y
 # CONFIG_SWP_EMULATE is not set
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCIE_SPEAR13XX=y
 CONFIG_SMP=y
 # CONFIG_SMP_ON_UP is not set
 # CONFIG_ARM_CPU_TOPOLOGY is not set
+CONFIG_AEABI=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_VFP=y
 CONFIG_BINFMT_MISC=y
 CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_NET_IPIP=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_OF_PARTS=y
@@ -27,6 +38,7 @@ CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_FSMC=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=16384
+CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 # CONFIG_SATA_PMP is not set
 CONFIG_SATA_AHCI_PLATFORM=y
@@ -66,6 +78,7 @@ CONFIG_USB=y
 # CONFIG_USB_DEVICE_CLASS is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_SPEAR=y
@@ -79,11 +92,14 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_SECURITY=y
 CONFIG_AUTOFS4_FS=m
+CONFIG_FUSE_FS=y
 CONFIG_MSDOS_FS=m
 CONFIG_VFAT_FS=m
 CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
 CONFIG_NLS_DEFAULT="utf8"
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=m
-- 
1.7.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
