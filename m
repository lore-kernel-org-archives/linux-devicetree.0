From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
Date: Fri, 11 Nov 2016 15:12:57 +1030
Message-ID: <CACPK8Xc=AcA=d+O++W07ki+KkCxA86EnXj7dqTRobTpb9WQbUw@mail.gmail.com>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478688149-4554-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 9, 2016 at 9:12 PM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:
> This driver adds mtd support for spi-nor attached to either or both of
> the Firmware Memory Controller or the SPI Flash Controller (AST2400
> only).
>
> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
> ones found on the AST2400. The differences are on the number of
> supported flash modules and their default mappings in the SoC address
> space.
>
> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
> for the host firmware. All controllers have now the same set of
> registers compatible with the AST2400 FMC controller and the legacy
> 'SMC' controller is fully gone.
>
> Each controller has a memory range on which it maps its flash module
> slaves. Each slave is assigned a memory window for its mapping that
> can be changed at bootime with the Segment Address Register.
>
> Each SPI flash slave can then be accessed in two modes: Command and
> User. When in User mode, accesses to the memory segment of the slaves
> are translated in SPI transfers. When in Command mode, the HW
> generates the SPI commands automatically and the memory segment is
> accessed as if doing a MMIO.
>
> Currently, only the User mode is supported. Command mode needs a
> little more work to check that the memory window on the AHB bus fits
> the module size.
>
> Based on previous work from Milton D. Miller II <miltonm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> ---
>  Tested on:
>
>  * OpenPOWER Palmetto (AST2400) with
>         FMC controller : n25q256a
>         SPI controller : mx25l25635e and n25q512ax3
>
>  * Evaluation board (AST2500) with
>         FMC controller : w25q256
>         SPI controller : w25q256
>
>  * OpenPOWER Witherspoon (AST2500) with
>         FMC controller : mx25l25635e * 2
>         SPI controller : mx66l1g45g

It's also in use on the Zaius and Barreleye OpenBMC systems.

In that respect, I would like to see this merged once it's deemed
ready by the mtd maintainers. We can follow up with the extra features
in future patches.

I've reviewed and tested this as Cedric and Milton have developed it,
so please add:

Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Cheers,

Joel

>
>  Changes since v2:
>
>  - added a set4b ops to handle difference in the controllers
>  - simplified the IO routines
>  - prepared for fast read using dummy cycles
>
>  Work in progress:
>
>  - read optimization using higher SPI clock frequencies
>  - command mode to direct reads from AHB
>  - DMA support
>
>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  72 ++
>  drivers/mtd/spi-nor/Kconfig                        |  12 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/aspeed-smc.c                   | 783 +++++++++++++++=
++++++
>  4 files changed, 868 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
