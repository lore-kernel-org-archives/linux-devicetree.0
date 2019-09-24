From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH 3/5] regulator: da9062: add voltage selection gpio support
Date: Tue, 24 Sep 2019 09:48:41 +0000
Message-ID: <AM5PR1001MB099431ECB45A103A22646CB680840@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
 <20190917124246.11732-4-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917124246.11732-4-m.felsch@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, Support Opensource <Support.Opensource@diasemi.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Steve Twiss <stwiss.opensource@diasemi.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 17 September 2019 13:43, Marco Felsch wrote:

> The DA9062/1 devices can switch their regulator voltages between
> voltage-A (active) and voltage-B (suspend) settings. Switching the
> voltages can be controlled by ther internal state-machine or by a gpio
> input signal and can be configured for each individual regulator. This
> commit adds the gpio-based voltage switching support.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/regulator/da9062-regulator.c | 149 +++++++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>=20
> diff --git a/drivers/regulator/da9062-regulator.c b/drivers/regulator/da9=
062-
> regulator.c
> index 9b2ca472f70c..9d6eb7625948 100644
> --- a/drivers/regulator/da9062-regulator.c
> +++ b/drivers/regulator/da9062-regulator.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/err.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -15,6 +16,7 @@
>  #include <linux/regulator/machine.h>
>  #include <linux/regulator/of_regulator.h>
>  #include <linux/mfd/da9062/core.h>
> +#include <linux/mfd/da9062/gpio.h>
>  #include <linux/mfd/da9062/registers.h>
>=20
>  /* Regulator IDs */
> @@ -50,6 +52,7 @@ struct da9062_regulator_info {
>  	struct reg_field sleep;
>  	struct reg_field suspend_sleep;
>  	unsigned int suspend_vsel_reg;
> +	struct reg_field vsel_gpi;
>  	/* Event detection bit */
>  	struct reg_field oc_event;
>  };
> @@ -65,6 +68,7 @@ struct da9062_regulator {
>  	struct regmap_field			*suspend;
>  	struct regmap_field			*sleep;
>  	struct regmap_field			*suspend_sleep;
> +	struct regmap_field			*vsel_gpi;
>  };
>=20
>  /* Encapsulates all information for the regulators driver */
> @@ -351,6 +355,65 @@ static const struct regulator_ops da9062_ldo_ops =3D=
 {
>  	.set_suspend_mode	=3D da9062_ldo_set_suspend_mode,
>  };
>=20
> +static int da9062_config_gpi(struct device_node *np,
> +			     const struct regulator_desc *desc,
> +			     struct regulator_config *cfg, const char *gpi_id)
> +{
> +	struct da9062_regulator *regl =3D cfg->driver_data;
> +	struct gpio_desc *gpi;
> +	unsigned int nr;
> +	int ret;
> +	char *prop, *label;
> +
> +	prop =3D kasprintf(GFP_KERNEL, "dlg,%s-sense-gpios", gpi_id);
> +	if (!prop)
> +		return -ENOMEM;
> +	label =3D kasprintf(GFP_KERNEL, "%s-%s-gpi", desc->name, gpi_id);
> +	if (!label) {
> +		ret =3D -ENOMEM;
> +		goto free;

If we use the generic bindings names then the above will change I guess.

> +	}
> +
> +	/*
> +	 * We only must ensure that the gpio device is probed before the
> +	 * regulator driver so no need to store the reference global. Luckily
> +	 * devm_* releases the gpio upon a unbound action.
> +	 */
> +	gpi =3D devm_gpiod_get_from_of_node(cfg->dev, np, prop, 0, GPIOD_IN |
> +					  GPIOD_FLAGS_BIT_NONEXCLUSIVE,
> label);
> +	if (IS_ERR(gpi)) {
> +		ret =3D PTR_ERR(gpi);
> +		goto free;
> +	}
> +
> +	if (!gpi) {
> +		ret =3D 0;
> +		goto free;
> +	}
> +
> +	/* We need the local number */
> +	nr =3D da9062_gpio_get_hwgpio(gpi);
> +	if (nr < 1 || nr > 3) {
> +		ret =3D -EINVAL;
> +		goto free;
> +	}
> +
> +	ret =3D regmap_field_write(regl->vsel_gpi, nr);

Actually thinking about this some more, should we really be setting alterna=
te
functions of the GPIO here? Would this not be done through GPIO/Pinmux
frameworks? That way the GPIO would be blocked off from other's requesting =
it.
This seems a little unsafe, unless I'm mistaken.

> +
> +free:
> +	kfree(prop);
> +	kfree(label);
> +
> +	return ret;
> +}
> +
> +static int da9062_parse_dt(struct device_node *np,
> +			   const struct regulator_desc *desc,
> +			   struct regulator_config *cfg)
> +{
> +	return da9062_config_gpi(np, desc, cfg, "vsel");
> +}
> +
>  /* DA9061 Regulator information */
>  static const struct da9062_regulator_info local_da9061_regulator_info[] =
=3D {
>  	{
> @@ -358,6 +421,7 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  		.desc.name =3D "DA9061 BUCK1",
>  		.desc.of_match =3D of_match_ptr("buck1"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_buck_ops,
>  		.desc.min_uV =3D (300) * 1000,
>  		.desc.uV_step =3D (10) * 1000,
> @@ -388,12 +452,17 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK1_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_BUCK1_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_BUCK1_CONT,
> +			__builtin_ffs((int)DA9062AA_VBUCK1_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VBUCK1_GPI_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9061_ID_BUCK2,
>  		.desc.name =3D "DA9061 BUCK2",
>  		.desc.of_match =3D of_match_ptr("buck2"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_buck_ops,
>  		.desc.min_uV =3D (800) * 1000,
>  		.desc.uV_step =3D (20) * 1000,
> @@ -424,12 +493,17 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK3_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_BUCK3_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_BUCK3_CONT,
> +			__builtin_ffs((int)DA9062AA_VBUCK3_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VBUCK3_GPI_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9061_ID_BUCK3,
>  		.desc.name =3D "DA9061 BUCK3",
>  		.desc.of_match =3D of_match_ptr("buck3"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_buck_ops,
>  		.desc.min_uV =3D (530) * 1000,
>  		.desc.uV_step =3D (10) * 1000,
> @@ -460,12 +534,17 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK4_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_BUCK4_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_BUCK4_CONT,
> +			__builtin_ffs((int)DA9062AA_VBUCK4_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VBUCK4_GPI_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9061_ID_LDO1,
>  		.desc.name =3D "DA9061 LDO1",
>  		.desc.of_match =3D of_match_ptr("ldo1"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_ldo_ops,
>  		.desc.min_uV =3D (900) * 1000,
>  		.desc.uV_step =3D (50) * 1000,
> @@ -489,6 +568,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_LDO1_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_LDO1_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_LDO1_CONT,
> +			__builtin_ffs((int)DA9062AA_VLDO1_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VLDO1_GPI_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO1_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -499,6 +582,7 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  		.desc.name =3D "DA9061 LDO2",
>  		.desc.of_match =3D of_match_ptr("ldo2"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_ldo_ops,
>  		.desc.min_uV =3D (900) * 1000,
>  		.desc.uV_step =3D (50) * 1000,
> @@ -522,6 +606,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_LDO2_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_LDO2_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_LDO2_CONT,
> +			__builtin_ffs((int)DA9062AA_VLDO2_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VLDO2_GPI_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO2_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -532,6 +620,7 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  		.desc.name =3D "DA9061 LDO3",
>  		.desc.of_match =3D of_match_ptr("ldo3"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_ldo_ops,
>  		.desc.min_uV =3D (900) * 1000,
>  		.desc.uV_step =3D (50) * 1000,
> @@ -555,6 +644,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_LDO3_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_LDO3_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_LDO3_CONT,
> +			__builtin_ffs((int)DA9062AA_VLDO3_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VLDO3_GPI_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO3_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -565,6 +658,7 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  		.desc.name =3D "DA9061 LDO4",
>  		.desc.of_match =3D of_match_ptr("ldo4"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_ldo_ops,
>  		.desc.min_uV =3D (900) * 1000,
>  		.desc.uV_step =3D (50) * 1000,
> @@ -588,6 +682,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_LDO4_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_LDO4_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_LDO4_CONT,
> +			__builtin_ffs((int)DA9062AA_VLDO4_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VLDO4_GPI_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO4_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -602,6 +700,7 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  		.desc.name =3D "DA9062 BUCK1",
>  		.desc.of_match =3D of_match_ptr("buck1"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_buck_ops,
>  		.desc.min_uV =3D (300) * 1000,
>  		.desc.uV_step =3D (10) * 1000,
> @@ -632,12 +731,17 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK1_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_BUCK1_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_BUCK1_CONT,
> +			__builtin_ffs((int)DA9062AA_VBUCK1_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VBUCK1_GPI_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9062_ID_BUCK2,
>  		.desc.name =3D "DA9062 BUCK2",
>  		.desc.of_match =3D of_match_ptr("buck2"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_buck_ops,
>  		.desc.min_uV =3D (300) * 1000,
>  		.desc.uV_step =3D (10) * 1000,
> @@ -668,12 +772,17 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK2_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_BUCK2_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_BUCK2_CONT,
> +			__builtin_ffs((int)DA9062AA_VBUCK2_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VBUCK2_GPI_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9062_ID_BUCK3,
>  		.desc.name =3D "DA9062 BUCK3",
>  		.desc.of_match =3D of_match_ptr("buck3"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_buck_ops,
>  		.desc.min_uV =3D (800) * 1000,
>  		.desc.uV_step =3D (20) * 1000,
> @@ -704,12 +813,17 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK3_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_BUCK3_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_BUCK3_CONT,
> +			__builtin_ffs((int)DA9062AA_VBUCK3_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VBUCK3_GPI_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9062_ID_BUCK4,
>  		.desc.name =3D "DA9062 BUCK4",
>  		.desc.of_match =3D of_match_ptr("buck4"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_buck_ops,
>  		.desc.min_uV =3D (530) * 1000,
>  		.desc.uV_step =3D (10) * 1000,
> @@ -740,12 +854,17 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK4_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_BUCK4_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_BUCK4_CONT,
> +			__builtin_ffs((int)DA9062AA_VBUCK4_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VBUCK4_GPI_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9062_ID_LDO1,
>  		.desc.name =3D "DA9062 LDO1",
>  		.desc.of_match =3D of_match_ptr("ldo1"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_ldo_ops,
>  		.desc.min_uV =3D (900) * 1000,
>  		.desc.uV_step =3D (50) * 1000,
> @@ -769,6 +888,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_LDO1_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_LDO1_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_LDO1_CONT,
> +			__builtin_ffs((int)DA9062AA_VLDO1_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VLDO1_GPI_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO1_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -779,6 +902,7 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  		.desc.name =3D "DA9062 LDO2",
>  		.desc.of_match =3D of_match_ptr("ldo2"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_ldo_ops,
>  		.desc.min_uV =3D (900) * 1000,
>  		.desc.uV_step =3D (50) * 1000,
> @@ -802,6 +926,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_LDO2_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_LDO2_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_LDO2_CONT,
> +			__builtin_ffs((int)DA9062AA_VLDO2_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VLDO2_GPI_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO2_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -812,6 +940,7 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  		.desc.name =3D "DA9062 LDO3",
>  		.desc.of_match =3D of_match_ptr("ldo3"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_ldo_ops,
>  		.desc.min_uV =3D (900) * 1000,
>  		.desc.uV_step =3D (50) * 1000,
> @@ -835,6 +964,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_LDO3_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_LDO3_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_LDO3_CONT,
> +			__builtin_ffs((int)DA9062AA_VLDO3_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VLDO3_GPI_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO3_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -845,6 +978,7 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  		.desc.name =3D "DA9062 LDO4",
>  		.desc.of_match =3D of_match_ptr("ldo4"),
>  		.desc.regulators_node =3D of_match_ptr("regulators"),
> +		.desc.of_parse_cb =3D da9062_parse_dt,
>  		.desc.ops =3D &da9062_ldo_ops,
>  		.desc.min_uV =3D (900) * 1000,
>  		.desc.uV_step =3D (50) * 1000,
> @@ -868,6 +1002,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_LDO4_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz(DA9062AA_LDO4_CONF_MASK) - 1),
> +		.vsel_gpi =3D REG_FIELD(DA9062AA_LDO4_CONT,
> +			__builtin_ffs((int)DA9062AA_VLDO4_GPI_MASK) - 1,
> +			sizeof(unsigned int) * 8 -
> +			__builtin_clz(DA9062AA_VLDO4_GPI_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO4_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -988,6 +1126,15 @@ static int da9062_regulator_probe(struct
> platform_device *pdev)
>  				return PTR_ERR(regl->suspend_sleep);
>  		}
>=20
> +		if (regl->info->vsel_gpi.reg) {
> +			regl->vsel_gpi =3D devm_regmap_field_alloc(
> +					&pdev->dev,
> +					chip->regmap,
> +					regl->info->vsel_gpi);
> +			if (IS_ERR(regl->vsel_gpi))
> +				return PTR_ERR(regl->vsel_gpi);
> +		}
> +
>  		/* Register regulator */
>  		memset(&config, 0, sizeof(config));
>  		config.dev =3D chip->dev;
> @@ -997,6 +1144,8 @@ static int da9062_regulator_probe(struct
> platform_device *pdev)
>  		regl->rdev =3D devm_regulator_register(&pdev->dev, &regl->desc,
>  						     &config);
>  		if (IS_ERR(regl->rdev)) {
> +			if (PTR_ERR(regl->rdev) =3D=3D -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
>  			dev_err(&pdev->dev,
>  				"Failed to register %s regulator\n",
>  				regl->desc.name);
> --
> 2.20.1
