From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: sunxi: Add driver for sunxi usb phy
Date: Fri, 7 Feb 2014 23:36:46 +0100
Message-ID: <20140207223646.GU3192@lukather>
References: <1391790801-27864-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pbi2MkfjSbXbI4MN"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBQWB2WLQKGQENOIHC5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391790801-27864-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Pbi2MkfjSbXbI4MN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

It looks very nice, I just have a few comments below though.

On Fri, Feb 07, 2014 at 05:33:21PM +0100, Hans de Goede wrote:
> The Allwinner A1x / A2x SoCs have 2 or 3 usb phys which are all accessed
> through a single set of registers. Besides this there are also some other
> phy related bits which need poking, which are per phy, but shared between=
 the
> ohci and ehci controllers, so these are also controlled from this new phy
> driver.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/sun4i-usb-phy.txt      |  28 ++
>  drivers/phy/Kconfig                                |  11 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-sun4i-usb.c                        | 326 +++++++++++++++=
++++++
>  4 files changed, 366 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/sun4i-usb-phy.t=
xt
>  create mode 100644 drivers/phy/phy-sun4i-usb.c
>=20
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Do=
cumentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> new file mode 100644
> index 0000000..f7eccb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -0,0 +1,28 @@
> +Allwinner sun4i USB PHY
> +-----------------------
> +
> +Required properties:
> +- compatible : should be one of "allwinner,sun4i-a10-usb-phy",
> +  "allwinner,sun5i-a13-usb-phy" or "allwinner,sun7i-a20-usb-phy"
> +- reg : a list of offset + length pairs, the 1st list entry should point=
 to
> +  the phy base regs, the 2nd entry to the pmu reg for phy1, and the 3th
> +  entry to the pmu reg of phy2 (for devices which have a phy2).

I'm concerned about devices that would only have a phy2 for some
reason.

Using reg-names would be much more robust, and is quite painless to
use. Just use platform_get_resource_by_name instead of
platform_get_resource, and that's pretty much it.

> +- #phy-cells : from the generic phy bindings, must be 1
> +
> +Optional properties:
> +- clocks : phandle + clock specifier for the phy clock
> +- clock-names : "usb_phy"
> +- resets : a list of phandle + reset specifier pairs
> +- reset-names : "usb0_reset", "usb1_reset", and / or "usb2_reset"
> +
> +Example:
> +	usbphy: phy@0x01c13400 {
> +		#phy-cells =3D <1>;
> +		compatible =3D "allwinner,sun4i-a10-usb-phy";
> +		/* phy base regs, phy1 pmu reg, phy2 pmu reg */
> +		reg =3D <0x01c13400 0x10 0x01c14800 0x4 0x01c1c800 0x4>;
> +		clocks =3D <&usb_clk 8>;
> +		clock-names =3D "usb_phy";
> +		resets =3D <&usb_clk 1>, <&usb_clk 2>;
> +		reset-names =3D "usb1_reset", "usb2_reset";
> +	};
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index afa2354..6070c99 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -64,4 +64,15 @@ config BCM_KONA_USB2_PHY
>  	help
>  	  Enable this to support the Broadcom Kona USB 2.0 PHY.
> =20
> +config PHY_SUN4I_USB
> +	tristate "Allwinner sunxi SoC USB PHY driver"
> +	depends on ARCH_SUNXI
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the transceiver that is part of Allwinner
> +	  sunxi SoCs.
> +
> +	  This driver controls the entire USB PHY block, both the USB OTG
> +	  parts, as well as the 2 regular USB 2 host PHYs.
> +
>  endmenu
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index b57c253..9d4f8bb 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_PHY_EXYNOS_MIPI_VIDEO)	+=3D phy-exynos-mipi-=
video.o
>  obj-$(CONFIG_PHY_MVEBU_SATA)		+=3D phy-mvebu-sata.o
>  obj-$(CONFIG_OMAP_USB2)			+=3D phy-omap-usb2.o
>  obj-$(CONFIG_TWL4030_USB)		+=3D phy-twl4030-usb.o
> +obj-$(CONFIG_PHY_SUN4I_USB)		+=3D phy-sun4i-usb.o
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
> new file mode 100644
> index 0000000..bd9cb7fa
> --- /dev/null
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -0,0 +1,326 @@
> +/*
> + * Allwinner sun4i USB phy driver
> + *
> + * Copyright (C) 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + *
> + * Based on code from
> + * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
> + *
> + * Modelled after: Samsung S5P/EXYNOS SoC series MIPI CSIS/DSIM DPHY dri=
ver
> + * Copyright (C) 2013 Samsung Electronics Co., Ltd.
> + * Author: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +
> +#define REG_ISCR			0x00
> +#define REG_PHYCTL			0x04
> +#define REG_PHYBIST			0x08
> +#define REG_PHYTUNE			0x0c
> +
> +#define SUNXI_AHB_ICHR8_EN		BIT(10)
> +#define SUNXI_AHB_INCR4_BURST_EN	BIT(9)
> +#define SUNXI_AHB_INCRX_ALIGN_EN	BIT(8)
> +#define SUNXI_ULPI_BYPASS_EN		BIT(0)
> +
> +/* Common Control Bits for Both PHYs */
> +#define PHY_PLL_BW			0x03
> +#define PHY_RES45_CAL_EN		0x0c
> +
> +/* Private Control Bits for Each PHY */
> +#define PHY_TX_AMPLITUDE_TUNE		0x20
> +#define PHY_TX_SLEWRATE_TUNE		0x22
> +#define PHY_VBUSVALID_TH_SEL		0x25
> +#define PHY_PULLUP_RES_SEL		0x27
> +#define PHY_OTG_FUNC_EN			0x28
> +#define PHY_VBUS_DET_EN			0x29
> +#define PHY_DISCON_TH_SEL		0x2a
> +
> +#define MAX_PHYS			3
> +
> +struct sun4i_usb_phy_data {
> +	struct clk *clk;
> +	void __iomem *base;
> +	struct mutex mutex;
> +	int num_phys;
> +	u32 disc_thresh;
> +	struct sun4i_usb_phy {
> +		struct phy *phy;
> +		void __iomem *pmu;
> +		struct regulator *vbus;
> +		struct reset_control *reset;
> +		int index;
> +	} phys[MAX_PHYS];
> +};
> +
> +#define to_sun4i_usb_phy_data(phy) \
> +	container_of((phy), struct sun4i_usb_phy_data, phys[(phy)->index])
> +
> +static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32=
 data,
> +				int len)
> +{
> +	struct sun4i_usb_phy_data *phy_data =3D to_sun4i_usb_phy_data(phy);
> +	u32 temp, usbc_bit =3D BIT(phy->index * 2);
> +	int i;
> +
> +	mutex_lock(&phy_data->mutex);
> +
> +	for (i =3D 0; i < len; i++) {
> +		temp =3D readl(phy_data->base + REG_PHYCTL);
> +
> +		/* clear the address portion */
> +		temp &=3D ~(0xff << 8);
> +
> +		/* set the address */
> +		temp |=3D ((addr + i) << 8);
> +		writel(temp, phy_data->base + REG_PHYCTL);
> +
> +		/* set the data bit and clear usbc bit*/
> +		temp =3D readb(phy_data->base + REG_PHYCTL);
> +		if (data & 0x1)
> +			temp |=3D BIT(7);
> +		else
> +			temp &=3D ~BIT(7);
> +		temp &=3D ~usbc_bit;
> +		writeb(temp, phy_data->base + REG_PHYCTL);
> +
> +		/* pulse usbc_bit */
> +		temp =3D readb(phy_data->base + REG_PHYCTL);
> +		temp |=3D usbc_bit;
> +		writeb(temp, phy_data->base + REG_PHYCTL);
> +
> +		temp =3D readb(phy_data->base + REG_PHYCTL);
> +		temp &=3D ~usbc_bit;
> +		writeb(temp, phy_data->base + REG_PHYCTL);
> +
> +		data >>=3D 1;
> +	}
> +	mutex_unlock(&phy_data->mutex);
> +}
> +
> +static void sun4i_usb_phy_passby(struct sun4i_usb_phy *phy, int enable)
> +{
> +	u32 bits, reg_value;
> +
> +	if (!phy->pmu)
> +		return;
> +
> +	bits =3D SUNXI_AHB_ICHR8_EN | SUNXI_AHB_INCR4_BURST_EN |
> +		SUNXI_AHB_INCRX_ALIGN_EN | SUNXI_ULPI_BYPASS_EN;
> +
> +	reg_value =3D readl(phy->pmu);
> +
> +	if (enable)
> +		reg_value |=3D bits;
> +	else
> +		reg_value &=3D ~bits;
> +
> +	writel(reg_value, phy->pmu);
> +}
> +
> +static int sun4i_usb_phy_init(struct phy *_phy)
> +{
> +	struct sun4i_usb_phy *phy =3D phy_get_drvdata(_phy);
> +	struct sun4i_usb_phy_data *data =3D to_sun4i_usb_phy_data(phy);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(data->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_deassert(phy->reset);
> +	if (ret) {
> +		clk_disable_unprepare(data->clk);
> +		return ret;
> +	}
> +
> +	/* Adjust PHY's magnitude and rate */
> +	sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
> +
> +	/* Disconnect threshold adjustment */
> +	sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL, data->disc_thresh, 2);
> +
> +	sun4i_usb_phy_passby(phy, 1);
> +
> +	return 0;
> +}
> +
> +static int sun4i_usb_phy_exit(struct phy *_phy)
> +{
> +	struct sun4i_usb_phy *phy =3D phy_get_drvdata(_phy);
> +	struct sun4i_usb_phy_data *data =3D to_sun4i_usb_phy_data(phy);
> +
> +	sun4i_usb_phy_passby(phy, 0);
> +	reset_control_assert(phy->reset);
> +	clk_disable_unprepare(data->clk);
> +
> +	return 0;
> +}
> +
> +static int sun4i_usb_phy_power_on(struct phy *_phy)
> +{
> +	struct sun4i_usb_phy *phy =3D phy_get_drvdata(_phy);
> +	int ret =3D 0;
> +
> +	if (phy->vbus)
> +		ret =3D regulator_enable(phy->vbus);
> +
> +	return ret;
> +}
> +
> +static int sun4i_usb_phy_power_off(struct phy *_phy)
> +{
> +	struct sun4i_usb_phy *phy =3D phy_get_drvdata(_phy);
> +
> +	if (phy->vbus)
> +		regulator_disable(phy->vbus);
> +
> +	return 0;
> +}
> +
> +static struct phy_ops sun4i_usb_phy_ops =3D {
> +	.init		=3D sun4i_usb_phy_init,
> +	.exit		=3D sun4i_usb_phy_exit,
> +	.power_on	=3D sun4i_usb_phy_power_on,
> +	.power_off	=3D sun4i_usb_phy_power_off,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static struct phy *sun4i_usb_phy_xlate(struct device *dev,
> +					struct of_phandle_args *args)
> +{
> +	struct sun4i_usb_phy_data *data =3D dev_get_drvdata(dev);
> +
> +	if (WARN_ON(args->args[0] =3D=3D 0 || args->args[0] >=3D data->num_phys=
))
> +		return ERR_PTR(-ENODEV);
> +
> +	return data->phys[args->args[0]].phy;
> +}
> +
> +static int sun4i_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct sun4i_usb_phy_data *data;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	void __iomem *pmu =3D NULL;
> +	struct phy_provider *phy_provider;
> +	struct reset_control *reset;
> +	struct regulator *vbus;
> +	struct phy *phy;
> +	char name[16];
> +	int i;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->mutex);
> +
> +	if (of_device_is_compatible(np, "allwinner,sun5i-a13-usb-phy"))
> +		data->num_phys =3D 2;
> +	else
> +		data->num_phys =3D 3;
> +
> +	if (of_device_is_compatible(np, "allwinner,sun4i-a10-usb-phy"))
> +		data->disc_thresh =3D 3;
> +	else
> +		data->disc_thresh =3D 2;

I'd still prefer to pass this through the .data field of of_device_id,
but it looks much cleaner already :)

> +	data->clk =3D devm_clk_get(dev, "usb_phy");
> +	if (IS_ERR(data->clk)) {
> +		dev_err(dev, "could not get usb_phy clock\n");
> +		return PTR_ERR(data->clk);
> +	}
> +
> +	/* Skip 0, 0 is the phy for otg which is not yet supported. */
> +	for (i =3D 1; i < data->num_phys; i++) {
> +		snprintf(name, sizeof(name), "usb%d_vbus", i);
> +		vbus =3D devm_regulator_get_optional(dev, name);
> +		if (IS_ERR(vbus)) {
> +			if (PTR_ERR(vbus) =3D=3D -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			vbus =3D NULL;
> +		}
> +
> +		snprintf(name, sizeof(name), "usb%d_reset", i);
> +		reset =3D devm_reset_control_get(dev, name);
> +		if (IS_ERR(phy)) {
> +			dev_err(dev, "failed to get reset %s\n", name);
> +			return PTR_ERR(phy);
> +		}
> +
> +		if (i) { /* No pmu for usbc0 */
> +			pmu =3D devm_ioremap_resource(dev,
> +			      platform_get_resource(pdev, IORESOURCE_MEM, i));
> +			if (IS_ERR(pmu))
> +				return PTR_ERR(pmu);
> +		}
> +
> +		phy =3D devm_phy_create(dev, &sun4i_usb_phy_ops, NULL);
> +		if (IS_ERR(phy)) {
> +			dev_err(dev, "failed to create PHY %d\n", i);
> +			return PTR_ERR(phy);
> +		}
> +
> +		data->phys[i].phy =3D phy;
> +		data->phys[i].pmu =3D pmu;
> +		data->phys[i].vbus =3D vbus;
> +		data->phys[i].reset =3D reset;
> +		data->phys[i].index =3D i;
> +		phy_set_drvdata(phy, &data->phys[i]);
> +	}
> +
> +	data->base =3D devm_ioremap_resource(dev,
> +			platform_get_resource(pdev, IORESOURCE_MEM, 0));
> +	if (IS_ERR(data->base))
> +		return PTR_ERR(data->base);
> +
> +	dev_set_drvdata(dev, data);
> +	phy_provider =3D devm_of_phy_provider_register(dev, sun4i_usb_phy_xlate=
);
> +	if (IS_ERR(phy_provider))
> +		return PTR_ERR(phy_provider);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sun4i_usb_phy_of_match[] =3D {
> +	{ .compatible =3D "allwinner,sun4i-a10-usb-phy" },
> +	{ .compatible =3D "allwinner,sun5i-a13-usb-phy" },
> +	{ .compatible =3D "allwinner,sun7i-a20-usb-phy" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
> +
> +static struct platform_driver sun4i_usb_phy_driver =3D {
> +	.probe	=3D sun4i_usb_phy_probe,
> +	.driver =3D {
> +		.of_match_table	=3D sun4i_usb_phy_of_match,
> +		.name  =3D "sun4i-usb-phy",
> +		.owner =3D THIS_MODULE,
> +	}
> +};
> +module_platform_driver(sun4i_usb_phy_driver);
> +
> +MODULE_DESCRIPTION("Allwinner sun4i USB phy driver");
> +MODULE_AUTHOR("Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> --=20
> 1.8.4.2
>=20

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Pbi2MkfjSbXbI4MN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS9V/9AAoJEBx+YmzsjxAg1FQP/01GRGgNUhKpkWBMzSVzSdqa
ZPlAo9XcFxm3L73b3MaEoXuN0gn+HrX138YIYem3sSFZ+sk2EIxjoyvyg2yyMcT8
XMSooKwuaxKTZhal3BXqE1tMFBFg3e18HhxmzemlcqLsQ5LGFfubzStpG+vgFTCq
cQqd7FS4zw7yiVgZC5L9fSw5nTAfQDD+iV6yNlaOjBbHWv55mJV3/HIbK/dkBt5U
JqjSWQUwJElGTw8CIgIvJyZUEo3HN9h6q7rp1qwivRZ6KU6dfw+65as2qG6kTdlE
vUu8dzOI6OJTfhiSHVYZHGLOVFzEGVJLNCscxTXMwt68UrdMZVTszcrTo+cQwA9G
q97tSLCqJSxwcQTe484daTqeTu4Wxb6phHsL+XJ38XPIpQhcqVILIphI/HY/5ds/
YG43YCr2Hp/5A8XlDzB6oe8IK1NDnhXyFmTJR4C1jWnoC1UPyFALUAYaBZ4a7LJM
JjaL6tLw9l639UFRNS1QjQZR5diBNHd+m8NrsGw/rHNFfidII1PYpZdVsJ65JfoA
9L0SM40OoWyGjbtmzmSasWmCqWiXHBABLDKvffDdvhKjQKUD4sOHJvjwkzrk8j6D
14L4Hb4qg1QMzEFbIVrzwpfQkvuHDr/VbaMZ1MQ9MzAxPANIPw+0WUhADUN3PsUX
GAdSgA++dc2FQFDyRuP+
=HHLb
-----END PGP SIGNATURE-----

--Pbi2MkfjSbXbI4MN--
