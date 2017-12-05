From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: h3: enable USB OTG for NanoPi Neo board
Date: Tue, 5 Dec 2017 10:07:06 +0100
Message-ID: <20171205090706.et5a7dizkhn6auje@flea.lan>
References: <20171201224942.GA12473@t440.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wsipjvhjh6fq76lz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171201224942.GA12473-JrLRIG1mnG582hYKe6nXyg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Adamski <k@japko.eu>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wsipjvhjh6fq76lz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 01, 2017 at 11:49:42PM +0100, Krzysztof Adamski wrote:
> Similarly to Orange Pi Zero, NanoPi Neo board has an USB OTG port with
> an ID pin but with unpowered VBUS. This patch enables this port in
> forced peripheral mode.
>=20
> Signed-off-by: Krzysztof Adamski <k@japko.eu>
> ---
> arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dt=
s/sun8i-h3-nanopi-neo.dts
> index 78f6c24952dd..14c3f137dbd3 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> @@ -53,3 +53,20 @@
> 	allwinner,leds-active-low;
> 	status =3D "okay";
> };
> +
> +&usb_otg {
> +	status =3D "okay";
> +	dr_mode =3D "peripheral";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios =3D <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};

Please sort the nodes in alphabetical order.

Also, does it make sense to add the OHCI and EHCI controller for a
peripheral-only device?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wsipjvhjh6fq76lz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlomYbYACgkQ0rTAlCFN
r3T6LQ//V3SE6loii3CpfpAZZUdqh1c6ImrKAUfIXzX4KsswukBKxT73deKNGLOo
kkCTvben3dPpqgiWoegZo2ZXSnxGG1fLj/ki4QDGDT96awbz46y3GBP7qlx6OwBu
yIm9VG3aY6jxyHu7K3P8B8EekyEdDCvUvyfZIhxgoLLIooz6I9F4dTHX+EXyut/B
ovljSPclmvawTO6+9xxJSXhUdqO8kUQCCWXL1PJpPfYjwlcli/T29XwvhG7KHENb
3NsOdo5L7RvZZ7u5hTWQ03M2UkmnHdwessUfgxE1zlfVY0phAthhLQo7RaA00sgw
dyaubqUav6UU0bxQst16f1T01sBw/8AvZ4yMnFTCOeDFxA4CS8eP/ENcWEZ3R7+b
yTtpP0ONDKLMlehYi6WGppxMafpRpBBqKE9zsLhiTae/fXLR+aOCESz+D8UhoXjf
c/1GjwKT0gSq6lFaE4b+8jcoyIUqkOt2pTYMxr9I/Y39c65IRCBhxupwEnex1RES
2pPyUqynOvkY06eNZaCfmr55MnOzMTDqp5Rjugb3Y8jFEWk9XubPrTGTM9xnaQ9p
d9QdDxH13vsaJxZkx4X0uSIyaupaW5OqiJw0y0D+RJ24wAobNzDMtEvC6haoER4F
ftKhda9vk2U17oMYZl8sp0WEwe0k45YDRA9wNlUpgX/MSbhwJms=
=/Hcb
-----END PGP SIGNATURE-----

--wsipjvhjh6fq76lz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
