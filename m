Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 16:23:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 30/30] PCI: tegra: Change link retry log level to INFO
Message-ID: <20190415142338.GD29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-31-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h+CsNYkJBPxpZ+B/"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-31-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--h+CsNYkJBPxpZ+B/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:55PM +0530, Manikanta Maddireddy wrote:
> Link retry log is info log not error, so change it to INFO log level.

The wording here is confusing. The log is clearly error level right now.
Perhaps you meant to say something like this:

    Letting users know that a link is down and in the process of being
    brought up again is informational, not an error condition.

Thierry

>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 75873e6627f9..55f8ff4f3e07 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2461,7 +2461,7 @@ static bool tegra_pcie_port_check_link(struct tegra=
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

--h+CsNYkJBPxpZ+B/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0k+oACgkQ3SOs138+
s6HF4xAAhYxq+grGQlSr4fAbdgEZN6rFJZEAvpeu0/Gyo2tn2+yM84y+xhY7hR3+
FVpqMRcxg8NqUaFHcWaMsCB9lWYc2QinMbnaL3W6CiyndL2Vth0pZ8jX4ibU2lzP
MAlDg/349H0aIcbsnGadLfPgmDzxShM6dQtHcPBGRCoyGqWq9o+5e/4Z1vjW0/h8
W8oisFJiNuytJrb0oPT8quvWqF9iI/B5JeorSQ67Lj5B+eZSqOu/y1XQCduVZyhj
/dhPzBXpcP0bSHX3WtWX9f1WGFhiColFoQLc6fGKxC1HlDAMM7el84i5PhMHE30N
AVhV1bpOXCanmQ34snvabWEVitpdfmodbdIoVZZ9MQPyW6d8Zei4hp0TqPX8nGTI
lNvJgQ1LBtMapgDgg9+GTIyh+ShTNcbixyD1aA17+/cdU4Se1aTCh/QCBlAqUBez
Dwbg0/fSf6EsPnwG5EFdXyP34AXXZ3JN728EeSwsotB+Ttwm75Syu7AKesWWD183
XrrEIVcobUPbP8CibOyaeP2XVAYG8QRR3YaRvNyt/adx12axsD5cTjxWCYtQuxxg
D+cK7QqJxd/iV5liWIKYx001cN9cUFdxZeQSDg0B0bp0LFOOwNnz3TUyClwhpkdP
Gc0hVHATsjtOypnOqwSvC7TKTliUfvUyfC34tHkEACi/jkOFdFM=
=yJ4g
-----END PGP SIGNATURE-----

--h+CsNYkJBPxpZ+B/--
