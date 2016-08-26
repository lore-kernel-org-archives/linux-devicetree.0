From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: Add extra UART pinmux settings for
 A23/33
Date: Fri, 26 Aug 2016 22:18:42 +0200
Message-ID: <20160826201842.GB3165@lukather>
References: <20160823055826.20591-1-icenowy@aosc.xyz>
 <20160823055826.20591-2-icenowy@aosc.xyz>
 <20160823114251.GL2598@lukather>
 <69271471960265@web26h.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <69271471960265@web26h.yandex.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 23, 2016 at 09:51:05PM +0800, Icenowy Zheng wrote:
>=20
>=20
> 23.08.2016, 19:42, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > Hi,
> >
> > On Tue, Aug 23, 2016 at 01:58:26PM +0800, Icenowy Zheng wrote:
> >> =A0A23/33 have 4 UART controllers outside PRCM. However, the devicetre=
e used
> >> =A0to mentioned only UART0's pinmux settings. Some extra UART controll=
ers have
> >> =A0RTS/CTS, and is suitable for using as bluetooth UART controller.
> >>
> >> =A0Add the pinmux settings for the UART controller, to make use of the
> >> =A0bluetooth function of some tablets.
> >>
> >> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >
> > Our policy is that we avoid adding unused pinctrl nodes to not cripple
> > the DT for no particular reason.
> >
> > So please add only the nodes you'll need in your tablet.
>=20
> Then... if what I needs is the PG group of uart1, should I name it as
> uart1_pins_a or uart1_pins_b?

We don't have any rules here, whichever comes first wins.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwKQiAAoJEBx+YmzsjxAgaLAQAI/BBtHjw2uh/WLqAjlqTA51
vr5S9Xu6RyjpCaQbusNaywd1P9qW1rANu3Mh4RYvYTJLmq4QpbZWK6mFDGogDtZi
eAPja6lCWcEB3Vho3xZP0NuiNHxv709DgeHHXHjmN3ajFtqVq3kk1Y2Sq4+8Gk45
pM3bVWPx5wmpp2E2bddF311PwWT5w9g8O0SdeEgnScb7JN8APCaveHJD2iI/R5xS
0qQwlEBt00KXEjSCm6jqO97TdfIAwFS1C0gcd9JJ67M+ndkLbnM3+B11mJLZ+2Pa
M/DNevnHqwpTYfKWhpR2CHBQ93vjMSiSX+ACwZ90a7uL9jszT8w88xZQioqqlfi+
E2YASMJSkvq3yHfe4VwSoxoqxXLt+988KAbQ+Hb33Derfqn4o/eC/Y/1nCWRAYil
x15prVkb8JFn2ANwXw+PO+30RieLBvlcf4pupBBdTRZCAPWTieMIVLppfJ1KmGLi
YAcj5SGZ/usBLSBPvDZv2T3wxUJUPiWvV7sPplhMm7ttC+TKFuBwWLCykaBJxGM3
6I0tFr/FvvPmnytoKcrxK93TBanD8Oe+R/jXI4qruSQ/IMNmKEGy6IDUQEGZJr2K
jr14XE6l12yWCEDWEfU7ob/YYO4wqzjck/UFw0VW8fOhwWllXm/56nP3DIaqaBcr
PvICdrynIgZybRkJehMk
=nDIn
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
