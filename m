Return-Path: <SRS0=F6gC=GE=gmail.com=thierry.reding@kernel.org>
Date: Wed, 14 Mar 2018 10:50:30 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 0/9] Refactor and add AHCI support for Tegra210
Message-ID: <20180314095030.GA31767@ulmo>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 05:10:29PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> 1. ADD AHCI support for Tegra210
> 2. Extend the Tegra AHCI controller device tree binding with Tegra210
> 3. Update initialization sequence
> 4. Initialize regulators based on chip
> 5. Disable DevSlp
> 6. Disable DIPM
> ---
>=20
> Preetham Ramchandra (9):
>   dt-bindings: Tegra210: add binding documentation
>   arm64: tegra: Add SATA node for Tegra210
>   arm64: tegra: Enable AHCI on Jetson TX1
>   ata: ahci_tegra: Update initialization sequence
>   ata: ahci_tegra: initialize regulators from soc struct
>   ata: ahci_tegra: disable devslp for Tegra124
>   ata: ahci_tegra: disable DIPM
>   ata: ahci_tegra: Add AHCI support for Tegra210
>   ata: change Tegra124 to Tegra
>=20
>  .../bindings/ata/nvidia,tegra124-ahci.txt          |  36 ++-
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   5 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  16 +
>  drivers/ata/Kconfig                                |   4 +-
>  drivers/ata/ahci_tegra.c                           | 359 +++++++++++++++=
+-----
>  5 files changed, 330 insertions(+), 90 deletions(-)

The series, on Jetson TX1:

Tested-by: Thierry Reding <treding@nvidia.com>

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqo8GMACgkQ3SOs138+
s6H2Hg//ZKVupF/cB/QGBEI6lnkRiQ3XAhIhxtdL3NXaKvc1UDgC3IB1YqGsTotA
kjlWbW0ISJpyYVhU9maS/qgY2X4kkO1dJedGT9TMUvUj8C6x0mASg0sayPW1Bevt
mGhSqo0f+ouRoPwU2IZzBxnYouVYtFFy5fraGSs9zhb46/J70oyqHz1ooOTFfOvt
UMxaGS/Tv+Y9BBBVejYzEdK14D4RImrcRwdvpf4Nrlz6+WPRN66mWKSuLppPnAov
/178paWMbGYbkbOXzVHWq4gMUiff2FjBGkjJXW0QLjxrs7TQpV46W+ivNOjH752F
VeryEnb20340Ab1GnBfSM0bL8RitbFWESQ8RAZcYO3wdX/IhLJGAur8eSLoANXvI
p4cHLL6rdt+eoCZl5amwi/r7egb8ryXvaS658cXbP2VJhuLUvn12OuKIezCB7fKr
ig2oCXu9av3UEnK3s8iMQIeXfBsv/MsuWrcZcwVLcRI/CK2d2UWRO4+maQQE4Uyl
t0wMfh0viwzNhyysNNmg+nJJMjfSnQjOhTVUhT7B/ejDGtuZ0xfrw3TS9CeFxJRd
SrENuerwET4Sr6oL1z2KV4+rWEssZRGmgHOcXkliriL62uFmLB14xhV2GLeehXr2
DdW2cydG33rUuXXxgdvRXWSS3MqjZrjTGhOwea8ESjeDbxEbuu8=
=uFWp
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
