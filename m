Return-Path: <SRS0=XkBP=TX=gmail.com=thierry.reding@kernel.org>
Date: Thu, 23 May 2019 12:15:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 5/8] arm64: tegra: Add xudc node for Tegra210
Message-ID: <20190523101512.GE30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-6-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X3gaHHMYHkYqP6yf"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-6-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--X3gaHHMYHkYqP6yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:29PM +0530, Nagarjuna Kristam wrote:
> Tegra210 has one XUSB device mode controller, which can be operated
> HS and SS modes. Add DT support for XUSB device mode controller.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra210.dtsi
> index a550c0a..edef00b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -1184,6 +1184,25 @@
>  		status =3D "disabled";
>  	};
> =20
> +	xudc@700d0000 {
> +		compatible =3D "nvidia,tegra210-xudc";
> +		reg =3D <0x0 0x700d0000 0x0 0x8000>,
> +			<0x0 0x700d8000 0x0 0x1000>,
> +			<0x0 0x700d9000 0x0 0x1000>;

Same comments regarding alignment as for the bindings patch.

> +		interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;

Same here.

> +		clock-names =3D "dev", "ss", "ss_src",
> +			      "hs_src", "fs_src";

No need to split this across multiple lines, it all fits within 72/80
characters.

Thierry

> +		power-domains =3D <&pd_xusbdev>, <&pd_xusbss>;
> +		power-domain-names =3D "dev", "ss";
> +		nvidia,xusb-padctl =3D <&padctl>;
> +		status =3D "disabled";
> +	};
> +
>  	mipi: mipi@700e3000 {
>  		compatible =3D "nvidia,tegra210-mipi";
>  		reg =3D <0x0 0x700e3000 0x0 0x100>;
> --=20
> 2.7.4
>=20

--X3gaHHMYHkYqP6yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmcrAACgkQ3SOs138+
s6EI6Q/8C/tEyZ3kqPVWgXpCadqrSgkSRS7wF2qitJizWLq5HNXrft5rq2AgbHEe
suqQeuxZtfEdVHqZRKA1u5kvgUNGtheWyfFlGhvlFywgjl1DKF6BghRbu+Fpmnb6
pOf6btzypjCMxPXEitBxtG23be/ozX2Eh6ItOKI8nEMmlSKZzQTlAMO1L4u2fpud
1rVidRQSuVLaulyu/XPjodMU/Q5a6GSEdN82Rw/ywkmbLgN0MAIK/lXEZtiscbFK
1LkNFrw/EIrCqkk9vDuAv9ta7xsoNx0HxTsDR/9E8+9GVSnfG7XN1bweNkDIdTlx
uSKXMkPtJv1/Gho9g21jlj4hl9JIKzaj4bLhhXaR9mgSz68HEP7X+YiUrF0Ju8gw
NghhEzNIQfawj7UWQhuKPRNQjUOUDgisSltsn0Rpsku6uVr8kScdxxk36k/rzcPD
nuNN4rUaXmDScfCnCsggd69x+hC7eopllPtMrOgJlLxylZAkwSBJHSyl03m6dMUP
MSFIAqWOXnJDZWc/nB3NvW5G1IAQdSMgiEeVrcEUcVp677L6qmzYK3LpJRCqUMV0
x0f3wSmbB+17rf18epZ6lY/BSWm8tnWHB6UDbAFEZeqIr6DcSWmpLOINu2XKIrC9
J/CBnj+cewWYzOEtIETSmQEefVHGs+GE8etz80NEyNdUk9zaYXg=
=oAnT
-----END PGP SIGNATURE-----

--X3gaHHMYHkYqP6yf--
