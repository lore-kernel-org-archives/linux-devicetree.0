From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add Olimex
 A20-SOM204-EVB board
Date: Thu, 18 Jan 2018 11:07:45 +0100
Message-ID: <20180118100745.y62adzvfnrzqkagd@flea.lan>
References: <1515747666-6597-1-git-send-email-stefan@olimex.com>
 <20180115095031.pzsgrp3tdmemotrs@flea.lan>
 <1b9667a4-75de-4ece-069d-7ec33b7e2f8d@olimex.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mniub4tbsrv3bavd"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7PDQHJQKGQE2BRPDWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1b9667a4-75de-4ece-069d-7ec33b7e2f8d-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mniub4tbsrv3bavd
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, Jan 15, 2018 at 12:07:34PM +0200, Stefan Mavrodiev wrote:
> > > +/dts-v1/;
> > > +#include "sun7i-a20.dtsi"
> > > +#include "sunxi-common-regulators.dtsi"
> > > +
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > +#include <dt-bindings/pwm/pwm.h>
> > > +
> > > +/ {
> > > +	model =3D "Olimex A20-SOM204-EVB";
> > > +	compatible =3D "olimex,a20-olimex-som204-evb", "allwinner,sun7i-a20=
";
> > > +
> > > +	aliases {
> > > +		serial0 =3D &uart0;
> > > +		serial1 =3D &uart4;
> > > +		serial2 =3D &uart7;
> > > +		spi0 =3D &spi1;
> > > +		spi1 =3D &spi2;
> > > +		ethernet1 =3D &rtl8723bs;
> >
> > ethernet1? if there's a single network interface, it should be
> > ethernet0.
>
> I think this will conflict the gmac alias defined in sun7i-a20.dtsi:
>=20
> aliases {
> =C2=A0=C2=A0=C2=A0 ethernet0 =3D &gmac;
> };

We have that? That's bad, but you're right :)

> > > +		stat {
> > > +			label =3D "a20-som204:green:stat";
> > > +			gpios =3D <&pio 8 0 GPIO_ACTIVE_HIGH>;
> > > +			default-state =3D "on";
> > > +		};
> > > +
> > > +		led1 {
> > > +			label =3D "a20-som204-evb:green:led1";
> > > +			gpios =3D <&pio 8 10 GPIO_ACTIVE_HIGH>;
> > > +			default-state =3D "on";
> > > +		};
> > > +
> > > +		led2 {
> > > +			label =3D "a20-som204-evb:yellow:led2";
> > > +			gpios =3D <&pio 8 11 GPIO_ACTIVE_HIGH>;
> > > +			default-state =3D "on";
> > > +		};
> >
> > You don't have the same prefix between stat and led1/led2. I'm fine
> > with both, but you should be consistent :)
>
> STAT led is on the SOM204 module, while led1/2 on the EVB. Thats why
> they have different prefix.

Still, the user and the system will see it as a single board, and the
documentation states that it should be the board name. I'm not quite
sure what a good rule would be here. Have you looked at how other
boards dealt with it? Chen-Yu, any opinion on this?

> >=20
> > > +	};
> > > +
> > > +	mmc2_pwrseq: mmc2_pwrseq {
> > > +		compatible =3D "mmc-pwrseq-emmc";
> > > +		reset-gpios =3D <&pio 2 16 GPIO_ACTIVE_LOW>;
> > > +	};
> > This is already declared in the emmc variant, isn't it?
> >=20
> > > +	rtl_pwrseq: rtl_pwrseq {
> > > +		compatible =3D "mmc-pwrseq-simple";
> > > +		reset-gpios =3D <&pio 6 9 GPIO_ACTIVE_LOW>,
> > > +			      <&pio 1 11 GPIO_ACTIVE_LOW>;
> > > +	};
> >
> > It looks suspicious that you have two reset lines.
>
> RTL8723BS is comblo WiFI/BT module. There is separate reset control
> for each of the systems.

You should tie the reset line to their associated device then. In this
case, you're linking the BT reset line to the wifi device, which in
turn means that if your MMC driver is not loaded / enabled, the BT
part will not work. That's obviously not ideal.

> > > +&spi1 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&spi1_pins_a>,
> > > +		    <&spi1_cs0_pins_a>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&spi2 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&spi2_pins_a>,
> > > +		    <&spi2_cs0_pins_a>;
> > > +	status =3D "okay";
> > > +};
> > What is connected on those buses
>
> As mentioned SPI1/2 are exposed to UEXT1/2.

Ok, please make that a comment.

> >=20
> > > +&uart0 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&uart0_pins_a>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&uart3 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&bt_uart_pins>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&uart4 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&uart4_pins_a>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&uart7 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&uart7_pins_a>;
> > > +	status =3D "okay";
> > > +};
> > Same thing for these three UARTs
>
> Uart3 is used for H5 BT protocol. UART4/7 are exposed to UEXT.

Ok, comments for those as well then :)

yyThanks!
maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--mniub4tbsrv3bavd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpgcfAACgkQ0rTAlCFN
r3R2MA/5AYsiYcEw1T5Gbyyclhbkq/DR5nGrvU4ke8M3Udl8sJmrEAstKkD1eoyp
lyQCJInWQsIXz6rQm90a9lD5KZNmBZptPmwkQkGFNqKfF02tdTKDmMdZCU77aloR
FYeqoWPGE19KQpQ3GigYWpRvzhGiJwaVy3swM99SuK9d823nbZ6j/cvRKg8lrFPS
zaaZWPRsCFncsUNctKZW5+mFHtj70inj3WBJDczEme+UoxG3rH2g8CzHs1p+6Crp
4NRwuHa00pZCgxjDNd5x9nftpqtTETyEF7OhCvypxd58ckUEscyaPydAQtgw1v7L
AL7qti6u+1UMrRUIXznKDuxEazeRH9tH+Wr+wqYki10UMuerdFyEptpFfelbREjt
mfYJeNd7VFQLHpknirM3fINq2r8J7I8eswcoz66WbCxhgxghfY+PA38ycz36sFRT
oOlXxmLcouVEdVGSXjUIMGt77LL8Z4QFw10p5PRE/Fi4FQYA3Ght0cAnUF/zCxRM
8ZDiv4XuNRqwASQhhi7Gth4JrVqn6/0CsrPWz4hVTqxvRKvyHZVUSjGT+KaF8GmR
tJqgIRA3FHO/WPamnmf9Z6MFsDFtia19h/yjZ4YwPT7CjGatwhd2eFmt8R18e9GT
5t7g/o2ZcOjZRA7Zp5rdZ+WCRzhUldmYr+oybEpJwVEXGiQkgr4=
=Ccb4
-----END PGP SIGNATURE-----

--mniub4tbsrv3bavd--
