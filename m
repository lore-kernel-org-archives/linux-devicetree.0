Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:21:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 04/30] PCI: tegra: Add PCIe Gen2 link speed support
Message-ID: <20190415112108.GE29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-5-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-5-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:29PM +0530, Manikanta Maddireddy wrote:
> Tegra124, 132, 210 and 186 support Gen2 link speed. After PCIe link is up
> in Gen1, set target link speed as Gen2 and retrain link. Link switches to
> Gen2 speed if Gen2 capable end point is connected, else link stays in Gen=
1.
>=20
> Per PCIe 4.0r0.9 sec 7.6.3.7 implementation note, driver need to wait for
> PCIe LTSSM to come back from recovery before retraining the link.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 61 ++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index a61ce9d475b4..6ccda82735f8 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -191,6 +191,8 @@
>  #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
>  #define  RP_LINK_CONTROL_STATUS_LINKSTAT_MASK	0x3fff0000
> =20
> +#define RP_LINK_CONTROL_STATUS_2		0x000000b0
> +
>  #define PADS_CTL_SEL		0x0000009c
> =20
>  #define PADS_CTL		0x000000a0
> @@ -2096,6 +2098,62 @@ static void tegra_pcie_apply_pad_settings(struct t=
egra_pcie *pcie)
>  		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
>  }
> =20
> +#define LINK_RETRAIN_TIMEOUT 100000

This is oddly placed. I think this should go somewhere near the top of
the file. We already have PME_ACK_TIMEOUT there.

But to be honest, I wouldn't even bother with the #define. This is used
exactly twice and is much longer to type than the actual number.

> +
> +static void tegra_pcie_change_link_speed(struct tegra_pcie *pcie)
> +{
> +	struct device *dev =3D pcie->dev;
> +	struct tegra_pcie_port *port, *tmp;
> +	ktime_t deadline;
> +	u32 val;

The driver uses u32 value for register values elsewhere. It'd be good to
stay consistent with that convention.

> +
> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
> +		/*
> +		 * Link Capabilities 2 register is hardwired to 0 in Tegra,
> +		 * so no need to read it before setting target speed.
> +		 */
> +		val =3D readl(port->base + RP_LINK_CONTROL_STATUS_2);
> +		val &=3D ~PCI_EXP_LNKSTA_CLS;
> +		val |=3D PCI_EXP_LNKSTA_CLS_5_0GB;
> +		writel(val, port->base + RP_LINK_CONTROL_STATUS_2);

The comment says there's no need to read the register, but then the code
goes on and reads it before modifying it.

That's the first thing that came to my mind. Then I realized that the
code doesn't actually do anything with the Link Capabilities 2 register
at all. So what's the deal here? Is it that the Link Capabilities 2
register being hardwired to 0 means that we can change the target speed?
Your comment needs to explain more clearly how it relates to the code.

> +
> +		/*
> +		 * Poll until link comes back from recovery to avoid race
> +		 * condition.
> +		 */
> +		deadline =3D ktime_add_us(ktime_get(), LINK_RETRAIN_TIMEOUT);
> +		for (;;) {
> +			val =3D readl(port->base + RP_LINK_CONTROL_STATUS);
> +			if (!(val & PCI_EXP_LNKSTA_LT))
> +				break;
> +			if (ktime_after(ktime_get(), deadline))
> +				break;
> +			usleep_range(2000, 3000);
> +		}

This would be more compact when written as a while loop. Also I think
it's more readable to make the !(...) an explicit comparison. Finally,
use whitespace to improve readability. The above looks very cluttered
and, in my opinion, makes the code difficult to read. Something like
the below is much easier to read, in my opinion:

		while (ktime_before(ktime_get(), deadline)) {
			value =3D readl(port->base + RP_LINK_CONTROL_STATUS);
			if ((value & PCI_EXP_LNKSTA_LT) =3D=3D 0)
				break;

			usleep_range(2000, 3000);
		}

> +		if (val & PCI_EXP_LNKSTA_LT)
> +			dev_err(dev, "PCIe port %u link is still in recovery\n",
> +				port->index);

Since you're continuing execution, perhaps make this dev_warn()?

> +
> +		/* Retrain the link */
> +		val =3D readl(port->base + RP_LINK_CONTROL_STATUS);
> +		val |=3D PCI_EXP_LNKCTL_RL;
> +		writel(val, port->base + RP_LINK_CONTROL_STATUS);
> +
> +		deadline =3D ktime_add_us(ktime_get(), LINK_RETRAIN_TIMEOUT);
> +		for (;;) {
> +			val =3D readl(port->base + RP_LINK_CONTROL_STATUS);
> +			if (!(val & PCI_EXP_LNKSTA_LT))
> +				break;
> +			if (ktime_after(ktime_get(), deadline))
> +				break;
> +			usleep_range(2000, 3000);
> +		}

Same comments as above.

> +		if (val & PCI_EXP_LNKSTA_LT)
> +			dev_err(dev, "link retrain of PCIe port %u failed\n",
> +				port->index);
> +	}

Most of the error messages in this file are of the form:

	"failed to ..."

Perhaps make this:

	"failed to retrain link of port %u\n"

for consistency?

Thierry

> +}
> +
>  static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>  {
>  	struct device *dev =3D pcie->dev;
> @@ -2122,6 +2180,9 @@ static void tegra_pcie_enable_ports(struct tegra_pc=
ie *pcie)
>  		tegra_pcie_port_disable(port);
>  		tegra_pcie_port_free(port);
>  	}
> +
> +	if (pcie->soc->has_gen2)
> +		tegra_pcie_change_link_speed(pcie);
>  }
> =20
>  static void tegra_pcie_disable_ports(struct tegra_pcie *pcie)
> --=20
> 2.17.1
>=20

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0aSIACgkQ3SOs138+
s6Egyw/+L2JItfslNCOftAK/VjtYmQFRKowMg8fXfL+BTHvlWqE/0ZuW+gVeL7D8
IKMehZy0NFlP93q1N4xjZXaoXJ6FIfUriE/V3EUSWMe7Cw5opiEarQLIaZ/5miDz
jLt0nu45z8VAnxkmgkYcM6oCSTxposY6VShMc6M7mbZwcE3zyI7lyjQJZWtdwFr2
UZXbPCgrRA919FYCAAy2rwVD00NblYcWuQEdZ9azoow+MlRHKOdxiVsMO3PHZut4
0j6aF2BLqk2P2wOulE2z2/7IzT72ViduLOEp8OL3WhEN9yb/ca42JL0Ez/j2nSZw
I10s3K+X9QWY7Ol8s9OtZ+Kwo4VGS4j9Ev/AQM2qzCAnBq4Cc5CfXOIeQcu8z9KC
RK6vySfgdZfzsf1Nsz7mGbuxxAH0rOGQ2y7khudhFNYx3HAiKPyGfGxgJAr1Nmcm
4VkLRPhE6aWe7v9ItLoGw65YVqcs1IcUe/bGss2L/0t7wHgnb6rc1W8FSIuu0Gyb
9pHrJodXsOX0Xg3rHJHztJ2EUac7lyryzuMma2ljlOOvMVk/wG0WLvD1CtKvLZKr
Rk9NsONwJ94+DhERkgC8WwsbX/4ZFyIFhSt8uQPLYYFQ11fW76C9pK2lxFMebW/i
EWPKiyCBAfu0Dffy1MbNMrL8NcqTRVJ1ykh2TD10Ens6/WUy48g=
=WX7G
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--
