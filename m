From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of: Add vendor prefix for Energy Micro
Date: Tue, 25 Mar 2014 16:35:17 +0000
Message-ID: <20140325163517.GL10341@e106331-lin.cambridge.arm.com>
References: <1395756677-6166-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395756677-6166-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 25, 2014 at 02:11:17PM +0000, Uwe Kleine-K=C3=B6nig wrote:
> There are already patches floating around to add
> energymicro,efm32-{i2c,serial,spi} as compatible strings.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Looks sensible to me.

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index 40ce2df0e0e9..7e5401201d3d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -31,6 +31,7 @@ davicom	DAVICOM Semiconductor, Inc.
>  denx	Denx Software Engineering
>  edt	Emerging Display Technologies
>  emmicro	EM Microelectronic
> +energymicro	Silicon Laboratories (formerly Energy Micro AS)
>  epfl	Ecole Polytechnique F=C3=A9d=C3=A9rale de Lausanne
>  epson	Seiko Epson Corp.
>  est	ESTeem Wireless Modems
> --=20
> 1.9.1
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
