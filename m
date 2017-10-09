From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: sun8i: r40: add 5V regulator for Banana Pi M2
 Ultra
Date: Mon, 9 Oct 2017 23:04:07 +0200
Message-ID: <20171009210407.ueharyifho3s6xvu@flea.home>
References: <20171008042906.46779-1-icenowy@aosc.io>
 <20171008042906.46779-4-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ngebpu2bs7noklkr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171008042906.46779-4-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ngebpu2bs7noklkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 08, 2017 at 04:29:03AM +0000, Icenowy Zheng wrote:
> On newer revisions of the Banana Pi M2 Ultra boards, the 5V power output
> (used by HDMI, SATA and USB) is controller via a GPIO.
>=20
> Add the regulator node for it.
>=20
> Older revisions just have the 5V power output always on, and the GPIO is
> reserved on these boards. So it won't affect the older revisions.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm=
/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> index 7b52608cebe6..035599d870b9 100644
> --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> @@ -78,6 +78,15 @@
>  		};
>  	};
> =20
> +	reg_vcc5v0: vcc5v0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
> +		enable-active-high;

This is redundant with the GPIO flag

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ngebpu2bs7noklkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ2+RHAAoJEBx+YmzsjxAg35cQAKvGPLLmkJzZAhof4u3rbLWB
PEc4KKVJ36ueOYMgEIRUBVGYuDJAqqxyrifhTO2feVlO54J5GkssnPWX4lzZJKJh
3Dd72kkDb++q1gTCZT3zyXI50UQtMfllesjUlBtABt1iVFuFG0W5R6dPNyosf+3d
6wpUOhAbHZ7fhxFqoIPab4dnFVoh6GeqTIvrRF4wqBOEs7+WjqVytn+z3Z6nMsLC
Sxu8VE5jgCoe407oDid/MpdWg1OiK8FcAcsBHP33vfpst/kckyOTYBA3h8C5XAHd
nvvfomaN2qUt9AALQdKjXiySD60cHrZgUbaPgWhN4RxAc9a/vugZnF3Yg/t3g8Bk
RcwmeXmWui/ybqh0IqRPNQBIgBAj1mMG0yvOHVhGg60uvHkqzvWbu09tiX/d9W0q
wX4bZXzM2imcfJRLhn5VaEcVyENEJrosWFC9mKrnTc+34nGhTRoyOEe6NnmkwAAN
JkCdQSZ1/lNQQ9fJmAPzGnzOix3hLkYAftQQYnGv8kyZZhO3VpNEvp1cBYwpBPaB
E6iRwwZ7o3Iyno/XUiAoGjnhzGdm0ueM2bK1yQ+VSJfQJgOkxwO5QloucJ0dqRxF
kFRg+PEDaCwhqbxIk5sxo5QT3I1c8di4Zz0e30rNylO0j8mC7BnzdA9pIm1vTQTw
w4KAGzm9cLRpNUQ27apj
=F8yS
-----END PGP SIGNATURE-----

--ngebpu2bs7noklkr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
