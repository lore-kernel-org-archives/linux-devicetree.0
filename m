From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/8] arm64: dts: allwinner: Add ARM Mali GPU
 node for H6
Date: Thu, 11 Apr 2019 09:28:06 +0200
Message-ID: <20190411072806.yr3z3ei6djjhpo32@flea>
References: <20190410232543.13297-1-peron.clem@gmail.com>
 <20190410232543.13297-5-peron.clem@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z6x6bvm6fottyrqb"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBCOZXPSQKGQEAQP5WEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190410232543.13297-5-peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--z6x6bvm6fottyrqb
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 01:25:39AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> Add the mali gpu node to the H6 device-tree.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 80 ++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index e0dc4a05c1ba..152b2128aadf 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -17,6 +17,71 @@
>  	#address-cells =3D <1>;
>  	#size-cells =3D <1>;
>
> +	gpu_opp_table: opp_table1 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp@756000000 {
> +			opp-hz =3D /bits/ 64 <756000000>;
> +			opp-microvolt =3D <1040000>;
> +		};
> +		opp@624000000 {
> +			opp-hz =3D /bits/ 64 <624000000>;
> +			opp-microvolt =3D <950000>;
> +		};
> +		opp@576000000 {
> +			opp-hz =3D /bits/ 64 <576000000>;
> +			opp-microvolt =3D <930000>;
> +		};
> +		opp@540000000 {
> +			opp-hz =3D /bits/ 64 <540000000>;
> +			opp-microvolt =3D <910000>;
> +		};
> +		opp@504000000 {
> +			opp-hz =3D /bits/ 64 <504000000>;
> +			opp-microvolt =3D <890000>;
> +		};
> +		opp@456000000 {
> +			opp-hz =3D /bits/ 64 <456000000>;
> +			opp-microvolt =3D <870000>;
> +		};
> +		opp@432000000 {
> +			opp-hz =3D /bits/ 64 <432000000>;
> +			opp-microvolt =3D <860000>;
> +		};
> +		opp@420000000 {
> +			opp-hz =3D /bits/ 64 <420000000>;
> +			opp-microvolt =3D <850000>;
> +		};
> +		opp@408000000 {
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-microvolt =3D <840000>;
> +		};
> +		opp@384000000 {
> +			opp-hz =3D /bits/ 64 <384000000>;
> +			opp-microvolt =3D <830000>;
> +		};
> +		opp@360000000 {
> +			opp-hz =3D /bits/ 64 <360000000>;
> +			opp-microvolt =3D <820000>;
> +		};
> +		opp@336000000 {
> +			opp-hz =3D /bits/ 64 <336000000>;
> +			opp-microvolt =3D <810000>;
> +		};
> +		opp@312000000 {
> +			opp-hz =3D /bits/ 64 <312000000>;
> +			opp-microvolt =3D <810000>;
> +		};
> +		opp@264000000 {
> +			opp-hz =3D /bits/ 64 <264000000>;
> +			opp-microvolt =3D <810000>;
> +		};
> +		opp@216000000 {
> +			opp-hz =3D /bits/ 64 <216000000>;
> +			opp-microvolt =3D <810000>;
> +		};
> +	};
> +

How were those OPPs tested?

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

--z6x6bvm6fottyrqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXK7shgAKCRDj7w1vZxhR
xRDJAP4khN/zfxuwm7SW2nQx8NlUPFsBsRM7b6g6j8zpPbmumwD/bFuHyrRVbpY9
aV++rHkiM3wLYccRwb8jwI3mHL7L8Q4=
=x49b
-----END PGP SIGNATURE-----

--z6x6bvm6fottyrqb--
