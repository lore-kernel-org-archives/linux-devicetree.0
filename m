From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: uniphier: add input-delay properties to
 Cadence eMMC node
Date: Sun, 14 May 2017 01:14:46 +0900
Message-ID: <CAK7LNAQvub8HodmDUwWm8CStcNAbrafOzSKzB=fOc8qf_EkcyQ@mail.gmail.com>
References: <1490934045-18874-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490934045-18874-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

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

Applied to linux-uniphier.




-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
