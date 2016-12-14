From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Change node name for pwrseq pin on
 Olinuxino-lime2-emmc
Date: Wed, 14 Dec 2016 15:09:34 +0100
Message-ID: <20161214140934.zdztogdjjis23raw@lukather>
References: <20161214100856.23735-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s4e7ovwn6was2fd3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161214100856.23735-1-manu@bidouilliste.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--s4e7ovwn6was2fd3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Emmanuel,

On Wed, Dec 14, 2016 at 11:08:56AM +0100, Emmanuel Vadot wrote:
> The node name for the power seq pin is mmc2@0 like the mmc2_pins_a one.
> This makes the original node (mmc2_pins_a) scrapped out of the dtb and
> result in a unusable eMMC if U-Boot didn't configured the pins to the
> correct functions.
>=20
> Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>
> ---
>  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts b/arch/=
arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
> index 5ea4915..68cb1b5 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
> @@ -56,7 +56,7 @@
>  };
> =20
>  &pio {
> -	mmc2_pins_nrst: mmc2@0 {
> +	mmc2_pins_nrst: mmc2@1 {

That would be even better if you renamed it to something like
mmc2-rst-pin to avoid all future conflicts (for example if we ever add
a second mmc pins groups.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--s4e7ovwn6was2fd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUVKaAAoJEBx+YmzsjxAgJY4QAIwZ9sJfboUOWfDbFPASTr+3
bIi70ihr9ZPgNYhn58j95zyIyvOdQGKVAY+G9i6qGlROluoge8yx3sZFqNHzRCZ0
5+9vbaX/FWDcXRQt9iFAXBcC2dreHQGMe9nMU3IXB+/IqdT6huKrIlmlbfDwQL8F
oloqgv+5OmLYxeCxR+n4EVex4aKWTpuKefDNrIAMs+nWfikIucU9GOQEgzPS7LKU
PZPAK2dtBZ4m/7PL5q7TqdOm6jBV6asKiuTpggocTv0sxSreD6UtaoATdtTjG0Y8
o+VYNPWwEfGhj+FkOSGZ/BRprVZ6CQGJ9tu1gLhMP27nWS8gxgds6+ye/YEkVEF+
ueOtMezEX7znOlRgVklnQn1g9aaMoSclUwBu5BZID2ukbF/9OB3/VeFvkdhnggCH
4nLqWDWxSSvbLRNPmqhKG8y1pyC4SJvcnCYc4fqi3Qf0GkrGy3YVjl9mWh6+2pBC
Lxcxwv2VPQmnviZcfOSdDh3wm1gpMrQqvn2HjXX0lIYs2e39zG/A98fBHhMGXRen
ehBWL1LHAXOEmStStkYH2mlzn1qj45Aj8hxxWRgcMDZjZIB4OIC85eg7mrw7u/IA
Tu5b+naWuoBzkn5dwxelB5DSANVpN17M107kM/wd7xRTBK4KiXrlOtgMnPEaRR1x
bYVZEgAq7rH5OKL8RU1o
=hH9q
-----END PGP SIGNATURE-----

--s4e7ovwn6was2fd3--
