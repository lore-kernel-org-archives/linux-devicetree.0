From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: sun8i: Add touchscreen node for
 sun8i-a23-gt90h
Date: Mon, 22 Aug 2016 20:30:09 +0200
Message-ID: <20160822183009.GX7104@lukather>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
 <1470685398-14568-4-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rG8Oha4Ryswg1dZ8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470685398-14568-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--rG8Oha4Ryswg1dZ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2016 at 09:43:14PM +0200, Hans de Goede wrote:
> The gt90h tablet has a gsl3675 touchscreen, add a dt node describing it.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts b/arch/arm/boot/dts=
/sun8i-a23-gt90h-v4.dts
> index f27ebbb..da55b5a 100644
> --- a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
> +++ b/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
> @@ -53,6 +53,14 @@
>  	status =3D "okay";
>  };
> =20
> +&gsl1680 {
> +	compatible =3D "silead,gsl3675";
> +	touchscreen-fw-name =3D "silead/gsl3675-gt90h.fw";

That's not documented anywhere, and looks really suspicious.

Rob, is that even allowed?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rG8Oha4Ryswg1dZ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXu0SxAAoJEBx+YmzsjxAg7U0P/R8MxDDGgJbaDFaWK/Y+VUqw
bUyJ1i7d56ENpzPfX9zV/+bIUKDgUpr94k8QuP5vU6TEqUmdWebDTBBc+jls9cs+
N07rggYTfVPflWhxr1/hBtFhV0K3cDhM9kd5nWjERsiPkxkoTpx+HlMfThxWjZvZ
wWZaHjmsPp7Pp9/asXswQK0WBrOiOG/aMCU0uiel+29VRlXfGOikNCKcFPsRLzVs
rT1GN3480uDdR7hJuAOu6mZuQhqmEUPhJm2eFIm3zluZsdQYm5sCVJMRPsPMH1G8
SO68kQey2dJYnlV+m7G0t9Lhw7E6kkyslgPrAbe89Uet1U68kcOrkZgE7SqhL+ld
MfnYMlaQNog58LANpkJrciVzmBIONtEpLGrwihIOBYf7spHSlj7DqV+IwJeIWAK1
J1VGxPXSkYQdnnIZBeDrQ4Z/QTlsZaB5WduND9BAiLYFwkZ/h9n/5KrgVuvoFH8S
5mc3HWQf3Ts0hSKJOaWjVYsaZfjgn9oeGynAOlbJk+ByOSsEuSHPudTbh5XcPf7S
NUBgwZe7vrLY4nQHMX+OgLOE2B0R6N8zY42YrMI2/g2FpbkD2oUFS0uvvUTUhniQ
7+qrZO6ky0uuqXFJbqb1f8NTYYx38eQIACbTrVrIsxGv40ByBbJjMWDz5dmRuz8y
oSuA3B+GjgCf01eQNxxg
=lkNx
-----END PGP SIGNATURE-----

--rG8Oha4Ryswg1dZ8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
