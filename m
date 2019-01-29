From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 13/13] ARM: lpc32xx: remove platform data of ARM PL111 LCD
 controller
Date: Tue, 29 Jan 2019 21:20:49 +0200
Message-ID: <20190129192049.11223-14-vz@mleia.com>
References: <20190129192049.11223-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129192049.11223-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The auxilary platform data added for the LCD controller is not needed
anymore, because the controller and a connected panel are properly
described in Phytec phyCORE-LPC3250 board dts file.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/mach-lpc32xx/phy3250.c | 77 ---------------------------------
 1 file changed, 77 deletions(-)

diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 568589e918c2..b3be60a8e467 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -45,73 +45,6 @@
 #include <mach/board.h>
 #include "common.h"
 
-/*
- * AMBA LCD controller
- */
-static struct clcd_panel conn_lcd_panel = {
-	.mode		= {
-		.name		= "QVGA portrait",
-		.refresh	= 60,
-		.xres		= 240,
-		.yres		= 320,
-		.pixclock	= 191828,
-		.left_margin	= 22,
-		.right_margin	= 11,
-		.upper_margin	= 2,
-		.lower_margin	= 1,
-		.hsync_len	= 5,
-		.vsync_len	= 2,
-		.sync		= 0,
-		.vmode		= FB_VMODE_NONINTERLACED,
-	},
-	.width		= -1,
-	.height		= -1,
-	.tim2		= (TIM2_IVS | TIM2_IHS),
-	.cntl		= (CNTL_BGR | CNTL_LCDTFT | CNTL_LCDVCOMP(1) |
-				CNTL_LCDBPP16_565),
-	.bpp		= 16,
-};
-#define PANEL_SIZE (3 * SZ_64K)
-
-static int lpc32xx_clcd_setup(struct clcd_fb *fb)
-{
-	dma_addr_t dma;
-
-	fb->fb.screen_base = dma_alloc_wc(&fb->dev->dev, PANEL_SIZE, &dma,
-					  GFP_KERNEL);
-	if (!fb->fb.screen_base) {
-		printk(KERN_ERR "CLCD: unable to map framebuffer\n");
-		return -ENOMEM;
-	}
-
-	fb->fb.fix.smem_start = dma;
-	fb->fb.fix.smem_len = PANEL_SIZE;
-	fb->panel = &conn_lcd_panel;
-
-	return 0;
-}
-
-static int lpc32xx_clcd_mmap(struct clcd_fb *fb, struct vm_area_struct *vma)
-{
-	return dma_mmap_wc(&fb->dev->dev, vma, fb->fb.screen_base,
-			   fb->fb.fix.smem_start, fb->fb.fix.smem_len);
-}
-
-static void lpc32xx_clcd_remove(struct clcd_fb *fb)
-{
-	dma_free_wc(&fb->dev->dev, fb->fb.fix.smem_len, fb->fb.screen_base,
-		    fb->fb.fix.smem_start);
-}
-
-static struct clcd_board lpc32xx_clcd_data = {
-	.name		= "Phytec LCD",
-	.check		= clcdfb_check,
-	.decode		= clcdfb_decode,
-	.setup		= lpc32xx_clcd_setup,
-	.mmap		= lpc32xx_clcd_mmap,
-	.remove		= lpc32xx_clcd_remove,
-};
-
 static struct pl08x_channel_data pl08x_slave_channels[] = {
 	{
 		.bus_id = "nand-slc",
@@ -159,7 +92,6 @@ static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
 static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl022", 0x20084000, "dev:ssp0", NULL),
 	OF_DEV_AUXDATA("arm,pl022", 0x2008C000, "dev:ssp1", NULL),
-	OF_DEV_AUXDATA("arm,pl110", 0x31040000, "dev:clcd", &lpc32xx_clcd_data),
 	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
 	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
 		       &lpc32xx_slc_data),
@@ -170,15 +102,6 @@ static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
 
 static void __init lpc3250_machine_init(void)
 {
-	u32 tmp;
-
-	/* Setup LCD muxing to RGB565 */
-	tmp = __raw_readl(LPC32XX_CLKPWR_LCDCLK_CTRL) &
-		~(LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_MSK |
-		LPC32XX_CLKPWR_LCDCTRL_PSCALE_MSK);
-	tmp |= LPC32XX_CLKPWR_LCDCTRL_LCDTYPE_TFT16;
-	__raw_writel(tmp, LPC32XX_CLKPWR_LCDCLK_CTRL);
-
 	lpc32xx_serial_init();
 
 	/* Test clock needed for UDA1380 initial init */
-- 
2.20.1
