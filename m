Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:47:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 28/28] PCI: tegra: Change link retry log level to info
Message-ID: <20190509144704.GY8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-29-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pM5zeTSooDOHDhuH"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-29-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--pM5zeTSooDOHDhuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:25PM +0530, Manikanta Maddireddy wrote:
> Driver checks for link up three times before giving up, each retry attempt
> is printed as an error. Letting users know that PCIe link is down and in =
the
> process of being brought up again is informational, not an error conditio=
n.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Updated commit log
>=20
>  drivers/pci/controller/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I wonder if we even need the informational message at all. Is there any
information in there that's useful to know? Do we care about how often
the link-up was tried if it ends up being brought up in the end?

Thierry

>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 09b3b3e847c5..563958104dd0 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2370,7 +2370,7 @@ static bool tegra_pcie_port_check_link(struct tegra=
_pcie_port *port)
>  		} while (--timeout);
> =20
>  		if (!timeout) {
> -			dev_err(dev, "link %u down, retrying\n", port->index);
> +			dev_info(dev, "link %u down, retrying\n", port->index);
>  			goto retry;
>  		}
> =20
> --=20
> 2.17.1
>=20

--pM5zeTSooDOHDhuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUPWgACgkQ3SOs138+
s6HFBg/9FC/ijtApzxY1VYwus5Z6wQc45LtkkBKwv0pdSYFIcXr8Rovhvgx4AcRa
U1FqT63dzWlBatO9/aWj6vVBUuzIin0DG0RRn58wWezKP/Qhtdyzu0sp8I2CsCpY
zuvS9KB5phGJ45g/Dyzw3n1CDtyzw45UJV0WeZjdqOfG9Sa4uGoEUe0ZWNX1yHRl
jl6yTcGQG2yfHz71dZeEVUHDY0hURW/ByXsfvI4NNKv5nG99C9Z2Xo2tZNWwrJ4+
hTxt6qJKkxRWPhZIXGFAVwuutLRKD+jGvg+eEqIuooZ2pLPU+94BnRgskaXOyIrh
xbix299OBhjWuTkeRjBFdD9g0d9BHGD+YQeeK1cvjdaSckvcc9ZD7LQnEiso1Zfz
Z42/AFT85vy1UViS6AabxW8yjaCvaQq5clcO6c6hH6Lm2wi283Y8s6EX5Xm1slxR
Osj6OmxXpbWpmM8wU1iWuQOnEkd9/mmTldWIJJH7+og6t5Ys1vSDtPQPLcVubKmA
sPgpz5Mv/SHDeqz7mJVNvkcb51zPbOM+9Vusv4kAgezvjuyeCGvkmI0aub3VsRQk
w20Dip7BIbmnYpuGy/YzEgUWqpnW48Y7z1oOZcvrvwOr9IPVdNU5d0KbJ2ONBb9M
0WTiqlsuTpA6RgUQB/M24Bv8zAXYZyBtr8MMUbeqsBRGmAhWWgo=
=vEwq
-----END PGP SIGNATURE-----

--pM5zeTSooDOHDhuH--
