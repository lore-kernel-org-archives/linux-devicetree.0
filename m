Return-Path: <SRS0=5STX=FN=gmail.com=thierry.reding@kernel.org>
Date: Mon, 19 Feb 2018 15:42:30 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 4/7] ata: ahci_tegra: initialize regulators from
 soc_data
Message-ID: <20180219144230.GG11455@ulmo>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-5-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PpAOPzA3dXsRhoo+"
Content-Disposition: inline
In-Reply-To: <1518456406-21564-5-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, preetham260@gmail.com, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2018 at 10:56:43PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>
>=20
> Get the regulator names to be initialized from soc_data
> and initialize them.
>=20
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v7:
> * moved tegra124_supply_names definition to just above
>    the tegra124_ahci_soc_data structure.
> ---
>  drivers/ata/ahci_tegra.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--PpAOPzA3dXsRhoo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK4lYACgkQ3SOs138+
s6EtQw//cUA88ynRyDwiCPVhkjWorDN/iJNrYwt6rc1s8TxQhHa+KnOi5iAREoae
OR+0On4Y2Y35HoNyoLiLOrKkRppo+L+enOBZf7GoL89stWZDFYhb9a5uRJRxjREp
LQ31OhqzubFZVDzpvuyCpIJRrbLcmU62P4R4m/mhtWU1qL0mrPVfXrca+APJCGnP
++PKms7CnVwnu3jimMXY4fP2YIRQdnre2fyakqwCR94eg/9fLiijtd9n9U/Ro18L
DXQyDiwaGoi4Xegeofu9NEQapSDVlxufaxzAQmRFjr0BADsspKqRFTvlgEefGJGy
FKGmza8lwmgpcL0FpgQZmub6Vj0XkqfHFb0T4+JQswoYDBaCV1N5O0f2w+dtDnfo
enR4gSJPxOt7nDoS5inYA3EmyZAaheYXUFSXYoo+v4x87ewshGrWvBFMOo4He3wH
YmvxiW+9ef9CLMi+MHqZc6m5slyQQzi/piuye20e0mIYMwykJ8NQEfhrGsi4YBey
Is02tLh7gNMvAvy/KP2Pd9M4RgLayiYZ1RMVXI87u5SxWQog8SIw742l5tDuKDFy
le+HuewW3X9imFojmn2IT8uzaa4/4jJVV/b7GNki6DDVJRljYCG2WsACHsldC2Lz
7tMI8fPUO2FuRtPOoNwrmViMhT7/txwE/raIyGqVtehFYEP7LAc=
=TPpg
-----END PGP SIGNATURE-----

--PpAOPzA3dXsRhoo+--
