From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of: Add vendor prefix for Energy Micro
Date: Thu, 24 Jul 2014 11:38:01 +0100
Message-ID: <20140724103801.GD4079@leverpostej>
References: <1395756677-6166-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1406146969-26279-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406146969-26279-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 23, 2014 at 09:22:49PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> The kernel supports devices with the following compatible strings
> already:
>=20
> 	energymicro,efm32-i2c
> 	energymicro,efm32-uart
> 	energymicro,efm32-spi
> 	energymicro,efm32-timer
>=20
> So add "energymicro" to the list of vendors.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Hello,
>=20
> An earlier version (with a different changelog) was sent with
> Message-Id: 1395756677-6166-1-git-send-email-u.kleine-koenig@pengutro=
nix.de
> in March and got an Ack by Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> and
> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>.
> I adapted the change log because the drivers are in mainline in the m=
eantime.

As with last time, this looks sensible to me:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Rob, do you want to pick this up?

Mark.

>=20
> Best regards
> Uwe
>=20
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index 46a311e728a8..b9c84039d0c3 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -42,6 +42,7 @@ dmo	Data Modul AG
>  ebv	EBV Elektronik
>  edt	Emerging Display Technologies
>  emmicro	EM Microelectronic
> +energymicro	Silicon Laboratories (formerly Energy Micro AS)
>  epfl	Ecole Polytechnique F=C3=A9d=C3=A9rale de Lausanne
>  epson	Seiko Epson Corp.
>  est	ESTeem Wireless Modems
> --=20
> 2.0.0
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
