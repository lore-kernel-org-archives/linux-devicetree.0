From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 11/26] ARM: sun5i: Add DRAM gates
Date: Wed, 3 Feb 2016 21:36:16 +0100
Message-ID: <20160203203616.GG3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-12-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65gCieH2-WS+1WeBNCVqRyw8fOxODdSC5xeKf-hkfgs6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65gCieH2-WS+1WeBNCVqRyw8fOxODdSC5xeKf-hkfgs6A@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Wynter Woods <wynter@nextthing.co>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org


--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 17, 2016 at 01:10:02AM +0800, Chen-Yu Tsai wrote:
> On Thu, Jan 14, 2016 at 11:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The DRAM gates control whether the image / display devices on the SoC h=
ave
> > access to the DRAM clock or not.
> >
> > Enable it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/sun5i-a10s.dtsi |  7 ++++---
> >  arch/arm/boot/dts/sun5i-a13.dtsi  |  2 +-
> >  arch/arm/boot/dts/sun5i-r8.dtsi   |  2 +-
> >  arch/arm/boot/dts/sun5i.dtsi      | 19 +++++++++++++++++++
> >  4 files changed, 25 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5=
i-a10s.dtsi
> > index bddd0de88af6..52d2c79cb37b 100644
> > --- a/arch/arm/boot/dts/sun5i-a10s.dtsi
> > +++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
> > @@ -66,7 +66,7 @@
> >                                      "simple-framebuffer";
> >                         allwinner,pipeline =3D "de_be0-lcd0-hdmi";
> >                         clocks =3D <&pll5 1>, <&ahb_gates 36>, <&ahb_ga=
tes 43>,
> > -                                <&ahb_gates 44>;
> > +                                <&ahb_gates 44>, <&dram_gates 26>;
> >                         status =3D "disabled";
> >                 };
> >
> > @@ -74,7 +74,8 @@
> >                         compatible =3D "allwinner,simple-framebuffer",
> >                                      "simple-framebuffer";
> >                         allwinner,pipeline =3D "de_be0-lcd0";
> > -                       clocks =3D <&pll5 1>, <&ahb_gates 36>, <&ahb_ga=
tes 44>;
> > +                       clocks =3D <&pll5 1>, <&ahb_gates 36>, <&ahb_ga=
tes 44>,
> > +                                <&dram_gates 26>;
> >                         status =3D "disabled";
> >                 };
> >
> > @@ -83,7 +84,7 @@
> >                                      "simple-framebuffer";
> >                         allwinner,pipeline =3D "de_be0-lcd0-tve0";
> >                         clocks =3D <&pll5 1>, <&ahb_gates 34>, <&ahb_ga=
tes 36>,
> > -                                <&ahb_gates 44>;
> > +                                <&ahb_gates 44>, <&dram_gates 26>;
> >                         status =3D "disabled";
> >                 };
> >         };
> > diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i=
-a13.dtsi
> > index 9669b03f20f3..f29163650ca8 100644
> > --- a/arch/arm/boot/dts/sun5i-a13.dtsi
> > +++ b/arch/arm/boot/dts/sun5i-a13.dtsi
> > @@ -62,7 +62,7 @@
> >                                      "simple-framebuffer";
> >                         allwinner,pipeline =3D "de_be0-lcd0";
> >                         clocks =3D <&ahb_gates 36>, <&ahb_gates 44>, <&=
de_be_clk>,
> > -                                <&tcon_ch0_clk>;
> > +                                <&tcon_ch0_clk>, <&dram_gates 26>;
> >                         status =3D "disabled";
> >                 };
> >         };
> > diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-=
r8.dtsi
> > index b1e4e0170d51..691d3de75b35 100644
> > --- a/arch/arm/boot/dts/sun5i-r8.dtsi
> > +++ b/arch/arm/boot/dts/sun5i-r8.dtsi
> > @@ -53,7 +53,7 @@
> >                         allwinner,pipeline =3D "de_be0-lcd0-tve0";
> >                         clocks =3D <&ahb_gates 34>, <&ahb_gates 36>,
> >                                  <&ahb_gates 44>, <&de_be_clk>,
> > -                                <&tcon_ch1_clk>;
> > +                                <&tcon_ch1_clk>, <&dram_gates 26>;
> >                         status =3D "disabled";
> >                 };
> >         };
> > diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> > index 0840612b5ed6..c72d94228915 100644
> > --- a/arch/arm/boot/dts/sun5i.dtsi
> > +++ b/arch/arm/boot/dts/sun5i.dtsi
> > @@ -338,6 +338,25 @@
> >                         clock-output-names =3D "usb_ohci0", "usb_phy";
> >                 };
> >
> > +               dram_gates: clk@01c20100 {
> > +                       #clock-cells =3D <1>;
> > +                       compatible =3D "allwinner,sun5i-a13-dram-gates-=
clk";
> > +                       reg =3D <0x01c20100 0x4>;
> > +                       clocks =3D <&pll5 0>;
> > +                       clock-indices =3D <0>,
> > +                                       <1>,
>=20
> According to A10s manual, bit 3 is DRAM clock for TS (transport stream
> decoder), while bit 5 is for the TV encoder.
>=20
> The others look good.

I'll fix that, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsmTAAAoJEBx+YmzsjxAg9tAP/i+aB3buXM5KB0nBGprNY1nC
fr/XVAoAc6TmDNbksh7mtqRrUxfgzeruxXuDR88TeKM2xb2pjPiEDXwHhQOcJs9P
E2AlulKkSJ4v5P1AtPdiD2QQ+VtB0hVrjHEH6u/Ip/bu+15nCTicUL9I5yAzgq5s
5M1Mqje8XlRq2OaBshCE2+1Aluyw0YtcfwiA0Fkxtb5vVobExYVD14kcNiVkp1Ci
0Eq+17UUzMWJvHpj4nSJ5H+QBPhTPuafOY13nGe/qWlEerniUlbjOu0wE8dK1OF5
7JpCk6x9MdNxMMkGoxTNyvdbUrEPc/ajSRVdLt4YLP5K7G0lI0Egg3l4qLFdGNfB
i99HOnvTI0evWphe7P8qwyimmuNseN79CpCRgfya5vJbdk3EQfEVc+oi5aGPvols
WiZhuEXjuHwZYGW0ON3nGM1/JA+5wrAIO/WsmrXSfiQyZPj0njejyA2xGflXew9r
ljIzkRkO39335pqzhK+eNwWJwSfiCJcBoREwv9z0aJJzvxCaP6f46BJgwvPtM4FW
/mQRQ6VRRZtHN7g2liJAtIZB0IDYGXb3yx8J7bAZzVzTW5uMh8FOYLc/7VgeHwI1
H8efuG5IBVUGXRF2oRXIGV7vwEuRe+bgQo+bIsv3o7JDOEJL4/k+Yn5l+OwW0zkE
3NdHeMfjo9WHO9g5tV8f
=BoOY
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--
