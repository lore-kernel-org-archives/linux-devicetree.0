From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/7] OF: make drivers depend on CONFIG_OF instead of
	CONFIG_PPC_OF
Date: Tue, 16 Nov 2010 14:33:49 -0600
Message-ID: <1289939635-30742-2-git-send-email-robherring2@gmail.com>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1289939635-30742-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Some OF drivers could likely be used on non-powerpc OF based platforms,
so fix the kconfig depends to be CONFIG_OF instead of CONFIG_PPC_OF

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 drivers/char/ipmi/ipmi_si_intf.c |   14 +++++++-------
 drivers/mmc/host/Kconfig         |    2 +-
 drivers/mtd/Kconfig              |    2 +-
 drivers/mtd/maps/Kconfig         |    2 +-
 drivers/net/can/sja1000/Kconfig  |    4 ++--
 drivers/serial/Kconfig           |    2 +-
 drivers/usb/host/isp1760-if.c    |    8 ++++----
 7 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 035da9e..1b33a42 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -66,7 +66,7 @@
 #include <linux/ctype.h>
 #include <linux/pnp.h>
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
 #endif
@@ -308,7 +308,7 @@ static int pci_registered;
 #ifdef CONFIG_ACPI
 static int pnp_registered;
 #endif
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 static int of_registered;
 #endif
 
@@ -2540,7 +2540,7 @@ static struct pci_driver ipmi_pci_driver = {
 #endif /* CONFIG_PCI */
 
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 static int __devinit ipmi_of_probe(struct platform_device *dev,
 			 const struct of_device_id *match)
 {
@@ -2646,7 +2646,7 @@ static struct of_platform_driver ipmi_of_platform_driver = {
 	.probe		= ipmi_of_probe,
 	.remove		= __devexit_p(ipmi_of_remove),
 };
-#endif /* CONFIG_PPC_OF */
+#endif /* CONFIG_OF */
 
 static int wait_for_msg_done(struct smi_info *smi_info)
 {
@@ -3380,7 +3380,7 @@ static int __devinit init_ipmi_si(void)
 	spmi_find_bmc();
 #endif
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 	of_register_platform_driver(&ipmi_of_platform_driver);
 	of_registered = 1;
 #endif
@@ -3440,7 +3440,7 @@ static int __devinit init_ipmi_si(void)
 			pci_unregister_driver(&ipmi_pci_driver);
 #endif
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 		if (of_registered)
 			of_unregister_platform_driver(&ipmi_of_platform_driver);
 #endif
@@ -3541,7 +3541,7 @@ static void __exit cleanup_ipmi_si(void)
 		pnp_unregister_driver(&ipmi_pnp_driver);
 #endif
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 	if (of_registered)
 		of_unregister_platform_driver(&ipmi_of_platform_driver);
 #endif
diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index d618e86..982ff67 100644
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
diff --git a/drivers/net/can/sja1000/Kconfig b/drivers/net/can/sja1000/Kconfig
index 6fdc031..3175190 100644
--- a/drivers/net/can/sja1000/Kconfig
+++ b/drivers/net/can/sja1000/Kconfig
@@ -22,11 +22,11 @@ config CAN_SJA1000_PLATFORM
 
 config CAN_SJA1000_OF_PLATFORM
 	tristate "Generic OF Platform Bus based SJA1000 driver"
-	depends on PPC_OF
+	depends on OF
 	---help---
 	  This driver adds support for the SJA1000 chips connected to
 	  the OpenFirmware "platform bus" found on embedded systems with
-	  OpenFirmware bindings, e.g. if you have a PowerPC based system
+	  OpenFirmware bindings, e.g. if you have a OpenFirmware based system
 	  you may want to enable this option.
 
 config CAN_EMS_PCI
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
diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
index 3b28dbf..c0de61e 100644
--- a/drivers/usb/host/isp1760-if.c
+++ b/drivers/usb/host/isp1760-if.c
@@ -17,7 +17,7 @@
 
 #include "isp1760-hcd.h"
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #endif
@@ -26,7 +26,7 @@
 #include <linux/pci.h>
 #endif
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 static int of_isp1760_probe(struct platform_device *dev,
 		const struct of_device_id *match)
 {
@@ -397,7 +397,7 @@ static int __init isp1760_init(void)
 	ret = platform_driver_register(&isp1760_plat_driver);
 	if (!ret)
 		any_ret = 0;
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 	ret = of_register_platform_driver(&isp1760_of_driver);
 	if (!ret)
 		any_ret = 0;
@@ -417,7 +417,7 @@ module_init(isp1760_init);
 static void __exit isp1760_exit(void)
 {
 	platform_driver_unregister(&isp1760_plat_driver);
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 	of_unregister_platform_driver(&isp1760_of_driver);
 #endif
 #ifdef CONFIG_PCI
-- 
1.7.1
