From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH 13/14] mtd: maps: Rename physmap_of_{versatile,
 gemini} into physmap-{versatile, gemini}
Date: Mon,  8 Oct 2018 22:10:26 +0200
Message-ID: <20181008201027.17952-14-boris.brezillon@bootlin.com>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20181008201027.17952-1-boris.brezillon@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

Now that the physmap_of driver is gone, the gemini and versative
extensions are part of the physmap driver. Rename the source files and
the config option to reflect this.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/Kconfig                                         | 4 ++--
 drivers/mtd/maps/Makefile                                        | 4 ++--
 drivers/mtd/maps/physmap-core.c                                  | 4 ++--
 drivers/mtd/maps/{physmap_of_gemini.c => physmap-gemini.c}       | 2 +-
 drivers/mtd/maps/{physmap_of_gemini.h => physmap-gemini.h}       | 2 +-
 drivers/mtd/maps/{physmap_of_versatile.c => physmap-versatile.c} | 2 +-
 drivers/mtd/maps/{physmap_of_versatile.h => physmap-versatile.h} | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/mtd/maps/{physmap_of_gemini.c => physmap-gemini.c} (98%)
 rename drivers/mtd/maps/{physmap_of_gemini.h => physmap-gemini.h} (90%)
 rename drivers/mtd/maps/{physmap_of_versatile.c => physmap-versatile.c} (99%)
 rename drivers/mtd/maps/{physmap_of_versatile.h => physmap-versatile.h} (90%)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 4fd13d76b7b5..93b7ae32e277 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -74,7 +74,7 @@ config MTD_PHYSMAP_OF
 	  physically into the CPU's memory. The mapping description here is
 	  taken from OF device tree.
 
-config MTD_PHYSMAP_OF_VERSATILE
+config MTD_PHYSMAP_VERSATILE
 	bool "ARM Versatile OF-based physical memory map handling"
 	depends on MTD_PHYSMAP_OF
 	depends on MFD_SYSCON
@@ -84,7 +84,7 @@ config MTD_PHYSMAP_OF_VERSATILE
 	  platforms, basically to add a VPP (write protection) callback so
 	  the flash can be taken out of write protection.
 
-config MTD_PHYSMAP_OF_GEMINI
+config MTD_PHYSMAP_GEMINI
 	bool "Cortina Gemini OF-based physical memory map handling"
 	depends on MTD_PHYSMAP_OF
 	depends on MFD_SYSCON
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index acec0fbfa18d..ed1ef75244db 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -18,8 +18,8 @@ obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
 obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
 physmap-objs-y			+= physmap-core.o
-physmap-objs-$(CONFIG_MTD_PHYSMAP_OF_VERSATILE) += physmap_of_versatile.o
-physmap-objs-$(CONFIG_MTD_PHYSMAP_OF_GEMINI) += physmap_of_gemini.o
+physmap-objs-$(CONFIG_MTD_PHYSMAP_VERSATILE) += physmap-versatile.o
+physmap-objs-$(CONFIG_MTD_PHYSMAP_GEMINI) += physmap-gemini.o
 physmap-objs			:= $(physmap-objs-y)
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
 obj-$(CONFIG_MTD_PISMO)		+= pismo.o
diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 2dc33ae71335..c7a12c394529 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -40,8 +40,8 @@
 #include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
 
-#include "physmap_of_gemini.h"
-#include "physmap_of_versatile.h"
+#include "physmap-gemini.h"
+#include "physmap-versatile.h"
 
 struct physmap_flash_info {
 	unsigned int		nmaps;
diff --git a/drivers/mtd/maps/physmap_of_gemini.c b/drivers/mtd/maps/physmap-gemini.c
similarity index 98%
rename from drivers/mtd/maps/physmap_of_gemini.c
rename to drivers/mtd/maps/physmap-gemini.c
index 9df62ca721d5..1cf128a0526d 100644
--- a/drivers/mtd/maps/physmap_of_gemini.c
+++ b/drivers/mtd/maps/physmap-gemini.c
@@ -13,7 +13,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/bitops.h>
-#include "physmap_of_gemini.h"
+#include "physmap-gemini.h"
 
 /*
  * The Flash-relevant parts of the global status register
diff --git a/drivers/mtd/maps/physmap_of_gemini.h b/drivers/mtd/maps/physmap-gemini.h
similarity index 90%
rename from drivers/mtd/maps/physmap_of_gemini.h
rename to drivers/mtd/maps/physmap-gemini.h
index 60e13a689d6a..72bd04ce3fdb 100644
--- a/drivers/mtd/maps/physmap_of_gemini.h
+++ b/drivers/mtd/maps/physmap-gemini.h
@@ -2,7 +2,7 @@
 #include <linux/of.h>
 #include <linux/mtd/map.h>
 
-#ifdef CONFIG_MTD_PHYSMAP_OF_GEMINI
+#ifdef CONFIG_MTD_PHYSMAP_GEMINI
 int of_flash_probe_gemini(struct platform_device *pdev,
 			  struct device_node *np,
 			  struct map_info *map);
diff --git a/drivers/mtd/maps/physmap_of_versatile.c b/drivers/mtd/maps/physmap-versatile.c
similarity index 99%
rename from drivers/mtd/maps/physmap_of_versatile.c
rename to drivers/mtd/maps/physmap-versatile.c
index 03f2b6e7bc7e..0179d710bb3f 100644
--- a/drivers/mtd/maps/physmap_of_versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -28,7 +28,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/bitops.h>
-#include "physmap_of_versatile.h"
+#include "physmap-versatile.h"
 
 static struct regmap *syscon_regmap;
 
diff --git a/drivers/mtd/maps/physmap_of_versatile.h b/drivers/mtd/maps/physmap-versatile.h
similarity index 90%
rename from drivers/mtd/maps/physmap_of_versatile.h
rename to drivers/mtd/maps/physmap-versatile.h
index 0302502c9462..9cf39d031f5a 100644
--- a/drivers/mtd/maps/physmap_of_versatile.h
+++ b/drivers/mtd/maps/physmap-versatile.h
@@ -2,7 +2,7 @@
 #include <linux/of.h>
 #include <linux/mtd/map.h>
 
-#ifdef CONFIG_MTD_PHYSMAP_OF_VERSATILE
+#ifdef CONFIG_MTD_PHYSMAP_VERSATILE
 int of_flash_probe_versatile(struct platform_device *pdev,
 			     struct device_node *np,
 			     struct map_info *map);
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
