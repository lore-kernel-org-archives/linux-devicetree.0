From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v17 0/5] ZII RAVE platform driver
Date: Thu, 21 Dec 2017 15:40:09 +0100
Message-ID: <20171221144009.GA17050@amd>
References: <20171221065118.29726-1-andrew.smirnov@gmail.com>
 <20171221093024.GA8938@amd>
 <19543ffb-3c64-1bba-1bcc-360a2b4bd15e@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <19543ffb-3c64-1bba-1bcc-360a2b4bd15e-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-12-21 05:49:59, Guenter Roeck wrote:
> On 12/21/2017 01:30 AM, Pavel Machek wrote:
> >>Everyone:
> >>
> >>This patch series is v17 of the driver for supervisory processor found
> >>on RAVE series of devices from ZII. Supervisory processor is a PIC
> >>microcontroller connected to various electrical subsystems on RAVE
> >>devices whose firmware implements protocol to command/qery them.
> >
> >query.
> >
> >Can we please get this patch merged? We really don't want to see v34
> >of this patch...
>=20
> Maybe if we can all agree that There Shall Be No More Bikeshedding.

I'll bite next person who tries to complain comment style. Grrr.

And actually, you could help, too. Normally it makes sense to wait few
days between resubmitting the patch...

Thanks,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlo7x8kACgkQMOfwapXb+vJIsQCfQbLKoD8AjWml44PyUneogVfq
ecMAn0Ucdki8CIciqOtJtjByWi4dmMAE
=eDQ1
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
