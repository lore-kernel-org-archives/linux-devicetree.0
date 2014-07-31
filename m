From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: sun7i: Add Banana Pi board
Date: Thu, 31 Jul 2014 18:52:12 +0200
Message-ID: <20140731165212.GG3952@lukather>
References: <1406653348-16638-1-git-send-email-hdegoede@redhat.com>
 <20140731095800.GA3952@lukather>
 <53DA1A89.4000104@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wQkw7DhpL9hyPo7K"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBCPL5GPAKGQE33C2H6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53DA1A89.4000104-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wQkw7DhpL9hyPo7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 12:29:29PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 07/31/2014 11:58 AM, Maxime Ripard wrote:
> > Hi Hans,
> >=20
> > On Tue, Jul 29, 2014 at 07:02:28PM +0200, Hans de Goede wrote:
> >> The Banana Pi is an A20 based development board using Raspberry Pi com=
patible
> >> IO headers. It comes with 1 GB RAM, 1 Gb ethernet, 2x USB host, sata, =
hdmi
> >> and stereo audio out + various expenansion headers:
> >>
> >> http://www.bananapi.org/
> >>
> >> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/Makefile               |   1 +
> >>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 183 ++++++++++++++++++++++=
+++++++++
> >>  2 files changed, 184 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/sun7i-a20-bananapi.dts
> >>
> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> index bdbc84a..440e037 100644
> >> --- a/arch/arm/boot/dts/Makefile
> >> +++ b/arch/arm/boot/dts/Makefile
> >> @@ -379,6 +379,7 @@ dtb-$(CONFIG_MACH_SUN6I) +=3D \
> >>  	sun6i-a31-hummingbird.dtb \
> >>  	sun6i-a31-m9.dtb
> >>  dtb-$(CONFIG_MACH_SUN7I) +=3D \
> >> +	sun7i-a20-bananapi.dtb \
> >>  	sun7i-a20-cubieboard2.dtb \
> >>  	sun7i-a20-cubietruck.dtb \
> >>  	sun7i-a20-i12-tvbox.dtb \
> >> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/=
dts/sun7i-a20-bananapi.dts
> >> new file mode 100644
> >> index 0000000..0332b82
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> >> @@ -0,0 +1,183 @@
> >> +/*
> >> + * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >> + *
> >> + * The code contained herein is licensed under the GNU General Public
> >> + * License. You may obtain a copy of the GNU General Public License
> >> + * Version 2 or later at the following locations:
> >> + *
> >> + * http://www.opensource.org/licenses/gpl-license.html
> >> + * http://www.gnu.org/copyleft/gpl.html
> >> + */
> >> +
> >> +/dts-v1/;
> >> +/include/ "sun7i-a20.dtsi"
> >> +/include/ "sunxi-common-regulators.dtsi"
> >> +
> >> +/ {
> >> +	model =3D "LeMaker Banana Pi";
> >> +	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
> >> +
> >> +	soc@01c00000 {
> >> +		spi0: spi@01c05000 {
> >> +			pinctrl-names =3D "default";
> >> +			pinctrl-0 =3D <&spi0_pins_a>;
> >> +			status =3D "okay";
> >> +		};
> >> +
> >> +		mmc0: mmc@01c0f000 {
> >> +			pinctrl-names =3D "default";
> >> +			pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_bananapi>;
> >> +			vmmc-supply =3D <&reg_vcc3v3>;
> >> +			bus-width =3D <4>;
> >> +			cd-gpios =3D <&pio 7 10 0>; /* PH10 */
> >> +			cd-inverted;
> >> +			status =3D "okay";
> >> +		};
> >> +
> >> +		usbphy: phy@01c13400 {
> >> +			usb1_vbus-supply =3D <&reg_usb1_vbus>;
> >> +			usb2_vbus-supply =3D <&reg_usb2_vbus>;
> >> +			status =3D "okay";
> >> +		};
> >> +
> >> +		ehci0: usb@01c14000 {
> >> +			status =3D "okay";
> >> +		};
> >> +
> >> +		ohci0: usb@01c14400 {
> >> +			status =3D "okay";
> >> +		};
> >> +
> >> +		ahci: sata@01c18000 {
> >> +			status =3D "okay";
> >> +		};
> >> +
> >> +		ehci1: usb@01c1c000 {
> >> +			status =3D "okay";
> >> +		};
> >> +
> >> +		ohci1: usb@01c1c400 {
> >> +			status =3D "okay";
> >> +		};
> >> +
> >> +		pinctrl@01c20800 {
> >> +			uart3_pins_bananapi: uart3_pin@0 {
> >> +				allwinner,pins =3D "PH0", "PH1";
> >> +				allwinner,function =3D "uart3";
> >> +				allwinner,drive =3D <0>;
> >> +				allwinner,pull =3D <0>;
> >> +			};
> >=20
> > That node should be in the DTSI
>=20
> I deliberately put it here because it is non standard, uart3
> has 4 pins rx, tx, cts and rts, which can be mapped to either
> PG6-9 or PH0-3 but here only 2 are used, it seemed appropriate
> to put this inside the dts, if we start also taking pinctrl
> variants where a subset of the pins are used into the dtsi
> then we will end up with a lot of pinctrl entries there.

We're already pretty much in that situation, and most UART (aside from
UART0) can work with at least 4 pins, so it's nothing new really.

There was some patches made to DTC at some point to garbage collect
specifically flagged nodes when they're not referenced, which would
prevent the DTB size to get too big. I'm not sure about the status of
these patches though.

But it's definitely something that is worked on, and we shouldn't
worry too much about it.

>=20
> Note if you decide to take this as is, please
> s/bananapi.org/lemaker.org/ in the commit message, bananapi.org
> is an unofficial site, I should have put lemaker.org there.
>=20
> Note btw that we already have this problem for spi1, the
> current spi1_pins_a does not include the cs1 pin, because it
> was added for use in sun7i-a20-olinuxino-micro.dts where
> only cs0 is hooked up, but I decided to leave that as is for now.

Yeah, that's another issue, maybe we should split the SPI pinctrl
nodes then, to have the "main" pins (CLK, MISO, MOSI), and then
individual nodes for each chip select.

> Also the "primary" binding for spi2 is to PORTB, but
> our spi2_pins_a binds it to PORTC, so it should be renamed
> spi2_pins_b IMHO.

I don't have any opinion on this, I was applying the "whoever is first
wins" on this, but if you come up with a better and more sensible
policy, it's totally fine for me :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--wQkw7DhpL9hyPo7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT2nQ8AAoJEBx+YmzsjxAgspEP/2RwMzKG07gdw3rru0uKq1Vv
R6LrnaPwVAsdGLUnensPmWeNL9w+o2Y4hwSdoljrY6sQaYGknHabkqCKSKNfoNEw
Fg/cmoeAPk7jEv/c47a35ioSYshyZEjw5W6AjwHaFWb6YJBGdYqH480vRQ5KFmhz
z4Dt1y2ZGCGWpmh2zpC9QDQKRdidOK7GKcagdaGh+eo+ckUXVod2U4G9FQnMXXhs
V1D2yc2DHcGa7tv2tEBh/ekiu2SeRbpNLDYxxsGbazZas14TUxDyJ0IB0NJg9FKU
O5eKto9qd/k9knXeCZv1rUH0PNtXcmD5qa8Ylw/JNjxKMeBiyfFj0LlvK8VjUQcV
gEP3at1dFG/zhjFTpqsN8aFxM+KSPWQwc3yMpdxCVeJ6/nYY2P+nTv1GCoPMr0j+
+2k26lB4ZLbSytIcXd4SjtiHD7f3zfbW5z+dUnjqJukD82UEt8w/Xk7yWqxBap2g
4okVpUNGHP045xSUOTT9C/DugyRzNrFxKY0yqnESpm1AGBgtkI6fT5oegVd2ixyc
Dp5YcpendJF/ZPtxEY6q/ldYiMH0Hw8JPs8deq2elomMs+Mosz4r168GbNgVTLSb
ogYnpPpwWgXjpKH6OY44cR90qW7B2aJP2RgeygVFChgMTNx5HSRKmzk4CA9sBnIJ
iXEU2Ut53DgFHalaoWWC
=CbSM
-----END PGP SIGNATURE-----

--wQkw7DhpL9hyPo7K--
