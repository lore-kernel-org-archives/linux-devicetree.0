Return-Path: <SRS0=wf0n=GC=gmail.com=thierry.reding@kernel.org>
Date: Mon, 12 Mar 2018 13:14:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 5/9] ata: ahci_tegra: initialize regulators from soc
 struct
Message-ID: <20180312121448.GF15972@ulmo>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <1520854838-21779-6-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Content-Disposition: inline
In-Reply-To: <1520854838-21779-6-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 05:10:34PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Get the regulator names to be initialized from soc structure
> and initialize them.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v8:
> * renamed tegra->soc_data to tegra->soc
> v7:
> * moved tegra124_supply_names definition to just above
>    the tegra124_ahci_soc_data structure.
> ---
>  drivers/ata/ahci_tegra.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)


Acked-by: Thierry Reding <treding@nvidia.com>

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmbzgACgkQ3SOs138+
s6G2aRAArEZ4JG0I/4g9cyUAHlF+RZnESH4r9iCOrm/Y6PqBoNLKS27cBRdCHQP9
SB0OuZnKHA8iEXitxiQcOuSOrvsCxtack+aiSdG6r84K1LrcShl/jvcGOtIX1zMQ
sM+lGv1PoVAUQjj1RGK6hmMC0ZnwYzujPCUSBH67PqusqfYplAZ4lSSOf/zFg0eC
2Yr8vhLPg3pi33wr1Oip0+iJDpu8ipV0BjR/z1V2t8lC8XjQQB4wtGVWzuXjY2Tp
XTqoburvnZn9XqGi1oAOHZ5OJCRc6YqEVsFkoSDnDZFiOB4vRkTyd3b9anJcrWO6
iDo7rjIVvpyTGe3JzFhvT6defvOGQWdrY+PciXCzj3MWe/FqRuqeMaV2KtQmEC/d
btWKG9u51L/xIoL1wbNufWnxm83BXypUbZaJLkAf6QuxPt7W/6XMczcsBWLTD8dB
BwBq3LK9Z/8MKmYtLk4wf8RWRrSuOuPd0X2dCGZCoYB3J4oL2Cbm3SajKyLLu4dJ
JUTr417RCp+HAP2qSmohQdtXYRyYqUiFeoDDI0jqiV0uC0eK5piXGtKWx1UuBNzX
89bDNG9xTvlRsVGSJ9wJXhxeRcAenLnxQK+Fue/Ew5H7Z16ti2smZfhwtR2whMkH
hvZc2tYx9CgWLL8bbH6nBWz/iWoPaE35P2SO4qRKJlae2jvguQY=
=bPT7
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
