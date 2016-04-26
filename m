From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: dts: lpc32xx: phy3250: add SoC name prefix to
 board dts file
Date: Tue, 26 Apr 2016 11:37:06 -0400
Message-ID: <1461685026.9433.5.camel@localhost>
References: <1461631050-10479-1-git-send-email-vz@mleia.com>
	 <1461631050-10479-8-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461631050-10479-8-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-04-26 at 03:37 +0300, Vladimir Zapolskiy wrote:
> To simplify matching of DTS files of all NXP LPC32xx powered boards by
> a file name add 'lpc3250' prefix to PHYTEC PHYCORE-LPC3250 board dts
> file.
> 
> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                             | 2 +-
>  arch/arm/boot/dts/{phy3250.dts => lpc3250-phy3250.dts} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename arch/arm/boot/dts/{phy3250.dts => lpc3250-phy3250.dts} (100%)
> 
Acked-by: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
