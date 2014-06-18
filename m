From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv6 2/3] regulator: s2mps11: Add support S2MPU02 regulator
 device
Date: Wed, 18 Jun 2014 10:13:58 +0100
Message-ID: <20140618091358.GD23945@lee--X1>
References: <1402964830-24890-1-git-send-email-cw00.choi@samsung.com>
 <1402964830-24890-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402964830-24890-3-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Jun 2014, Chanwoo Choi wrote:

> This patch add S2MPU02 regulator device to existing S2MPS11 device dr=
iver
> because of little difference between S2MPS1x and S2MPU02. The S2MPU02
> regulator device includes LDO[1-28] and BUCK[1-7].
>=20
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> [Add missing linear_min_sel of S2MPU02 LDO regulators by Jonghwa Lee]
> Signed-off-by: Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/sec-core.c              |  25 +++
>  drivers/regulator/s2mps11.c         | 321 ++++++++++++++++++++++++++=
+++++++---
>  include/linux/mfd/samsung/s2mpu02.h | 201 ++++++++++++++++++++++
>  3 files changed, 526 insertions(+), 21 deletions(-)
>  create mode 100644 include/linux/mfd/samsung/s2mpu02.h

Applied, thanks.

> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 15ba847..2621328 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/mfd/samsung/s2mpa01.h>
>  #include <linux/mfd/samsung/s2mps11.h>
>  #include <linux/mfd/samsung/s2mps14.h>
> +#include <linux/mfd/samsung/s2mpu02.h>
>  #include <linux/mfd/samsung/s5m8763.h>
>  #include <linux/mfd/samsung/s5m8767.h>
>  #include <linux/regmap.h>
> @@ -144,6 +145,18 @@ static bool s2mps11_volatile(struct device *dev,=
 unsigned int reg)
>  	}
>  }
> =20
> +static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case S2MPU02_REG_INT1M:
> +	case S2MPU02_REG_INT2M:
> +	case S2MPU02_REG_INT3M:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
>  static bool s5m8763_volatile(struct device *dev, unsigned int reg)
>  {
>  	switch (reg) {
> @@ -189,6 +202,15 @@ static const struct regmap_config s2mps14_regmap=
_config =3D {
>  	.cache_type =3D REGCACHE_FLAT,
>  };
> =20
> +static const struct regmap_config s2mpu02_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +
> +	.max_register =3D S2MPU02_REG_DVSDATA,
> +	.volatile_reg =3D s2mpu02_volatile,
> +	.cache_type =3D REGCACHE_FLAT,
> +};
> +
>  static const struct regmap_config s5m8763_regmap_config =3D {
>  	.reg_bits =3D 8,
>  	.val_bits =3D 8,
> @@ -310,6 +332,9 @@ static int sec_pmic_probe(struct i2c_client *i2c,
>  	case S5M8767X:
>  		regmap =3D &s5m8767_regmap_config;
>  		break;
> +	case S2MPU02:
> +		regmap =3D &s2mpu02_regmap_config;
> +		break;
>  	default:
>  		regmap =3D &sec_regmap_config;
>  		break;
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.=
c
> index 02e2fb2..2daacc6 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -31,6 +31,7 @@
>  #include <linux/mfd/samsung/core.h>
>  #include <linux/mfd/samsung/s2mps11.h>
>  #include <linux/mfd/samsung/s2mps14.h>
> +#include <linux/mfd/samsung/s2mpu02.h>
> =20
>  struct s2mps11_info {
>  	unsigned int rdev_num;
> @@ -40,11 +41,15 @@ struct s2mps11_info {
>  	int ramp_delay16;
>  	int ramp_delay7810;
>  	int ramp_delay9;
> +
> +	enum sec_device_type dev_type;
> +
>  	/*
> -	 * One bit for each S2MPS14 regulator whether the suspend mode
> +	 * One bit for each S2MPS14/S2MPU02 regulator whether the suspend m=
ode
>  	 * was enabled.
>  	 */
> -	unsigned int s2mps14_suspend_state:30;
> +	unsigned long long s2mps14_suspend_state:35;
> +
>  	/* Array of size rdev_num with GPIO-s for external sleep control */
>  	int *ext_control_gpio;
>  };
> @@ -415,12 +420,24 @@ static int s2mps14_regulator_enable(struct regu=
lator_dev *rdev)
>  	struct s2mps11_info *s2mps11 =3D rdev_get_drvdata(rdev);
>  	unsigned int val;
> =20
> -	if (s2mps11->s2mps14_suspend_state & (1 << rdev_get_id(rdev)))
> -		val =3D S2MPS14_ENABLE_SUSPEND;
> -	else if (gpio_is_valid(s2mps11->ext_control_gpio[rdev_get_id(rdev)]=
))
> -		val =3D S2MPS14_ENABLE_EXT_CONTROL;
> -	else
> -		val =3D rdev->desc->enable_mask;
> +	switch (s2mps11->dev_type) {
> +	case S2MPS14X:
> +		if (s2mps11->s2mps14_suspend_state & (1 << rdev_get_id(rdev)))
> +			val =3D S2MPS14_ENABLE_SUSPEND;
> +		else if (gpio_is_valid(s2mps11->ext_control_gpio[rdev_get_id(rdev)=
]))
> +			val =3D S2MPS14_ENABLE_EXT_CONTROL;
> +		else
> +			val =3D rdev->desc->enable_mask;
> +		break;
> +	case S2MPU02:
> +		if (s2mps11->s2mps14_suspend_state & (1 << rdev_get_id(rdev)))
> +			val =3D S2MPU02_ENABLE_SUSPEND;
> +		else
> +			val =3D rdev->desc->enable_mask;
> +		break;
> +	default:
> +		return -EINVAL;
> +	};
> =20
>  	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
>  			rdev->desc->enable_mask, val);
> @@ -429,12 +446,38 @@ static int s2mps14_regulator_enable(struct regu=
lator_dev *rdev)
>  static int s2mps14_regulator_set_suspend_disable(struct regulator_de=
v *rdev)
>  {
>  	int ret;
> -	unsigned int val;
> +	unsigned int val, state;
>  	struct s2mps11_info *s2mps11 =3D rdev_get_drvdata(rdev);
> +	int rdev_id =3D rdev_get_id(rdev);
> =20
> -	/* LDO3 should be always on and does not support suspend mode */
> -	if (rdev_get_id(rdev) =3D=3D S2MPS14_LDO3)
> -		return 0;
> +	/* Below LDO should be always on or does not support suspend mode. =
*/
> +	switch (s2mps11->dev_type) {
> +	case S2MPS14X:
> +		switch (rdev_id) {
> +		case S2MPS14_LDO3:
> +			return 0;
> +		default:
> +			state =3D S2MPS14_ENABLE_SUSPEND;
> +			break;
> +		};
> +		break;
> +	case S2MPU02:
> +		switch (rdev_id) {
> +		case S2MPU02_LDO13:
> +		case S2MPU02_LDO14:
> +		case S2MPU02_LDO15:
> +		case S2MPU02_LDO17:
> +		case S2MPU02_BUCK7:
> +			state =3D S2MPU02_DISABLE_SUSPEND;
> +			break;
> +		default:
> +			state =3D S2MPU02_ENABLE_SUSPEND;
> +			break;
> +		};
> +		break;
> +	default:
> +		return -EINVAL;
> +	};
> =20
>  	ret =3D regmap_read(rdev->regmap, rdev->desc->enable_reg, &val);
>  	if (ret < 0)
> @@ -452,7 +495,7 @@ static int s2mps14_regulator_set_suspend_disable(=
struct regulator_dev *rdev)
>  		return 0;
> =20
>  	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
> -			rdev->desc->enable_mask, S2MPS14_ENABLE_SUSPEND);
> +			rdev->desc->enable_mask, state);
>  }
> =20
>  static struct regulator_ops s2mps14_reg_ops =3D {
> @@ -605,8 +648,7 @@ static void s2mps14_pmic_dt_parse_ext_control_gpi=
o(struct platform_device *pdev,
>  }
> =20
>  static int s2mps11_pmic_dt_parse(struct platform_device *pdev,
> -		struct of_regulator_match *rdata, struct s2mps11_info *s2mps11,
> -		enum sec_device_type dev_type)
> +		struct of_regulator_match *rdata, struct s2mps11_info *s2mps11)
>  {
>  	struct device_node *reg_np;
> =20
> @@ -617,7 +659,7 @@ static int s2mps11_pmic_dt_parse(struct platform_=
device *pdev,
>  	}
> =20
>  	of_regulator_match(&pdev->dev, reg_np, rdata, s2mps11->rdev_num);
> -	if (dev_type =3D=3D S2MPS14X)
> +	if (s2mps11->dev_type =3D=3D S2MPS14X)
>  		s2mps14_pmic_dt_parse_ext_control_gpio(pdev, rdata, s2mps11);
> =20
>  	of_node_put(reg_np);
> @@ -625,6 +667,238 @@ static int s2mps11_pmic_dt_parse(struct platfor=
m_device *pdev,
>  	return 0;
>  }
> =20
> +static int s2mpu02_set_ramp_delay(struct regulator_dev *rdev, int ra=
mp_delay)
> +{
> +	unsigned int ramp_val, ramp_shift, ramp_reg;
> +
> +	switch (rdev_get_id(rdev)) {
> +	case S2MPU02_BUCK1:
> +		ramp_shift =3D S2MPU02_BUCK1_RAMP_SHIFT;
> +		break;
> +	case S2MPU02_BUCK2:
> +		ramp_shift =3D S2MPU02_BUCK2_RAMP_SHIFT;
> +		break;
> +	case S2MPU02_BUCK3:
> +		ramp_shift =3D S2MPU02_BUCK3_RAMP_SHIFT;
> +		break;
> +	case S2MPU02_BUCK4:
> +		ramp_shift =3D S2MPU02_BUCK4_RAMP_SHIFT;
> +		break;
> +	default:
> +		return 0;
> +	}
> +	ramp_reg =3D S2MPU02_REG_RAMP1;
> +	ramp_val =3D get_ramp_delay(ramp_delay);
> +
> +	return regmap_update_bits(rdev->regmap, ramp_reg,
> +				  S2MPU02_BUCK1234_RAMP_MASK << ramp_shift,
> +				  ramp_val << ramp_shift);
> +}
> +
> +static struct regulator_ops s2mpu02_ldo_ops =3D {
> +	.list_voltage		=3D regulator_list_voltage_linear,
> +	.map_voltage		=3D regulator_map_voltage_linear,
> +	.is_enabled		=3D regulator_is_enabled_regmap,
> +	.enable			=3D s2mps14_regulator_enable,
> +	.disable		=3D regulator_disable_regmap,
> +	.get_voltage_sel	=3D regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel	=3D regulator_set_voltage_sel_regmap,
> +	.set_voltage_time_sel	=3D regulator_set_voltage_time_sel,
> +	.set_suspend_disable	=3D s2mps14_regulator_set_suspend_disable,
> +};
> +
> +static struct regulator_ops s2mpu02_buck_ops =3D {
> +	.list_voltage		=3D regulator_list_voltage_linear,
> +	.map_voltage		=3D regulator_map_voltage_linear,
> +	.is_enabled		=3D regulator_is_enabled_regmap,
> +	.enable			=3D s2mps14_regulator_enable,
> +	.disable		=3D regulator_disable_regmap,
> +	.get_voltage_sel	=3D regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel	=3D regulator_set_voltage_sel_regmap,
> +	.set_voltage_time_sel	=3D regulator_set_voltage_time_sel,
> +	.set_suspend_disable	=3D s2mps14_regulator_set_suspend_disable,
> +	.set_ramp_delay		=3D s2mpu02_set_ramp_delay,
> +};
> +
> +#define regulator_desc_s2mpu02_ldo1(num) {		\
> +	.name		=3D "LDO"#num,			\
> +	.id		=3D S2MPU02_LDO##num,		\
> +	.ops		=3D &s2mpu02_ldo_ops,		\
> +	.type		=3D REGULATOR_VOLTAGE,		\
> +	.owner		=3D THIS_MODULE,			\
> +	.min_uV		=3D S2MPU02_LDO_MIN_900MV,	\
> +	.uV_step	=3D S2MPU02_LDO_STEP_12_5MV,	\
> +	.linear_min_sel	=3D S2MPU02_LDO_GROUP1_START_SEL,	\
> +	.n_voltages	=3D S2MPU02_LDO_N_VOLTAGES,	\
> +	.vsel_reg	=3D S2MPU02_REG_L1CTRL,		\
> +	.vsel_mask	=3D S2MPU02_LDO_VSEL_MASK,	\
> +	.enable_reg	=3D S2MPU02_REG_L1CTRL,		\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK		\
> +}
> +#define regulator_desc_s2mpu02_ldo2(num) {		\
> +	.name		=3D "LDO"#num,			\
> +	.id		=3D S2MPU02_LDO##num,		\
> +	.ops		=3D &s2mpu02_ldo_ops,		\
> +	.type		=3D REGULATOR_VOLTAGE,		\
> +	.owner		=3D THIS_MODULE,			\
> +	.min_uV		=3D S2MPU02_LDO_MIN_1050MV,	\
> +	.uV_step	=3D S2MPU02_LDO_STEP_25MV,	\
> +	.linear_min_sel	=3D S2MPU02_LDO_GROUP2_START_SEL,	\
> +	.n_voltages	=3D S2MPU02_LDO_N_VOLTAGES,	\
> +	.vsel_reg	=3D S2MPU02_REG_L2CTRL1,		\
> +	.vsel_mask	=3D S2MPU02_LDO_VSEL_MASK,	\
> +	.enable_reg	=3D S2MPU02_REG_L2CTRL1,		\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK		\
> +}
> +#define regulator_desc_s2mpu02_ldo3(num) {		\
> +	.name		=3D "LDO"#num,			\
> +	.id		=3D S2MPU02_LDO##num,		\
> +	.ops		=3D &s2mpu02_ldo_ops,		\
> +	.type		=3D REGULATOR_VOLTAGE,		\
> +	.owner		=3D THIS_MODULE,			\
> +	.min_uV		=3D S2MPU02_LDO_MIN_900MV,	\
> +	.uV_step	=3D S2MPU02_LDO_STEP_12_5MV,	\
> +	.linear_min_sel	=3D S2MPU02_LDO_GROUP1_START_SEL,	\
> +	.n_voltages	=3D S2MPU02_LDO_N_VOLTAGES,	\
> +	.vsel_reg	=3D S2MPU02_REG_L3CTRL + num - 3,	\
> +	.vsel_mask	=3D S2MPU02_LDO_VSEL_MASK,	\
> +	.enable_reg	=3D S2MPU02_REG_L3CTRL + num - 3,	\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK		\
> +}
> +#define regulator_desc_s2mpu02_ldo4(num) {		\
> +	.name		=3D "LDO"#num,			\
> +	.id		=3D S2MPU02_LDO##num,		\
> +	.ops		=3D &s2mpu02_ldo_ops,		\
> +	.type		=3D REGULATOR_VOLTAGE,		\
> +	.owner		=3D THIS_MODULE,			\
> +	.min_uV		=3D S2MPU02_LDO_MIN_1050MV,	\
> +	.uV_step	=3D S2MPU02_LDO_STEP_25MV,	\
> +	.linear_min_sel	=3D S2MPU02_LDO_GROUP2_START_SEL,	\
> +	.n_voltages	=3D S2MPU02_LDO_N_VOLTAGES,	\
> +	.vsel_reg	=3D S2MPU02_REG_L3CTRL + num - 3,	\
> +	.vsel_mask	=3D S2MPU02_LDO_VSEL_MASK,	\
> +	.enable_reg	=3D S2MPU02_REG_L3CTRL + num - 3,	\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK		\
> +}
> +#define regulator_desc_s2mpu02_ldo5(num) {		\
> +	.name		=3D "LDO"#num,			\
> +	.id		=3D S2MPU02_LDO##num,		\
> +	.ops		=3D &s2mpu02_ldo_ops,		\
> +	.type		=3D REGULATOR_VOLTAGE,		\
> +	.owner		=3D THIS_MODULE,			\
> +	.min_uV		=3D S2MPU02_LDO_MIN_1600MV,	\
> +	.uV_step	=3D S2MPU02_LDO_STEP_50MV,	\
> +	.linear_min_sel	=3D S2MPU02_LDO_GROUP3_START_SEL,	\
> +	.n_voltages	=3D S2MPU02_LDO_N_VOLTAGES,	\
> +	.vsel_reg	=3D S2MPU02_REG_L3CTRL + num - 3,	\
> +	.vsel_mask	=3D S2MPU02_LDO_VSEL_MASK,	\
> +	.enable_reg	=3D S2MPU02_REG_L3CTRL + num - 3,	\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK		\
> +}
> +
> +#define regulator_desc_s2mpu02_buck1234(num) {			\
> +	.name		=3D "BUCK"#num,				\
> +	.id		=3D S2MPU02_BUCK##num,			\
> +	.ops		=3D &s2mpu02_buck_ops,			\
> +	.type		=3D REGULATOR_VOLTAGE,			\
> +	.owner		=3D THIS_MODULE,				\
> +	.min_uV		=3D S2MPU02_BUCK1234_MIN_600MV,		\
> +	.uV_step	=3D S2MPU02_BUCK1234_STEP_6_25MV,		\
> +	.n_voltages	=3D S2MPU02_BUCK_N_VOLTAGES,		\
> +	.linear_min_sel =3D S2MPU02_BUCK1234_START_SEL,		\
> +	.ramp_delay	=3D S2MPU02_BUCK_RAMP_DELAY,		\
> +	.vsel_reg	=3D S2MPU02_REG_B1CTRL2 + (num - 1) * 2,	\
> +	.vsel_mask	=3D S2MPU02_BUCK_VSEL_MASK,		\
> +	.enable_reg	=3D S2MPU02_REG_B1CTRL1 + (num - 1) * 2,	\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK			\
> +}
> +#define regulator_desc_s2mpu02_buck5(num) {			\
> +	.name		=3D "BUCK"#num,				\
> +	.id		=3D S2MPU02_BUCK##num,			\
> +	.ops		=3D &s2mpu02_ldo_ops,			\
> +	.type		=3D REGULATOR_VOLTAGE,			\
> +	.owner		=3D THIS_MODULE,				\
> +	.min_uV		=3D S2MPU02_BUCK5_MIN_1081_25MV,		\
> +	.uV_step	=3D S2MPU02_BUCK5_STEP_6_25MV,		\
> +	.n_voltages	=3D S2MPU02_BUCK_N_VOLTAGES,		\
> +	.linear_min_sel =3D S2MPU02_BUCK5_START_SEL,		\
> +	.ramp_delay	=3D S2MPU02_BUCK_RAMP_DELAY,		\
> +	.vsel_reg	=3D S2MPU02_REG_B5CTRL2,			\
> +	.vsel_mask	=3D S2MPU02_BUCK_VSEL_MASK,		\
> +	.enable_reg	=3D S2MPU02_REG_B5CTRL1,			\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK			\
> +}
> +#define regulator_desc_s2mpu02_buck6(num) {			\
> +	.name		=3D "BUCK"#num,				\
> +	.id		=3D S2MPU02_BUCK##num,			\
> +	.ops		=3D &s2mpu02_ldo_ops,			\
> +	.type		=3D REGULATOR_VOLTAGE,			\
> +	.owner		=3D THIS_MODULE,				\
> +	.min_uV		=3D S2MPU02_BUCK6_MIN_1700MV,		\
> +	.uV_step	=3D S2MPU02_BUCK6_STEP_2_50MV,		\
> +	.n_voltages	=3D S2MPU02_BUCK_N_VOLTAGES,		\
> +	.linear_min_sel =3D S2MPU02_BUCK6_START_SEL,		\
> +	.ramp_delay	=3D S2MPU02_BUCK_RAMP_DELAY,		\
> +	.vsel_reg	=3D S2MPU02_REG_B6CTRL2,			\
> +	.vsel_mask	=3D S2MPU02_BUCK_VSEL_MASK,		\
> +	.enable_reg	=3D S2MPU02_REG_B6CTRL1,			\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK			\
> +}
> +#define regulator_desc_s2mpu02_buck7(num) {			\
> +	.name		=3D "BUCK"#num,				\
> +	.id		=3D S2MPU02_BUCK##num,			\
> +	.ops		=3D &s2mpu02_ldo_ops,			\
> +	.type		=3D REGULATOR_VOLTAGE,			\
> +	.owner		=3D THIS_MODULE,				\
> +	.min_uV		=3D S2MPU02_BUCK7_MIN_900MV,		\
> +	.uV_step	=3D S2MPU02_BUCK7_STEP_6_25MV,		\
> +	.n_voltages	=3D S2MPU02_BUCK_N_VOLTAGES,		\
> +	.linear_min_sel =3D S2MPU02_BUCK7_START_SEL,		\
> +	.ramp_delay	=3D S2MPU02_BUCK_RAMP_DELAY,		\
> +	.vsel_reg	=3D S2MPU02_REG_B7CTRL2,			\
> +	.vsel_mask	=3D S2MPU02_BUCK_VSEL_MASK,		\
> +	.enable_reg	=3D S2MPU02_REG_B7CTRL1,			\
> +	.enable_mask	=3D S2MPU02_ENABLE_MASK			\
> +}
> +
> +static const struct regulator_desc s2mpu02_regulators[] =3D {
> +	regulator_desc_s2mpu02_ldo1(1),
> +	regulator_desc_s2mpu02_ldo2(2),
> +	regulator_desc_s2mpu02_ldo4(3),
> +	regulator_desc_s2mpu02_ldo5(4),
> +	regulator_desc_s2mpu02_ldo4(5),
> +	regulator_desc_s2mpu02_ldo3(6),
> +	regulator_desc_s2mpu02_ldo3(7),
> +	regulator_desc_s2mpu02_ldo4(8),
> +	regulator_desc_s2mpu02_ldo5(9),
> +	regulator_desc_s2mpu02_ldo3(10),
> +	regulator_desc_s2mpu02_ldo4(11),
> +	regulator_desc_s2mpu02_ldo5(12),
> +	regulator_desc_s2mpu02_ldo5(13),
> +	regulator_desc_s2mpu02_ldo5(14),
> +	regulator_desc_s2mpu02_ldo5(15),
> +	regulator_desc_s2mpu02_ldo5(16),
> +	regulator_desc_s2mpu02_ldo4(17),
> +	regulator_desc_s2mpu02_ldo5(18),
> +	regulator_desc_s2mpu02_ldo3(19),
> +	regulator_desc_s2mpu02_ldo4(20),
> +	regulator_desc_s2mpu02_ldo5(21),
> +	regulator_desc_s2mpu02_ldo5(22),
> +	regulator_desc_s2mpu02_ldo5(23),
> +	regulator_desc_s2mpu02_ldo4(24),
> +	regulator_desc_s2mpu02_ldo5(25),
> +	regulator_desc_s2mpu02_ldo4(26),
> +	regulator_desc_s2mpu02_ldo5(27),
> +	regulator_desc_s2mpu02_ldo5(28),
> +	regulator_desc_s2mpu02_buck1234(1),
> +	regulator_desc_s2mpu02_buck1234(2),
> +	regulator_desc_s2mpu02_buck1234(3),
> +	regulator_desc_s2mpu02_buck1234(4),
> +	regulator_desc_s2mpu02_buck5(5),
> +	regulator_desc_s2mpu02_buck6(6),
> +	regulator_desc_s2mpu02_buck7(7),
> +};
> +
>  static int s2mps11_pmic_probe(struct platform_device *pdev)
>  {
>  	struct sec_pmic_dev *iodev =3D dev_get_drvdata(pdev->dev.parent);
> @@ -634,15 +908,14 @@ static int s2mps11_pmic_probe(struct platform_d=
evice *pdev)
>  	struct s2mps11_info *s2mps11;
>  	int i, ret =3D 0;
>  	const struct regulator_desc *regulators;
> -	enum sec_device_type dev_type;
> =20
>  	s2mps11 =3D devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),
>  				GFP_KERNEL);
>  	if (!s2mps11)
>  		return -ENOMEM;
> =20
> -	dev_type =3D platform_get_device_id(pdev)->driver_data;
> -	switch (dev_type) {
> +	s2mps11->dev_type =3D platform_get_device_id(pdev)->driver_data;
> +	switch (s2mps11->dev_type) {
>  	case S2MPS11X:
>  		s2mps11->rdev_num =3D ARRAY_SIZE(s2mps11_regulators);
>  		regulators =3D s2mps11_regulators;
> @@ -651,8 +924,13 @@ static int s2mps11_pmic_probe(struct platform_de=
vice *pdev)
>  		s2mps11->rdev_num =3D ARRAY_SIZE(s2mps14_regulators);
>  		regulators =3D s2mps14_regulators;
>  		break;
> +	case S2MPU02:
> +		s2mps11->rdev_num =3D ARRAY_SIZE(s2mpu02_regulators);
> +		regulators =3D s2mpu02_regulators;
> +		break;
>  	default:
> -		dev_err(&pdev->dev, "Invalid device type: %u\n", dev_type);
> +		dev_err(&pdev->dev, "Invalid device type: %u\n",
> +				    s2mps11->dev_type);
>  		return -EINVAL;
>  	};
> =20
> @@ -686,7 +964,7 @@ static int s2mps11_pmic_probe(struct platform_dev=
ice *pdev)
>  	for (i =3D 0; i < s2mps11->rdev_num; i++)
>  		rdata[i].name =3D regulators[i].name;
> =20
> -	ret =3D s2mps11_pmic_dt_parse(pdev, rdata, s2mps11, dev_type);
> +	ret =3D s2mps11_pmic_dt_parse(pdev, rdata, s2mps11);
>  	if (ret)
>  		goto out;
> =20
> @@ -739,6 +1017,7 @@ out:
>  static const struct platform_device_id s2mps11_pmic_id[] =3D {
>  	{ "s2mps11-pmic", S2MPS11X},
>  	{ "s2mps14-pmic", S2MPS14X},
> +	{ "s2mpu02-pmic", S2MPU02},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, s2mps11_pmic_id);
> diff --git a/include/linux/mfd/samsung/s2mpu02.h b/include/linux/mfd/=
samsung/s2mpu02.h
> new file mode 100644
> index 0000000..47ae9bc
> --- /dev/null
> +++ b/include/linux/mfd/samsung/s2mpu02.h
> @@ -0,0 +1,201 @@
> +/*
> + * s2mpu02.h
> + *
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd
> + *              http://www.samsung.com
> + *
> + * This program is free software; you can redistribute  it and/or mo=
dify it
> + * under  the terms of  the GNU General  Public License as published=
 by the
> + * Free Software Foundation;  either version 2 of the  License, or (=
at your
> + * option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef __LINUX_MFD_S2MPU02_H
> +#define __LINUX_MFD_S2MPU02_H
> +
> +/* S2MPU02 registers */
> +enum S2MPU02_reg {
> +	S2MPU02_REG_ID,
> +	S2MPU02_REG_INT1,
> +	S2MPU02_REG_INT2,
> +	S2MPU02_REG_INT3,
> +	S2MPU02_REG_INT1M,
> +	S2MPU02_REG_INT2M,
> +	S2MPU02_REG_INT3M,
> +	S2MPU02_REG_ST1,
> +	S2MPU02_REG_ST2,
> +	S2MPU02_REG_PWRONSRC,
> +	S2MPU02_REG_OFFSRC,
> +	S2MPU02_REG_BU_CHG,
> +	S2MPU02_REG_RTCCTRL,
> +	S2MPU02_REG_PMCTRL1,
> +	S2MPU02_REG_RSVD1,
> +	S2MPU02_REG_RSVD2,
> +	S2MPU02_REG_RSVD3,
> +	S2MPU02_REG_RSVD4,
> +	S2MPU02_REG_RSVD5,
> +	S2MPU02_REG_RSVD6,
> +	S2MPU02_REG_RSVD7,
> +	S2MPU02_REG_WRSTEN,
> +	S2MPU02_REG_RSVD8,
> +	S2MPU02_REG_RSVD9,
> +	S2MPU02_REG_RSVD10,
> +	S2MPU02_REG_B1CTRL1,
> +	S2MPU02_REG_B1CTRL2,
> +	S2MPU02_REG_B2CTRL1,
> +	S2MPU02_REG_B2CTRL2,
> +	S2MPU02_REG_B3CTRL1,
> +	S2MPU02_REG_B3CTRL2,
> +	S2MPU02_REG_B4CTRL1,
> +	S2MPU02_REG_B4CTRL2,
> +	S2MPU02_REG_B5CTRL1,
> +	S2MPU02_REG_B5CTRL2,
> +	S2MPU02_REG_B5CTRL3,
> +	S2MPU02_REG_B5CTRL4,
> +	S2MPU02_REG_B5CTRL5,
> +	S2MPU02_REG_B6CTRL1,
> +	S2MPU02_REG_B6CTRL2,
> +	S2MPU02_REG_B7CTRL1,
> +	S2MPU02_REG_B7CTRL2,
> +	S2MPU02_REG_RAMP1,
> +	S2MPU02_REG_RAMP2,
> +	S2MPU02_REG_L1CTRL,
> +	S2MPU02_REG_L2CTRL1,
> +	S2MPU02_REG_L2CTRL2,
> +	S2MPU02_REG_L2CTRL3,
> +	S2MPU02_REG_L2CTRL4,
> +	S2MPU02_REG_L3CTRL,
> +	S2MPU02_REG_L4CTRL,
> +	S2MPU02_REG_L5CTRL,
> +	S2MPU02_REG_L6CTRL,
> +	S2MPU02_REG_L7CTRL,
> +	S2MPU02_REG_L8CTRL,
> +	S2MPU02_REG_L9CTRL,
> +	S2MPU02_REG_L10CTRL,
> +	S2MPU02_REG_L11CTRL,
> +	S2MPU02_REG_L12CTRL,
> +	S2MPU02_REG_L13CTRL,
> +	S2MPU02_REG_L14CTRL,
> +	S2MPU02_REG_L15CTRL,
> +	S2MPU02_REG_L16CTRL,
> +	S2MPU02_REG_L17CTRL,
> +	S2MPU02_REG_L18CTRL,
> +	S2MPU02_REG_L19CTRL,
> +	S2MPU02_REG_L20CTRL,
> +	S2MPU02_REG_L21CTRL,
> +	S2MPU02_REG_L22CTRL,
> +	S2MPU02_REG_L23CTRL,
> +	S2MPU02_REG_L24CTRL,
> +	S2MPU02_REG_L25CTRL,
> +	S2MPU02_REG_L26CTRL,
> +	S2MPU02_REG_L27CTRL,
> +	S2MPU02_REG_L28CTRL,
> +	S2MPU02_REG_LDODSCH1,
> +	S2MPU02_REG_LDODSCH2,
> +	S2MPU02_REG_LDODSCH3,
> +	S2MPU02_REG_LDODSCH4,
> +	S2MPU02_REG_SELMIF,
> +	S2MPU02_REG_RSVD11,
> +	S2MPU02_REG_RSVD12,
> +	S2MPU02_REG_RSVD13,
> +	S2MPU02_REG_DVSSEL,
> +	S2MPU02_REG_DVSPTR,
> +	S2MPU02_REG_DVSDATA,
> +};
> +
> +/* S2MPU02 regulator ids */
> +enum S2MPU02_regulators {
> +	S2MPU02_LDO1,
> +	S2MPU02_LDO2,
> +	S2MPU02_LDO3,
> +	S2MPU02_LDO4,
> +	S2MPU02_LDO5,
> +	S2MPU02_LDO6,
> +	S2MPU02_LDO7,
> +	S2MPU02_LDO8,
> +	S2MPU02_LDO9,
> +	S2MPU02_LDO10,
> +	S2MPU02_LDO11,
> +	S2MPU02_LDO12,
> +	S2MPU02_LDO13,
> +	S2MPU02_LDO14,
> +	S2MPU02_LDO15,
> +	S2MPU02_LDO16,
> +	S2MPU02_LDO17,
> +	S2MPU02_LDO18,
> +	S2MPU02_LDO19,
> +	S2MPU02_LDO20,
> +	S2MPU02_LDO21,
> +	S2MPU02_LDO22,
> +	S2MPU02_LDO23,
> +	S2MPU02_LDO24,
> +	S2MPU02_LDO25,
> +	S2MPU02_LDO26,
> +	S2MPU02_LDO27,
> +	S2MPU02_LDO28,
> +	S2MPU02_BUCK1,
> +	S2MPU02_BUCK2,
> +	S2MPU02_BUCK3,
> +	S2MPU02_BUCK4,
> +	S2MPU02_BUCK5,
> +	S2MPU02_BUCK6,
> +	S2MPU02_BUCK7,
> +
> +	S2MPU02_REGULATOR_MAX,
> +};
> +
> +/* Regulator constraints for BUCKx */
> +#define S2MPU02_BUCK1234_MIN_600MV	600000
> +#define S2MPU02_BUCK5_MIN_1081_25MV	1081250
> +#define S2MPU02_BUCK6_MIN_1700MV	1700000
> +#define S2MPU02_BUCK7_MIN_900MV		900000
> +
> +#define S2MPU02_BUCK1234_STEP_6_25MV	6250
> +#define S2MPU02_BUCK5_STEP_6_25MV	6250
> +#define S2MPU02_BUCK6_STEP_2_50MV	2500
> +#define S2MPU02_BUCK7_STEP_6_25MV	6250
> +
> +#define S2MPU02_BUCK1234_START_SEL	0x00
> +#define S2MPU02_BUCK5_START_SEL		0x4D
> +#define S2MPU02_BUCK6_START_SEL		0x28
> +#define S2MPU02_BUCK7_START_SEL		0x30
> +
> +#define S2MPU02_BUCK_RAMP_DELAY		12500
> +
> +/* Regulator constraints for different types of LDOx */
> +#define S2MPU02_LDO_MIN_900MV		900000
> +#define S2MPU02_LDO_MIN_1050MV		1050000
> +#define S2MPU02_LDO_MIN_1600MV		1600000
> +#define S2MPU02_LDO_STEP_12_5MV		12500
> +#define S2MPU02_LDO_STEP_25MV		25000
> +#define S2MPU02_LDO_STEP_50MV		50000
> +
> +#define S2MPU02_LDO_GROUP1_START_SEL	0x8
> +#define S2MPU02_LDO_GROUP2_START_SEL	0xA
> +#define S2MPU02_LDO_GROUP3_START_SEL	0x10
> +
> +#define S2MPU02_LDO_VSEL_MASK		0x3F
> +#define S2MPU02_BUCK_VSEL_MASK		0xFF
> +#define S2MPU02_ENABLE_MASK		(0x03 << S2MPU02_ENABLE_SHIFT)
> +#define S2MPU02_ENABLE_SHIFT		6
> +
> +/* On/Off controlled by PWREN */
> +#define S2MPU02_ENABLE_SUSPEND		(0x01 << S2MPU02_ENABLE_SHIFT)
> +#define S2MPU02_DISABLE_SUSPEND		(0x11 << S2MPU02_ENABLE_SHIFT)
> +#define S2MPU02_LDO_N_VOLTAGES		(S2MPU02_LDO_VSEL_MASK + 1)
> +#define S2MPU02_BUCK_N_VOLTAGES		(S2MPU02_BUCK_VSEL_MASK + 1)
> +
> +/* RAMP delay for BUCK1234*/
> +#define S2MPU02_BUCK1_RAMP_SHIFT	6
> +#define S2MPU02_BUCK2_RAMP_SHIFT	4
> +#define S2MPU02_BUCK3_RAMP_SHIFT	2
> +#define S2MPU02_BUCK4_RAMP_SHIFT	0
> +#define S2MPU02_BUCK1234_RAMP_MASK	0x3
> +
> +#endif /*  __LINUX_MFD_S2MPU02_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
