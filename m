Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 15:25:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 17/30] PCI: tegra: Use switch statements in
 tegra_pcie_isr()
Message-ID: <20190415132523.GS29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-18-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dQ2XShfnd5GHxhN7"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-18-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--dQ2XShfnd5GHxhN7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:42PM +0530, Manikanta Maddireddy wrote:
> Use switch statements in tegra_pcie_isr() for better code readability.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 37 ++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index cdaaf13a9fd7..cf2715065a53 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -842,36 +842,39 @@ static irqreturn_t tegra_pcie_isr(int irq, void *ar=
g)
>  	};
>  	struct tegra_pcie *pcie =3D arg;
>  	struct device *dev =3D pcie->dev;
> -	u32 code, signature;
> +	u32 code, signature, fpci;
> +	u64 address;
> =20
>  	code =3D afi_readl(pcie, AFI_INTR_CODE) & AFI_INTR_CODE_MASK;
>  	signature =3D afi_readl(pcie, AFI_INTR_SIGNATURE);
>  	afi_writel(pcie, 0, AFI_INTR_CODE);
> =20
> -	if (code =3D=3D AFI_INTR_LEGACY)
> -		return IRQ_NONE;
> -
>  	if (code >=3D ARRAY_SIZE(err_msg))
> -		code =3D 0;
> +		return IRQ_NONE;
> =20
> +	switch (code) {
> +	case AFI_INTR_LEGACY:
> +		return IRQ_NONE;
>  	/*
>  	 * do not pollute kernel log with master abort reports since they
>  	 * happen a lot during enumeration
>  	 */
> -	if (code =3D=3D AFI_INTR_MASTER_ABORT)
> +	case AFI_INTR_MASTER_ABORT:
>  		dev_dbg(dev, "%s, signature: %08x\n", err_msg[code], signature);
> -	else
> +		fpci =3D afi_readl(pcie, AFI_UPPER_FPCI_ADDRESS) & 0xff;
> +		address =3D (u64)fpci << 32 | (signature & 0xfffffffc);
> +		dev_dbg(dev, "  FPCI address: %10llx\n", address);
> +		break;
> +	case AFI_INTR_TARGET_ABORT:
> +	case AFI_INTR_FPCI_DECODE_ERROR:
>  		dev_err(dev, "%s, signature: %08x\n", err_msg[code], signature);
> -
> -	if (code =3D=3D AFI_INTR_TARGET_ABORT || code =3D=3D AFI_INTR_MASTER_AB=
ORT ||
> -	    code =3D=3D AFI_INTR_FPCI_DECODE_ERROR) {
> -		u32 fpci =3D afi_readl(pcie, AFI_UPPER_FPCI_ADDRESS) & 0xff;
> -		u64 address =3D (u64)fpci << 32 | (signature & 0xfffffffc);
> -
> -		if (code =3D=3D AFI_INTR_MASTER_ABORT)
> -			dev_dbg(dev, "  FPCI address: %10llx\n", address);
> -		else
> -			dev_err(dev, "  FPCI address: %10llx\n", address);
> +		fpci =3D afi_readl(pcie, AFI_UPPER_FPCI_ADDRESS) & 0xff;
> +		address =3D (u64)fpci << 32 | (signature & 0xfffffffc);
> +		dev_err(dev, "  FPCI address: %10llx\n", address);
> +		break;
> +	default:
> +		dev_err(dev, "%s, signature: %08x\n", err_msg[code], signature);
> +		break;
>  	}
> =20
>  	return IRQ_HANDLED;

I don't think this improves readability. It does duplicate some code and
is actually longer than the previous variant, so I don't think this adds
value.

Thierry

--dQ2XShfnd5GHxhN7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0hkMACgkQ3SOs138+
s6GEqg//eKPRgsBGLEsN2iMBRu5sGehlHiLyP7DbRwiXaGdnQ5q1SRKhJYmfbSwh
AWtUDqhG68TBuXDLgb5AghW90KX4RrDqlhvfnnSYpQVxuXUuLh55uHQbAjI/UP2e
RGHioLAAa+RePhWUR6S6dcsvpAo2OKrZSIk8r2/cYp/TMyRn28vw5voG8cv/yfec
rMlA+ie3HMgGrWi2SZDzkf036OPr2ZQECJPT9qr2Ayfg3W93Q/qmhiSCp5XpOZTD
eRRAOSMH37AFQVAMBGe73AQTUw0oFKZZ0hhAqUw37GFWiBM7/vuOGjYfWYgpmAG7
wQORA8WXpZ/67OmrUV98/J0Iiy1pAXOCxviS4CRTRW/oWN3gTCX2XcdprpONY/EB
fSe/mmlAu9A77FGWSE8dJc2TZG0P3OjpjXSoyVhVSGWIB7xR7qesBIplYyFKwW2k
5vGzGBf10ZaCJmJoYkHNaqF+1S3CuExc1Qzfp9wYSa5+u+sXIMm0cyjL6Qc0AJwe
/i1kUFSVK0CRk6InXPqNl9PGOZ4jiNedAXKi8P11BYFXPqTlZ7ALCy8j2obXvKGn
YmBBl/mbHe80fSpqncJeIEcjMOh1o4a6ezuyqd20EOqN/puhubxym70MJfd6ob8+
BCZuYbL1j/MOk5nD2m92KRgWOyBd8AAsqozocAenqRbqgn0GNqQ=
=lJDM
-----END PGP SIGNATURE-----

--dQ2XShfnd5GHxhN7--
