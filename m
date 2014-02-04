From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/8] clk: sunxi: Add Allwinner A20/A31
 GMAC clock unit
Date: Tue, 4 Feb 2014 10:27:50 +0100
Message-ID: <20140204092750.GK25625@lukather>
References: <1391398346-5094-1-git-send-email-wens@csie.org>
 <1391398346-5094-2-git-send-email-wens@csie.org>
 <20140203193108.GC25625@lukather>
 <CAGb2v64+qiBqYtWyc23b6p4aWyWj7a9K1qveTsW7ZGh0ti8_Wg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBG7GYKLQKGQEN5I443Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64+qiBqYtWyc23b6p4aWyWj7a9K1qveTsW7ZGh0ti8_Wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2014 at 10:43:33AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Tue, Feb 4, 2014 at 3:31 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> >
> > On Mon, Feb 03, 2014 at 11:32:19AM +0800, Chen-Yu Tsai wrote:
> >> The Allwinner A20/A31 clock module controls the transmit clock source
> >> and interface type of the GMAC ethernet controller. Model this as
> >> a single clock for GMAC drivers to use.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/bindings/clock/sunxi.txt | 26 +++++++
> >>  drivers/clk/sunxi/clk-sunxi.c                     | 83 ++++++++++++++=
+++++++++
> >>  2 files changed, 109 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Docum=
entation/devicetree/bindings/clock/sunxi.txt
> >> index 0cf679b..f43b4c0 100644
> >> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> >> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> >> @@ -37,6 +37,7 @@ Required properties:
> >>       "allwinner,sun6i-a31-apb2-gates-clk" - for the APB2 gates on A31
> >>       "allwinner,sun4i-mod0-clk" - for the module 0 family of clocks
> >>       "allwinner,sun7i-a20-out-clk" - for the external output clocks
> >> +     "allwinner,sun7i-a20-gmac-clk" - for the GMAC clock module on A2=
0/A31
> >>
> >>  Required properties for all clocks:
> >>  - reg : shall be the control register address for the clock.
> >> @@ -50,6 +51,9 @@ Required properties for all clocks:
> >>       If the clock module only has one output, the name shall be the
> >>       module name.
> >>
>=20
>=20
> >> +For "allwinner,sun7i-a20-gmac-clk", the parent clocks shall be fixed =
rate
> >> +dummy clocks at 25 MHz and 125 MHz, respectively. See example.
> >> +
>=20
>=20
> >>  Clock consumers should specify the desired clocks they use with a
> >>  "clocks" phandle cell. Consumers that are using a gated clock should
> >>  provide an additional ID in their clock property. This ID is the
> >> @@ -96,3 +100,25 @@ mmc0_clk: clk@01c20088 {
> >>       clocks =3D <&osc24M>, <&pll6 1>, <&pll5 1>;
> >>       clock-output-names =3D "mmc0";
> >>  };
> >> +
> >> +mii_phy_tx_clk: clk@2 {
> >> +     #clock-cells =3D <0>;
> >> +     compatible =3D "fixed-clock";
> >> +     clock-frequency =3D <25000000>;
> >> +     clock-output-names =3D "mii_phy_tx";
> >> +};
> >> +
> >> +gmac_int_tx_clk: clk@3 {
> >> +     #clock-cells =3D <0>;
> >> +     compatible =3D "fixed-clock";
> >> +     clock-frequency =3D <125000000>;
> >> +     clock-output-names =3D "gmac_int_tx";
> >> +};
> >> +
> >> +gmac_clk: clk@01c20164 {
> >> +     #clock-cells =3D <0>;
> >> +     compatible =3D "allwinner,sun7i-a20-gmac-clk";
> >> +     reg =3D <0x01c20164 0x4>;
> >> +     clocks =3D <&mii_phy_tx_clk>, <&gmac_int_tx_clk>;
> >
> > You should also document in which order you expect the parents to
> > be. Or it will probably be easier to just use clock-names here.
>=20
> Is it not clear from the "Required properties" section above?

I'd make it clearer. But again, using clock-names would avoid any
ambiguity, and be more flexible.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS8LKWAAoJEBx+YmzsjxAgxEoP/1Ub2JG1TD1EDfayvJL9wTB3
CU5XCYp98UNezbD/D2nfmS6psbhsLlpT8+L26CoFS4ISxGfaN3MG9Qw4D0IUPmM9
e/wrduyqefNIwg7a7tciBrJBHprSLRF07ief2usqLiwO+pEFsUnYyUyA09k3WIWg
5+imwBYBXG+ScFFo2I34tagUzGDIxIcKbWqQz1dzVOWIdasiYBEDBQeB7SkKZhDF
SOA2ypb2ubj5/yz3xFbq1L7Msgzmf5i0hUYNU+cv/g12NgDxt92j9hUDGDKvV+PW
lisA600BfNu6yOc8lT4inWy1wRbb6hIf3X+jmnCTiRzMBt49IgtDzWl/pX3OF1TA
uxFGb9Cr911cCF3myY07nzKVuudyjP2GP6LUCD4KA5/2KKAM/LIj3CN+4/B2Q3T1
uL0QWjAfaci1n2OIDIfbnyBZoEL+gJx3Tm4F2I3fgWIjzX2bnQ2+Mrz4ZYNsv97p
SnDZ2Y9pALMFlDi13Wd8Xfztaa6Mat+YhZSeWiTusphaO0gSpl1WGA+gvKs9UhIr
UfDBkc6yIwk1Rla5cPyv3g1alFq0bsr0I+hALmleNvws5wDO7vmkF/Ze6SYROM4z
X/BZTsCIcUclJSrsVWrKXlpxbXYVhkHNxagXSwKAPNmo763ou/qbH2iR4wPK+088
RSHLHqRfGF8T2BUl/T1g
=ImRB
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
