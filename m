From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 5/6] ARM: dove: convert to DT irqchip and clocksource
Date: Thu,  6 Jun 2013 18:27:13 +0200
Message-ID: <1370536034-23956-6-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370536034-23956-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With recent support for true irqchip and clocksource drivers for Orion
SoCs, now make use of it on DT enabled Dove boards.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/mach-dove/Kconfig    |    2 ++
 arch/arm/mach-dove/Makefile   |    4 ++--
 arch/arm/mach-dove/board-dt.c |   23 ++++++++++++++++-------
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-dove/Kconfig b/arch/arm/mach-dove/Kconfig
index dff7b2f..0bc7cdf 100644
--- a/arch/arm/mach-dove/Kconfig
+++ b/arch/arm/mach-dove/Kconfig
@@ -23,6 +23,8 @@ config MACH_CM_A510
 config MACH_DOVE_DT
 	bool "Marvell Dove Flattened Device Tree"
 	select DOVE_CLK
+	select ORION_IRQCHIP
+	select ORION_TIMER
 	select REGULATOR
 	select REGULATOR_FIXED_VOLTAGE
 	select USE_OF
diff --git a/arch/arm/mach-dove/Makefile b/arch/arm/mach-dove/Makefile
index 4d9d2ff..cbc5c06 100644
--- a/arch/arm/mach-dove/Makefile
+++ b/arch/arm/mach-dove/Makefile
@@ -1,5 +1,5 @@
-obj-y				+= common.o irq.o
-obj-$(CONFIG_DOVE_LEGACY)	+= mpp.o
+obj-y				+= common.o
+obj-$(CONFIG_DOVE_LEGACY)	+= irq.o mpp.o
 obj-$(CONFIG_PCI)		+= pcie.o
 obj-$(CONFIG_MACH_DOVE_DB)	+= dove-db-setup.o
 obj-$(CONFIG_MACH_DOVE_DT)	+= board-dt.o
diff --git a/arch/arm/mach-dove/board-dt.c b/arch/arm/mach-dove/board-dt.c
index b3d65e8..b4ed3da 100644
--- a/arch/arm/mach-dove/board-dt.c
+++ b/arch/arm/mach-dove/board-dt.c
@@ -10,10 +10,13 @@
 
 #include <linux/init.h>
 #include <linux/clk-provider.h>
+#include <linux/clocksource.h>
+#include <linux/irqchip.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <asm/hardware/cache-tauros2.h>
 #include <asm/mach/arch.h>
+#include <mach/dove.h>
 #include <mach/pm.h>
 #include <plat/common.h>
 #include <plat/irq.h>
@@ -41,10 +44,17 @@ static void __init dove_legacy_clk_init(void)
 			 of_clk_get_from_provider(&clkspec));
 }
 
-static void __init dove_of_clk_init(void)
+static void __init dove_dt_time_init(void)
 {
 	of_clk_init(NULL);
-	dove_legacy_clk_init();
+	clocksource_of_init();
+}
+
+static void __init dove_dt_init_early(void)
+{
+	mvebu_mbus_init("marvell,dove-mbus",
+			BRIDGE_WINS_BASE, BRIDGE_WINS_SZ,
+			DOVE_MC_WINS_BASE, DOVE_MC_WINS_SZ);
 }
 
 static void __init dove_dt_init(void)
@@ -56,8 +66,8 @@ static void __init dove_dt_init(void)
 #endif
 	dove_setup_cpu_wins();
 
-	/* Setup root of clk tree */
-	dove_of_clk_init();
+	/* setup clocks for legacy devices */
+	dove_legacy_clk_init();
 
 	/* Internal devices not ported to DT yet */
 	dove_pcie_init(1, 1);
@@ -72,9 +82,8 @@ static const char * const dove_dt_board_compat[] = {
 
 DT_MACHINE_START(DOVE_DT, "Marvell Dove (Flattened Device Tree)")
 	.map_io		= dove_map_io,
-	.init_early	= dove_init_early,
-	.init_irq	= orion_dt_init_irq,
-	.init_time	= dove_timer_init,
+	.init_early	= dove_dt_init_early,
+	.init_time	= dove_dt_time_init,
 	.init_machine	= dove_dt_init,
 	.restart	= dove_restart,
 	.dt_compat	= dove_dt_board_compat,
-- 
1.7.2.5
