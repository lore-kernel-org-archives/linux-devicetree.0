From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH v6 11/13] ARM: dts: sun8i: add DE2 nodes
 for V3s SoC
Date: Fri, 5 May 2017 14:30:35 +0200
Message-ID: <20170505123035.pwh3idz73ujrd3hx@lukather>
References: <20170504114858.9008-1-icenowy@aosc.io>
 <20170504114858.9008-12-icenowy@aosc.io>
 <CAGb2v67uE2iuP+wrL2t0fSMY8C1qnX=pYru7pZGX+0WhC_z2EA@mail.gmail.com>
 <8ad5de02ffc13348dfc71e9ec203205c@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="st47prdbm2t3ondk"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8ad5de02ffc13348dfc71e9ec203205c@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
To: icenowy@aosc.io
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--st47prdbm2t3ondk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 04:53:43PM +0800, icenowy@aosc.io wrote:
> > > +               de2_clocks: clock@1000000 {
> > > +                       compatible =3D "allwinner,sun50i-h5-de2-clk";
> >=20
> > I am a bit skeptical about this. Since the V3S only has one mixer, do
> > the clocks
> > for the second one even exist?
>=20
> It's described in the de_clock.c in the BSP source code, and in hardware
> these bits can be really set (although without clock output).
>=20
> So I use this compatible which has still the extra clocks.

If it's not usable, then it shouldn't be in the code, it's basically
dead code.

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--st47prdbm2t3ondk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZDHBnAAoJEBx+YmzsjxAgcXIQAMA633vVYPislWdk3mRPf9vc
KWuBNS3Yg/XFtOi9qgzF9iGu8G0NeeG7FSBVoD+PSg6IsCenv936Iz2sOQc2x6X2
PHPANnL32IchPRVZYBJLZNTee2om+2Yil0soKGaix6IUb+RdWedIcwcI6bfyM5jM
zustjt83PZcd7ZhUV4NjZcLSUiITjaapNZ+fraDJNNgFepw0HepGxqubx27bfCii
Abr5CZDhBQ5JaRjLbzmd2kJRFtU6u+eEmXRJyQlUsgdxra7RYbaXS80TBd14faFr
55W0+ZJKVbgAHiy/eRIz0WO5H1X8YFHEZv6OxgH2KtS/oWasHI7jjNsN7BFxf5Ou
bAO2GZHcgLI+FbSVqC7riSbGGlxZy/M/x2WFcWJzZ3sW7jUhAjBh05pqfKe/ixdT
IhteMAcLnxClrE+GDX3r3XMIwf4OTGP3dbShkBzFQu2lv36Wq1pfWWn9qNkUA/Sr
vrQmz+ZtqxrFx5wgHAL3r1HtbN3XSAXGivhZpXKsKIPkqxGhsrRTnIbu4FZPFGI/
jSP1Zs6iNdrllwU2iBbRIvskl1kLJSqTOMMekfaSAvDoq1ne552lgsJU2YzjVKzg
IWsShJxplWLGdLOMwRmhKcyxApoPrwYgSfREtsu0XvsvdBQTJ0lkjL5MVIcOga3B
Y30eWJuKrcwxzh6A+kP3
=ZXop
-----END PGP SIGNATURE-----

--st47prdbm2t3ondk--
