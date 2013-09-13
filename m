From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Fri, 13 Sep 2013 11:21:27 +0100
Message-ID: <20130913102127.GD29403@sirena.org.uk>
References: <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
 <52318953.6090405@freescale.com>
 <1378979431.2627.402.camel@shinybook.infradead.org>
 <20130913025827.GA3051@gmail.com>
 <1378999322.4210.95.camel@i7.infradead.org>
 <20130913041208.GD3051@gmail.com>
 <20130912205644.GW29403@sirena.org.uk>
 <52329AD3.2050608@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cuksurJxElusDw39"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52329AD3.2050608-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>, "thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org" <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cuksurJxElusDw39
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 12:55:47PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8813=E6=97=A5 04:56, Mark Brown =E5=86=99=
=E9=81=93:

> > I think this is part of the problem - you're trying to represent
> > something that isn't really a SPI controller as a SPI controller (or at
> > least trying to implement functionality beyond that which a SPI
> > controller has).

> The QuadSpi is not a traditional SPI controller, but i think it is still
> a SPI controller.
> It connects and controls the SPI NOR FLASH, so what do you think it is?

I think it is a SPI flash controller because...

> But the Quadspi controller can not work with the byte streams directly,
> it works with the LUT instruction sequences, so we have to parse the
> byte streams,
> and then uses the right LUT to trigger the transaction.

=2E..it has a programming model that seems strongly oriented around that.
The device can offer a SPI interface too but as you say that's going to
be less efficient.  Externally it is still SPI but in terms of what it
is offering to the processor the functionality you are trying to support
looks like it will work a lot better if the code using it understands
that it is talking to a flash rather than having a SPI driver which
tries to reverse engineer the data that's being sent to it.

> > I think what you should be doing is refactoring the MTD code which
> > interfaces to SPI flashes to split out the code so that there's an
> > abstraction which can express what this controller (and presumably
> > other controllers) can do and then implement this functionaltiy at
> > that level.

> If i follow this advice, i have to create a new file cloned by the m25p80=
=2Ec,
> and replace all the SPI APIs with other APIs.

Not quite, you need to split that file up so that there is an API
between the flash chip code and the SPI code - the code for the flash
chip should be shared between regular SPI and other controllers like
this one.

> I have no idea what APIs can be used to replace the SPI APIs.

You will need to create them.

--cuksurJxElusDw39
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMucjAAoJELSic+t+oim9d4wQAJYc/viQ5INRdELygTsxgDvE
/wqIjBtZOkouq4AsxsVBhjUsZZtvoqQvp1J6RGstYNf+gMB3rcNvSuSqWbFubaCu
E/CVfYDnIQAejNTt7q/QaIXOJ+J7IkBdUerzugTF4LBZShJ6it2N4lLY4pZxzb6U
Hy2fi8So2CirbX7904G25xCf7QAdanznnxRkLB5lKrMlz6T2ryczHFFQbd6wF6q9
IZ7ob6iMgRgss0VMDaKLp6Q7KoUAUvRudsjnDeXdzx+spO7kW+eZnjfssyxbXtZl
MfC4D4s0VencnwCOSwlY8OMHq9Bd1MP7EsqzgbCHFFEHDBfmFGHRO2YbfdRRCipH
V1PIw9vZG1F8G7M8meuNInX/P0EjpzSANVNS0BmDdwbBJMk+fGDtJ8OK8VJtPOsV
UbVkLSVNyu6sD2TNeX8uujRJy2g/SJvAym4TmItsLofYBXvulLOmrWGR1E7/dLY+
BZ2QakaSctgOZlFnG7CCr5AN3tccG4VydEvwFOE9CgxJQq66tMF+JdSwGkRNIViW
45sPhFlebLA6VJaep168uFMmiMFwITSKUphw2mtMTcJOkaNT3o/Sp/zTq07pezqV
3QNLjGDOAOG1LWQlqdrD2zBaN7GZgDKJY/3qG3wAyERkyPTKbMyu9XHHr82xh1S5
DieoT1odrfFSyooss84P
=nSyw
-----END PGP SIGNATURE-----

--cuksurJxElusDw39--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
