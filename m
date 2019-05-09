Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:27:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 19/28] PCI: tegra: Change PRSNT_SENSE irq log to debug
Message-ID: <20190509142726.GP8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-20-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="88pBQ1/6ie/nQzMF"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-20-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--88pBQ1/6ie/nQzMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:16PM +0530, Manikanta Maddireddy wrote:
> PRSNT_MAP bit field is programmed to update the slot present status.
> PRSNT_SENSE irq is triggered when this bit field is programmed, which is

s/irq/IRQ/

> not an error. Add a new if condition to trap RSNT_SENSE code and print it

s/RSNT_SENSE/PRSNT_SENSE/

With that:

Acked-by: Thierry Reding <treding@nvidia.com>

> with debug log level.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: If-else to switch-case conversion patch is dropped, this patch is
> rebased to stay with if-else statements
>=20
>  drivers/pci/controller/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 9b841b0392ac..72634ce6d3da 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -864,7 +864,7 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
>  	 * do not pollute kernel log with master abort reports since they
>  	 * happen a lot during enumeration
>  	 */
> -	if (code =3D=3D AFI_INTR_MASTER_ABORT)
> +	if (code =3D=3D AFI_INTR_MASTER_ABORT || code =3D=3D AFI_INTR_PE_PRSNT_=
SENSE)
>  		dev_dbg(dev, "%s, signature: %08x\n", err_msg[code], signature);
>  	else
>  		dev_err(dev, "%s, signature: %08x\n", err_msg[code], signature);
> --=20
> 2.17.1
>=20

--88pBQ1/6ie/nQzMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUOM4ACgkQ3SOs138+
s6HB4A/+K7pEVq/DuzHX5RWv32RH9lVyZOyq6vRSg5PZ8VSd7rbHZxXmOIH0q4Hr
oOtqrtelIuPE1UHVb/fltfYWVfiLPWO2US5BDBupHowvrc60WsMyx+IpI3S+ah8W
cNEH0YdwTXv1AoJGf8TdhKFIppiJOyxUwzJKkebJPrFwy9Q7U7sZc9jba2PPaqbd
04yUuvzJbkN7naV5Zevh3fze1Z3ilQMx3jfyvmTtfqZvv7Q8+84tLfa+clsa7MlV
LMDjscbamy/vFg3K33GXO8xRmGiep4pAW9qffqntL+BMTMC6fQD4TrOOz4y7uvd8
SYGkLuZ0foPwCwR+By08y0bZ107WB6BRiFJ6hEOGyPxvzcEpOmP1dQr/UoWh5YJ+
1BzsL2bAXDg0X4MEQzA2YUMGv8Dtx6WH/k4HxOrt5GoJQMkivjoS+ZiOkh59Rdtf
AUL3NlnD6LyPCq/Nk9JJWFLvTJvvcpSI3V8I8Jp70ToQREBXxqOjcc2ZfBfY2gcw
eKqaxDmKKll+II0BrNjLV2cMIjsYsaByYr1t+3KLX1TQe9KPjKst2+iPDgvJWeIr
jGO0wIlLjTvl7vkREGzcmCh9arXdVvA9ZIGRPo45haM6w2Ae++xoBNIyJm/7ox+e
j83yvLmRJFv4fIjkTz0O45iXEdKM8iJdw35H+GpXhku/2yGfb1U=
=bers
-----END PGP SIGNATURE-----

--88pBQ1/6ie/nQzMF--
