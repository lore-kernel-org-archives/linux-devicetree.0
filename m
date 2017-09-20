From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] arm: sun8i: nanopi-neo: Enable USB OTG
Date: Wed, 20 Sep 2017 10:54:00 +0200
Message-ID: <20170920085400.ipaduwj5ccslkg43@flea.home>
References: <20170920043923.16425-1-ddiss@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vyvsp4e6jxzav4gr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170920043923.16425-1-ddiss-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Disseldorp <ddiss-l3A5Bk7waGM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, David Disseldorp <ddiss-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--vyvsp4e6jxzav4gr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2017 at 04:39:23AM +0000, David Disseldorp wrote:
> From: David Disseldorp <ddiss-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
>=20
> The NanoPi NEO features a MicroUSB port that can work in both host mode
> and peripheral mode. Switching is handled via GPIO PG12.
>=20
> Signed-off-by: David Disseldorp <ddiss-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> ---
> Changes since v1
> - remove duplicate ehci3/ohci3 definitions, which are already carried in
>   sun8i-h3-nanopi.dtsi
>=20
>  arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts b/arch/arm/boot/dt=
s/sun8i-h3-nanopi-neo.dts
> index 78f6c24952dd..17b07c3df369 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> @@ -47,9 +47,28 @@
>  	compatible =3D "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
>  };
> =20
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
>  &emac {
>  	phy-handle =3D <&int_mii_phy>;
>  	phy-mode =3D "mii";
>  	allwinner,leds-active-low;
>  	status =3D "okay";
>  };
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	/* USB Type-A port's VBUS is always on */

I'm not sure what that comment is here for.

> +	usb0_id_det-gpios =3D <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */

And that means that you cannot switch VBUS on on the board?

In this case, it's not able to do proper OTG like advertised above.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vyvsp4e6jxzav4gr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZwiyoAAoJEBx+YmzsjxAgEEoP/jDJGGmuK+1S57E005HCl9Jf
qxLyHscYO8+E9s6MnfMnkp1G/96S5FYKo7GNUdZLWwHWQ1a1HYar8OdZclZu3A9o
QtZKqVqyMTZAkg7fszAiir0H8qy8SHitXhb1MfKsB7i9JMboRnghGYVNWkFrQSZA
7mzOwWkgD0odLZ8Q5CKSQw9zlm4oPElUnOVDFmcXHtAV1SxPvLumP3ltB6W5k2Dm
LgvMOgVob6/qQ38H7cgXbz6xqXmsjZFtn9rxuTvQbkA497ljhxr0Zc4b3YX3VbrV
wYX75mN3Wz89tAAajn5dfqFVFH3LnjKNXYNr9JyigQR8hwlmQuhyLJvzMHT9Z+wn
Ym2AbiuTS7/aSD27my+48WFHV3DjRpVjI8x6oj6ms4nVyQ5fJeuo2DoJSjJVVxIk
KDoWAP6WgLufSGLxkRBroDSdy7Om9jgBarC50pwDaawNwDuI50Q+IS3w2iZtzOuZ
oW/GEhyd6dP+p3zk1x1gDVjwLGOWHZSZJVJ2ZIR410yz/wM/PnT6XDY5glRaFlNo
CbJptSAXblHr4TRLBXhdSHu8h8Naf4fd8ebUKEtKTTXMZ9j0qs9dl0cvZsaBs8ZK
jvSV0ykdvbdNV3MJ9MyMonWZ39XZ05IEwoLoWB1fr436bkG5sPwe2IeQDA4yBT+8
EmZ89uPIqaOqf2sq7cio
=MoVT
-----END PGP SIGNATURE-----

--vyvsp4e6jxzav4gr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
