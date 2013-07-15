From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 04/10] watchdog: orion: Use the proper watchdog register
Date: Mon, 15 Jul 2013 20:32:37 -0300
Message-ID: <1373931163-12670-5-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1373931163-12670-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373931163-12670-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Until now the watchdog driver was using the timer control register
to access the watchdog counter register. This is not appropriate,
given the timer control register should be controlled by the clocksource
driver alone.

Fix this by passing the correct register address to the driver and making
direct use of it. Note that this breaks the current device-tree binding
compatibility since it changes the meaning of the 'reg' property.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-kirkwood/include/mach/bridge-regs.h | 1 +
 arch/arm/mach-orion5x/include/mach/bridge-regs.h  | 1 +
 arch/arm/plat-orion/common.c                      | 2 +-
 drivers/watchdog/orion_wdt.c                      | 7 +++----
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-kirkwood/include/mach/bridge-regs.h b/arch/arm/mach-kirkwood/include/mach/bridge-regs.h
index d4cbe5e..c3f361d 100644
--- a/arch/arm/mach-kirkwood/include/mach/bridge-regs.h
+++ b/arch/arm/mach-kirkwood/include/mach/bridge-regs.h
@@ -40,6 +40,7 @@
 
 #define TIMER_VIRT_BASE		(BRIDGE_VIRT_BASE + 0x0300)
 #define TIMER_PHYS_BASE		(BRIDGE_PHYS_BASE + 0x0300)
+#define WDT_PHYS_BASE		(BRIDGE_PHYS_BASE + 0x0324)
 
 #define L2_CONFIG_REG		(BRIDGE_VIRT_BASE + 0x0128)
 #define L2_WRITETHROUGH		0x00000010
diff --git a/arch/arm/mach-orion5x/include/mach/bridge-regs.h b/arch/arm/mach-orion5x/include/mach/bridge-regs.h
index 461fd69..aa35de3 100644
--- a/arch/arm/mach-orion5x/include/mach/bridge-regs.h
+++ b/arch/arm/mach-orion5x/include/mach/bridge-regs.h
@@ -36,4 +36,5 @@
 
 #define TIMER_VIRT_BASE		(ORION5X_BRIDGE_VIRT_BASE + 0x300)
 #define TIMER_PHYS_BASE		(ORION5X_BRIDGE_PHYS_BASE + 0x300)
+#define WDT_PHYS_BASE		(ORION5X_BRIDGE_PHYS_BASE + 0x324)
 #endif
diff --git a/arch/arm/plat-orion/common.c b/arch/arm/plat-orion/common.c
index c019b7a..77fac6c 100644
--- a/arch/arm/plat-orion/common.c
+++ b/arch/arm/plat-orion/common.c
@@ -595,7 +595,7 @@ void __init orion_spi_1_init(unsigned long mapbase)
  * Watchdog
  ****************************************************************************/
 static struct resource orion_wdt_resource =
-		DEFINE_RES_MEM(TIMER_PHYS_BASE, 0x28);
+		DEFINE_RES_MEM(WDT_PHYS_BASE, 0x04);
 
 static struct platform_device orion_wdt_device = {
 	.name		= "orion_wdt",
diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index c0597f4..01bcf53 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -32,7 +32,6 @@
  * Watchdog timer block registers.
  */
 #define WDT_EN			0x0010
-#define WDT_VAL			0x0024
 
 #define WDT_MAX_CYCLE_COUNT	0xffffffff
 #define WDT_IN_USE		0
@@ -51,7 +50,7 @@ static int orion_wdt_ping(struct watchdog_device *wdt_dev)
 	spin_lock(&wdt_lock);
 
 	/* Reload watchdog duration */
-	writel(wdt_tclk * wdt_dev->timeout, wdt_reg + WDT_VAL);
+	writel(wdt_tclk * wdt_dev->timeout, wdt_reg);
 
 	spin_unlock(&wdt_lock);
 	return 0;
@@ -64,7 +63,7 @@ static int orion_wdt_start(struct watchdog_device *wdt_dev)
 	spin_lock(&wdt_lock);
 
 	/* Set watchdog duration */
-	writel(wdt_tclk * wdt_dev->timeout, wdt_reg + WDT_VAL);
+	writel(wdt_tclk * wdt_dev->timeout, wdt_reg);
 
 	/* Clear watchdog timer interrupt */
 	reg = readl(BRIDGE_CAUSE);
@@ -106,7 +105,7 @@ static unsigned int orion_wdt_get_timeleft(struct watchdog_device *wdt_dev)
 	unsigned int time_left;
 
 	spin_lock(&wdt_lock);
-	time_left = readl(wdt_reg + WDT_VAL) / wdt_tclk;
+	time_left = readl(wdt_reg) / wdt_tclk;
 	spin_unlock(&wdt_lock);
 
 	return time_left;
-- 
1.8.1.5
