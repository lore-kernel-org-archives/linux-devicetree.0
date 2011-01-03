From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] OF: make drivers depend on CONFIG_OF instead of
	CONFIG_PPC_OF
Date: Mon,  3 Jan 2011 11:56:38 -0600
Message-ID: <1294077398-24655-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Some OF drivers could likely be used on non-powerpc OF based platforms,
so fix the kconfig depends to be CONFIG_OF instead of CONFIG_PPC_OF.

Compile tested on ARM and sparc.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---

Grant, 

I dropped the ipmi changes as with further merging of the platform driver, all 
the ifdefs that were in this patch go away. I'll send out a new version of it
later, but wanted to get this in now.

Rob

 drivers/mmc/host/Kconfig |    4 +++-
 drivers/mtd/Kconfig      |    2 +-
 drivers/mtd/maps/Kconfig |    2 +-
 drivers/serial/Kconfig   |    2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index d618e86..e960a93 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -83,7 +83,7 @@ config MMC_RICOH_MMC
 
 config MMC_SDHCI_OF
 	tristate "SDHCI support on OpenFirmware platforms"
-	depends on MMC_SDHCI && PPC_OF
+	depends on MMC_SDHCI && OF
 	help
 	  This selects the OF support for Secure Digital Host Controller
 	  Interfaces.
@@ -93,6 +93,7 @@ config MMC_SDHCI_OF
 config MMC_SDHCI_OF_ESDHC
 	bool "SDHCI OF support for the Freescale eSDHC controller"
 	depends on MMC_SDHCI_OF
+	depends on PPC_OF
 	select MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
 	help
 	  This selects the Freescale eSDHC controller support.
@@ -102,6 +103,7 @@ config MMC_SDHCI_OF_ESDHC
 config MMC_SDHCI_OF_HLWD
 	bool "SDHCI OF support for the Nintendo Wii SDHCI controllers"
 	depends on MMC_SDHCI_OF
+	depends on PPC_OF
 	select MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 1e2cbf5..b1f7689 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -159,7 +159,7 @@ config MTD_AFS_PARTS
 
 config MTD_OF_PARTS
 	tristate "Flash partition map based on OF description"
-	depends on (MICROBLAZE || PPC_OF) && MTD_PARTITIONS
+	depends on OF && MTD_PARTITIONS
 	help
 	  This provides a partition parsing function which derives
 	  the partition map from the children of the flash node,
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index a0dd7bb..5d37d31 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -72,7 +72,7 @@ config MTD_PHYSMAP_BANKWIDTH
 
 config MTD_PHYSMAP_OF
 	tristate "Flash device in physical memory map based on OF description"
-	depends on (MICROBLAZE || PPC_OF) && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
+	depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
 	help
 	  This provides a 'mapping' driver which allows the NOR Flash and
 	  ROM driver code to communicate with chips which are mapped
diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
index aff9dcd..9d109f9 100644
--- a/drivers/serial/Kconfig
+++ b/drivers/serial/Kconfig
@@ -1402,7 +1402,7 @@ config SERIAL_NETX_CONSOLE
 
 config SERIAL_OF_PLATFORM
 	tristate "Serial port on Open Firmware platform bus"
-	depends on PPC_OF || MICROBLAZE
+	depends on OF
 	depends on SERIAL_8250 || SERIAL_OF_PLATFORM_NWPSERIAL
 	help
 	  If you have a PowerPC based system that has serial ports
-- 
1.7.1
