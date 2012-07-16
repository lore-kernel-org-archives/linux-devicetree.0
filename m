From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/7] ARM: EXYNOS: Adding DRM platform device
Date: Mon, 16 Jul 2012 17:41:23 +0530
Message-ID: <1342440686-21860-5-git-send-email-l.krishna@samsung.com>
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

Add DRM platform device to machine file for exynos5.

Signed-off-by: Prathyush K <prathyush.k-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 652a537..a91c928 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -17,6 +17,7 @@
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
+#include <asm/io.h>
 #include <mach/map.h>
 
 #include <plat/cpu.h>
@@ -29,6 +30,22 @@
 #include <video/platform_lcd.h>
 
 
+static void exynos_fimd_gpio_setup_24bpp(void)
+{
+	unsigned int reg = 0;
+	/*
+	 * Set DISP1BLK_CFG register for Display path selection
+	 * FIMD of DISP1_BLK Bypass selection : DISP1BLK_CFG[15]
+	 * ---------------------
+	 * 0 | MIE/MDNIE
+	 * 1 | FIMD : selected
+	 */
+	reg = __raw_readl(S3C_VA_SYS + 0x0214);
+	reg &= ~(1 << 15);      /* To save other reset values */
+	reg |= (1 << 15);
+	__raw_writel(reg, S3C_VA_SYS + 0x0214);
+}
+
 static int smdk5250_bl_notify(struct device *unused, int brightness)
 {
 	/* manage lcd_bl_en signal */
@@ -51,6 +68,14 @@ static struct platform_pwm_backlight_data smdk5250_bl_data = {
 	.notify		= smdk5250_bl_notify,
 };
 
+static struct platform_device exynos_drm_device = {
+	.name		= "exynos-drm",
+	.dev = {
+		.dma_mask = &exynos_drm_device.dev.coherent_dma_mask,
+		.coherent_dma_mask = 0xffffffffUL,
+	}
+};
+
 static void lcd_set_power(struct plat_lcd_data *pd,
 			unsigned int power)
 {
@@ -134,6 +159,7 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 
 static struct platform_device *smdk5250_devices[] __initdata = {
 	&smdk5250_lcd, /* for platform_lcd device */
+	&exynos_drm_device,
 };
 
 static void __init exynos5250_dt_map_io(void)
@@ -147,6 +173,7 @@ static void __init exynos5250_dt_machine_init(void)
 	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
 	of_platform_populate(NULL, of_default_bus_match_table,
 				exynos5250_auxdata_lookup, NULL);
+	exynos_fimd_gpio_setup_24bpp();
 	platform_add_devices(smdk5250_devices, ARRAY_SIZE(smdk5250_devices));
 }
 
-- 
1.7.0.4
