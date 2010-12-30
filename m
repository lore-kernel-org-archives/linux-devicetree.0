From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] OF: make drivers depend on CONFIG_OF instead of
	CONFIG_PPC_OF
Date: Wed, 29 Dec 2010 17:56:58 -0700
Message-ID: <20101230005658.GJ32711@angua.secretlab.ca>
References: <1290037824-24978-1-git-send-email-robherring2@gmail.com>
	<1290037824-24978-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1290037824-24978-4-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 17, 2010 at 05:50:24PM -0600, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Some OF drivers could likely be used on non-powerpc OF based platforms,
> so fix the kconfig depends to be CONFIG_OF instead of CONFIG_PPC_OF.
> 
> Compile tested on ARM and sparc.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Since I'm not picking up patch 1/3, this patch doesn't apply.  I'll
skip this one too.

g.

> ---
>  drivers/char/ipmi/ipmi_si_intf.c |   14 +++++++-------
>  drivers/mmc/host/Kconfig         |    4 +++-
>  drivers/mtd/Kconfig              |    2 +-
>  drivers/mtd/maps/Kconfig         |    2 +-
>  drivers/serial/Kconfig           |    2 +-
>  5 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 9167e04..e8f3497 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -66,7 +66,7 @@
>  #include <linux/ctype.h>
>  #include <linux/pnp.h>
>  
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
>  #include <linux/of_device.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> @@ -309,7 +309,7 @@ static int pci_registered;
>  #ifdef CONFIG_ACPI
>  static int pnp_registered;
>  #endif
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
>  static int plat_registered;
>  #endif
>  
> @@ -2531,7 +2531,7 @@ static struct pci_driver ipmi_pci_driver = {
>  #endif /* CONFIG_PCI */
>  
>  
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
>  static int __devinit ipmi_plat_probe(struct platform_device *dev)
>  {
>  	struct smi_info *info;
> @@ -2644,7 +2644,7 @@ static struct platform_driver ipmi_platform_driver = {
>  	.probe		= ipmi_plat_probe,
>  	.remove		= __devexit_p(ipmi_plat_remove),
>  };
> -#endif /* CONFIG_PPC_OF */
> +#endif /* CONFIG_OF */
>  
>  static int wait_for_msg_done(struct smi_info *smi_info)
>  {
> @@ -3381,7 +3381,7 @@ static __devinit int init_ipmi_si(void)
>  	spmi_find_bmc();
>  #endif
>  
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
>  	platform_driver_register(&ipmi_platform_driver);
>  	plat_registered = 1;
>  #endif
> @@ -3441,7 +3441,7 @@ static __devinit int init_ipmi_si(void)
>  			pci_unregister_driver(&ipmi_pci_driver);
>  #endif
>  
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
>  		if (plat_registered)
>  			platform_driver_unregister(&ipmi_platform_driver);
>  #endif
> @@ -3542,7 +3542,7 @@ static __exit void cleanup_ipmi_si(void)
>  		pnp_unregister_driver(&ipmi_pnp_driver);
>  #endif
>  
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
>  	if (plat_registered)
>  		platform_driver_unregister(&ipmi_platform_driver);
>  #endif
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 68d1279..ec94465 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -83,7 +83,7 @@ config MMC_RICOH_MMC
>  
>  config MMC_SDHCI_OF
>  	tristate "SDHCI support on OpenFirmware platforms"
> -	depends on MMC_SDHCI && PPC_OF
> +	depends on MMC_SDHCI && OF
>  	help
>  	  This selects the OF support for Secure Digital Host Controller
>  	  Interfaces.
> @@ -93,6 +93,7 @@ config MMC_SDHCI_OF
>  config MMC_SDHCI_OF_ESDHC
>  	bool "SDHCI OF support for the Freescale eSDHC controller"
>  	depends on MMC_SDHCI_OF
> +	depends on PPC_OF
>  	select MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
>  	help
>  	  This selects the Freescale eSDHC controller support.
> @@ -102,6 +103,7 @@ config MMC_SDHCI_OF_ESDHC
>  config MMC_SDHCI_OF_HLWD
>  	bool "SDHCI OF support for the Nintendo Wii SDHCI controllers"
>  	depends on MMC_SDHCI_OF
> +	depends on PPC_OF
>  	select MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
>  	help
>  	  This selects the Secure Digital Host Controller Interface (SDHCI)
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 1e2cbf5..b1f7689 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -159,7 +159,7 @@ config MTD_AFS_PARTS
>  
>  config MTD_OF_PARTS
>  	tristate "Flash partition map based on OF description"
> -	depends on (MICROBLAZE || PPC_OF) && MTD_PARTITIONS
> +	depends on OF && MTD_PARTITIONS
>  	help
>  	  This provides a partition parsing function which derives
>  	  the partition map from the children of the flash node,
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 701d942..83346d6 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -72,7 +72,7 @@ config MTD_PHYSMAP_BANKWIDTH
>  
>  config MTD_PHYSMAP_OF
>  	tristate "Flash device in physical memory map based on OF description"
> -	depends on (MICROBLAZE || PPC_OF) && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
> +	depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
>  	help
>  	  This provides a 'mapping' driver which allows the NOR Flash and
>  	  ROM driver code to communicate with chips which are mapped
> diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
> index 12900f7..83f3400 100644
> --- a/drivers/serial/Kconfig
> +++ b/drivers/serial/Kconfig
> @@ -1408,7 +1408,7 @@ config SERIAL_NETX_CONSOLE
>  
>  config SERIAL_OF_PLATFORM
>  	tristate "Serial port on Open Firmware platform bus"
> -	depends on PPC_OF || MICROBLAZE
> +	depends on OF
>  	depends on SERIAL_8250 || SERIAL_OF_PLATFORM_NWPSERIAL
>  	help
>  	  If you have a PowerPC based system that has serial ports
> -- 
> 1.7.1
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
