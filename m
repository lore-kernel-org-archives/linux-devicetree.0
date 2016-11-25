From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] devicetree: Add vendor prefix for CZ.NIC
Date: Fri, 25 Nov 2016 17:15:24 +0100
Message-ID: <87mvgnilib.fsf@free-electrons.com>
References: <20161125142658.21690-1-uwe@kleine-koenig.org>
        <20161125142658.21690-2-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125142658.21690-2-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org> ("Uwe
        =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Fri, 25 Nov 2016 15:26:57
 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?utf-8?Q?Bed=C5=99icha_Ko=C5=A1a?= =?utf-8?Q?tu?= <bedrich.kosata-x+rMaJPWets@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Uwe,
 
 On ven., nov. 25 2016, Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org> wrote:

> Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>

Applied on mvebu/dt and I added back the Acked-by from Rob Herring.

Thanks,

Gregory


> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index f0a48ea78659..ae9fce9fed03 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -67,6 +67,7 @@ creative	Creative Technology Ltd
>  crystalfontz	Crystalfontz America, Inc.
>  cubietech	Cubietech, Ltd.
>  cypress	Cypress Semiconductor Corporation
> +cznic	CZ.NIC, z.s.p.o.
>  dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
>  davicom	DAVICOM Semiconductor, Inc.
>  delta	Delta Electronics, Inc.
> -- 
> 2.10.2
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
