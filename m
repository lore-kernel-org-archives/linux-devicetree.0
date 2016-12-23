From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/3] Static memory controllers for the Aspeed SoC
Date: Fri, 23 Dec 2016 12:22:43 +0100
Message-ID: <cabe37bd-29af-5256-2349-bdc666f0d489@atmel.com>
References: <1482339439-26402-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482339439-26402-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 21/12/2016 à 17:57, Cédric Le Goater a écrit :
> Hello,
> 
> Here is a series introducing a new driver for the different memory
> controllers of the Aspeed AST2500 and AST2400 SoCs. Each SoC has at
> least a memory controller for the BMC firmware and another one for the
> host firmware. The register set are mostly compatible but there are
> some slight differences on the AST2400.
> 
> The driver only supports SPI type flash.
> 
> Tested on:
> 
>  * OpenPOWER Palmetto (AST2400) with
>  	FMC controller : n25q256a
> 	SPI controller : mx25l25635e and n25q512ax3
> 
>  * Evaluation board (AST2500) with
>  	FMC controller : w25q256 
> 	SPI controller : w25q256
> 
>  * OpenPOWER Witherspoon (AST2500) with
>  	FMC controller : mx25l25635e * 2
> 	SPI controller : mx66l1g45g
> 
> Changes since v4:
>  - improved IO routines with Cyrille's suggestions
>  - added dummy bytes hanling for fast read commands
>  - removed the 'label' property from jedec,spi-nor. Needs more
>    discussion.
> 
> Changes since v3:
>  - reworked IO routines to use io{read,write}32_rep
>  - changed config option to SPI_ASPEED_SMC
>  - fixed aspeed_smc_chip_setup_init() returned value
> 
> Changes since v2:
>  - splitted patch to distinguish AST2400 and AST2500 controllers
>  - fixed controller names
>  - introduced prepare/unprepare ops
>  - introduced a aspeed_smc_setup_flash() routine
>  - various cleanups
> 
> Changes since v1:
>  - added a set4b ops to handle difference in the controllers
>  - simplified the IO routines
>  - prepared for fast read using dummy cycles
> 
> Work in progress:
>  - read optimization using higher SPI clock frequencies
>  - command mode to direct reads from AHB
>  - DMA support
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (3):
>   mtd: spi-nor: add memory controllers for the Aspeed AST2500 SoC
>   mtd: aspeed: add memory controllers for the Aspeed AST2400 SoC
>   mtd: spi-nor: bindings for the Aspeed memory controllers
> 
>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  51 ++
>  drivers/mtd/spi-nor/Kconfig                        |  10 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/aspeed-smc.c                   | 759 +++++++++++++++++++++
>  4 files changed, 821 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
> 

Applied to git://github.com/spi-nor/linux.git

Thanks!

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
