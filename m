From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC 2/7] clocksource: add dependencies for Vybrid pit
 clocksource
Date: Sun, 12 Oct 2014 20:18:21 +0200
Message-ID: <20141012181821.GQ31554@pengutronix.de>
References: <cover.1413136383.git.stefan@agner.ch>
 <603e0f51e88b5643cb42e966cbb1b80b21a55ecf.1413136383.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <603e0f51e88b5643cb42e966cbb1b80b21a55ecf.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Sun, Oct 12, 2014 at 08:13:56PM +0200, Stefan Agner wrote:
> Add the minimal dependencies required to use the Vybrid PIT
> clocksource driver. Those are not part of the SoC dependencies.
>=20
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  drivers/clocksource/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index cfd6519..26464dd 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -146,6 +146,8 @@ config FSL_FTM_TIMER
> =20
>  config VF_PIT_TIMER
>  	bool
> +	select CLKSRC_MMIO
> +	select CLKSRC_OF
>  	help
>  	  Support for Period Interrupt Timer on Freescale Vybrid Family SoC=
s.
This one seems to qualify as a fix for the MMU stuff, right?

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
