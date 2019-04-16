From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ARM: dts: sun8i: v40:
 bananapi-m2-berry: Enable GMAC ethernet controller
Date: Tue, 16 Apr 2019 15:00:57 +0200
Message-ID: <20190416130057.bjaweorywikaa6ig@flea>
References: <1555065186-8154-1-git-send-email-pgreco@centosproject.org>
 <1555065186-8154-3-git-send-email-pgreco@centosproject.org>
 <20190415075309.p7pgj62mmtmxsnnr@flea>
 <eb80d64f-7355-071b-c1d1-04e0eb4475ce@centosproject.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2w42a2v2c5vbfesk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKNE27SQKGQEQZC3JXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <eb80d64f-7355-071b-c1d1-04e0eb4475ce-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Pablo =?utf-8?Q?Sebasti=C3=A1n?= Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2w42a2v2c5vbfesk
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

65;5600;1c
On Tue, Apr 16, 2019 at 07:47:09AM -0300, Pablo Sebasti=C3=A1n Greco wrote:
>
> El 15/4/19 a las 04:53, Maxime Ripard escribi=C3=B3:
> > On Fri, Apr 12, 2019 at 07:33:01AM -0300, Pablo Greco wrote:
> > > Just like the Bananapi M2 Ultra, the Bananapi M2 Berry has a Realtek
> > > RTL8211E RGMII PHY tied to the GMAC.
> > > The PMIC's DC1SW output provides power for the PHY, while the ALDO2
> > > output provides I/O voltages on both sides.
> > >
> > > Signed-off-by: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
> > > ---
> > >   arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 30 ++++++++++++=
+++++++++++
> > >   1 file changed, 30 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch=
/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> > > index f05cabd..0d79e91 100644
> > > --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> > > +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> > > @@ -50,6 +50,7 @@
> > >   	compatible =3D "sinovoip,bpi-m2-berry", "allwinner,sun8i-r40";
> > >
> > >   	aliases {
> > > +		ethernet0 =3D &gmac;
> > >   		serial0 =3D &uart0;
> > >   	};
> > >
> > > @@ -92,6 +93,22 @@
> > >   	status =3D "okay";
> > >   };
> > >
> > > +&gmac {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&gmac_rgmii_pins>;
> > > +	phy-handle =3D <&phy1>;
> > > +	phy-mode =3D "rgmii";
> > > +	phy-supply =3D <&reg_dc1sw>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&gmac_mdio {
> > > +	phy1: ethernet-phy@1 {
> > > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +		reg =3D <1>;
> > > +	};
> > > +};
> > > +
> > >   &i2c0 {
> > >   	status =3D "okay";
> > >
> > > @@ -123,6 +140,13 @@
> > >   	status =3D "okay";
> > >   };
> > >
> > > +&reg_aldo2 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt =3D <2500000>;
> > > +	regulator-max-microvolt =3D <2500000>;
> > > +	regulator-name =3D "vcc-pa";
> > > +};
> > > +
> > If this one provides power to the pins, it should be tied to the PIO
> > node.
>
> In that case, I should fix the bananapi-m2-ultra the same way. Do you pre=
fer
> me to add those fixes to this series?

If you have that board, then please add that yep.

> Or is it better to apply this like it is, and I fix both together in a
> separated series?

No, please resend a new version.

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
For more options, visit https://groups.google.com/d/optout.

--2w42a2v2c5vbfesk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLXSCQAKCRDj7w1vZxhR
xSSuAQCQ/kkSRgvp8XeaTQsZFfcjmgEBvvtjYDzpMrPJdVpClwD/Q3IuzuS0sWoE
nYcAS9VzOQTUlt9QAbaD7EeaL/sdOQg=
=0e9z
-----END PGP SIGNATURE-----

--2w42a2v2c5vbfesk--
