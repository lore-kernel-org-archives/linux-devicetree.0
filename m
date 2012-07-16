From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/7] ARM: EXYNOS5: add machine specific support for LCD
Date: Mon, 16 Jul 2012 17:41:22 +0530
Message-ID: <1342440686-21860-4-git-send-email-l.krishna@samsung.com>
References: <1342440686-21860-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1342440686-21860-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds machine specific support for LCD controller like setting power to LCD
and adding LCD platform device.

Signed-off-by: Prathyush K <prathyush.k-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |   57 ++++++++++++++++++++++++++++++++
 1 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 0a200fd..652a537 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -13,6 +13,7 @@
 #include <linux/serial_core.h>
 #include <linux/pwm_backlight.h>
 #include <linux/gpio.h>
+#include <linux/delay.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -25,6 +26,8 @@
 
 #include "common.h"
 
+#include <video/platform_lcd.h>
+
 
 static int smdk5250_bl_notify(struct device *unused, int brightness)
 {
@@ -48,6 +51,55 @@ static struct platform_pwm_backlight_data smdk5250_bl_data = {
 	.notify		= smdk5250_bl_notify,
 };
 
+static void lcd_set_power(struct plat_lcd_data *pd,
+			unsigned int power)
+{
+
+	/* reset */
+	gpio_request_one(EXYNOS5_GPX1(5), GPIOF_OUT_INIT_HIGH, "GPX1");
+
+	mdelay(20);
+	if (power) {
+		/* fire nRESET on power up */
+		gpio_set_value(EXYNOS5_GPX1(5), 0);
+		mdelay(20);
+		gpio_set_value(EXYNOS5_GPX1(5), 1);
+		mdelay(20);
+		gpio_free(EXYNOS5_GPX1(5));
+	} else {
+		/* fire nRESET on power off */
+		gpio_set_value(EXYNOS5_GPX1(5), 0);
+		mdelay(20);
+		gpio_set_value(EXYNOS5_GPX1(5), 1);
+		mdelay(20);
+		gpio_free(EXYNOS5_GPX1(5));
+	}
+	mdelay(20);
+
+	/*
+	 * Request lcd_bl_en GPIO for smdk5250_bl_notify().
+	 * TODO: Fix this so we are not at risk of requesting the GPIO
+	 * multiple times, this should be done with device tree, and
+	 * likely integrated into the plat-samsung/dev-backlight.c init.
+	 */
+	gpio_request_one(EXYNOS5_GPX3(0), GPIOF_OUT_INIT_LOW, "GPX3");
+}
+
+static int smdk5250_match_fb(struct plat_lcd_data *pd, struct fb_info *info)
+{
+	/* Don't call .set_power callback while unblanking */
+	return 0;
+}
+
+static struct plat_lcd_data smdk5250_lcd_data = {
+	.set_power	= lcd_set_power,
+	.match_fb	= smdk5250_match_fb,
+};
+
+static struct platform_device smdk5250_lcd = {
+	.name			= "platform-lcd",
+	.dev.platform_data	= &smdk5250_lcd_data,
+};
 /*
  * The following lookup table is used to override device names when devices
  * are registered from device tree. This is temporarily added to enable
@@ -80,6 +132,10 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	{},
 };
 
+static struct platform_device *smdk5250_devices[] __initdata = {
+	&smdk5250_lcd, /* for platform_lcd device */
+};
+
 static void __init exynos5250_dt_map_io(void)
 {
 	exynos_init_io(NULL, 0);
@@ -91,6 +147,7 @@ static void __init exynos5250_dt_machine_init(void)
 	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
 	of_platform_populate(NULL, of_default_bus_match_table,
 				exynos5250_auxdata_lookup, NULL);
+	platform_add_devices(smdk5250_devices, ARRAY_SIZE(smdk5250_devices));
 }
 
 static char const *exynos5250_dt_compat[] __initdata = {
-- 
1.7.0.4
