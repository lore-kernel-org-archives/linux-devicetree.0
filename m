From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: Fix armada-385-turris-omnia stdout-path
Date: Sun, 27 Nov 2016 22:25:28 +0100
Message-ID: <20161127212528.wmqbwciz5ltnfws3@pengutronix.de>
References: <71af60f5-b657-cab4-32a8-00a604fc656e@suse.de>
 <1480275444-4220-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480275444-4220-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?QmVkxZlpY2hhIEtvxaFhdHU=?= <bedrich.kosata-x+rMaJPWets@public.gmane.org>, Michal Hrusecki <Michal.Hrusecky-x+rMaJPWets@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 27, 2016 at 08:37:24PM +0100, Andreas Färber wrote:
> Specify the baudrate.
> 
> Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")
> Cc: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>

You said with plain &uart0 the kernel uses a wrong baud rate? That's
strange. For me it works and I think it's the intended behaviour to
dermine the baud rate setup by the bootloader and use this.

I'd prefer it this way over hard coding the baud rate.

>  arch/arm/boot/dts/armada-385-turris-omnia.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/armada-385-turris-omnia.dts b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> index f53cb8b73610..2eff012287d4 100644
> --- a/arch/arm/boot/dts/armada-385-turris-omnia.dts
> +++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> @@ -52,7 +52,7 @@
>  	compatible = "cznic,turris-omnia", "marvell,armada385", "marvell,armada380";
>  
>  	chosen {
> -		stdout-path = &uart0;
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	memory {

This has the downside to depend on the alias. Not sure this is
considered modern. An alternative would be:

	stdout-path = "/soc/internal-regs/serial@12000:115200n8";

(maybe there even exists syntactic sugar to express this using &uart0?)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
