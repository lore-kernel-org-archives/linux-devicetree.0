From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/4] arm: dts: sun8i: a83t: Add registers needed for MCPM
Date: Wed, 13 Dec 2017 11:50:04 +0100
Message-ID: <20171213105004.k2hlnl3dzvs2plhh@flea.lan>
References: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
 <20171211075001.6100-3-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qky5j3yljc4piko5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171211075001.6100-3-mylene.josserand@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: wens@csie.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org


--qky5j3yljc4piko5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 11, 2017 at 08:49:59AM +0100, Myl=E8ne Josserand wrote:
> Add 3 registers needed for MCPM (ie SMP): prcm, cpucfg and r_cpucfg.
> prcm and cpucfg are identical with sun9i-a80. The only difference
> is the r_cpucfg that does not exist on sun9i.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index a384b766f3dc..eeb2e7d0d6dc 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -323,6 +323,16 @@
>  			#reset-cells =3D <1>;
>  		};


> +		cpucfg@01700000 {

Please drop the leading zero here, it generates a warning in dtc.

> +			compatible =3D "allwinner,sun9i-a80-cpucfg";

There's some significant differences between the A83t and the A80 IPs,
you should use a different compatible.

> +			reg =3D <0x01700000 0x100>;

the size is 1k (0x400)

> +		};
> +
> +		r_cpucfg@1f01c00 {
> +			compatible =3D "allwinner,sun8i-a83t-r-cpucfg";
> +			reg =3D <0x1f01c00 0x100>;

You should order the nodes by physical address

> +		};
> +
>  		pio: pinctrl@1c20800 {
>  			compatible =3D "allwinner,sun8i-a83t-pinctrl";
>  			interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> @@ -493,6 +503,11 @@
>  			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		prcm@1f01400 {
> +			compatible =3D "allwinner,sun9i-a80-prcm";

That block is significantly different on the A83t. Please use a
different compatible.

> +			reg =3D <0x1f01400 0x200>;
> +		};
> +

The size is 1k, again.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qky5j3yljc4piko5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloxBdgACgkQ0rTAlCFN
r3SW2Q/6A3zAlrNQzGCNx4Kr2LN1zZqjmoZWG2VcwsNtBmWws4nuBdNmwYvJO3qn
q/j6NGrX6FbzBFLjVCO6oA0WZ/DCX4ff+AADyuxskFR0bHb2POeuW2AyM06Bb0q7
jk2G7wicW5cj59dpcM2S2H5tI1FaUsa95mqMBTogrADlfK7kAxLans9fF/TDfoEj
cTkqJ+8gldlXifRgZd2gjiDQU1X/W7MDOltifxnEodcgHf8VmVrgEN4sbuh7ThYB
8/XYMFK3jeJEB/O5dK8D5hK5zqb18ffaVb7o3d4FpEP1iu1gmq1zl0Rb78K/OW4g
CdyCPFOxnVzcduay+Z5Km9e2WHA00cQA0No5DHrAqvOAK4HO/m8YhRIg6ALslMgH
02WLnxafPJZmh2N9/GqoJZz8QUEZSFwW2DY5x5RRcfvvM0gqcAck2bnrOjTUFJ7q
gCebitdfVoSY76Fsc+7T0tqTYkdTjPQiY81ZDTcLnMVNH86dyTHDjiyAg2+gB5+Y
IQP6xKYbMAoCuVfatV7eUY54dn91aVhpXBH7kkTn7ZMOIN+c/CZJ48yt22Wb8yfT
5It7fU472y9uzigeDUy3eqryFANhT5ExPhBNZiQ79utUFl3fMtqJRPehQcD+dLFp
zZsuCd6XN3nsBl7zzWYIHSwSBPYflgfbKcYXIr7ySPL2eS9BjU4=
=9T72
-----END PGP SIGNATURE-----

--qky5j3yljc4piko5--
