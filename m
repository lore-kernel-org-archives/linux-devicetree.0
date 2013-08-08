Return-Path: <devicetree-owner@vger.kernel.org>
Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]:2619 "EHLO
	va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965297Ab3HHP3V (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 8 Aug 2013 11:29:21 -0400
Message-ID: <1375975785.29305.1.camel@linux-builds1>
Subject: Re: [RESEND PATCH 4/4] arm: socfpga: Add support for SD/MMC and
 ethernet to defconfig
From: Dinh Nguyen <dinguyen@altera.com>
Date: Thu, 8 Aug 2013 10:29:45 -0500
In-Reply-To: <20130808090111.GA5167@amd.pavel.ucw.cz>
References: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
	 <1375739925-9110-5-git-send-email-dinguyen@altera.com>
	 <20130808090111.GA5167@amd.pavel.ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: ZY - pavel <pavel@denx.de>
Cc: dinh.linux@gmail.com, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
List-ID: <devicetree@vger.kernel.org>

On Thu, 2013-08-08 at 11:01 +0200, ZY - pavel wrote:
> Hi!
> 
> > From: Dinh Nguyen <dinguyen@altera.com>
> > 
> > Update the socfpga_defconfig to include dw_mmc driver and Micrel PHY.
> > Also enable EXT3 and NFS FS support.
> > 
> > Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
> > Tested-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> 
> > @@ -82,3 +86,7 @@ CONFIG_DEBUG_INFO=y
> >  CONFIG_ENABLE_DEFAULT_TRACERS=y
> >  CONFIG_DEBUG_USER=y
> >  CONFIG_XZ_DEC=y
> > +CONFIG_MMC=y
> > +CONFIG_MMC_DW=y
> > +CONFIG_MMC_DW_PLTFM=y
> > +CONFIG_MMC_DW_SOCFPGA=y
> 
> Actually, I was confused here. This series does not seem to enable MMC,
> so it probably should not be enabled in defconfig.

You need this patch, which you reviewed also.

http://archive.arm.linux.org.uk/lurker/message/20130805.204312.7f9a34d2.en.html

I'm staging these patches at:

git.rocketboards.org:linux-socfpga-next.git for-next

Dinh

> 
> [Patch below can be used to get MMC working, but is not
> production-quality.]
> 
> Thanks,
> 								Pavel
> 
> commit 035495806fddc3f0dfdd23630185d6c1e0ec0923
> Author: Pavel Machek <pavel@denx.de>
> Date:   Thu Aug 8 10:57:56 2013 +0200
> 
>     With these patches, mmc now works.
> 
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index d950c67..0e5881b 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -449,6 +449,23 @@
>  			status = "disabled";
>  		};
>  
> +               mmc: dwmmc0@ff704000 {
> +                       compatible = "snps,dw-mshc";
> +                       reg = <0xff704000 0x1000>;
> +                       interrupts = <0 139 4>;
> +                       bus-hz = <12500000>; /*12.5 MHz*/
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       num-slots = <1>;
> +                       supports-highspeed;
> +                       broken-cd;
> +                       fifo-depth = <0x400>;
> +                       slot@0 {
> +                               reg = <0>;
> +                               bus-width = <4>;
> +                       };
> +               };
> +
>  		gmac1: ethernet@ff702000 {
>  			compatible = "altr,socfpga-stmmac", "snps,dwmac-3.70a", "snps,dwmac";
>  			reg = <0xff702000 0x2000>;
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index ee5f167..8e40030 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -38,10 +38,16 @@
>  
>  #include "dw_mmc.h"
>  
> +#define SDMMC_INT_DTO                  BIT(9)
> +
>  /* Common flag combinations */
> -#define DW_MCI_DATA_ERROR_FLAGS	(SDMMC_INT_DRTO | SDMMC_INT_DCRC | \
> -				 SDMMC_INT_HTO | SDMMC_INT_SBE  | \
> -				 SDMMC_INT_EBE)
> +/* According to Synopsys, the data starvation interrupt (HTO) should not treat
> + * as error. Software should continue the data transfer. We have verified this
> + * in Virtual Target. The same is applied to FIFO under/overrun (FRUN) as well.
> + */
> +#define DW_MCI_DATA_ERROR_FLAGS (SDMMC_INT_DTO | SDMMC_INT_DCRC | \
> +				 SDMMC_INT_HTO | SDMMC_INT_FRUN | SDMMC_INT_SBE | SDMMC_INT_EBE)
> +
>  #define DW_MCI_CMD_ERROR_FLAGS	(SDMMC_INT_RTO | SDMMC_INT_RCRC | \
>  				 SDMMC_INT_RESP_ERR)
>  #define DW_MCI_ERROR_FLAGS	(DW_MCI_DATA_ERROR_FLAGS | \
> @@ -276,6 +282,9 @@ static u32 dw_mci_prepare_command(struct mmc_host *mmc, struct mmc_command *cmd)
>  	if (drv_data && drv_data->prepare_command)
>  		drv_data->prepare_command(slot->host, &cmdr);
>  
> +	if (slot->host->use_hold_reg)
> +		cmdr |= SDMMC_CMD_USE_HOLD_REG;
> +
>  	return cmdr;
>  }
>  
> @@ -2125,6 +2134,11 @@ static struct dw_mci_board *dw_mci_parse_dt(struct dw_mci *host)
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> +	if (of_property_read_u32(dev->of_node, "bus-hz", &pdata->bus_hz)) {
> +		dev_err(dev, "couldn't determine bus-hz\n");
> +		pdata->bus_hz = 50000000;
> +	}
> +
>  	/* find out number of slots supported */
>  	if (of_property_read_u32(dev->of_node, "num-slots",
>  				&pdata->num_slots)) {
> @@ -2287,6 +2301,9 @@ int dw_mci_probe(struct dw_mci *host)
>  		host->data_shift = 2;
>  	}
>  
> +	/* Get the USE_HOLD_REG */
> +	host->use_hold_reg = mci_readl(host, CMD) & SDMMC_CMD_USE_HOLD_REG;
> +
>  	/* Reset all blocks */
>  	if (!mci_wait_reset(host->dev, host))
>  		return -ENODEV;
> diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_mmc.h
> index 198f0fa..b8bcfed 100644
> --- a/include/linux/mmc/dw_mmc.h
> +++ b/include/linux/mmc/dw_mmc.h
> @@ -187,6 +187,9 @@ struct dw_mci {
>  	struct regulator	*vmmc;	/* Power regulator */
>  	unsigned long		irq_flags; /* IRQ flags */
>  	int			irq;
> +
> +	/* Set to one for SDR12 and SDR25 */
> +	unsigned int use_hold_reg;
>  };
>  
>  /* DMA ops for Internal/External DMAC interface */
> 
> 



