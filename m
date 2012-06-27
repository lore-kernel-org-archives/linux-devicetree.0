From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/4] mtd: lpc32xx_slc: Select AMBA_PL08X in Kconfig
Date: Wed, 27 Jun 2012 20:15:42 +0100
Message-ID: <20120627191542.GC25319@n2100.arm.linux.org.uk>
References: <1340812275-1197-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1340812275-1197-1-git-send-email-stigge@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org, aletes.xgr@gmail.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2012 at 05:51:12PM +0200, Roland Stigge wrote:
> From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> 
> Since this driver depends on the amba pl08x dma driver, select it in Kconfig.
> 
> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> Signed-off-by: Roland Stigge <stigge@antcom.de>
> ---
>  drivers/mtd/nand/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index de69978..a9e8b73 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -417,6 +417,7 @@ config MTD_NAND_PXA3xx
>  config MTD_NAND_SLC_LPC32XX
>  	tristate "NXP LPC32xx SLC Controller"
>  	depends on ARCH_LPC32XX
> +	select AMBA_PL08X
>  	help
>  	  Enables support for NXP's LPC32XX SLC (i.e. for Single Level Cell
>  	  chips) NAND controller. This is the default for the PHYTEC 3250

Surely not?  Drivers using DMA engine really should not depend on any
particular DMA engine implementation.
