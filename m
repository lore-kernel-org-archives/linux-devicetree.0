From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sunxi: h3/h5: Correct emac register size
Date: Thu, 6 Jul 2017 20:52:05 +0200
Message-ID: <20170706185205.f4jwskpnz4d3udvv@flea>
References: <20170706085334.25380-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fcgbg44eaedy3lba"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170706085334.25380-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--fcgbg44eaedy3lba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2017 at 10:53:34AM +0200, Corentin Labbe wrote:
> The datasheet said that emac register size is 0x1000 not 0x104
>=20
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi=
-h3-h5.dtsi
> index 716e7d668dec..5a57b67c9b77 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -406,7 +406,7 @@
>  		emac: ethernet@1c30000 {
>  			compatible =3D "allwinner,sun8i-h3-emac";
>  			syscon =3D <&syscon>;
> -			reg =3D <0x01c30000 0x104>;
> +			reg =3D <0x01c30000 0x1000>;

The size is actually 0x10000. I fixed it and applied.

The A64 DTSI has the same issue, can you send a patch for this one
too?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fcgbg44eaedy3lba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZXobVAAoJEBx+YmzsjxAgJcEP/iLNTR1rF5E7iJKPEO3KgnQN
wNkVyIvQueEDVK/GOUgWp+JxOh8dZrUnXS9oTodAH6Fi27TOZYwTG/2Xwp+nxs5C
UlcAUiHxK4ovJIHJYePcYss3X3/lHvMNUBWr8WxFwToRkEoYLWG6xtgA+Hr6Gg89
mBpsUBIgwcaiZI6VyKH02d5rl1dtgeabE7VOwRaO8yvaiaptJ7desQQGfeBjTWrp
eR2O63lK6bU54OkyID1vnLm/ONkD/5DAZp5AW3J5gIKny/c6xkVVD+8Jnf2zrMiy
9O7LCTJBwWlU9tpalbaN8CuiZPWjpCpOQu4sD8NQhf6j1eY8HcL4fNUqPzX0nqqv
zJm1rV71URMyT4LijCphqTHdz6h1JEiBFGEo5XaK0FY+xeHtxH6Cv2/MOK6bKNzZ
62oACzVOYoMstVJzmGrX31UkTExyOxIxWWUCC1TSJm/Tey9K90o2+8zON/kC3UZW
IhZml4czxic/kaykKkuKc9V0Rn7m3gC4zxT1ITgvcQ0irksQJf3plgjOtC/TBUQj
Zua2i3SocHCP1HQwQd4dw+9OZg9L4Qi5jftLPwihV92vkpTY4b6zLKcdxBipgDLg
/nYUa25bgsw5vpTS8lSNERuI9WNUPHHso0f0VreKWhxDVFK+ORkFk1lgOGCeFYet
pUauNv6aHFB10coTvVU5
=lo78
-----END PGP SIGNATURE-----

--fcgbg44eaedy3lba--
