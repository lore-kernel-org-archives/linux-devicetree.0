From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 1/6] mtd: nand: use Marvell reworked NAND controller
 driver with all platforms
Date: Thu, 22 Feb 2018 10:49:43 +0100
Message-ID: <20180222104943.5a155319@bbrezillon>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
 <20180219223557.2458-2-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180219223557.2458-2-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Richard Weinberger <richard@nod.at>, Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, Nadav Haklai <nadavh@marvell.com>, Marek Vasut <marek.vasut@gmail.com>, linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>, linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Gregory Clement <gregory.clement@bootlin.com>, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

+Arnd and the LAKML

Arnd, Robert, I'd like to apply this patch through the MTD tree so
we can get rid of the pxa driver in 4.17. Robert already gave his
Tested-by, but I wanted to make sure this was okay for me to take it
through the MTD tree. I can provide an immutable branch if needed.

Thanks,

Boris

On Mon, 19 Feb 2018 23:35:52 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Compile marvell_nand.c instead of pxa3xx_nand.c with all PXA based SoCs.
> Convert all board files and defconfigs so that the new driver is used
> everywhere instead of the old one.
> 
> Board files using CONFIG_MTD_NAND_PXA3xx now use CONFIG_MTD_NAND_MARVELL
> instead.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  arch/arm/configs/cm_x300_defconfig  | 2 +-
>  arch/arm/configs/pxa3xx_defconfig   | 3 +--
>  arch/arm/configs/pxa_defconfig      | 2 +-
>  arch/arm/configs/raumfeld_defconfig | 2 +-
>  arch/arm/mach-mmp/ttc_dkb.c         | 4 ++--
>  arch/arm/mach-pxa/cm-x300.c         | 2 +-
>  arch/arm/mach-pxa/colibri-pxa3xx.c  | 2 +-
>  arch/arm/mach-pxa/colibri.h         | 2 +-
>  arch/arm/mach-pxa/littleton.c       | 4 ++--
>  arch/arm/mach-pxa/mxm8x10.c         | 4 ++--
>  arch/arm/mach-pxa/zylonite.c        | 4 ++--
>  11 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
> index c0418e03d180..5e349c625b71 100644
> --- a/arch/arm/configs/cm_x300_defconfig
> +++ b/arch/arm/configs/cm_x300_defconfig
> @@ -49,7 +49,7 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_NAND=y
> -CONFIG_MTD_NAND_PXA3xx=y
> +CONFIG_MTD_NAND_MARVELL=y
>  CONFIG_MTD_UBI=y
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_RAM=y
> diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
> index bfea6874b0a1..3e0de035ab77 100644
> --- a/arch/arm/configs/pxa3xx_defconfig
> +++ b/arch/arm/configs/pxa3xx_defconfig
> @@ -32,8 +32,7 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_NAND=y
> -CONFIG_MTD_NAND_PXA3xx=y
> -CONFIG_MTD_NAND_PXA3xx_BUILTIN=y
> +CONFIG_MTD_NAND_MARVELL=y
>  CONFIG_MTD_ONENAND=y
>  CONFIG_MTD_ONENAND_VERIFY_WRITE=y
>  CONFIG_MTD_ONENAND_GENERIC=y
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index 837d0c9c8b0e..5655a1cee87d 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -197,7 +197,7 @@ CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0x4000000
>  CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
>  CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
>  CONFIG_MTD_NAND_SHARPSL=m
> -CONFIG_MTD_NAND_PXA3xx=m
> +CONFIG_MTD_NAND_MARVELL=m
>  CONFIG_MTD_NAND_CM_X270=m
>  CONFIG_MTD_NAND_TMIO=m
>  CONFIG_MTD_NAND_BRCMNAND=m
> diff --git a/arch/arm/configs/raumfeld_defconfig b/arch/arm/configs/raumfeld_defconfig
> index 77a56c23c6ef..2dd56e9a484e 100644
> --- a/arch/arm/configs/raumfeld_defconfig
> +++ b/arch/arm/configs/raumfeld_defconfig
> @@ -33,7 +33,7 @@ CONFIG_NFTL=y
>  CONFIG_NFTL_RW=y
>  CONFIG_MTD_BLOCK2MTD=y
>  CONFIG_MTD_NAND=y
> -CONFIG_MTD_NAND_PXA3xx=y
> +CONFIG_MTD_NAND_MARVELL=y
>  CONFIG_MTD_UBI=y
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_ISL29003=y
> diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/mach-mmp/ttc_dkb.c
> index d90c74fa614d..e0b6073c61a7 100644
> --- a/arch/arm/mach-mmp/ttc_dkb.c
> +++ b/arch/arm/mach-mmp/ttc_dkb.c
> @@ -178,7 +178,7 @@ static struct mv_usb_platform_data ttc_usb_pdata = {
>  #endif
>  #endif
>  
> -#if IS_ENABLED(CONFIG_MTD_NAND_PXA3xx)
> +#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
>  static struct pxa3xx_nand_platform_data dkb_nand_info = {
>  	.enable_arbiter = 1,
>  	.num_cs = 1,
> @@ -275,7 +275,7 @@ static void __init ttc_dkb_init(void)
>  
>  	/* on-chip devices */
>  	pxa910_add_uart(1);
> -#if IS_ENABLED(CONFIG_MTD_NAND_PXA3xx)
> +#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
>  	pxa910_add_nand(&dkb_nand_info);
>  #endif
>  
> diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
> index c487401b6fdb..de1f8c995076 100644
> --- a/arch/arm/mach-pxa/cm-x300.c
> +++ b/arch/arm/mach-pxa/cm-x300.c
> @@ -391,7 +391,7 @@ static void __init cm_x300_init_ac97(void)
>  static inline void cm_x300_init_ac97(void) {}
>  #endif
>  
> -#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
> +#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
>  static struct mtd_partition cm_x300_nand_partitions[] = {
>  	[0] = {
>  		.name        = "OBM",
> diff --git a/arch/arm/mach-pxa/colibri-pxa3xx.c b/arch/arm/mach-pxa/colibri-pxa3xx.c
> index b04431bb4ba7..3018eafd723e 100644
> --- a/arch/arm/mach-pxa/colibri-pxa3xx.c
> +++ b/arch/arm/mach-pxa/colibri-pxa3xx.c
> @@ -110,7 +110,7 @@ void __init colibri_pxa3xx_init_lcd(int bl_pin)
>  }
>  #endif
>  
> -#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
> +#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
>  static struct mtd_partition colibri_nand_partitions[] = {
>  	{
>  		.name        = "bootloader",
> diff --git a/arch/arm/mach-pxa/colibri.h b/arch/arm/mach-pxa/colibri.h
> index 673a131da875..85525d49e321 100644
> --- a/arch/arm/mach-pxa/colibri.h
> +++ b/arch/arm/mach-pxa/colibri.h
> @@ -46,7 +46,7 @@ static inline void colibri_pxa3xx_init_lcd(int bl_pin) {}
>  extern void colibri_pxa3xx_init_eth(struct ax_plat_data *plat_data);
>  #endif
>  
> -#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
> +#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
>  extern void colibri_pxa3xx_init_nand(void);
>  #else
>  static inline void colibri_pxa3xx_init_nand(void) {}
> diff --git a/arch/arm/mach-pxa/littleton.c b/arch/arm/mach-pxa/littleton.c
> index 4105614cc38e..193dccca1086 100644
> --- a/arch/arm/mach-pxa/littleton.c
> +++ b/arch/arm/mach-pxa/littleton.c
> @@ -291,7 +291,7 @@ static void __init littleton_init_mmc(void)
>  static inline void littleton_init_mmc(void) {}
>  #endif
>  
> -#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
> +#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
>  static struct mtd_partition littleton_nand_partitions[] = {
>  	[0] = {
>  		.name        = "Bootloader",
> @@ -341,7 +341,7 @@ static void __init littleton_init_nand(void)
>  }
>  #else
>  static inline void littleton_init_nand(void) {}
> -#endif /* CONFIG_MTD_NAND_PXA3xx || CONFIG_MTD_NAND_PXA3xx_MODULE */
> +#endif /* IS_ENABLED(CONFIG_MTD_NAND_MARVELL) */
>  
>  #if defined(CONFIG_I2C_PXA) || defined(CONFIG_I2C_PXA_MODULE)
>  static struct led_info littleton_da9034_leds[] = {
> diff --git a/arch/arm/mach-pxa/mxm8x10.c b/arch/arm/mach-pxa/mxm8x10.c
> index f9e3d41a4609..5cc379c0626c 100644
> --- a/arch/arm/mach-pxa/mxm8x10.c
> +++ b/arch/arm/mach-pxa/mxm8x10.c
> @@ -359,7 +359,7 @@ void __init mxm_8x10_ac97_init(void)
>  }
>  
>  /* NAND flash Support */
> -#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
> +#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
>  #define NAND_BLOCK_SIZE SZ_128K
>  #define NB(x)           (NAND_BLOCK_SIZE * (x))
>  static struct mtd_partition mxm_8x10_nand_partitions[] = {
> @@ -402,7 +402,7 @@ static void __init mxm_8x10_nand_init(void)
>  }
>  #else
>  static inline void mxm_8x10_nand_init(void) {}
> -#endif /* CONFIG_MTD_NAND_PXA3xx || CONFIG_MTD_NAND_PXA3xx_MODULE */
> +#endif /* IS_ENABLED(CONFIG_MTD_NAND_MARVELL) */
>  
>  /* Ethernet support: Davicom DM9000 */
>  static struct resource dm9k_resources[] = {
> diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
> index 4268552d600d..3a99fc054e96 100644
> --- a/arch/arm/mach-pxa/zylonite.c
> +++ b/arch/arm/mach-pxa/zylonite.c
> @@ -338,7 +338,7 @@ static void __init zylonite_init_keypad(void)
>  static inline void zylonite_init_keypad(void) {}
>  #endif
>  
> -#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
> +#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
>  static struct mtd_partition zylonite_nand_partitions[] = {
>  	[0] = {
>  		.name        = "Bootloader",
> @@ -388,7 +388,7 @@ static void __init zylonite_init_nand(void)
>  }
>  #else
>  static inline void zylonite_init_nand(void) {}
> -#endif /* CONFIG_MTD_NAND_PXA3xx || CONFIG_MTD_NAND_PXA3xx_MODULE */
> +#endif /* IS_ENABLED(CONFIG_MTD_NAND_MARVELL) */
>  
>  #if defined(CONFIG_USB_OHCI_HCD) || defined(CONFIG_USB_OHCI_HCD_MODULE)
>  static struct pxaohci_platform_data zylonite_ohci_info = {



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
