From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v2 12/12] ARM: vf610m4: add defconfig for Linux on Vybrids Cortex-M4
Date: Tue, 30 Dec 2014 00:32:15 +0100
Message-ID: <1419895935-22966-13-git-send-email-stefan@agner.ch>
References: <1419895935-22966-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419895935-22966-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add defconfig for Linux on Vybrid (vf610) on the secondary Cortex-
M4 CPU. The use of a XIP image has been tested which needs to be
loaded (e.g. using the custom m4boot loader) to the end of the
available RAM at address 0x8f000000. The Cortex-M4 has a code-alias
which makes sure that the instructions get fetched through the code
bus (alias starts at 0x00800000 => 0x80800000 in system address).
Hence, to get optimal performance, use 0x0f000000 as XIP_PHYS_ADDR.
This address is additionally shifted by the length of the minimal
loader which is inserted by m4boot. Currently, this offset is 0x80.

The standard DRAM base address is configured to 0x8C000000, which
gives the Cortex-M4 48MiB of RAM.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/configs/vf610m4_defconfig | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/arm/configs/vf610m4_defconfig

diff --git a/arch/arm/configs/vf610m4_defconfig b/arch/arm/configs/vf610m4_defconfig
new file mode 100644
index 0000000..392bc1d
--- /dev/null
+++ b/arch/arm/configs/vf610m4_defconfig
@@ -0,0 +1,53 @@
+CONFIG_NAMESPACES=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZ4 is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_EMBEDDED=y
+# CONFIG_MMU is not set
+CONFIG_ARCH_MULTI_V7M=y
+CONFIG_ARCH_MXC=y
+CONFIG_SOC_VF610=y
+CONFIG_VF_USE_PIT_TIMER=y
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0x8c000000
+CONFIG_FLASH_MEM_BASE=0x8f000000
+CONFIG_FLASH_SIZE=0x01000000
+CONFIG_CMDLINE="console=/dev/ttyLP2"
+CONFIG_XIP_KERNEL=y
+CONFIG_XIP_PHYS_ADDR=0x0f000080
+CONFIG_BINFMT_FLAT=y
+CONFIG_BINFMT_ZFLAT=y
+CONFIG_BINFMT_SHARED_FLAT=y
+# CONFIG_SUSPEND is not set
+# CONFIG_UEVENT_HELPER is not set
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_BLK_DEV_XIP=y
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_GPIO_POLLED=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_FSL_LPUART=y
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_ESDHC_IMX=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT4_FS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_FTRACE is not set
+# CONFIG_CRYPTO_HW is not set
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
