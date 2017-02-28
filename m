From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: only select PINCTRL_SUNXI for
 Allwinner platforms
Date: Tue, 28 Feb 2017 18:19:15 +0000
Message-ID: <c878ba53-a33a-e042-2d65-11f86a47b844@arm.com>
References: <20170228172444.59655-1-icenowy@aosc.xyz>
 <20170228172444.59655-2-icenowy@aosc.xyz>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBQP523CQKGQE2GQO6LQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170228172444.59655-2-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-ymACFijhrKM@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 28/02/17 17:24, Icenowy Zheng wrote:
> As the pinctrl driver selecting is refactored in Kconfig file of
> pinctrl-sunxi, now we can select only PINCTRL_SUNXI for Allwinner
> platform, and the default value of several pinctrl drivers useful on
> ARM64 Allwinner SoCs will become Y.
> 
> Drop the select of per-SoC pinctrl choices, but select PINCTRL_SUNXI.
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
>  arch/arm64/Kconfig.platforms | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 129cc5ae4091..f6db2a938b1e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -4,7 +4,7 @@ config ARCH_SUNXI
>  	bool "Allwinner sunxi 64-bit SoC Family"
>  	select GENERIC_IRQ_CHIP
>  	select PINCTRL
> -	select PINCTRL_SUN50I_A64
> +	select PINCTRL_SUNXI

Why do we need to add this generic PINCTRL_SUNXI here? This is selected
already by the SoC specific PINCTRL symbols (see your previous patch).

Cheers,
Andre.

>  	help
>  	  This enables support for Allwinner sunxi based SoCs like the A64.
>  
> 
