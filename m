From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ARM: dts: sun50i: h6: Introduce
 Beelink GS1 board
Date: Fri, 5 Apr 2019 17:11:00 +0200
Message-ID: <20190405151100.jjjg55z7sg35ijxw@flea>
References: <20190405122446.2101-1-peron.clem@gmail.com>
 <20190405122446.2101-5-peron.clem@gmail.com>
 <CAJiuCcfbnR+Jfj8Je_4HwgycCBEe92sx6zqwqgXpeiMe2jKL-Q@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vydzdtbzehqip32c"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBXATXSQKGQE7LQ6PSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAJiuCcfbnR+Jfj8Je_4HwgycCBEe92sx6zqwqgXpeiMe2jKL-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vydzdtbzehqip32c
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 02:53:35PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi,
>
> Adding this r_pio regulators make a new error in the bootlog :
>
> [    0.346843] sun50i-h6-r-pinctrl 7022000.pinctrl: Couldn't get bank
> PL regulator
> [    0.346853] sun50i-h6-r-pinctrl 7022000.pinctrl: request() failed for =
pin 352
> [    0.346862] sun50i-h6-r-pinctrl 7022000.pinctrl: pin-352
> (7081400.i2c) status -517
> [    0.346871] sun50i-h6-r-pinctrl 7022000.pinctrl: could not request
> pin 352 (PL0) from group PL0  on device 7022000.pinctrl
> [    0.346878] mv64xxx_i2c 7081400.i2c: Error applying setting,
> reverse things back
>
> PL0 and PL1 are SCK/SDA for the PMIC :(

How was this DT tested then?

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

--vydzdtbzehqip32c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKdwBAAKCRDj7w1vZxhR
xRckAP4wZ46tgKZYKDJhYKIgcd4LHvEUq6BNr/w1FqxiVL6TswEA6p6RUzr55f9c
tpfmanzizb77MMjF9zA6P9bPohY6EgM=
=3hKq
-----END PGP SIGNATURE-----

--vydzdtbzehqip32c--
