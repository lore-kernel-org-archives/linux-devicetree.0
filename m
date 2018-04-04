From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 6/7] arm: dts: sun8i: a33: Add the DSI-related nodes
Date: Wed, 4 Apr 2018 10:14:55 +0200
Message-ID: <20180404081455.radrcx4hs7n3hlzo@flea>
References: <cover.14d017af44a2140bea674731b60a0dd7f992f5f6.1520344489.git-series.maxime.ripard@bootlin.com>
 <fbb4d14a83ed80e9740c042cd9df58b8132b4c91.1520344489.git-series.maxime.ripard@bootlin.com>
 <CAGb2v65AfHHUZ=fUB+TPUZaLdYb4mN3hZ=3n5GOAD39C42+Nag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1648170503=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v65AfHHUZ=fUB+TPUZaLdYb4mN3hZ=3n5GOAD39C42+Nag@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1648170503==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c77lldtbfpi24rrg"
Content-Disposition: inline


--c77lldtbfpi24rrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 22, 2018 at 10:23:32AM +0800, Chen-Yu Tsai wrote:
> On Tue, Mar 6, 2018 at 9:56 PM, Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > From: Maxime Ripard <maxime.ripard@free-electrons.com>
> >
> > The A33 has a MIPI-DSI block, along with its D-PHY. Let's add it in ord=
er
> > to use it in the relevant boards.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/sun8i-a33.dtsi | 44 ++++++++++++++++++++++++++++++++=
+-
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i=
-a33.dtsi
> > index 50eb84fa246a..94cfa7b1bbfa 100644
> > --- a/arch/arm/boot/dts/sun8i-a33.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a33.dtsi
> > @@ -236,6 +236,11 @@
> >                                         #address-cells =3D <1>;
> >                                         #size-cells =3D <0>;
> >                                         reg =3D <1>;
> > +
> > +                                       tcon0_out_dsi0: endpoint@1 {
> > +                                               reg =3D <1>;
> > +                                               remote-endpoint =3D <&d=
si0_in_tcon0>;
> > +                                       };
> >                                 };
> >                         };
> >                 };
> > @@ -280,6 +285,45 @@
> >                         #io-channel-cells =3D <0>;
> >                 };
> >
> > +               dsi0: dsi@1ca0000 {
>=20
> Nit: There's only one so you don't need the numbered suffix.

I'll fix it.

> Also, is "dsi" specific enough, or should we use "mipi-dsi"

If we were to be pedantic about it, that would even be MIPI-DSI2, but
I'm not sure it's worth it to be honest.

> > +                       compatible =3D "allwinner,sun6i-a31-mipi-dsi";
> > +                       reg =3D <0x01ca0000 0x1000>;
> > +                       interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&ccu CLK_BUS_MIPI_DSI>,
> > +                                <&ccu CLK_DSI_SCLK>;
> > +                       clock-names =3D "bus", "mod";
> > +                       resets =3D <&ccu RST_BUS_MIPI_DSI>;
> > +                       phys =3D <&dphy0>;
> > +                       phy-names =3D "dphy";
> > +                       status =3D "disabled";
> > +
> > +                       ports {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               port@0 {
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <0>;
> > +
> > +                                       dsi0_in_tcon0: endpoint {
> > +                                               remote-endpoint =3D <&t=
con0_out_dsi0>;
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> > +
> > +               dphy0: d-phy@1ca1000 {
>=20
> Same nit, and "dsi-phy" would be better.

D-PHY is one of the MIPI standards that can be used with DSI, but it
doesn't mean DSI-PHY. You also have C-PHY (that can be used with DSI
as well) and M-PHY (than can be used with UniPro and CSI3). So, no, it
really is a D-PHY controller :)

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--c77lldtbfpi24rrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrEiX4ACgkQ0rTAlCFN
r3QDXQ/8D4c79ldNDWTRBBscYpDp2x8u/43sY/8sCZS4u+oItK5XfSITggFd8A6D
UF6P3Mgceuv/tk+MkovX/5bHV965Sqx+a+nKkRyuno8QrF2+54zZ4svpHWcXBFAT
K/NC6Om+7bRYjtMZ2J5JVQPxXSKdLxKolu9eKkAwls26iH5d6qBOkZ3hSUlal0Tf
NRQGceAJrnmTwcI53GyYCzV34a3AZmR4L8WgVyfBXI97oY0AttYhKqptSNftdI+z
Gcn2te5pUlvZZOyMRiUgZJVJWfY7kDJ/HcZz3Vb9dfL+A7xB3Tgd/5btJBRIYMqK
RzcZmq9boT1JRGoFZ8zONDUiDLrFNrGATrrrZfwZRR+jMhEjeWCmw1f/FlFoSoqg
WFlkEFK7XRbB6CvCxp16010RtkALM2SWhQ39CQ2qZyPA9Po95LeBmino1HMN486q
EcfKrPMv1VOpEvZ0bxkYw5uVrmWzjZrB3fctG/ScG3reAabUQddztfTKT7y4AfQk
qAgriCAX0DRzos7klFV3lbqUcHQp2Kqzxb9mfAYKJFeKLviR+vZ6GOFGaQP8Gyxz
8G/5WLlzh5LVl17wtEYIAoIhADHTEFim3uMpE26aZe1l1pIXlQmGHtIZEwALsyEt
4z51pVN6PVVSdTWpEEN1t/Z250RSEwPpsQAk1HWnYct9g1VGWo4=
=o9hS
-----END PGP SIGNATURE-----

--c77lldtbfpi24rrg--

--===============1648170503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1648170503==--
