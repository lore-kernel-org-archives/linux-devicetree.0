Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 16:11:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 25/30] PCI: tegra: Put PEX CLK & BIAS pads in DPD mode
Message-ID: <20190415141100.GZ29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-26-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L4xCDQ7GT+ph8Lmk"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-26-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--L4xCDQ7GT+ph8Lmk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:50PM +0530, Manikanta Maddireddy wrote:
> In Tegra210 AFI design has clamp value for the BIAS pad as 0, which keeps
> the bias pad in non power down mode. This is leading to power consumption

s/bias/BIAS/

> of 2 mW in BIAS pad, even if the PCIe partition is power gated. To avoid

powergated

> unnecessary power consumption, put PEX CLK & BIAS pads in deep power down
> mode when PCIe partition is power gated.

You should validate, but I'm pretty sure there's a way to make this work
without any code (or very minimal code) in the driver if you're using
the standard pinctrl state names.

Thierry

>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 65 +++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index c050687020f0..92c6daa0de84 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -30,6 +30,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/pci.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/sizes.h>
> @@ -323,6 +324,7 @@ struct tegra_pcie_soc {
>  	bool program_deskew_time;
>  	bool raw_violation_fixup;
>  	bool update_fc_threshold;
> +	bool config_pex_io_dpd;
>  	struct {
>  		struct {
>  			u32 rp_ectl_2_r1;
> @@ -385,6 +387,10 @@ struct tegra_pcie {
> =20
>  	const struct tegra_pcie_soc *soc;
>  	struct dentry *debugfs;
> +
> +	struct pinctrl *pex_pinctrl;
> +	struct pinctrl_state *pex_dpd_enable;
> +	struct pinctrl_state *pex_dpd_disable;
>  };
> =20
>  struct tegra_pcie_port {
> @@ -2154,6 +2160,37 @@ static int tegra_pcie_get_regulators(struct tegra_=
pcie *pcie, u32 lane_mask)
>  	return tegra_pcie_get_legacy_regulators(pcie);
>  }
> =20
> +static int tegra_pcie_parse_pinctrl(struct tegra_pcie *pcie)
> +{
> +	struct device *dev =3D pcie->dev;
> +	int err =3D 0;
> +
> +	pcie->pex_pinctrl =3D devm_pinctrl_get(dev);
> +	if (IS_ERR(pcie->pex_pinctrl)) {
> +		err =3D PTR_ERR(pcie->pex_pinctrl);
> +		dev_err(dev, "failed to get pinctrl handle: %d\n", err);
> +		return err;
> +	}
> +
> +	pcie->pex_dpd_enable =3D pinctrl_lookup_state(pcie->pex_pinctrl,
> +						    "pex-dpd-enable");
> +	if (IS_ERR(pcie->pex_dpd_enable)) {
> +		err =3D PTR_ERR(pcie->pex_dpd_enable);
> +		dev_err(dev, "missing pex-dpd-enable state: %d\n", err);
> +		return err;
> +	}
> +
> +	pcie->pex_dpd_disable =3D pinctrl_lookup_state(pcie->pex_pinctrl,
> +						     "pex-dpd-disable");
> +	if (IS_ERR(pcie->pex_dpd_disable)) {
> +		err =3D PTR_ERR(pcie->pex_dpd_disable);
> +		dev_err(dev, "missing pex-dpd-disable state: %d\n", err);
> +		return err;
> +	}
> +
> +	return err;
> +}
> +
>  static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>  {
>  	struct device *dev =3D pcie->dev;
> @@ -2496,6 +2533,7 @@ static const struct tegra_pcie_soc tegra20_pcie =3D=
 {
>  	.program_deskew_time =3D false,
>  	.raw_violation_fixup =3D false,
>  	.update_fc_threshold =3D false,
> +	.config_pex_io_dpd =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2524,6 +2562,7 @@ static const struct tegra_pcie_soc tegra30_pcie =3D=
 {
>  	.program_deskew_time =3D false,
>  	.raw_violation_fixup =3D false,
>  	.update_fc_threshold =3D false,
> +	.config_pex_io_dpd =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2547,6 +2586,7 @@ static const struct tegra_pcie_soc tegra124_pcie =
=3D {
>  	.program_deskew_time =3D false,
>  	.raw_violation_fixup =3D true,
>  	.update_fc_threshold =3D false,
> +	.config_pex_io_dpd =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2570,6 +2610,7 @@ static const struct tegra_pcie_soc tegra210_pcie =
=3D {
>  	.program_deskew_time =3D true,
>  	.raw_violation_fixup =3D false,
>  	.update_fc_threshold =3D true,
> +	.config_pex_io_dpd =3D true,
>  	.ectl.regs.rp_ectl_2_r1 =3D 0x0000000f,
>  	.ectl.regs.rp_ectl_4_r1 =3D 0x00000067,
>  	.ectl.regs.rp_ectl_5_r1 =3D 0x55010000,
> @@ -2607,6 +2648,7 @@ static const struct tegra_pcie_soc tegra186_pcie =
=3D {
>  	.program_deskew_time =3D false,
>  	.raw_violation_fixup =3D false,
>  	.update_fc_threshold =3D false,
> +	.config_pex_io_dpd =3D false,
>  	.ectl.enable =3D false,
>  };
> =20
> @@ -2753,6 +2795,12 @@ static int tegra_pcie_probe(struct platform_device=
 *pdev)
>  	INIT_LIST_HEAD(&pcie->ports);
>  	pcie->dev =3D dev;
> =20
> +	if (pcie->soc->config_pex_io_dpd) {
> +		err =3D tegra_pcie_parse_pinctrl(pcie);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	err =3D tegra_pcie_parse_dt(pcie);
>  	if (err < 0)
>  		return err;
> @@ -2866,6 +2914,8 @@ static int __maybe_unused tegra_pcie_pm_suspend(str=
uct device *dev)
>  		tegra_pcie_disable_msi(pcie);
> =20
>  	tegra_pcie_disable_controller(pcie);
> +	if (pcie->soc->config_pex_io_dpd)
> +		pinctrl_select_state(pcie->pex_pinctrl, pcie->pex_dpd_enable);
>  	tegra_pcie_power_off(pcie);
> =20
>  	return 0;
> @@ -2881,10 +2931,20 @@ static int __maybe_unused tegra_pcie_pm_resume(st=
ruct device *dev)
>  		dev_err(dev, "tegra pcie power on fail: %d\n", err);
>  		return err;
>  	}
> +
> +	if (pcie->soc->config_pex_io_dpd) {
> +		err =3D pinctrl_select_state(pcie->pex_pinctrl,
> +					   pcie->pex_dpd_disable);
> +		if (err < 0) {
> +			dev_err(dev, "disabling PCIe IO DPD failed: %d\n", err);
> +			goto poweroff;
> +		}
> +	}
> +
>  	err =3D tegra_pcie_enable_controller(pcie);
>  	if (err) {
>  		dev_err(dev, "tegra pcie controller enable fail: %d\n", err);
> -		goto poweroff;
> +		goto pex_dpd_enable;
>  	}
>  	tegra_pcie_setup_translations(pcie);
> =20
> @@ -2904,6 +2964,9 @@ static int __maybe_unused tegra_pcie_pm_resume(stru=
ct device *dev)
> =20
>  disable_controller:
>  	tegra_pcie_disable_controller(pcie);
> +pex_dpd_enable:
> +	if (pcie->soc->config_pex_io_dpd)
> +		pinctrl_select_state(pcie->pex_pinctrl, pcie->pex_dpd_enable);
>  poweroff:
>  	tegra_pcie_power_off(pcie);
> =20
> --=20
> 2.17.1
>=20

--L4xCDQ7GT+ph8Lmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0kPQACgkQ3SOs138+
s6GyJQ/9HYR3WnbJ5472esPwGC+75yX0fC/5fbeSEgCwjA+PU/wIzqjrT97/vzWq
RifFVbofE4DiEnBFfz+grF/apHAp0uJOYq4GBqTjWkOxm2X9UggGJPBmlmQEFUim
a/UYiG27VQODY8PPz1rnXM21v3/aWj35FCnaqLex9vCWmWkHPMrVFXwpvFOx9qL8
RKr8AteaPz51hha/34YzCRNu0FuQ+5fszlVI0l2MxiRqZjarh6Tqr2yh4uFnQmQD
EH3Y11uuSntU0oGeiHVEOB51eoxjJE5NRZZmBXSZMP6rCFTPmnd1+i9DylAF7ZGS
dR0Obj8gHXK/RzQlu0B7ImIeKiiHRGWPMDAljw7vaO7IUL2USZmGemQihHNaIoGq
4xHp+hhLf1DB5jc4bIO5UwnkwUvPiHPqXduwWZIijd/NjozwkKw1aDU7Q+fYFVVe
ByDGn+sMQHGR7N7pJfzrwNFGK+BvZNgFMbzR2WgUXmdG0YPwmGQukR+I6IcdLEo2
8swc57R67gKPWZSZOs84Z3RXCc5uXsu1FHf6eMJiu8CTwXLPpKMqB2Vf8Nhz6lyt
x/kHLWJoU2GmkTIcLzs1TG2wQ3FSYh4j5DvZzrXli9Ui4gH1pADLJJRtXyl3RxIS
k20MjGfyRWgvep3bIijOI9Gda9fyhNVxaPZNXMu1HDjNOHrz+u0=
=1XOz
-----END PGP SIGNATURE-----

--L4xCDQ7GT+ph8Lmk--
