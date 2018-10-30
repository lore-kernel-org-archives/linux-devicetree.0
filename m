From: Jonathan McDowell <noodles@earth.li>
Subject: Re: [PATCH] dts: sun8i-h3: Add DTS for Mapleboard MP130
Date: Tue, 30 Oct 2018 22:08:13 +0000
Message-ID: <20181030220812.4zw7j6ymowbbtksy@earth.li>
References: <20181025195519.hil6o66h4ev2m62q@earth.li>
 <20181029152052.q75feg6ipsbysvfg@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m6brttlingh3itrm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181029152052.q75feg6ipsbysvfg@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org


--m6brttlingh3itrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 29, 2018 at 04:20:52PM +0100, Maxime Ripard wrote:
> Thanks for your patch.

Thanks for the comments.

> On Thu, Oct 25, 2018 at 08:55:19PM +0100, Jonathan McDowell wrote:
=2E..
> The prefix of your patch should be "ARM: dts: sun8i-h3: ..."

Ok.

> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index b5bd3de87c33..dcf1b9e7f71e 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1035,6 +1035,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >  	sun8i-h3-bananapi-m2-plus.dtb \
> >  	sun8i-h3-beelink-x2.dtb \
> >  	sun8i-h3-libretech-all-h3-cc.dtb \
> > +	sun8i-h3-mapleboard-mp130.dtb \
> >  	sun8i-h3-nanopi-m1.dtb	\
> >  	sun8i-h3-nanopi-m1-plus.dtb \
> >  	sun8i-h3-nanopi-neo.dtb \
> > diff --git a/arch/arm/boot/dts/sun8i-h3-mapleboard-mp130.dts b/arch/arm=
/boot/dts/sun8i-h3-mapleboard-mp130.dts
> > new file mode 100644
> > index 000000000000..bf948128af94
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun8i-h3-mapleboard-mp130.dts
> > @@ -0,0 +1,179 @@
> > +/*
> > + * Copyright (C) 2017 Centrum Embedded Systems, Jia-Bin Huang <jb@ces.=
com.tw>
> > + * Copyright (C) 2018 Jonathan McDowell <noodles@earth.li>
> > + *
> > + * This file is licensed under the terms of the GNU General Public
> > + * License version 2. This program is licensed "as is" without any
> > + * warranty of any kind, whether express or implied.
>=20
> You should add a SPDX tag instead of the license.

Done.

> We're also trying to license the DT under a dual GPL/MIT license,
> since they can be used by projects under a license that is not the
> GPL. But that's your call, obviously.

I'm building on top of Jia-Bin Huang's work, which was GPL only, so I'll
stick with that for the moment.

> > + */
> > +
> > +/dts-v1/;
> > +#include "sun8i-h3.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +
> > +/ {
> > +	model =3D "MapleBoard MP130 Board";
> > +	compatible =3D "mapleboard,mp130_board", "allwinner,sun8i-h3";
>=20
> The "board" in both the model and compatible is redundant.

Ok.

> > +
> > +	aliases {
> > +		ethernet0 =3D &emac;
> > +		serial0 =3D &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&leds_pio>, <&leds_r_pio>;
>=20
> You can drop those pinctrl nodes

Done.

> > +		pwr_led {
> > +			label =3D "mp130_board:orange:pwr";
> > +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> > +			default-state =3D "on";
> > +		};
>=20
> A new line here would be nice

Ok.

> > +		status_led {
> > +			label =3D "mp130_board:orange:status";
> > +			gpios =3D <&pio 0 10 GPIO_ACTIVE_HIGH>;
> > +		};
> > +	};
> > +
> > +	r_gpio_keys {
> > +		compatible =3D "gpio-keys";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&sw_r_pio>;
>=20
> Samething the pinctrl reference can be dropped

Ok.

> > +		power {
> > +			label =3D "power";
> > +			linux,code =3D <KEY_POWER>;
> > +			gpios =3D <&r_pio 0 3 GPIO_ACTIVE_LOW>; /* PL3 */
> > +		};
> > +
> > +		user {
> > +			label =3D "user";
> > +			linux,code =3D <BTN_0>;
> > +			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_LOW>;
> > +		};
>=20
> The labels should be under the form "board:color:function"

These are GPIO buttons, not LEDs, so I think you mean "board:function".
Will change.

> > +	};
> > +};
> > +
> > +&codec {
> > +	allwinner,audio-routing =3D
> > +		"Line Out", "LINEOUT",
> > +		"LINEIN", "Line In";
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci2 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci3 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ir {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&ir_pins_a>;
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +	vmmc-supply =3D <&reg_vcc3v3>;
> > +	bus-width =3D <4>;
> > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> > +	cd-inverted;
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mmc2_8bit_pins>;
> > +	vmmc-supply =3D <&reg_vcc3v3>;
> > +	bus-width =3D <8>;
> > +	non-removable;
> > +	cap-mmc-hw-reset;
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci2 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci3 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pio {
> > +	leds_pio: led_pins {
> > +		pins =3D "PA15";
> > +		function =3D "gpio_out";
> > +	};
> > +};
> > +
> > +&r_pio {
> > +	leds_r_pio: led_pins {
> > +		pins =3D "PL10";
> > +		function =3D "gpio_out";
> > +	};
> > +
> > +	sw_r_pio: key_pins {
> > +		pins =3D "PL3", "PL4";
> > +		function =3D "gpio_in";
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_pins_a>;
> > +	status =3D "okay";
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart1_pins>;
> > +	status =3D "disabled";
> > +};
> > +
> > +&uart2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart2_pins>;
> > +	status =3D "disabled";
> > +};
> > +
> > +&uart3 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart3_pins>;
> > +	status =3D "disabled";
> > +};
> > +
> > +&usb_otg {
> > +	dr_mode =3D "peripheral";
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +	/* USB VBUS is always on */
> > +	status =3D "okay";
> > +};
> > +
> > +&emac {
> > +	phy-handle =3D <&int_mii_phy>;
> > +	phy-mode =3D "mii";
> > +	allwinner,leds-active-low;
> > +	status =3D "okay";
> > +};
> > +
>=20
> This should be ordered alphabetically

Ok.

> > J.
> >=20
> > --=20
> > Revd Jonathan McDowell, ULC | Do you believe in happy endings?
>=20
> Please don't send patches through your mailer. git send-email can be
> configured to send the patches directly, this should be your preferred
> option.

I haven't previously had problems with using mutt to send these things
out (and for a single patch I tend to trust it more and like to see
exactly what's being sent), but I'll look into it.

J.

--=20
   101 things you can't have too   |  .''`.  Debian GNU/Linux Developer
       much of : 53 - Space.       | : :' :  Happy to accept PGP signed
                                   | `. `'   or encrypted mail - RSA
                                   |   `-    key on the keyservers.

--m6brttlingh3itrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEERUuPEyEc/2gMWDpQ/xYvxc8/utEFAlvY1kwACgkQ/xYvxc8/
utFdrhAAvZ+TxM+/gpbilnwdLhtOtS17CxyXx1aZX4yZi3kU23qfz7S2v7wI40n+
qblpw7/jveZFACVatKsh/5JoQmgJi0GIXEvfPaIGpqoZUeNS4XT6xNrnMtNw3QF+
qcKCd32DrD37/P6UybQku1l0a/WGB0VN+oR47Zytn1bhJCDhWXs/rwToXMwqg/02
BdwL3PdguNXtqfd8ykqn/q+tbbVMNS4GF4uHYJ+ye8UMRHvsrmrIPjP6utsxIblr
Bwx0+/2jMUUXrl05jH3WJfhXBIuCx2JSDin2gsR3n2xT85quKll/FHhBXSdlTM8Z
KS1BKbOV8+hBk2wGH4aQZbp9I4HZvS0cCVtuhFaszJlUgaFzTf6PrwvQr/sY9Jn3
y5d1JyKPH3AmXfIX/jJsqGM5u8ERpw2seyCCFLGxH3CxftehjFrmKRM67n/5Ci0R
MZLw2enmEVZMaSFSiZb1hLhOyrvh2DokFOPSzDcNPrFf/XOXpneVaAr/AUfTMBPp
920016qQasA/gzGkr9vAOPal35FOByAFrfmz708wgNr6ZpZOF44dOg7q8xytHL/p
rxYWguzE2/LGxwRmVElkJfm7PE42kZRFfnYGdQhIUeh6VrqMKfv41nrfu+jGg30S
CXdJC+f/gxpRKfA00KeyrF3EBySIIXMD6jXI7uVFa+NXhHrNgsc=
=FWh/
-----END PGP SIGNATURE-----

--m6brttlingh3itrm--
