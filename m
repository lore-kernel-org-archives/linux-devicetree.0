From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v1] ARM: dts: sun7i: provide ramoops region on BananaPi
Date: Thu, 22 Jun 2017 08:16:17 +0200
Message-ID: <20170622061617.5guhcyxdthvmiq7j@flea.lan>
References: <1498065017-30556-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zlgqqimsx2g5o662"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498065017-30556-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zlgqqimsx2g5o662
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Oleksij,

On Wed, Jun 21, 2017 at 07:10:17PM +0200, Oleksij Rempel wrote:
> This should help provide useful debug information on remote
> targets without UART.
>=20
> Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts=
/sun7i-a20-bananapi.dts
> index ed2f35a..38923bf 100644
> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> @@ -63,6 +63,22 @@
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		ramoops@7fb6a000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0x7fb6a000 0x100000>;
> +			ecc-size	=3D <16>;
> +			record-size	=3D <0x00020000>;
> +			console-size	=3D <0x00020000>;
> +			ftrace-size	=3D <0x00020000>;
> +			pmsg-size	=3D <0x00020000>;
> +		};
> +	};
> +

I'm a bit skeptical about this one.

First, there's nothing specific to the bananapi, but every one will
want to have different sizes here, or different parameters.

Since using the kernel parameters is also an option, I'd rather
document how to do that with the parameters.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zlgqqimsx2g5o662
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZS2CwAAoJEBx+YmzsjxAgIPEQAKk9JaWGfUqCR7g0xigBW1re
OrcybzmI/Nl9+h3H8SQQS5dETBYGYzfwoGM4QUTvVODi4YSibf76PsENkpdw9vDG
qgxQFxs9Nc9c2fOaisgQpUGG1WHiGUU1qy9Wsj1oQT0wUqGWWG6ejsgVSGsUc302
RNMWa6AHseI6efSY1z2RF0FHP2YmKkCtVkAO+GjEaWCx8FHiMyBmGTZxnXx/ziuk
bsMShCcDa7v6/s/sY+gu/3Vro5i5ChZYpuQ0h9rQhQcDcm1CROv6K38o4SNdK18z
3eveQYE8HESN/Hii3iXMTcDTk6NBGTZtNQUi4ptFfNyPO+4Idk8gp6nWbE0fTQ/N
zv81475gwGbJyIFv3H1lRSQN6Hq4iK/WKYDS3gOzmcZqLOdVZE+khMtWOTgMR48X
ZVN19AYCe4bfHyOUJ2UcDoDgdsPfMKYQJPbMxZT4IuHwfLFjHDlwGBjh2VknCLM4
A2tJqMRQQYSb93AVPSndgMXkYpi7XiNeODAW0+2nzqE4EmyntEXGEiR0AEAPpWqF
bEHTsLquljLZT6wbF5xw1IgzK79C5TBqhhCWEQC0dE8tYRZaZtDriTD5WyL2b/UV
WIM1VWKHxpKlbNFWTKhgPVQimf4JLJGcVPKUMA3fbfSCLAUYgj0GDCxkJcHZrDJ5
oBCFYt2rur7cUByGdli2
=whId
-----END PGP SIGNATURE-----

--zlgqqimsx2g5o662--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
