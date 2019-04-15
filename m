Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:52:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 14/30] PCI: tegra: Set target speed as Gen1 before link up
Message-ID: <20190415115218.GP29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-15-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8G1nIWD3RY794FAy"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-15-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--8G1nIWD3RY794FAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:39PM +0530, Manikanta Maddireddy wrote:
> Some of the legacy PCIe endpoints doesn't enumerate if root port advertis=
es
> both Gen-1 and Gen-2 speeds. Hence, the strategy followed here is to
> initially advertise only Gen-1 and after link is up, retrain link to Gen-2
> speed.
>=20
> Following two cards display this behaviour,
>   - Fusion HDTV 5 Express card
>   - IOGear SIL - PCIE - SATA card
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 7dc728cc5f51..7e24eac12668 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -670,6 +670,17 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_p=
cie_port *port)
>  		value |=3D soc->update_fc_val;
>  		writel(value, port->base + RP_VEND_XP);
>  	}
> +
> +	/*
> +	 * PCIe link doesn't come up with few legacy PCIe endpoints
> +	 * if root port advertises both Gen-1 and Gen-2 speeds.
> +	 * Hence, the strategy followed here is to initially advertise
> +	 * only Gen-1 and after link is up, retrain link to Gen-2 speed
> +	 */
> +	value =3D readl(port->base + RP_LINK_CONTROL_STATUS_2);
> +	value &=3D ~PCI_EXP_LNKSTA_CLS;
> +	value |=3D PCI_EXP_LNKSTA_CLS_2_5GB;
> +	writel(value, port->base + RP_LINK_CONTROL_STATUS_2);
>  }
> =20
>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)

This looks like it's related to the earlier patch that adds support for
retraining the link at Gen-2. As such, I think the two patches should be
moved closer together to make that more obvious.

Also, perhaps even the order needs to be changed. For example, if the
earlier patch enables advertisement of Gen-2, then there will be a
period of 10 or so patches where the above devices wouldn't work. So if
this fixes an error introduced by an earlier patch, it makes sense to
resort the patches so that we first fix the potential error and then
introduce the code that would cause the error to happen.

Thierry

--8G1nIWD3RY794FAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0cHEACgkQ3SOs138+
s6HhYQ//ZE33XGJb0W1SVhhQnJIuadqxGY05OGcBUtJJg9RkCAbwT6OldswqiWsX
MDvlKGra66ZQWw6WHMHKsy+oS2Bh6NMha9dG9/uaHMkUtPOev72Uaq2+nd3Ok3jw
Ae2tULQPbPCvyNr/wY3avHbGFOOy54KPIGgOvkfQYLTbSabt2/JUEM+CLM+4ZT2L
i5qGul+b34rFViaL59RdcxUdofCDn8iiKvnCYg/qjHoY91DilnUJpA/SmNkvsSEV
heRw0xcd03oCgHpE7VpLjtwJ2ujuehzf9igLujQTMrzb/kGQGQdivrFJd2InGPrA
mJdEq3IGufKeJ7QMPuIm/1z0zstPSPPYFqi//uENNXb6DX7fBuBjmziMqu8MUSV+
+Somyj1EDZbZYXy+eZCY99FuraUaCkQEsKunWTrIMheHj1vvms7VkOeZmW9mC0z4
O1aVPsdDcq1lWphnzqqF4UgZr3JcBMtAZ0bU8yFovKH3Y0Gy0OckV9d+DAr7fen5
S+N/n4WylinXloW5XO7ZzRbIrHzb6xt18Ntg7lSsPl3yKGKVPXJ3yKwn+Aj2oIYc
aiIJ5PQPg+SPZaro+Cp8vCMkMcvZkGUXqI5ISmH3YJJ9sJQIAE+FatP7i/OVE0Ub
3LzQsDxxxr3pO1VW7vBTpnJSR3N0QPQqRR7oyewz4MFRUDc6AIM=
=bOny
-----END PGP SIGNATURE-----

--8G1nIWD3RY794FAy--
