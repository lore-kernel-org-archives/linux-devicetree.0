From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/7] mmc: consolidate sdhci_pltfm_data and sdhci_of_data
	into one
Date: Tue, 15 Mar 2011 13:55:13 -0600
Message-ID: <20110315195513.GA20845@angua.secretlab.ca>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
	<1300112759-3495-5-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1300112759-3495-5-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

On Mon, Mar 14, 2011 at 10:25:56PM +0800, Shawn Guo wrote:
> This patch is motivated by the work of supporting sdhci-esdhc-imx as
> an OF device.  The sdhci-esdhc-imx driver was well designed to be
> able to work with either platform or OF bus, with a little effort to
> decouple the driver from sdhci_pltfm_data.
> 
> Like sdhci_ops works for both platform and OF sdhci driver, the patch
> demonstrates that sdhci_pltfm_data and sdhci_of_data can be
> consolidated into sdhci_data, which should work for both.  As one of
> the results, header linux/mmc/sdhci-pltfm.h can be deleted.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

I like the push to unify DT and non-DT usage with the SDHCI drivers,
but I'm not convinced on the approach.  Actually, that's more a
comment on the existing code than it is on the this patch.

I don't like the way that sdhci-pltfm.c and sdhci-of-core.c each take
responsibility for the .probe hook on each of the implementations.
Doing it that way means that each implementation needs to add a set of
hooks into those core files protected by #ifdefs based on whether or
not the driver is enabled.  It also means that loading one driver
means that all the configured sdhci drivers get loaded into the
kernel.  This seems backwards.

>From what I can see, sdhci-pltfm.c and sdhci-of-core.c both provide
useful common functions that would be used by all sdhci host drivers.
The interface would be a lot cleaner if those routines were exported
for use by other modules, and each driver registered its own probe
hook.  It would keep all the driver specific stuff out of
sdhci_pltfm_ids and I think it would result in a cleaner interface
overall.

Here is how I would do it:

1) break the bulk of the sdhci_pltfm.c and sdhci_of_core.c .probe and
.remove hooks out into separate functions; callable by other modules
2) for each driver, add its own probe and remove hooks which calls
into the new functions created in step 1.  This would eliminate the
need for the ->exit and ->init callbacks since they would get rolled
into the new .probe and .remove callbacks
3) finally, when all drivers are removed; eliminate the driver
registration from sdhci_pltfm.c and sdhci_of_core.c because there
wouldn't be any users left.

drivers/mmc/host/sdhci-pxa.c appears to be a good example of how I
think sdhci platform_drivers should be structured.

At the same time, the functionality from sdhci_of_core.c could easily
be migrated into sdhci_pltfm.c.

g.

> ---
>  drivers/mmc/host/sdhci-cns3xxx.c   |    3 +-
>  drivers/mmc/host/sdhci-dove.c      |    2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c |   19 ++++++-------
>  drivers/mmc/host/sdhci-of-core.c   |   50 +++++++++++++++++++++++-------------
>  drivers/mmc/host/sdhci-of-esdhc.c  |   28 +++++++++++---------
>  drivers/mmc/host/sdhci-of-hlwd.c   |   20 ++++++++------
>  drivers/mmc/host/sdhci-of.h        |    9 +-----
>  drivers/mmc/host/sdhci-pltfm.c     |   47 ++++++++++++++++-----------------
>  drivers/mmc/host/sdhci-pltfm.h     |   18 ++++++------
>  drivers/mmc/host/sdhci-tegra.c     |   10 +++---
>  drivers/mmc/host/sdhci.h           |   15 +++++++++++
>  include/linux/mmc/sdhci-pltfm.h    |   35 -------------------------
>  12 files changed, 123 insertions(+), 133 deletions(-)
>  delete mode 100644 include/linux/mmc/sdhci-pltfm.h
> 
> diff --git a/drivers/mmc/host/sdhci-cns3xxx.c b/drivers/mmc/host/sdhci-cns3xxx.c
> index 9ebd1d7..6d494d5 100644
> --- a/drivers/mmc/host/sdhci-cns3xxx.c
> +++ b/drivers/mmc/host/sdhci-cns3xxx.c
> @@ -15,7 +15,6 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/mmc/host.h>
> -#include <linux/mmc/sdhci-pltfm.h>
>  #include <mach/cns3xxx.h>
>  #include "sdhci.h"
>  #include "sdhci-pltfm.h"
> @@ -86,7 +85,7 @@ static struct sdhci_ops sdhci_cns3xxx_ops = {
>  	.set_clock	= sdhci_cns3xxx_set_clock,
>  };
>  
> -struct sdhci_pltfm_data sdhci_cns3xxx_pdata = {
> +struct sdhci_data sdhci_cns3xxx_data = {
>  	.ops = &sdhci_cns3xxx_ops,
>  	.quirks = SDHCI_QUIRK_BROKEN_DMA |
>  		  SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK |
> diff --git a/drivers/mmc/host/sdhci-dove.c b/drivers/mmc/host/sdhci-dove.c
> index 2aeef4f..7d14402 100644
> --- a/drivers/mmc/host/sdhci-dove.c
> +++ b/drivers/mmc/host/sdhci-dove.c
> @@ -61,7 +61,7 @@ static struct sdhci_ops sdhci_dove_ops = {
>  	.read_l	= sdhci_dove_readl,
>  };
>  
> -struct sdhci_pltfm_data sdhci_dove_pdata = {
> +struct sdhci_data sdhci_dove_data = {
>  	.ops	= &sdhci_dove_ops,
>  	.quirks	= SDHCI_QUIRK_NO_SIMULT_VDD_AND_POWER |
>  		  SDHCI_QUIRK_NO_BUSY_IRQ |
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 9b82910..dfd1ccb 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -16,7 +16,6 @@
>  #include <linux/err.h>
>  #include <linux/clk.h>
>  #include <linux/mmc/host.h>
> -#include <linux/mmc/sdhci-pltfm.h>
>  #include <mach/hardware.h>
>  #include "sdhci.h"
>  #include "sdhci-pltfm.h"
> @@ -86,21 +85,21 @@ static void esdhc_writeb_le(struct sdhci_host *host, u8 val, int reg)
>  	esdhc_clrset_le(host, 0xff, val, reg);
>  }
>  
> -static unsigned int esdhc_pltfm_get_max_clock(struct sdhci_host *host)
> +static unsigned int esdhc_get_max_clock(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  
>  	return clk_get_rate(pltfm_host->clk);
>  }
>  
> -static unsigned int esdhc_pltfm_get_min_clock(struct sdhci_host *host)
> +static unsigned int esdhc_get_min_clock(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  
>  	return clk_get_rate(pltfm_host->clk) / 256 / 16;
>  }
>  
> -static int esdhc_pltfm_init(struct sdhci_host *host, struct sdhci_pltfm_data *pdata)
> +static int esdhc_init(struct sdhci_host *host, struct sdhci_data *pdata)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct clk *clk;
> @@ -123,7 +122,7 @@ static int esdhc_pltfm_init(struct sdhci_host *host, struct sdhci_pltfm_data *pd
>  	return 0;
>  }
>  
> -static void esdhc_pltfm_exit(struct sdhci_host *host)
> +static void esdhc_exit(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  
> @@ -136,14 +135,14 @@ static struct sdhci_ops sdhci_esdhc_ops = {
>  	.write_w = esdhc_writew_le,
>  	.write_b = esdhc_writeb_le,
>  	.set_clock = esdhc_set_clock,
> -	.get_max_clock = esdhc_pltfm_get_max_clock,
> -	.get_min_clock = esdhc_pltfm_get_min_clock,
> +	.get_max_clock = esdhc_get_max_clock,
> +	.get_min_clock = esdhc_get_min_clock,
>  };
>  
> -struct sdhci_pltfm_data sdhci_esdhc_imx_pdata = {
> +struct sdhci_data sdhci_esdhc_imx_data = {
>  	.quirks = ESDHC_DEFAULT_QUIRKS | SDHCI_QUIRK_BROKEN_ADMA,
>  	/* ADMA has issues. Might be fixable */
>  	.ops = &sdhci_esdhc_ops,
> -	.init = esdhc_pltfm_init,
> -	.exit = esdhc_pltfm_exit,
> +	.init = esdhc_init,
> +	.exit = esdhc_exit,
>  };
> diff --git a/drivers/mmc/host/sdhci-of-core.c b/drivers/mmc/host/sdhci-of-core.c
> index dd84124..0b32ad7 100644
> --- a/drivers/mmc/host/sdhci-of-core.c
> +++ b/drivers/mmc/host/sdhci-of-core.c
> @@ -23,6 +23,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> +#include <linux/of_device.h>
>  #include <linux/mmc/host.h>
>  #ifdef CONFIG_PPC
>  #include <asm/machdep.h>
> @@ -30,6 +31,20 @@
>  #include "sdhci-of.h"
>  #include "sdhci.h"
>  
> +static const struct of_device_id sdhci_of_match[] = {
> +#ifdef CONFIG_MMC_SDHCI_OF_ESDHC
> +	{ .compatible = "fsl,mpc8379-esdhc", .data = &sdhci_esdhc_data, },
> +	{ .compatible = "fsl,mpc8536-esdhc", .data = &sdhci_esdhc_data, },
> +	{ .compatible = "fsl,esdhc", .data = &sdhci_esdhc_data, },
> +#endif
> +#ifdef CONFIG_MMC_SDHCI_OF_HLWD
> +	{ .compatible = "nintendo,hollywood-sdhci", .data = &sdhci_hlwd, },
> +#endif
> +	{ .compatible = "generic-sdhci", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sdhci_of_match);
> +
>  #ifdef CONFIG_MMC_SDHCI_BIG_ENDIAN_32BIT_BYTE_SWAPPER
>  
>  /*
> @@ -128,7 +143,7 @@ static int __devinit sdhci_of_probe(struct platform_device *ofdev,
>  				 const struct of_device_id *match)
>  {
>  	struct device_node *np = ofdev->dev.of_node;
> -	struct sdhci_of_data *sdhci_of_data = match->data;
> +	struct sdhci_data *data = match->data;
>  	struct sdhci_host *host;
>  	struct sdhci_of_host *of_host;
>  	const __be32 *clk;
> @@ -158,9 +173,14 @@ static int __devinit sdhci_of_probe(struct platform_device *ofdev,
>  	}
>  
>  	host->hw_name = dev_name(&ofdev->dev);
> -	if (sdhci_of_data) {
> -		host->quirks = sdhci_of_data->quirks;
> -		host->ops = &sdhci_of_data->ops;
> +	if (data) {
> +		host->quirks = data->quirks;
> +		host->ops = data->ops;
> +		if (data->init) {
> +			ret = data->init(host, data);
> +			if (ret)
> +				goto err_of_init;
> +		}
>  	}
>  
>  	if (of_get_property(np, "sdhci,auto-cmd12", NULL))
> @@ -184,6 +204,9 @@ static int __devinit sdhci_of_probe(struct platform_device *ofdev,
>  	return 0;
>  
>  err_add_host:
> +	if (data && data->exit)
> +		data->exit(host);
> +err_of_init:
>  	irq_dispose_mapping(host->irq);
>  err_no_irq:
>  	iounmap(host->ioaddr);
> @@ -195,7 +218,12 @@ err_addr_map:
>  static int __devexit sdhci_of_remove(struct platform_device *ofdev)
>  {
>  	struct sdhci_host *host = dev_get_drvdata(&ofdev->dev);
> +	const struct of_device_id *match =
> +			of_match_device(sdhci_of_match, &ofdev->dev);
> +	struct sdhci_data *data = match->data;
>  
> +	if (data && data->exit)
> +		data->exit(host);
>  	sdhci_remove_host(host, 0);
>  	sdhci_free_host(host);
>  	irq_dispose_mapping(host->irq);
> @@ -203,20 +231,6 @@ static int __devexit sdhci_of_remove(struct platform_device *ofdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id sdhci_of_match[] = {
> -#ifdef CONFIG_MMC_SDHCI_OF_ESDHC
> -	{ .compatible = "fsl,mpc8379-esdhc", .data = &sdhci_esdhc, },
> -	{ .compatible = "fsl,mpc8536-esdhc", .data = &sdhci_esdhc, },
> -	{ .compatible = "fsl,esdhc", .data = &sdhci_esdhc, },
> -#endif
> -#ifdef CONFIG_MMC_SDHCI_OF_HLWD
> -	{ .compatible = "nintendo,hollywood-sdhci", .data = &sdhci_hlwd, },
> -#endif
> -	{ .compatible = "generic-sdhci", },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, sdhci_of_match);
> -
>  static struct of_platform_driver sdhci_of_driver = {
>  	.driver = {
>  		.name = "sdhci-of",
> diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
> index fcd0e1f..8a68e7a 100644
> --- a/drivers/mmc/host/sdhci-of-esdhc.c
> +++ b/drivers/mmc/host/sdhci-of-esdhc.c
> @@ -72,18 +72,20 @@ static unsigned int esdhc_of_get_min_clock(struct sdhci_host *host)
>  	return of_host->clock / 256 / 16;
>  }
>  
> -struct sdhci_of_data sdhci_esdhc = {
> +static struct sdhci_ops sdhci_esdhc_ops = {
> +	.read_l = sdhci_be32bs_readl,
> +	.read_w = esdhc_readw,
> +	.read_b = sdhci_be32bs_readb,
> +	.write_l = sdhci_be32bs_writel,
> +	.write_w = esdhc_writew,
> +	.write_b = esdhc_writeb,
> +	.set_clock = esdhc_set_clock,
> +	.enable_dma = esdhc_of_enable_dma,
> +	.get_max_clock = esdhc_of_get_max_clock,
> +	.get_min_clock = esdhc_of_get_min_clock,
> +};
> +
> +struct sdhci_of_data sdhci_esdhc_data = {
>  	.quirks = ESDHC_DEFAULT_QUIRKS,
> -	.ops = {
> -		.read_l = sdhci_be32bs_readl,
> -		.read_w = esdhc_readw,
> -		.read_b = sdhci_be32bs_readb,
> -		.write_l = sdhci_be32bs_writel,
> -		.write_w = esdhc_writew,
> -		.write_b = esdhc_writeb,
> -		.set_clock = esdhc_set_clock,
> -		.enable_dma = esdhc_of_enable_dma,
> -		.get_max_clock = esdhc_of_get_max_clock,
> -		.get_min_clock = esdhc_of_get_min_clock,
> -	},
> +	.ops = &sdhci_esdhc_ops,
>  };
> diff --git a/drivers/mmc/host/sdhci-of-hlwd.c b/drivers/mmc/host/sdhci-of-hlwd.c
> index 68ddb75..188a317 100644
> --- a/drivers/mmc/host/sdhci-of-hlwd.c
> +++ b/drivers/mmc/host/sdhci-of-hlwd.c
> @@ -51,15 +51,17 @@ static void sdhci_hlwd_writeb(struct sdhci_host *host, u8 val, int reg)
>  	udelay(SDHCI_HLWD_WRITE_DELAY);
>  }
>  
> -struct sdhci_of_data sdhci_hlwd = {
> +static struct sdhci_ops sdhci_hlwd_ops = {
> +	.read_l = sdhci_be32bs_readl,
> +	.read_w = sdhci_be32bs_readw,
> +	.read_b = sdhci_be32bs_readb,
> +	.write_l = sdhci_hlwd_writel,
> +	.write_w = sdhci_hlwd_writew,
> +	.write_b = sdhci_hlwd_writeb,
> +};
> +
> +struct sdhci_of_data sdhci_hlwd_data = {
>  	.quirks = SDHCI_QUIRK_32BIT_DMA_ADDR |
>  		  SDHCI_QUIRK_32BIT_DMA_SIZE,
> -	.ops = {
> -		.read_l = sdhci_be32bs_readl,
> -		.read_w = sdhci_be32bs_readw,
> -		.read_b = sdhci_be32bs_readb,
> -		.write_l = sdhci_hlwd_writel,
> -		.write_w = sdhci_hlwd_writew,
> -		.write_b = sdhci_hlwd_writeb,
> -	},
> +	.ops = &sdhci_hlwd_ops,
>  };
> diff --git a/drivers/mmc/host/sdhci-of.h b/drivers/mmc/host/sdhci-of.h
> index ad09ad9..e88fe2e 100644
> --- a/drivers/mmc/host/sdhci-of.h
> +++ b/drivers/mmc/host/sdhci-of.h
> @@ -19,11 +19,6 @@
>  #include <linux/types.h>
>  #include "sdhci.h"
>  
> -struct sdhci_of_data {
> -	unsigned int quirks;
> -	struct sdhci_ops ops;
> -};
> -
>  struct sdhci_of_host {
>  	unsigned int clock;
>  	u16 xfer_mode_shadow;
> @@ -36,7 +31,7 @@ extern void sdhci_be32bs_writel(struct sdhci_host *host, u32 val, int reg);
>  extern void sdhci_be32bs_writew(struct sdhci_host *host, u16 val, int reg);
>  extern void sdhci_be32bs_writeb(struct sdhci_host *host, u8 val, int reg);
>  
> -extern struct sdhci_of_data sdhci_esdhc;
> -extern struct sdhci_of_data sdhci_hlwd;
> +extern struct sdhci_data sdhci_esdhc_data;
> +extern struct sdhci_data sdhci_hlwd_data;
>  
>  #endif /* __SDHCI_OF_H */
> diff --git a/drivers/mmc/host/sdhci-pltfm.c b/drivers/mmc/host/sdhci-pltfm.c
> index 4125fbf..6b4f94c 100644
> --- a/drivers/mmc/host/sdhci-pltfm.c
> +++ b/drivers/mmc/host/sdhci-pltfm.c
> @@ -30,7 +30,6 @@
>  #include <linux/mmc/host.h>
>  
>  #include <linux/io.h>
> -#include <linux/mmc/sdhci-pltfm.h>
>  
>  #include "sdhci.h"
>  #include "sdhci-pltfm.h"
> @@ -53,7 +52,7 @@ static struct sdhci_ops sdhci_pltfm_ops = {
>  #include <linux/of_device.h>
>  static const struct of_device_id sdhci_dt_ids[] = {
>  #ifdef CONFIG_MMC_SDHCI_TEGRA
> -	{ .compatible = "nvidia,tegra250-sdhci", .data = &sdhci_tegra_dt_pdata },
> +	{ .compatible = "nvidia,tegra250-sdhci", .data = &sdhci_tegra_dt_data },
>  #endif
>  	{ }
>  };
> @@ -75,18 +74,18 @@ static int __devinit sdhci_pltfm_probe(struct platform_device *pdev)
>  {
>  	const struct platform_device_id *platid = platform_get_device_id(pdev);
>  	const struct of_device_id *dtid = sdhci_get_of_device_id(pdev);
> -	struct sdhci_pltfm_data *pdata;
> +	struct sdhci_data *data;
>  	struct sdhci_host *host;
>  	struct sdhci_pltfm_host *pltfm_host;
>  	struct resource *iomem;
>  	int ret;
>  
>  	if (platid && platid->driver_data)
> -		pdata = (void *)platid->driver_data;
> +		data = (void *)platid->driver_data;
>  	else if (dtid && dtid->data)
> -		pdata = dtid->data;
> +		data = dtid->data;
>  	else
> -		pdata = pdev->dev.platform_data;
> +		data = pdev->dev.platform_data;
>  
>  	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!iomem) {
> @@ -112,12 +111,12 @@ static int __devinit sdhci_pltfm_probe(struct platform_device *pdev)
>  	pltfm_host = sdhci_priv(host);
>  
>  	host->hw_name = "platform";
> -	if (pdata && pdata->ops)
> -		host->ops = pdata->ops;
> +	if (data && data->ops)
> +		host->ops = data->ops;
>  	else
>  		host->ops = &sdhci_pltfm_ops;
> -	if (pdata)
> -		host->quirks = pdata->quirks;
> +	if (data)
> +		host->quirks = data->quirks;
>  	host->irq = platform_get_irq(pdev, 0);
>  
>  	if (!request_mem_region(iomem->start, resource_size(iomem),
> @@ -134,8 +133,8 @@ static int __devinit sdhci_pltfm_probe(struct platform_device *pdev)
>  		goto err_remap;
>  	}
>  
> -	if (pdata && pdata->init) {
> -		ret = pdata->init(host, pdata);
> +	if (data && data->init) {
> +		ret = data->init(host, data);
>  		if (ret)
>  			goto err_plat_init;
>  	}
> @@ -149,8 +148,8 @@ static int __devinit sdhci_pltfm_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_add_host:
> -	if (pdata && pdata->exit)
> -		pdata->exit(host);
> +	if (data && data->exit)
> +		data->exit(host);
>  err_plat_init:
>  	iounmap(host->ioaddr);
>  err_remap:
> @@ -166,18 +165,18 @@ static int __devexit sdhci_pltfm_remove(struct platform_device *pdev)
>  {
>  	const struct platform_device_id *platid = platform_get_device_id(pdev);
>  	const struct of_device_id *dtid = sdhci_get_of_device_id(pdev);
> -	struct sdhci_pltfm_data *pdata;
> +	struct sdhci_data *data;
>  	struct sdhci_host *host = platform_get_drvdata(pdev);
>  	struct resource *iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	int dead;
>  	u32 scratch;
>  
>  	if (platid && platid->driver_data)
> -		pdata = (void *)platid->driver_data;
> +		data = (void *)platid->driver_data;
>  	else if (dtid && dtid->data)
> -		pdata = dtid->data;
> +		data = dtid->data;
>  	else
> -		pdata = pdev->dev.platform_data;
> +		data = pdev->dev.platform_data;
>  
>  	dead = 0;
>  	scratch = readl(host->ioaddr + SDHCI_INT_STATUS);
> @@ -185,8 +184,8 @@ static int __devexit sdhci_pltfm_remove(struct platform_device *pdev)
>  		dead = 1;
>  
>  	sdhci_remove_host(host, dead);
> -	if (pdata && pdata->exit)
> -		pdata->exit(host);
> +	if (data && data->exit)
> +		data->exit(host);
>  	iounmap(host->ioaddr);
>  	release_mem_region(iomem->start, resource_size(iomem));
>  	sdhci_free_host(host);
> @@ -198,16 +197,16 @@ static int __devexit sdhci_pltfm_remove(struct platform_device *pdev)
>  static const struct platform_device_id sdhci_pltfm_ids[] = {
>  	{ "sdhci", },
>  #ifdef CONFIG_MMC_SDHCI_CNS3XXX
> -	{ "sdhci-cns3xxx", (kernel_ulong_t)&sdhci_cns3xxx_pdata },
> +	{ "sdhci-cns3xxx", (kernel_ulong_t)&sdhci_cns3xxx_data },
>  #endif
>  #ifdef CONFIG_MMC_SDHCI_ESDHC_IMX
> -	{ "sdhci-esdhc-imx", (kernel_ulong_t)&sdhci_esdhc_imx_pdata },
> +	{ "sdhci-esdhc-imx", (kernel_ulong_t)&sdhci_esdhc_imx_data },
>  #endif
>  #ifdef CONFIG_MMC_SDHCI_DOVE
> -	{ "sdhci-dove", (kernel_ulong_t)&sdhci_dove_pdata },
> +	{ "sdhci-dove", (kernel_ulong_t)&sdhci_dove_data },
>  #endif
>  #ifdef CONFIG_MMC_SDHCI_TEGRA
> -	{ "sdhci-tegra", (kernel_ulong_t)&sdhci_tegra_pdata },
> +	{ "sdhci-tegra", (kernel_ulong_t)&sdhci_tegra_data },
>  #endif
>  	{ },
>  };
> diff --git a/drivers/mmc/host/sdhci-pltfm.h b/drivers/mmc/host/sdhci-pltfm.h
> index c67523d..a240bc9 100644
> --- a/drivers/mmc/host/sdhci-pltfm.h
> +++ b/drivers/mmc/host/sdhci-pltfm.h
> @@ -8,22 +8,22 @@
>   * published by the Free Software Foundation.
>   */
>  
> -#ifndef _DRIVERS_MMC_SDHCI_PLTFM_H
> -#define _DRIVERS_MMC_SDHCI_PLTFM_H
> +#ifndef _SDHCI_PLTFM_H
> +#define _SDHCI_PLTFM_H
>  
>  #include <linux/clk.h>
>  #include <linux/types.h>
> -#include <linux/mmc/sdhci-pltfm.h>
> +#include "sdhci.h"
>  
>  struct sdhci_pltfm_host {
>  	struct clk *clk;
>  	u32 scratchpad; /* to handle quirks across io-accessor calls */
>  };
>  
> -extern struct sdhci_pltfm_data sdhci_cns3xxx_pdata;
> -extern struct sdhci_pltfm_data sdhci_esdhc_imx_pdata;
> -extern struct sdhci_pltfm_data sdhci_dove_pdata;
> -extern struct sdhci_pltfm_data sdhci_tegra_pdata;
> -extern struct sdhci_pltfm_data sdhci_tegra_dt_pdata;
> +extern struct sdhci_data sdhci_cns3xxx_data;
> +extern struct sdhci_data sdhci_esdhc_imx_data;
> +extern struct sdhci_data sdhci_dove_data;
> +extern struct sdhci_data sdhci_tegra_data;
> +extern struct sdhci_data sdhci_tegra_dt_data;
>  
> -#endif /* _DRIVERS_MMC_SDHCI_PLTFM_H */
> +#endif /* _SDHCI_PLTFM_H */
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index c3d6f83..ec1778d 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -120,7 +120,7 @@ static int tegra_sdhci_8bit(struct sdhci_host *host, int bus_width)
>  
>  
>  static int tegra_sdhci_pltfm_init(struct sdhci_host *host,
> -				  struct sdhci_pltfm_data *pdata)
> +				  struct sdhci_data *data)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct platform_device *pdev = to_platform_device(mmc_dev(host->mmc));
> @@ -214,7 +214,7 @@ out:
>  }
>  
>  static int tegra_sdhci_pltfm_dt_init(struct sdhci_host *host,
> -				     struct sdhci_pltfm_data *pdata)
> +				     struct sdhci_data *data)
>  {
>  	struct platform_device *pdev = to_platform_device(mmc_dev(host->mmc));
>  	struct tegra_sdhci_platform_data *plat;
> @@ -237,7 +237,7 @@ static int tegra_sdhci_pltfm_dt_init(struct sdhci_host *host,
>  	dev_info(&pdev->dev, "using gpios cd=%i, wp=%i power=%i\n",
>  		plat->cd_gpio, plat->wp_gpio, plat->power_gpio);
>  
> -	return tegra_sdhci_pltfm_init(host, pdata);
> +	return tegra_sdhci_pltfm_init(host, data);
>  }
>  
>  static void tegra_sdhci_pltfm_exit(struct sdhci_host *host)
> @@ -285,7 +285,7 @@ static struct sdhci_ops tegra_sdhci_ops = {
>  	.platform_8bit_width = tegra_sdhci_8bit,
>  };
>  
> -struct sdhci_pltfm_data sdhci_tegra_pdata = {
> +struct sdhci_data sdhci_tegra_data = {
>  	.quirks = SDHCI_QUIRK_BROKEN_TIMEOUT_VAL |
>  		  SDHCI_QUIRK_SINGLE_POWER_WRITE |
>  		  SDHCI_QUIRK_NO_HISPD_BIT |
> @@ -295,7 +295,7 @@ struct sdhci_pltfm_data sdhci_tegra_pdata = {
>  	.exit = tegra_sdhci_pltfm_exit,
>  };
>  
> -struct sdhci_pltfm_data sdhci_tegra_dt_pdata = {
> +struct sdhci_data sdhci_tegra_dt_data = {
>  	.quirks = SDHCI_QUIRK_BROKEN_TIMEOUT_VAL |
>  		  SDHCI_QUIRK_SINGLE_POWER_WRITE |
>  		  SDHCI_QUIRK_NO_HISPD_BIT |
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 6e0969e..6388953 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -201,6 +201,21 @@
>  #define SDHCI_MAX_DIV_SPEC_200	256
>  #define SDHCI_MAX_DIV_SPEC_300	2046
>  
> +/**
> + * struct sdhci_data - SDHCI platform/OF specific information & hooks
> + * @ops: optional pointer to the platform/OF provided SDHCI ops
> + * @quirks: optional SDHCI quirks
> + * @init: optional hook that is called during device probe, before the
> + *        driver tries to access any SDHCI registers
> + * @exit: optional hook that is called during device removal
> + */
> +struct sdhci_data {
> +	struct sdhci_ops *ops;
> +	unsigned int quirks;
> +	int (*init)(struct sdhci_host *host, struct sdhci_data *data);
> +	void (*exit)(struct sdhci_host *host);
> +};
> +
>  struct sdhci_ops {
>  #ifdef CONFIG_MMC_SDHCI_IO_ACCESSORS
>  	u32		(*read_l)(struct sdhci_host *host, int reg);
> diff --git a/include/linux/mmc/sdhci-pltfm.h b/include/linux/mmc/sdhci-pltfm.h
> deleted file mode 100644
> index 548d59d..0000000
> --- a/include/linux/mmc/sdhci-pltfm.h
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -/*
> - * Platform data declarations for the sdhci-pltfm driver.
> - *
> - * Copyright (c) 2010 MontaVista Software, LLC.
> - *
> - * Author: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or (at
> - * your option) any later version.
> - */
> -
> -#ifndef _SDHCI_PLTFM_H
> -#define _SDHCI_PLTFM_H
> -
> -struct sdhci_ops;
> -struct sdhci_host;
> -
> -/**
> - * struct sdhci_pltfm_data - SDHCI platform-specific information & hooks
> - * @ops: optional pointer to the platform-provided SDHCI ops
> - * @quirks: optional SDHCI quirks
> - * @init: optional hook that is called during device probe, before the
> - *        driver tries to access any SDHCI registers
> - * @exit: optional hook that is called during device removal
> - */
> -struct sdhci_pltfm_data {
> -	struct sdhci_ops *ops;
> -	unsigned int quirks;
> -	int (*init)(struct sdhci_host *host, struct sdhci_pltfm_data *pdata);
> -	void (*exit)(struct sdhci_host *host);
> -};
> -
> -#endif /* _SDHCI_PLTFM_H */
> -- 
> 1.7.1
> 
