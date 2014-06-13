From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH] IBM Akebono: Remove obsolete config select
Date: Fri, 13 Jun 2014 13:56:32 +0200
Message-ID: <1402660592.28881.22.camel@x220>
References: <1398998002.2925.15.camel@pasglop>
	 <1399018005-23136-1-git-send-email-alistair@popple.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399018005-23136-1-git-send-email-alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-05-02 at 18:06 +1000, Alistair Popple wrote:
> The original implementation of MMC support for Akebono introduced a
> new configuration symbol (MMC_SDHCI_OF_476GTR). This symbol has been
> dropped in favour of using the generic platform driver however the
> select for this symbol was mistakenly left in the platform
> configuration.
> 
> This patch removes the obsolete symbol selection.
> 
> Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>

This patch hasn't yet entered linux-next nor Linus' tree. Is it queued
somewhere? If not, would a
    Acked-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>

help to get this trivial patch queued for either of those trees?


Paul Bolle

> ---
>  arch/powerpc/platforms/44x/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
> index 8beec7d..908bf11 100644
> --- a/arch/powerpc/platforms/44x/Kconfig
> +++ b/arch/powerpc/platforms/44x/Kconfig
> @@ -220,7 +220,6 @@ config AKEBONO
>  	select USB_EHCI_HCD_PLATFORM
>  	select MMC_SDHCI
>  	select MMC_SDHCI_PLTFM
> -	select MMC_SDHCI_OF_476GTR
>  	select ATA
>  	select SATA_AHCI_PLATFORM
>  	help

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
