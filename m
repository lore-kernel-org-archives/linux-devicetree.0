From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 14/20] ARM: sun5i: a13: Add LCD pins
Date: Wed, 25 May 2016 14:33:04 +0200
Message-ID: <20160525123304.GD9232@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-15-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v66g_xZEyOf8ky_TKpT70D_EQwirVKNMQbubT5U2cD8rnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66g_xZEyOf8ky_TKpT70D_EQwirVKNMQbubT5U2cD8rnw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 01:13:01AM +0800, Chen-Yu Tsai wrote:
> >  arch/arm/boot/dts/sun5i-a13.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i=
-a13.dtsi
> > index 263d46dbc7e6..79b5d513c142 100644
> > --- a/arch/arm/boot/dts/sun5i-a13.dtsi
> > +++ b/arch/arm/boot/dts/sun5i-a13.dtsi
> > @@ -237,6 +237,16 @@
> >  &pio {
> >         compatible =3D "allwinner,sun5i-a13-pinctrl";
> >
> > +       lcd_rgb666_pins: lcd_rgb666@0 {
> > +               allwinner,pins =3D "PD2", "PD3", "PD4", "PD5", "PD6", "=
PD7",
> > +                                "PD10", "PD11", "PD12", "PD13", "PD14"=
, "PD15",
> > +                                "PD18", "PD19", "PD20", "PD21", "PD22"=
, "PD23",
> > +                                "PD24", "PD25", "PD26", "PD27";
> > +               allwinner,function =3D "lcd0";
> > +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
>=20
> Just a thought: would we ever need to increase the drive strength for ver=
y high
> resolutions?

I don't think we need to, but we can always change that later.

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZuAAAoJEBx+YmzsjxAgh34P/A8mjRbercJZ5kw43eJi2NIu
mhZQQdNAoMvgHe3RNOpycMHC+kMhCE9UG8/bbp2A+We/SDYMBgWrse/CNGEo5nCN
L4EdnEb6ZUI5ry6oBfef+CvUaRX0A0RwNqRSj0zLPpV3URAoutuFmJzavN+am8wp
u/ptWFhOzKn9W1NN2POH6bXMHTNzD1DslACwf91uceRc77Clzfz3mxYMLv36X5Fq
ocDH5JUTtdUyIliocENV3D3xrvS8x6zmYop9umMULmgrkmfSrAVirH97w69Z3eP1
UdiDWV1RNyboaRKgN4TCEXvcmImWBnvcRK8p1HYDHIjXGxzWi1oUmk+MnlGo1R3g
7fj5MDP5mrTglBa5LVFqt7CZ2ky97NQZVQItlxyAzVwKAGb09GLXj6dVoSrQKuPJ
pH7odyhe1KFyohtePn8oW2eKnBO9q6qYpq5EsAeNgD4Bsr8fz0mnQZ1Ca+6MWdXy
eEhY1x5Ob/3wSqjrXraOmHhU66gIc8IiSYbQ6K8Wedkif7ZbluumOywlx0onbU2l
S3GRqc2XqcpyQv3MKxowQ81i4Yrk5+caX9Gklk6CrhYE45T1CxjOEQXRr+RgXGKM
oWuGWC7lrlMh6QYykZChRMd4Cn38DhLaTh+DKIE+9CPZMQNzZiQODec+Ecq0nZtG
n9Bwx+BnsARHgDMCVlaw
=9ODZ
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
