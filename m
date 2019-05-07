From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH v2] arm64: allwinner: h6:
 orangepi-one-plus: Add Ethernet support
Date: Tue, 7 May 2019 09:06:41 +0200
Message-ID: <20190507070641.7whs4ckiqupaah35@flea>
References: <20190503115928.27662-1-jagan@amarulasolutions.com>
 <20190503144651.ttqfha656dykqjzo@flea>
 <CAMty3ZCQTiX5OvCG_uMRS02vFu0c1-bkcyauLD6oaFcd=y3RNA@mail.gmail.com>
 <20190506133101.c3twwwydy5mez3db@core.my.home>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t252ai7obnvmcokm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBCG5YTTAKGQEFIFUEMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190506133101.c3twwwydy5mez3db-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--t252ai7obnvmcokm
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2019 at 03:31:01PM +0200, Ond=C5=99ej Jirman wrote:
> > > > ---
> > > > Changes for v2:
> > > > - emac changes on top of https://patchwork.kernel.org/cover/1089952=
9/
> > > >   series
> > > >
> > > >  .../allwinner/sun50i-h6-orangepi-one-plus.dts |  8 ++++
> > > >  .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 42 +++++++++++++++=
++++
> > > >  2 files changed, 50 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-p=
lus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > > index 12e17567ab56..9e8ed1053715 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > > > @@ -9,4 +9,12 @@
> > > >  / {
> > > >       model =3D "OrangePi One Plus";
> > > >       compatible =3D "xunlong,orangepi-one-plus", "allwinner,sun50i=
-h6";
> > > > +
> > > > +     aliases {
> > > > +             ethernet0 =3D &emac;
> > > > +     };
> > > > +};
> > > > +
> > > > +&emac {
> > > > +     status =3D "okay";
> > > >  };
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi =
b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > > index 62e27948a3fa..c48e24acaf8a 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > > > @@ -45,6 +45,48 @@
> > > >               regulator-max-microvolt =3D <5000000>;
> > > >               regulator-always-on;
> > > >       };
> > > > +
> > > > +     /*
> > > > +      * The board uses 2.5V RGMII signalling. Power sequence to en=
able
> > > > +      * the phy is to enable GMAC-2V5 and GMAC-3V (aldo2) power ra=
ils
> > > > +      * at the same time and to wait 100ms.
> > > > +      */
> > > > +     reg_gmac_2v5: gmac-2v5 {
> > > > +             compatible =3D "regulator-fixed";
> > > > +             regulator-name =3D "gmac-2v5";
> > > > +             regulator-min-microvolt =3D <2500000>;
> > > > +             regulator-max-microvolt =3D <2500000>;
> > > > +             startup-delay-us =3D <100000>;
> > > > +             enable-active-high;
> > > > +             gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* GMAC_EN: PD6=
 */
> > > > +
> > > > +             /* The real parent of gmac-2v5 is reg_vcc5v, but we n=
eed to
> > > > +              * enable two regulators to power the phy. This is on=
e way
> > > > +              * to achieve that.
> > > > +              */
> > > > +             vin-supply =3D <&reg_aldo2>; /* VCC3V3-MAC: GMAC-3V *=
/
> > > > +     };
> > > > +};
> > > > +
> > > > +&emac {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > +     phy-mode =3D "rgmii";
> > > > +     phy-handle =3D <&ext_rgmii_phy>;
> > > > +     phy-supply =3D <&reg_gmac_2v5>;
> > > > +     allwinner,rx-delay-ps =3D <1500>;
> > > > +     allwinner,tx-delay-ps =3D <700>;
> > > > +};
> > > > +
> > > > +&mdio {
> > > > +     ext_rgmii_phy: ethernet-phy@1 {
> > > > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +             reg =3D <1>;
> > > > +
> > > > +             reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* RGMII=
-RESET: PD14 */
> > > > +             reset-assert-us =3D <15000>;
> > > > +             reset-deassert-us =3D <40000>;
> > > > +     };
> > > >  };
> > >
> > > ... however, at no point in time you explain why you made that switch=
,
> > > and while most of the definition of the EMAC nodes is in the DTSI, yo=
u
> > > only enable it in one DTS.
> >
> > The dtsi is shared b/w 1+ and lite2 and 1+ has emac, so I enabled the
> > status directly on dts and keeping the relevant nodes on dtsi just
> > like SoC dtsi does. do I need to mention this in commit log?
>
> Lite 2 doesn't have reg_gmac_2v5 and it also doesn't have the external ph=
y.
> But with this patch, reg_gmac_2v5 will also show up in the Lite 2's final
> DTB.
>
> Comapred to SoC dtsi, the SoC always has things that are in the dtsi, the=
y
> are just not enabled/used by the board, but they are present on the chip.
>
> So this comes down to what the meaning of board-level dtsi should be. I
> doubt we want it to mean "a collection of stuff that may or may not be
> present on the boards that depend on it".

Agreed.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190507070641.7whs4ckiqupaah35%40flea.
For more options, visit https://groups.google.com/d/optout.

--t252ai7obnvmcokm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXNEugQAKCRDj7w1vZxhR
xSqpAP9+c1gUKZN/ouCvKfloPe7AajE+A0yKbWtfWhHElWT14QEAzjJAuWb8Rv+a
FfdAW6X7qq2yr9sNkluAa/DRkDrm+Q8=
=30DV
-----END PGP SIGNATURE-----

--t252ai7obnvmcokm--
