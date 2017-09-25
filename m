From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91: sama5d2 Xplained: Describe the SD card
 power supply
Date: Mon, 25 Sep 2017 22:15:12 +0200
Message-ID: <20170925201512.2jwuyhsjf6pgjuwi@piout.net>
References: <20170905101805.15127-1-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170905101805.15127-1-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/09/2017 at 12:18:05 +0200, Romain Izard wrote:
> As the SAMA5D2 SDHCI controller works with an external power supply,
> describe the power supply for the SD card slot. This makes it possible
> to use mmc power sequences, in the case of external SDIO modules.
> 
> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
