From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun5i: Add touchscreen node to
 reference-design-tablet.dtsi
Date: Thu, 17 Nov 2016 19:35:20 +0100
Message-ID: <20161117183520.vpyw72mchynpqx7d@lukather>
References: <20161113192203.7101-1-hdegoede@redhat.com>
 <20161114200802.vdduhyxnkgmpsyd5@lukather>
 <0c3a9e9c-d310-c6c3-ae10-1ae9e520963e@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mcemdzigfkydcwxq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0c3a9e9c-d310-c6c3-ae10-1ae9e520963e-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--mcemdzigfkydcwxq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Nov 15, 2016 at 11:12:35AM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 14-11-16 21:08, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sun, Nov 13, 2016 at 08:22:02PM +0100, Hans de Goede wrote:
> > > Just like on sun8i all sun5i tablets use the same interrupt and power
> > > gpios for their touchscreens. I've checked all known a13 fex files and
> > > only the UTOO P66 uses a different gpio for the interrupt.
> > >=20
> > > Add a touchscreen node to sun5i-reference-design-tablet.dtsi, which
> > > fills in the necessary gpios to avoid duplication in the tablet dts f=
iles,
> > > just like we do in sun8i-reference-design-tablet.dtsi.
> > >=20
> > > This will make future patches adding touchscreen nodes to a13 tablets
> > > simpler.
> > >=20
> > > Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/sun5i-a13-utoo-p66.dts           | 38 ++++++++----=
----------
> > >  .../boot/dts/sun5i-reference-design-tablet.dtsi    | 25 ++++++++++++=
++
> > >  2 files changed, 39 insertions(+), 24 deletions(-)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot=
/dts/sun5i-a13-utoo-p66.dts
> > > index a8b0bcc..3d7ff10 100644
> > > --- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> > > +++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> > > @@ -83,22 +83,6 @@
> > >  	allwinner,pins =3D "PG3";
> > >  };
> > >=20
> > > -&i2c1 {
> > > -	icn8318: touchscreen@40 {
> > > -		compatible =3D "chipone,icn8318";
> > > -		reg =3D <0x40>;
> > > -		interrupt-parent =3D <&pio>;
> > > -		interrupts =3D <6 9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
> > > -		pinctrl-names =3D "default";
> > > -		pinctrl-0 =3D <&ts_wake_pin_p66>;
> > > -		wake-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
> > > -		touchscreen-size-x =3D <800>;
> > > -		touchscreen-size-y =3D <480>;
> > > -		touchscreen-inverted-x;
> > > -		touchscreen-swapped-x-y;
> > > -	};
> > > -};
> > > -
> > >  &mmc2 {
> > >  	pinctrl-names =3D "default";
> > >  	pinctrl-0 =3D <&mmc2_pins_a>;
> > > @@ -121,20 +105,26 @@
> > >  		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > >  		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> > >  	};
> > > -
> > > -	ts_wake_pin_p66: ts_wake_pin@0 {
> > > -		allwinner,pins =3D "PB3";
> > > -		allwinner,function =3D "gpio_out";
> > > -		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > > -		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> > > -	};
> > > -
> > >  };
> > >=20
> > >  &reg_usb0_vbus {
> > >  	gpio =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> > >  };
> > >=20
> > > +&touchscreen {
> > > +	compatible =3D "chipone,icn8318";
> > > +	reg =3D <0x40>;
> > > +	/* The P66 uses a different EINT then the reference design */
> > > +	interrupts =3D <6 9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
> > > +	/* The icn8318 binding expects wake-gpios instead of power-gpios */
> > > +	wake-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
> > > +	touchscreen-size-x =3D <800>;
> > > +	touchscreen-size-y =3D <480>;
> > > +	touchscreen-inverted-x;
> > > +	touchscreen-swapped-x-y;
> > > +	status =3D "okay";
> > > +};
> > > +
> > >  &uart1 {
> > >  	/* The P66 uses the uart pins as gpios */
> > >  	status =3D "disabled";
> > > diff --git a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi b/a=
rch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
> > > index 20cc940..7af488a 100644
> > > --- a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
> > > +++ b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
> > > @@ -41,6 +41,7 @@
> > >   */
> > >  #include "sunxi-reference-design-tablet.dtsi"
> > >=20
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > >  #include <dt-bindings/pwm/pwm.h>
> > >=20
> > >  / {
> > > @@ -84,6 +85,23 @@
> > >  };
> > >=20
> > >  &i2c1 {
> > > +	/*
> > > +	 * The gsl1680 is rated at 400KHz and it will not work reliable at
> > > +	 * 100KHz, this has been confirmed on multiple different q8 tablets.
> > > +	 * All other devices on this bus are also rated for 400KHz.
> > > +	 */
> > > +	clock-frequency =3D <400000>;
> > > +
> > > +	touchscreen: touchscreen {
> > > +		interrupt-parent =3D <&pio>;
> > > +		interrupts =3D <6 11 IRQ_TYPE_EDGE_FALLING>; /* EINT11 (PG11) */
> > > +		pinctrl-names =3D "default";
> > > +		pinctrl-0 =3D <&ts_power_pin>;
> > > +		power-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
> > > +		/* Tablet dts must provide reg and compatible */
> > > +		status =3D "disabled";
> > > +	};
> > > +
> > >  	pcf8563: rtc@51 {
> > >  		compatible =3D "nxp,pcf8563";
> > >  		reg =3D <0x51>;
> > > @@ -125,6 +143,13 @@
> > >  		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> > >  	};
> > >=20
> > > +	ts_power_pin: ts_power_pin {
> > > +		allwinner,pins =3D "PB3";
> > > +		allwinner,function =3D "gpio_out";
> > > +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > > +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> > > +	};
> > > +
> >=20
> > For the next release, we'll switch to the generic pin mux properties
> > ("pins" and "function"), and we actually implemented the fact that the
> > drive and pull properties are optional, so you can drop them both.
> >=20
> > You'll need next + http://lists.infradead.org/pipermail/linux-arm-kerne=
l/2016-November/467123.html
>=20
> Ok, before I send a v2 first a question about this, for the touchscreen
> case I actually need:
>=20
> 		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> 		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>=20
> Because otherwise when the touchscreen controller is powered by a separate
> regulator and that regulator is off, then it may draw just enough current
> from its enable pin to be sort-of listening to the i2c bus and mess up
> that bus.
>=20
> So is this the default, or do we get the power-on default when not
> specifying these? If it is the power-on default then we do need to
> specify these, because AFAICT the power-on drive strength typically
> is 20 mA.

Leaving them out will keep whatever state has been programmed. Putting
them in the DT will force them to whatever value has been set.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mcemdzigfkydcwxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLfhjAAoJEBx+YmzsjxAgLEkQAJ7vMmptamg2kKC4rWJhg8Co
/9rVotaDFndK2Q2kTS/hwTkAuPFEdDotjDl6lhSyrwojkFAot2KcLoUbJ5tJZEEV
FGoVtdEyPEN4UIntixgfVEbz6YKsi4v+K6Ic2EbkqDS524W4gBWiVs5AbMXP9HnU
hANPY1LlIAXpRh5mVaS1bLZKh/QPigBGTMX1cBK4VkAbbseOTOrDuwx9TFzKtLog
sluSnSS+58jOs0mS6bo99HvCK7qLJhn8x2pIDzV0eUKyQcLNhjcU3IKgK09z2twr
5Bun7oscUFaejWnhfx9kPhrjj56n9OvYupyMdagJfgLia1QJP1lmFJ3UYH9QnadD
iYb861ldNZlCt9Bc+IOWia6b2nvw4LfrdXFtnrCWM1+dEAG3sWeKRH3r/uuWexio
0yRjSPqJqVpsZZuKB4hQreEB5BWd2shkqT4BrFyyPEx2fnZqY8lEwQMK3uK5Ojtr
jwKioBwel7wxOSidtwcyZnIRK8zHfCmx5ztd5l9FMmR5hxjNcRxMrqAQGT8wCOwU
ZTriBIjo4EK8MkGQGbu2wZbtNqKdC0rzbm/fRJXrUgo8y6p6AICxHENYcAs2Na4p
kSFfQtTdAKF+YkcAjIUSe2wwKsjETZeI90HDwOgL0OnUitzZyqi2vvIfo9k9GjW/
KArXp+MK3XvrYH35ribJ
=+A/x
-----END PGP SIGNATURE-----

--mcemdzigfkydcwxq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
