Return-Path: <SRS0=wf0n=GC=gmail.com=thierry.reding@kernel.org>
Date: Mon, 12 Mar 2018 13:14:14 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 1/9] dt-bindings: Tegra210: add binding documentation
Message-ID: <20180312121414.GD15972@ulmo>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <1520854838-21779-2-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline
In-Reply-To: <1520854838-21779-2-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 05:10:30PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> This adds bindings documentation for the AHCI controller on Tegra210.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v8:
> * Add Tegra132: "nvidia,tegra132-ahci", "nvidia,tegra124-ahci".
> * Changed AUX registers to optional.
> * corrected commit message line length.
> * Move phy-name for Tegra210 to optional.
> v7:
> * For Aux register set drop the Tegra210 since this register
>   set also works on Tegra124
> * rephrase the sentence for cml1 clock
> * change the commit subject to include ahci-tegra
> * drop pll_e since CCF handles it automatically as
>   CML1 is a child clock of it.
> v4:
> * changed the commit message
> * changed 'sata-cold' reset to mandatory for t210 and t124
> * Removed the regulators for T210 since these regulators
>   will be enabled in phy driver.
> v3:
> * Add AUX register.
> v2:
> * change cml1, pll_e and phy regulators as optional
>   for T210.
> ---
>  .../bindings/ata/nvidia,tegra124-ahci.txt          | 36 ++++++++++++++--=
------
>  1 file changed, 24 insertions(+), 12 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmbxEACgkQ3SOs138+
s6H2lhAAwof/X3ihm2QorAorHekG4nlDnB48uchEZ292c/VNnOax6ZGuT7JX2Rsy
T8Kp1/qQLXpQLU1qhq2B238pAxD0uL0vYlsU8KxeEoxBCTfFUdFKiKunq2Hwshub
6mBvSB9JIFxJ1+nzNXZd0HlmJV0bDGE5QUDITCj+tzCytJyGZPQSQUbjsHCIdpsm
bk7l4zPaM2NET4xdiSIs7QfKgiMlDoykJokhmyEU6Hga+a3lWNGmrQN6/k2j+Nvz
YYlQYDAgkmFiSJ9yRa+nbvLmiKr54m6gvtGuVS43Y3TUgRwxEDkD46z6LVO7fxtC
SeVdixAfNyzDW5bJBQ79fn3Snouvvxb4qism6EUwjj8ZzyFkb8Jy1X7a8qJOA432
HUW6e7qGvI+Ku62OQtXzi0BIECWQkJ6ClfjLkArWsKctlLaKFuU3CIJSXe/GfmKY
fUAJM1pyPBXChXuyLc31/6A7PiDThbMC7l0KCHJoMuQr0Rf9s8k9q2IZH+4M+kJQ
FSnLnwp2kuX0qid1An97HiWTfBzCL2eHG7ixWEeDa3ahBT2M1JsNMKgvCgACsy0x
hDkdBP+OigfHXvb50qPGs73kfiq88mF5I095d84xXZQYAK15eZfg4XGrXZAXO8Bt
HRz+fWxNCkNxdnqc9WPZ7v8DXwLiwdSaAynnnyzeJkPN4THA/os=
=aGL/
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
