From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH] ARM: sun6i: a31: Enable HDMI support on the
 Mele I7
Date: Wed, 31 Jan 2018 16:32:04 +0100
Message-ID: <20180131153204.wm7sdwowvnjg2wd6@flea.lan>
References: <20180130183327.20825-1-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5w2z4rsyebboym67"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180130183327.20825-1-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5w2z4rsyebboym67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2018 at 07:33:27PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> The Mele I7 has an HDMI connector wired to the HDMI pins
> on the SoC. Enable the display pipeline and HDMI output.
>=20
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Chen-Yu is missing from the recipients...

> ---
>  arch/arm/boot/dts/sun6i-a31-i7.dts | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31-i7.dts b/arch/arm/boot/dts/sun6i=
-a31-i7.dts
> index 010a84c7c012..4f69be4988a5 100644
> --- a/arch/arm/boot/dts/sun6i-a31-i7.dts
> +++ b/arch/arm/boot/dts/sun6i-a31-i7.dts
> @@ -58,6 +58,17 @@
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
>  		pinctrl-names =3D "default";
> @@ -93,6 +104,10 @@
>  	status =3D "okay";
>  };
> =20
> +&de {
> +	status =3D "okay";
> +};
> +
>  &ehci0 {
>  	status =3D "okay";
>  };
> @@ -101,6 +116,16 @@
>  	status =3D "okay";
>  };
> =20
> +&hdmi {
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
>  &gmac {

And this is not ordered alphabetically.

maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5w2z4rsyebboym67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpx4XMACgkQ0rTAlCFN
r3TcHRAAjtdQB8CGQF8Oc8u/tAOf/fm0hAJM6suIPxFBSys7xSerAM3g+KdQlEKA
P3ghke6OYSAJeMT2PHT1OE+e6R4ts6yrsmbgP7HsgLcgkULZdVw+DoVIY7F6Nrhn
FTYM4I95Sh+9ozSEw8YBypD+992tyVyf2TxLVXjIF+2fFYwPWHMTRjVHAigMeRot
Kr04NCgKCaqCcWpal4p86mqivMk/yP9wVtXYao3gO1g84I5PJ9tp7+QZSURn8Ojj
s+5ELHwhkDI41yZfsjWqmIrhAdE1CaWSkVkRZyZANfRaeOARMrJn9qGrJg66wiKN
2XVO0lTO9gEMacQvh7BI+1KPnsxKrkOsogATDe0JhvsXk38iW0x31sD7QDEqb/TJ
8SfWBaMu/VzL0xrex78Y90zjqBy5LyLkYtQVtVu5rA5LHgUOROa1dzMk080q+EFj
jOxXr8eUbrMTUGNmuUq62vPLpAnzaF5hJDwyhYpvS9xB0qJd5usMgDqKxB7DCsTp
giiAej4DJES46eRw8kH2lNx8aiP2MWebBukYv1H8myzb1217Z7jJOcy+YdnRs0I1
J3KNFTDHAKeX4izjrmm07L25/5vn3ze/u/fDDV+bY9fozCfVwDNOqXgEB4GKHc5a
sIcT4qUsJ4v9+U6vUUWYKjOVOxwBrUd6W+9owWoA/8XOp0/WyfM=
=D8VV
-----END PGP SIGNATURE-----

--5w2z4rsyebboym67--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
