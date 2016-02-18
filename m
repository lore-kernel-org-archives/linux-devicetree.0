From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: colibri-vf: Add pinmux for UART_0 aka UART_A
 RTS/CTS pins
Date: Thu, 18 Feb 2016 23:18:18 +0800
Message-ID: <20160218151818.GF6756@tiger>
References: <1455594361-5870-1-git-send-email-bhuvanchandra.dv@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455594361-5870-1-git-send-email-bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 16, 2016 at 09:16:01AM +0530, Bhuvanchandra DV wrote:
> Add pinmux for UART_A RTS, CTS pin's.
> 
> Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Applied, thanks.

Please copy linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org instead of
linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org when submit such patches in the future.

Shawn

> ---
>  arch/arm/boot/dts/vf-colibri.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
> index e5949b9..700840f 100644
> --- a/arch/arm/boot/dts/vf-colibri.dtsi
> +++ b/arch/arm/boot/dts/vf-colibri.dtsi
> @@ -213,6 +213,8 @@
>  			fsl,pins = <
>  				VF610_PAD_PTB10__UART0_TX		0x21a2
>  				VF610_PAD_PTB11__UART0_RX		0x21a1
> +				VF610_PAD_PTB12__UART0_RTS		0x21a2
> +				VF610_PAD_PTB13__UART0_CTS		0x21a1
>  			>;
>  		};
> 
> --
> 2.7.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
