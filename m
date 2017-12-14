From: Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH v3 07/11] thermal: armada: Update Kconfig and module description
Date: Thu, 14 Dec 2017 11:30:07 +0100
Message-ID: <20171214103011.24713-8-miquel.raynal@free-electrons.com>
References: <20171214103011.24713-1-miquel.raynal@free-electrons.com>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20171214103011.24713-1-miquel.raynal@free-electrons.com>
Sender: linux-pm-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@free-electrons.com>, Baruch Siach <baruch@tkos.co.il>, David Sniatkiwicz <davidsn@marvell.com>
List-Id: devicetree@vger.kernel.org

Update Armada thermal driver Kconfig entry as well as the driver's
MODULE_DESCRIPTION content, now that 64-bit SoCs are also supported,
eg. Armada 7K and Armada 8K.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/thermal/Kconfig          | 4 ++--
 drivers/thermal/armada_thermal.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 315ae2926e20..44cad046f272 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -301,13 +301,13 @@ config DB8500_THERMAL
 	  thermal zone if trip points reached.
 
 config ARMADA_THERMAL
-	tristate "Armada 370/XP thermal management"
+	tristate "Armada 370/XP/7K/8K thermal management"
 	depends on ARCH_MVEBU || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
 	help
 	  Enable this option if you want to have support for thermal management
-	  controller present in Armada 370 and Armada XP SoC.
+	  controller present in Armada 370, Armada XP, Armada 7K/8K SoCs.
 
 config DA9062_THERMAL
 	tristate "DA9062/DA9061 Dialog Semiconductor thermal driver"
diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
index f5c911524656..da58a8961a37 100644
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -403,5 +403,5 @@ static struct platform_driver armada_thermal_driver = {
 module_platform_driver(armada_thermal_driver);
 
 MODULE_AUTHOR("Ezequiel Garcia <ezequiel.garcia@free-electrons.com>");
-MODULE_DESCRIPTION("Armada 370/XP thermal driver");
+MODULE_DESCRIPTION("Armada SoCs thermal driver");
 MODULE_LICENSE("GPL v2");
-- 
2.11.0
