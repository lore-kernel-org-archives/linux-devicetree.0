From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/7] mmc: support sdhci-esdhc-imx as an OF device
Date: Tue, 15 Mar 2011 13:59:26 -0600
Message-ID: <20110315195926.GB20845@angua.secretlab.ca>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
	<1300112759-3495-6-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1300112759-3495-6-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 14, 2011 at 10:25:57PM +0800, Shawn Guo wrote:
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

dt support can be added directly to sdchi-pltfm.c drivers now.  There
is no longer any need to use sdhci-of-core.c any more.  For an
example, see the patch titled "of/tegra: add sdhci device tree
handling" in my devicetree/test branch.

http://git.secretlab.ca/?p=linux-2.6.git;a=commit;h=1437bd1d5a1fec2dcf17d9fde73b385569c82084

g.

> ---
>  drivers/mmc/host/Kconfig         |    7 ++++---
>  drivers/mmc/host/Makefile        |    3 ++-
>  drivers/mmc/host/sdhci-of-core.c |    3 +++
>  drivers/mmc/host/sdhci-of.h      |    1 +
>  4 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index afe8c6f..9746ec1 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -133,12 +133,13 @@ config MMC_SDHCI_CNS3XXX
>  	  If unsure, say N.
>  
>  config MMC_SDHCI_ESDHC_IMX
> -	bool "SDHCI platform support for the Freescale eSDHC i.MX controller"
> -	depends on MMC_SDHCI_PLTFM && (ARCH_MX25 || ARCH_MX35 || ARCH_MX5)
> +	bool "SDHCI support for the Freescale eSDHC i.MX controller"
> +	depends on ARCH_MX25 || ARCH_MX35 || ARCH_MX5
> +	depends on MMC_SDHCI_PLTFM || MMC_SDHCI_OF
>  	select MMC_SDHCI_IO_ACCESSORS
>  	help
>  	  This selects the Freescale eSDHC controller support on the platform
> -	  bus, found on platforms like mx35/51.
> +	  or OF bus, found on platforms like mx35/51.
>  
>  	  If unsure, say N.
>  
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index e834fb2..cca8dfd 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -39,7 +39,6 @@ obj-$(CONFIG_MMC_USHC)		+= ushc.o
>  obj-$(CONFIG_MMC_SDHCI_PLTFM)			+= sdhci-platform.o
>  sdhci-platform-y				:= sdhci-pltfm.o
>  sdhci-platform-$(CONFIG_MMC_SDHCI_CNS3XXX)	+= sdhci-cns3xxx.o
> -sdhci-platform-$(CONFIG_MMC_SDHCI_ESDHC_IMX)	+= sdhci-esdhc-imx.o
>  sdhci-platform-$(CONFIG_MMC_SDHCI_DOVE)		+= sdhci-dove.o
>  sdhci-platform-$(CONFIG_MMC_SDHCI_TEGRA)	+= sdhci-tegra.o
>  
> @@ -48,6 +47,8 @@ sdhci-of-y				:= sdhci-of-core.o
>  sdhci-of-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
>  sdhci-of-$(CONFIG_MMC_SDHCI_OF_HLWD)	+= sdhci-of-hlwd.o
>  
> +obj-$(CONFIG_MMC_SDHCI_ESDHC_IMX)	+= sdhci-esdhc-imx.o
> +
>  ifeq ($(CONFIG_CB710_DEBUG),y)
>  	CFLAGS-cb710-mmc	+= -DDEBUG
>  endif
> diff --git a/drivers/mmc/host/sdhci-of-core.c b/drivers/mmc/host/sdhci-of-core.c
> index 0b32ad7..d803fa5 100644
> --- a/drivers/mmc/host/sdhci-of-core.c
> +++ b/drivers/mmc/host/sdhci-of-core.c
> @@ -32,6 +32,9 @@
>  #include "sdhci.h"
>  
>  static const struct of_device_id sdhci_of_match[] = {
> +#ifdef CONFIG_MMC_SDHCI_ESDHC_IMX
> +	{ .compatible = "fsl,imx-esdhc", .data = &sdhci_esdhc_imx_data, },
> +#endif
>  #ifdef CONFIG_MMC_SDHCI_OF_ESDHC
>  	{ .compatible = "fsl,mpc8379-esdhc", .data = &sdhci_esdhc_data, },
>  	{ .compatible = "fsl,mpc8536-esdhc", .data = &sdhci_esdhc_data, },
> diff --git a/drivers/mmc/host/sdhci-of.h b/drivers/mmc/host/sdhci-of.h
> index e88fe2e..90fb2eb 100644
> --- a/drivers/mmc/host/sdhci-of.h
> +++ b/drivers/mmc/host/sdhci-of.h
> @@ -31,6 +31,7 @@ extern void sdhci_be32bs_writel(struct sdhci_host *host, u32 val, int reg);
>  extern void sdhci_be32bs_writew(struct sdhci_host *host, u16 val, int reg);
>  extern void sdhci_be32bs_writeb(struct sdhci_host *host, u8 val, int reg);
>  
> +extern struct sdhci_data sdhci_esdhc_imx_data;
>  extern struct sdhci_data sdhci_esdhc_data;
>  extern struct sdhci_data sdhci_hlwd_data;
>  
> -- 
> 1.7.1
> 
