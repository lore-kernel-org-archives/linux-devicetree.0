From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [RFCv2 3/3] reset: reset-zynq: Adding support for Xilinx Zynq
 reset controller.
Date: Mon, 27 Jul 2015 07:14:46 +0200
Message-ID: <55B5BE46.3080703@monstr.eu>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-4-git-send-email-moritz.fischer@ettus.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Nf5hLhJcTBOUpIo7XuIvxTkRhwMOHhN3v"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437783682-13632-4-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Nf5hLhJcTBOUpIo7XuIvxTkRhwMOHhN3v
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/25/2015 02:21 AM, Moritz Fischer wrote:
> This adds a reset controller driver to control the Xilinx Zynq
> SoC's various resets.
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-zynq.c | 142 +++++++++++++++++++++++++++++++++++++=
++++++++
>  2 files changed, 143 insertions(+)
>  create mode 100644 drivers/reset/reset-zynq.c
>=20
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 157d421..3fe50e7 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARCH_SOCFPGA) +=3D reset-socfpga.o
>  obj-$(CONFIG_ARCH_BERLIN) +=3D reset-berlin.o
>  obj-$(CONFIG_ARCH_SUNXI) +=3D reset-sunxi.o
>  obj-$(CONFIG_ARCH_STI) +=3D sti/
> +obj-$(CONFIG_ARCH_ZYNQ) +=3D reset-zynq.o
> diff --git a/drivers/reset/reset-zynq.c b/drivers/reset/reset-zynq.c
> new file mode 100644
> index 0000000..05e37f8
> --- /dev/null
> +++ b/drivers/reset/reset-zynq.c
> @@ -0,0 +1,142 @@
> +/*
> + * Copyright (c) 2015, National Instruments Corp.
> + *
> + * Xilinx Zynq Reset controller driver
> + *
> + * This program is free software; you can redistribute it and/or modif=
y
> + * it under the terms of the GNU General Public License as published b=
y
> + * the Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +/* Offsets into SLCR regmap */
> +#define SLCR_RST_CTRL_OFFSET	0x200 /* FPGA Software Reset Control */

incorrect comment.

> +
> +#define NBANKS	18
> +
> +struct zynq_reset_data {
> +	struct regmap *slcr;
> +	struct reset_controller_dev rcdev;
> +};
> +
> +#define to_zynq_reset_data(p)		\
> +	container_of((p), struct zynq_reset_data, rcdev)
> +
> +static int zynq_reset_assert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	struct zynq_reset_data *priv =3D to_zynq_reset_data(rcdev);
> +
> +	int bank =3D id / BITS_PER_LONG;
> +	int offset =3D id % BITS_PER_LONG;
> +
> +	regmap_update_bits(priv->slcr,
> +			   SLCR_RST_CTRL_OFFSET + (bank * 4),
> +			   BIT(offset),
> +			   BIT(offset));
> +
> +	return 0;
> +}
> +
> +static int zynq_reset_deassert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct zynq_reset_data *priv =3D to_zynq_reset_data(rcdev);
> +
> +	int bank =3D id / BITS_PER_LONG;
> +	int offset =3D id % BITS_PER_LONG;
> +
> +	regmap_update_bits(priv->slcr,
> +			   SLCR_RST_CTRL_OFFSET + (bank * 4),
> +			   BIT(offset),
> +			   ~BIT(offset));
> +
> +	return 0;
> +}
> +
> +static int zynq_reset_status(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	struct zynq_reset_data *priv =3D to_zynq_reset_data(rcdev);
> +
> +	int bank =3D id / BITS_PER_LONG;
> +	int offset =3D id % BITS_PER_LONG;
> +	u32 reg;
> +
> +	regmap_read(priv->slcr, SLCR_RST_CTRL_OFFSET + (bank * 4), &reg);
> +
> +	return !(reg & BIT(offset));
> +}
> +
> +static const struct reset_control_ops zynq_reset_ops =3D {
> +	.assert		=3D zynq_reset_assert,
> +	.deassert	=3D zynq_reset_deassert,
> +	.status		=3D zynq_reset_status,
> +};
> +
> +static int zynq_reset_probe(struct platform_device *pdev)
> +{
> +	struct zynq_reset_data *priv;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->slcr =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +		"syscon");

NIT - incorrect indentation.

> +	if (IS_ERR(priv->slcr)) {
> +		dev_err(&pdev->dev, "unable to get zynq-slcr regmap");
> +		return PTR_ERR(priv->slcr);
> +	}
> +
> +	priv->rcdev.owner =3D THIS_MODULE;
> +	priv->rcdev.nr_resets =3D NBANKS * BITS_PER_LONG;
> +	priv->rcdev.ops =3D &zynq_reset_ops;
> +	priv->rcdev.of_node =3D pdev->dev.of_node;
> +	reset_controller_register(&priv->rcdev);
> +
> +	return 0;
> +}
> +
> +static int zynq_reset_remove(struct platform_device *pdev)
> +{
> +	struct zynq_reset_data *priv =3D platform_get_drvdata(pdev);
> +
> +	reset_controller_unregister(&priv->rcdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id zynq_reset_dt_ids[] =3D {
> +	{ .compatible =3D "xlnx,zynq-reset", },
> +	{ /* sentinel */ },
> +};
> +
> +static struct platform_driver zynq_reset_driver =3D {
> +	.probe	=3D zynq_reset_probe,
> +	.remove	=3D zynq_reset_remove,
> +	.driver =3D {
> +		.name		=3D "zynq-pl-reset",

PL in name.
BTW: Don't you want to use KBUILD_MODNAME here?

> +		.of_match_table	=3D zynq_reset_dt_ids,
> +	},
> +};
> +module_platform_driver(zynq_reset_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>");
> +MODULE_DESCRIPTION("Zynq Reset Controller Driver");
>=20

The rest looks good - will test it.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--Nf5hLhJcTBOUpIo7XuIvxTkRhwMOHhN3v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlW1vkYACgkQykllyylKDCG1EQCfbS+jKpzwz2a16BLEO/Z6SMZ7
xVcAn0tMXT0efv4DyZyTMU75EN5ccy7f
=6U0n
-----END PGP SIGNATURE-----

--Nf5hLhJcTBOUpIo7XuIvxTkRhwMOHhN3v--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
