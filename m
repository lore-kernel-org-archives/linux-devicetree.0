From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add mali node
Date: Tue, 13 Nov 2018 10:00:24 +0100
Message-ID: <20181113090024.puzll77rx5dylnhf@flea>
References: <20181111121811.21638-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dflgs3elxdgqizus"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181111121811.21638-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--dflgs3elxdgqizus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Sun, Nov 11, 2018 at 01:18:11PM +0100, Jernej Skrabec wrote:
> A64 has Mali400 MP2 GPU. Add a node for it.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  This node and A64 GPU binary driver was tested with Kodi on LibreELEC.
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index f3a66f888205..48cc5451d0eb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -753,6 +753,28 @@
>  			#size-cells =3D <0>;
>  		};
> =20
> +		mali: gpu@1c40000 {
> +			compatible =3D "allwinner,sun50i-a64-mali",
> +				     "arm,mali-400";

You should document that new compatible string. The patch looks good
otherwise, thanks!

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dflgs3elxdgqizus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+qSqAAKCRDj7w1vZxhR
xd5LAP9sPAyqmGLxfpUXrUL3/59yFZ5XKnj1mYcmKVOqQwHjoQD+IZGSL8LTxu4r
Nle/BpHo/axKq4lQJdeMNgQg9zthAw0=
=hg8i
-----END PGP SIGNATURE-----

--dflgs3elxdgqizus--
