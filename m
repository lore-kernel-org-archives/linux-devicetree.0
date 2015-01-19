From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] [linux-next] ARM: mvebu: make DTS comments reflect
 DEBUG_LL changes
Date: Mon, 19 Jan 2015 22:27:18 +0100
Message-ID: <20150119212718.GA2938@lunn.ch>
References: <1421696425.9655.65.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421696425.9655.65.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 19, 2015 at 08:40:25PM +0100, Paul Bolle wrote:
> The Kconfig symbol DEBUG_MVEBU_UART_ALTERNATE was renamed to
> DEBUG_MVEBU_UART0_ALTERNATE. And the symbol DEBUG_MVEBU_UART1_ALTERNATE
> was added to allow UART1 as a DEBUG_LL target. Make the comment at the
> top of this DTS reflect those changes.
> 
> Since we're touching this DTS add comments to show which blocks describe
> UART0 and UART1.
> 
> Signed-off-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>

Hi Paul

Thanks for this. I have added it to mvebu/dt.

       Andrew


> ---
> Created on top of next-20150119. Untested! Note that I know nothing
> about this board or about DT source files, so all changes are nothing
> more than guesses.
> 
>  arch/arm/boot/dts/armada-xp-axpwifiap.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/armada-xp-axpwifiap.dts b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
> index ca0200e20751..28174ab019f9 100644
> --- a/arch/arm/boot/dts/armada-xp-axpwifiap.dts
> +++ b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
> @@ -3,8 +3,8 @@
>   *
>   * Note: this board is shipped with a new generation boot loader that
>   * remaps internal registers at 0xf1000000. Therefore, if earlyprintk
> - * is used, the CONFIG_DEBUG_MVEBU_UART_ALTERNATE option should be
> - * used.
> + * is used, the CONFIG_DEBUG_MVEBU_UART0_ALTERNATE option or the
> + * CONFIG_DEBUG_MVEBU_UART1_ALTERNATE option should be used.
>   *
>   * Copyright (C) 2013 Marvell
>   *
> @@ -60,10 +60,12 @@
>  		};
>  
>  		internal-regs {
> +			/* UART0 */
>  			serial@12000 {
>  				status = "okay";
>  			};
>  
> +			/* UART1 */
>  			serial@12100 {
>  				status = "okay";
>  			};
> -- 
> 1.9.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
