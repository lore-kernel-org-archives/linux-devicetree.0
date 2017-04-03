From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: uniphier: add input-delay properties to
 Cadence eMMC node
Date: Mon, 3 Apr 2017 15:28:43 +0900
Message-ID: <CAK7LNARtKO-a7tX5U2NGAw707uSLcfxABo1yt44QQfE2go7EmQ@mail.gmail.com>
References: <1490934045-18874-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490934045-18874-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Piotr Sroka <piotrs-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

MTD developers,
Please ignore this patch.

I accidentally sent this patch to a wrong ML.
Sorry for the noise.




2017-03-31 13:20 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> Since commit a04e2b383401 ("mmc: sdhci-cadence: Update PHY delay
> configuration"), PHY parameters must be specified by DT.
>
> The hard-coded settings have been converted as follows:
> - SDHCI_CDNS_PHY_DLY_SD_DEFAULT -> cdns,phy-input-delay-legacy
> - SDHCI_CDNS_PHY_DLY_EMMC_SDR   -> cdns,phy-input-delay-mmc-highspeed
> - SDHCI_CDNS_PHY_DLY_EMMC_DDR   -> cdns,phy-input-delay-mmc-ddr
>
> The following have not been moved:
> - SDHCI_CDNS_PHY_DLY_SD_HS
>    this is unneeded in the eMMC configuration
> - SDHCI_CDNS_PHY_DLY_EMMC_LEGACY
>    this is never enabled by the driver as it is covered by
>    SDHCI_CDNS_PHY_DLY_SD_DEFAULT
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>
>  arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 3 +++
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> index 5dc5124..b6ebdc9 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> @@ -310,6 +310,9 @@
>                         bus-width = <8>;
>                         mmc-ddr-1_8v;
>                         mmc-hs200-1_8v;
> +                       cdns,phy-input-delay-legacy = <4>;
> +                       cdns,phy-input-delay-mmc-highspeed = <2>;
> +                       cdns,phy-input-delay-mmc-ddr = <3>;
>                 };
>
>                 usb0: usb@5a800100 {
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> index 6c9a72d..0ab6c2e 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> @@ -394,6 +394,9 @@
>                         bus-width = <8>;
>                         mmc-ddr-1_8v;
>                         mmc-hs200-1_8v;
> +                       cdns,phy-input-delay-legacy = <4>;
> +                       cdns,phy-input-delay-mmc-highspeed = <2>;
> +                       cdns,phy-input-delay-mmc-ddr = <3>;
>                 };
>
>                 sd: sdhc@5a400000 {
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
