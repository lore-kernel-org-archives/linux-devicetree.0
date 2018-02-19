Return-Path: <SRS0=5STX=FN=gmail.com=thierry.reding@kernel.org>
Date: Mon, 19 Feb 2018 15:31:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 2/7] arm64: tegra: Enable AHCI on Jetson TX1
Message-ID: <20180219143112.GE11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-3-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MIdTMoZhcV1D07fI"
Content-Disposition: inline
In-Reply-To: <1518456406-21564-3-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2018 at 10:56:41PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Add sata node to the Tegra210 device tree, and
> enable the device and assign board-specific
> properties on Jetson TX1.
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>

Tags such as Signed-off-by: should be in a separate paragraph, so the
above is missing a blank line before the Signed-off-by:.

> ---
> v7:
> * Change commit message to reflect accordingly
> v4:
> * Fixed missing space after 'AUX'
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 16 ++++++++++++++++
>  2 files changed, 22 insertions(+)

I prefer these to be two separate patches, one for the SoC .dtsi and
another for the P2597 carrier.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2597.dtsi
> index d67ef4319f3b..2aa2979cd6b5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -1325,6 +1325,12 @@
>  		status =3D "okay";
>  	};
> =20
> +	sata@70020000 {
> +		status =3D "okay";
> +		phys =3D <&{/padctl@7009f000/pads/sata/lanes/sata-0}>;
> +		phy-names =3D "sata-0";
> +	};
> +
>  	padctl@7009f000 {
>  		status =3D "okay";
> =20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra210.dtsi
> index 9c2402108772..bf72db5386a5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -798,6 +798,22 @@
>  		#iommu-cells =3D <1>;
>  	};
> =20
> +	sata@70020000 {
> +		compatible =3D "nvidia,tegra210-ahci";
> +		reg =3D <0x0 0x70027000 0x0 0x2000>, /* AHCI */
> +		      <0x0 0x70020000 0x0 0x7000>, /* SATA */
> +		      <0x0 0x70001100 0x0 0x1000>; /* SATA AUX */
> +		interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&tegra_car TEGRA210_CLK_SATA>,
> +			<&tegra_car TEGRA210_CLK_SATA_OOB>;

Nit: these are not properly aligned.

Thierry

--MIdTMoZhcV1D07fI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK37AACgkQ3SOs138+
s6H+mRAAtvFZOQfMQpqaI/nbTaJCJN4cCNOJH9qu4Mp5K7+487SqzHYBer2x1mBh
XaUCDO128Q+VJhAe3MpEM2Y7PJZ+tsylSXB1d1zdU1o6yvlFA0S8JPPmZZ+yuUd5
CDFgSmzF+CCOTuV4FyV3igVwmevipcBFfFcJs8WigwGqhR81jEhEhBz5cr9xZNX2
N9KNhYTJ4haSshfATOpyDVAIbss4xm3rLh4kwHM2x5O47b8AJHZuPq7cPNGvILBP
EKQAKOtFozumY1CGw0elH6YUYmfHTToqOyrzg4Od/FPOH/onws8IrT2RvMekIffu
YhR1mGgkIcMnEzmIut6XcgmEY6B6LuAYPQtjdbGL+Ayrxi3Z+2dByv+IYrZChZ8J
qqm3lxmOOjvF/3HWHwiFwQleV9wuAFVp22k4uPJ9D91D1g7KHsBzI8T6tjgylcEg
ST5ZmdPodI0SWrf8SN5tMZeoV2DUibEGbVp2ETkOEd3LGpjmXaAUOwgcwLKEDiLa
ZCa5lb2jJlhQ/gh9tpV6eA9PzuvY8gh8+bxpFzWRWECdH/k+8DiXIM888wGsN1up
UQ3Aoav9HByhKSsR+63+tycpZG86yVDUW37JWGtjcsNJexYfUyxkgRD9Et4hqddV
w6V7jlVNDPzKww+p+m8jhOfJpFiCtkbikFb2mnSzP6IMjzZzGXo=
=cv+z
-----END PGP SIGNATURE-----

--MIdTMoZhcV1D07fI--
