From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] initial support for "suniv" Allwinner new ARM9
 SoC
Date: Thu, 25 Jan 2018 16:35:20 +0100
Message-ID: <20180125153520.lxcfvh3yvi36uiux@flea.lan>
References: <20180119231735.61504-1-icenowy@aosc.io>
 <20180122121435.bpayxk4uzfqbhqse@flea.lan>
 <14593819.uISRktVE4V@ice-x220i>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwdinujenvvsyeha"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <14593819.uISRktVE4V@ice-x220i>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rwdinujenvvsyeha
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 24, 2018 at 09:10:34PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2018=E5=B9=B41=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 C=
ST =E4=B8=8B=E5=8D=888:14:35=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Sat, Jan 20, 2018 at 07:17:26AM +0800, Icenowy Zheng wrote:
> > > This is the RFC initial patchset for the "new" Allwinner SUNIV ARM9 S=
oC.
> > >=20
> > > The same die is packaged differently, come with different co-packaged
> > > DRAM or shipped with different SDK; and then made many model names: F=
23,
> > > F25, F1C100A, F1C100S, F1C200S, F1C500, F1C600, R6, etc. These SoCs a=
ll
> > > share a common feature set and are packaged similarly (eLQFP128 for S=
oCs
> > > without co-packaged DRAM, QFN88 for with DRAM). As their's no
> > > functionality hidden on the QFN88 models (except DRAM interface not
> > > exported), it's not clever to differentiate them. So I will use suniv=
 as
> > > common name of all these SoCs.
> >=20
> > Where is that suniv prefix coming from?
>=20
> The BSP (Melis and Linux). (e.g. "libs/suniv" directory of the Melis SDK =
and=20
> "arch/arm/boot/dts/sunivw1p1.dtsi" in the Linux SDK)

Do you have a link to that BSP?

> > You should really answer two questions here:
> >   - Are you able to predict whether you'll find an SoC part of that
> >     family in the future that derives a bit and will need a compatible
> >     of its own?
> >   - Are you able to predict which quirks we'll need along the way to
> >     support all the SoCs you've listed there?
> >=20
> > If you can't answer yes to both these questions, with a 100%
> > certainty, then you'll need a SoC name in the compatible.
> >=20
> > Which doesn't prevent you from sharing as much as possible the DT like
> > we did between the A10s and the A13 for example.
>=20
> So the suniv-f1c100s.dtsi will still be kept empty and all peripherals kn=
own=20
> should go through suniv.dtsi.

Sorry if I wasn't really clear. You can totally keep the current DT
structure if that makes sense (and judging by what you're saying, it
does.), but the compatibles should have the SoC name in it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rwdinujenvvsyeha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpp+TcACgkQ0rTAlCFN
r3QHxw//YmXyxVNuYtAPjBx08jzNik0jFayt0j1hWPc1AG8pCj0k4uty6Lk+h3lh
TKhn8gExV8c1nL+D7gWXFk8XZ4PQHGjd0HCYQEQ+USZ4eZ9wOLhDY3OXLm8ofeAg
4h3WAlOPOBMzr/M2N5lrwBFG/dAA57fKNdfu8UOnOcvexDiJm6fQNq4OFhvKQRrS
UiCYhFmPo9ixQH0GQSkq3u2Uj+xwaR9J0xY2YqpSbMPLurFqyIZPI0RrOrHbrQMl
SrK/ivrtzw80aswJGRslEGkedAXfaI33t4cpTLg0nLUyTwRXHA2xEXOQD1QRJc84
vbPmHMx+rabz7gpOCip2PySJUgiyuByfoRp/a9Wc44si6il45uCiKni5v2q8klF3
BBZojuMYF5LgUB61fJHLxuyJfnivHEH2pYHKwXh0NuVU4+vJznJF4SrSRASlA9lo
ag2vebJTH7wNitKRue6VaexcWP9BUSi9Cv7EpBwQiEDiOCTCXhtAMu6KPNYpPYo+
ci377QGj396pFb/7FIm63zGepRymM+muv4WrdxL0xdEvCr1CDcBjz9hmwcT5Ifz1
/BRrDtgvYRDmlKTj0X+It+nZ/0R7JpHrat6iXtZEEu4GzkSviWYiB6NIXq2MJd3O
kNCknMYtsktl5xL2gwmAGV1ibj88lQgVMYIdtF4SZLa+jdQsHzw=
=GfbL
-----END PGP SIGNATURE-----

--rwdinujenvvsyeha--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
