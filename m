Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 16:20:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 29/30] PCI: tegra: Add support for GPIO based PCIe reset
Message-ID: <20190415142058.GC29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-30-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A1Iwnsx6rNfRhs6P"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-30-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--A1Iwnsx6rNfRhs6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:54PM +0530, Manikanta Maddireddy wrote:
> Add support for GPIO based PERST# instead of SFIO mode controller by AFI.
> GPIO number comes from per port PCIe device tree node.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 37 +++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 4a91c9fb3a9d..75873e6627f9 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -17,6 +17,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/export.h>
> +#include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
>  #include <linux/irq.h>
> @@ -26,6 +27,7 @@
>  #include <linux/module.h>
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
> +#include <linux/of_gpio.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/pci.h>
> @@ -406,6 +408,7 @@ struct tegra_pcie_port {
> =20
>  	int n_gpios;
>  	int *gpios;
> +	int rst_gpio;

This should be using GPIO descriptor APIs.

Thierry

>  };
> =20
>  struct tegra_pcie_bus {
> @@ -589,15 +592,23 @@ static void tegra_pcie_port_reset(struct tegra_pcie=
_port *port)
>  	unsigned long value;
> =20
>  	/* pulse reset signal */
> -	value =3D afi_readl(port->pcie, ctrl);
> -	value &=3D ~AFI_PEX_CTRL_RST;
> -	afi_writel(port->pcie, value, ctrl);
> +	if (gpio_is_valid(port->rst_gpio)) {
> +		gpio_set_value(port->rst_gpio, 0);
> +	} else {
> +		value =3D afi_readl(port->pcie, ctrl);
> +		value &=3D ~AFI_PEX_CTRL_RST;
> +		afi_writel(port->pcie, value, ctrl);
> +	}
> =20
>  	usleep_range(1000, 2000);
> =20
> -	value =3D afi_readl(port->pcie, ctrl);
> -	value |=3D AFI_PEX_CTRL_RST;
> -	afi_writel(port->pcie, value, ctrl);
> +	if (gpio_is_valid(port->rst_gpio)) {
> +		gpio_set_value(port->rst_gpio, 1);
> +	} else {
> +		value =3D afi_readl(port->pcie, ctrl);
> +		value |=3D AFI_PEX_CTRL_RST;
> +		afi_writel(port->pcie, value, ctrl);
> +	}
>  }
> =20
>  static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
> @@ -2241,6 +2252,20 @@ static int tegra_pcie_parse_plat_dt(struct tegra_p=
cie_port *port,
>  		}
>  	}
> =20
> +	port->rst_gpio =3D of_get_named_gpio(np, "nvidia,rst-gpio", 0);
> +	if (gpio_is_valid(port->rst_gpio)) {
> +		err =3D devm_gpio_request(dev, port->rst_gpio, "pex_rst_gpio");
> +		if (err < 0) {
> +			dev_err(dev, "rst_gpio request failed: %d\n", err);
> +			return err;
> +		}
> +		err =3D gpio_direction_output(port->rst_gpio, 0);
> +		if (err < 0) {
> +			dev_err(dev, "rst_gpio set o/p failed: %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	return 0;
>  }
> =20
> --=20
> 2.17.1
>=20

--A1Iwnsx6rNfRhs6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0k0oACgkQ3SOs138+
s6EBqg/9HY0M/JN1fAO6sl66qb0NYQ5yNCjb3to4paOgMuRilUWaK6N3qaW6ABRX
YlQjlnrUK46GfC8rZt2ZFe83K8FEnsLHDffzqLAoHK1VKnN4fB9+RbIi71D/+1L3
Dun+2u4W07YkIzBZNbk7MSAx6cLDicOM3/MYGwOR+0VTi+1VNpQFgZrzu1NmNjMb
+gxkEi/GBV01OStpuE/0NajZeQI9PVcZ7o7miYafKwSMLIcZOM8yAW+AwIsTD1q5
ygFzMK8C9zuKMB3XqDNTcuIYkolRvEtVlAwhthNARFeJnuqRrDcpjfXxK4Xt9kP1
ngyqZAzvf9AGdXGhh/nWiWDlRnXt/cJglXvfBEPpqRuEFC4JUCvBYnJ9ngvvdvwr
JCeYlDugI3WAYyaKixuJdG9nzW5u+IYQ8wBOl1K11TIoffhYHL7662h4zNPAKFWx
KZsMy0noPMZ/EjAuGabiWAUN2dSmfRk4rPeXWMCUJaDy6Vitjh6Z8ZKlpWsaJlgH
IC3EqlRR39Ej7dTcs2C0IoRg9p0sfn/+DmWh6FwueoEP9yDGqZfFBRrRZkVnss9t
wsDJSrp3L/HJsg//2vG/wkE4V2mYCGRcm5jNaqgWnrO4n0dShK24/GhjAwR4qOsb
0VP/G9NnLSo+yn48nrnRV1ZwVUDemZs7SufyZw24XCmyWaEiTZA=
=DO+r
-----END PGP SIGNATURE-----

--A1Iwnsx6rNfRhs6P--
