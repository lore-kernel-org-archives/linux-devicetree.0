From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm: dts: sun8i: a83t: Add CCI-400 node
Date: Wed, 13 Dec 2017 11:52:08 +0100
Message-ID: <20171213105208.4rrxffplh7mfxviv@flea.lan>
References: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
 <20171211075001.6100-4-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="awz5jiw3tsabcnxs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171211075001.6100-4-mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--awz5jiw3tsabcnxs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 11, 2017 at 08:50:00AM +0100, Myl=E8ne Josserand wrote:
> Add CCI-400 node and control-port on CPUs needed by MCPM (ie SMP).
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 41 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index eeb2e7d0d6dc..3e2aad537972 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -62,48 +62,56 @@
>  			compatible =3D "arm,cortex-a7";
>  			device_type =3D "cpu";
>  			reg =3D <0>;
> +			cci-control-port =3D <&cci_control0>;
>  		};
> =20
>  		cpu@1 {
>  			compatible =3D "arm,cortex-a7";
>  			device_type =3D "cpu";
>  			reg =3D <1>;
> +			cci-control-port =3D <&cci_control0>;
>  		};
> =20
>  		cpu@2 {
>  			compatible =3D "arm,cortex-a7";
>  			device_type =3D "cpu";
>  			reg =3D <2>;
> +			cci-control-port =3D <&cci_control0>;
>  		};
> =20
>  		cpu@3 {
>  			compatible =3D "arm,cortex-a7";
>  			device_type =3D "cpu";
>  			reg =3D <3>;
> +			cci-control-port =3D <&cci_control0>;
>  		};
> =20
>  		cpu@100 {
>  			compatible =3D "arm,cortex-a7";
>  			device_type =3D "cpu";
>  			reg =3D <0x100>;
> +			cci-control-port =3D <&cci_control1>;
>  		};
> =20
>  		cpu@101 {
>  			compatible =3D "arm,cortex-a7";
>  			device_type =3D "cpu";
>  			reg =3D <0x101>;
> +			cci-control-port =3D <&cci_control1>;
>  		};
> =20
>  		cpu@102 {
>  			compatible =3D "arm,cortex-a7";
>  			device_type =3D "cpu";
>  			reg =3D <0x102>;
> +			cci-control-port =3D <&cci_control1>;
>  		};
> =20
>  		cpu@103 {
>  			compatible =3D "arm,cortex-a7";
>  			device_type =3D "cpu";
>  			reg =3D <0x103>;
> +			cci-control-port =3D <&cci_control1>;
>  		};
>  	};
> =20
> @@ -314,6 +322,39 @@
>  			status =3D "disabled";
>  		};
> =20
> +		cci: cci@1790000 {

You're not using that label, and you should order the node by physical
address.

> +			compatible =3D "arm,cci-400";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x01790000 0x1000>;

The size is 0x10000.

> +			ranges =3D <0x0 0x01790000 0x10000>;
> +
> +			cci_control0: slave-if@4000 {
> +				compatible =3D "arm,cci-400-ctrl-if";
> +				interface-type =3D "ace";
> +				reg =3D <0x4000 0x1000>;
> +			};
> +
> +			cci_control1: slave-if@5000 {
> +				compatible =3D "arm,cci-400-ctrl-if";
> +				interface-type =3D "ace";
> +				reg =3D <0x5000 0x1000>;
> +			};
> +
> +			pmu@9000 {
> +				compatible =3D "arm,cci-400-pmu,r1";
> +				reg =3D <0x9000 0x5000>;
> +				interrupts =3D <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--awz5jiw3tsabcnxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloxBlQACgkQ0rTAlCFN
r3Qi3Q//ZPoU39VdwyIM4kBr45N3yJs3F7idqQ5zsh6cds1toYupjbZ4PLv17YRO
G/fHVdfaOOp0UnVhkSk2lDBIkJkiguWU7ZKJGYX/bA+3Qa5BHRraVsJrlt4Lai1b
0ym+qkMQVAaxQ7+TY4MnpmOn4A5FHQeu3PfvcZNo3paI5d7EKO3Ic+gQIKH2t9di
dQ3rwq4gjwCnKkWSk6F5BBHFKTIa/EEOPicPngiVrNIR+kqZS4zFcBiZ0YN4h99h
jR1AHAH9sWsyu5CT+l6TnvZDLHn8U+Sh9FuTtSixgwXzwaAqWepFdsDjCrXRMUx5
9zjtE3T5huGHojo5CVA7MwP0khJWU/uDkqz4lZoMOGNQ0aoGjCxXTSyhNudb+rDP
dM2TtIfc2Jol3ZoUjrXGRK/570ejO+N+D9dnnpsmP3jQNxOPi5QsNEZ8ONC9ZWNL
+k0rae/MN3ZEQuw0YyIR/k+5aI4miXhLNYzW6PMBsZYJkJ99ybujtWGtEztLcFax
3DhlZkEmbFGIHoTtZHC25RTNsUTeyKRZQ5RPCPhe2cETiRz+LBOQCF1L3o5B/Yi2
Tw9MoLcN67EAMPBhmwH9rU2BNeUofVa9WFOF/+5WthdpC9b8ULp1Mi7N1LLS3+45
VrleVhlWyPoE7O8o2jX7OICKQOJdw6V9xnhQxOLJ9dLHyrcdY3I=
=+6Hd
-----END PGP SIGNATURE-----

--awz5jiw3tsabcnxs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
