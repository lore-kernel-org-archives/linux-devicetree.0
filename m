From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [4/5] IBM Akebono: Add the Akebono platform
Date: Thu, 01 May 2014 11:27:27 +0200
Message-ID: <1398936447.4121.12.camel@x220>
References: <1394077948-8395-5-git-send-email-alistair@popple.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394077948-8395-5-git-send-email-alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-03-06 at 14:52 +1100, Alistair Popple wrote:
> This patch adds support for the IBM Akebono board.

This patch just landed in linux-next (ie, in next-20140501).

> Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
>[...]
> --- a/arch/powerpc/platforms/44x/Kconfig
> +++ b/arch/powerpc/platforms/44x/Kconfig
> @@ -199,6 +199,32 @@ config CURRITUCK
>  	help
>  	  This option enables support for the IBM Currituck (476fpe) evaluation board
>  
> +config AKEBONO
> +	bool "IBM Akebono (476gtr) Support"
> +	depends on PPC_47x
> +	default n
> +	select SWIOTLB
> +	select 476FPE
> +	select PPC4xx_PCI_EXPRESS
> +	select I2C
> +	select I2C_IBM_IIC
> +	select NETDEVICES
> +	select ETHERNET
> +	select NET_VENDOR_IBM
> +	select IBM_EMAC_EMAC4
> +	select IBM_EMAC_RGMII_WOL

The patch that added this symbol (and the related driver) was submitted
in https://lkml.org/lkml/2014/2/21/25 . It's not (yet) included in
linux-next. Is it queued somewhere else?

> +	select USB
> +	select USB_OHCI_HCD_PLATFORM
> +	select USB_EHCI_HCD_PLATFORM
> +	select MMC_SDHCI
> +	select MMC_SDHCI_PLTFM
> +	select MMC_SDHCI_OF_476GTR

The plan to add MMC_SDHCI_OF_476GTR seems to have been abandoned (see
the discussion of https://lkml.org/lkml/2014/2/21/24 ). So this select
is not needed. Should I submit a trivial patch to drop this select?

> +	select ATA
> +	select SATA_AHCI_PLATFORM
> +	help
> +	  This option enables support for the IBM Akebono (476gtr) evaluation board
> +
> +
>  config ICON
>  	bool "Icon"
>  	depends on 44x


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
