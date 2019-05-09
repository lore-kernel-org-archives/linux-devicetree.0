Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:17:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 06/28] PCI: tegra: Add PCIe Gen2 link speed support
Message-ID: <20190509141720.GF8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-7-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-7-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 23, 2019 at 02:58:03PM +0530, Manikanta Maddireddy wrote:
[...]
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
[...]
> +		while (ktime_before(ktime_get(), deadline)) {
> +			value = readl(port->base + RP_LINK_CONTROL_STATUS);
> +			if ((value & PCI_EXP_LNKSTA_LT) == 0)
> +				break;
> +
> +			usleep_range(2000, 3000);
> +		}
> +		if (value & PCI_EXP_LNKSTA_LT)
> +			dev_warn(dev, "PCIe port %u link is in recovery\n",
> +				 port->index);

Blank line between "}" and "if (...)" for readability.

> +		while (ktime_before(ktime_get(), deadline)) {
> +			value = readl(port->base + RP_LINK_CONTROL_STATUS);
> +			if ((value & PCI_EXP_LNKSTA_LT) == 0)
> +				break;
> +
> +			usleep_range(2000, 3000);
> +		}
> +		if (value & PCI_EXP_LNKSTA_LT)
> +			dev_err(dev, "failed to retrain link of port %u\n",
> +				port->index);

Same here.

With that:

Acked-by: Thierry Reding <treding@nvidia.com>

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUNnAACgkQ3SOs138+
s6HNAA//TZ0zt5Q7wT9uwqxfIJUZaByyIy/zrcbeh/psahyWwxWLZyvAKQSfpYyi
0Q6jvS7g0EfuH1H1HGYQs6DN4UK8rQs+OWiICQBAKpkYjaAEWQ3HIKpbF/8cwjSX
cZ85Q08bihPmmhL9+fd6HnEkoQxRs2zBljM00jmXIs/SmYnT7uuTVxL49LJGdT2L
NlGN+2psY0Zcc8LOtZR7a3zq2S++DIWjtSa1GXTUcDwq1uSd0vD2LTJqWr0gTU4Z
gixIT3jFr0L4kuFVG5DJNyBYY8hW9scSVTfehhoSWf3eDj6NhdLCo6vO00v9ddZ5
9u2/k48CX6eMec6JKJ92YANXlUypir6fwnKTyv1Mch0zTpMJ8LT7ITKeCb5bofUd
Z4EBCgUWFZSLp3cfQOMUpulWBLSgn0l031P1yD3TRJGFy9Ej0vvS4WiBH35s6UkT
xgUH0KLcTJozkMx4nb8TiZXdTaiNfHLX1K8Hii4EV19WxIjBReQoPQI+VjGeX+8l
xc+B7VMt73J6655833TiKQzqZknQhvqldXpyxsQrIkiiauZU7VXbrxkNwzQohDNu
LygF3wmSpxNuY265beBcpwAoWlpUrqgGjUbh8Ic+M/75NAvhw0rlirtO4n+cTpxO
xCA2VC3VpLNYQoZaTz+2xii32VJcP1P0ElVZJDeRaLE/UabBPmI=
=rwdL
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--
