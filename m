From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: uniphier: add cdns,phy-dll-delay-sdclk(-hsmmc)
 for eMMC
Date: Sun, 14 May 2017 01:16:03 +0900
Message-ID: <CAK7LNARmTXLsyx1bDQLYkHr-QqcFf+Lth5D+X3VoasEy0MWYMQ@mail.gmail.com>
References: <1491271477-19806-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491271477-19806-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-04-04 11:04 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> Adjust the PHY parameters for more stable access to the eMMC device.
> Set the SDCLK output delay value to 21 (including HS200/400 modes).
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>
>  arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 2 ++
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> index 42f1803..25a525c 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> @@ -313,6 +313,8 @@
>                         cdns,phy-input-delay-legacy = <4>;
>                         cdns,phy-input-delay-mmc-highspeed = <2>;
>                         cdns,phy-input-delay-mmc-ddr = <3>;
> +                       cdns,phy-dll-delay-sdclk = <21>;
> +                       cdns,phy-dll-delay-sdclk-hsmmc = <21>;
>                 };
>
>                 usb0: usb@5a800100 {
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> index e4499ff..c85e6e2 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> @@ -387,6 +387,8 @@
>                         cdns,phy-input-delay-legacy = <4>;
>                         cdns,phy-input-delay-mmc-highspeed = <2>;
>                         cdns,phy-input-delay-mmc-ddr = <3>;
> +                       cdns,phy-dll-delay-sdclk = <21>;
> +                       cdns,phy-dll-delay-sdclk-hsmmc = <21>;
>                 };
>
>                 soc-glue@5f800000 {


Applied to linux-uniphier.



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
