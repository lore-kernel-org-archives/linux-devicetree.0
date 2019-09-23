From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH 1/5] regulator: da9062: fix suspend_enable/disable
 preparation
Date: Mon, 23 Sep 2019 16:03:39 +0000
Message-ID: <AM5PR1001MB0994BD2F5D5635085B836A7980850@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
 <20190917124246.11732-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917124246.11732-2-m.felsch@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, Support Opensource <Support.Opensource@diasemi.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Steve Twiss <stwiss.opensource@diasemi.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 17 September 2019 13:43, Marco Felsch wrote:

> Currently the suspend reg_field maps to the pmic voltage selection bits
> and is used during suspend_enabe/disable() and during get_mode(). This
> seems to be wrong for both use cases.
>
> Use case one (suspend_enabe/disable):
> Those callbacks are used to mark a regulator device as enabled/disabled
> during suspend. Marking the regulator enabled during suspend is done by
> the LDOx_CONF/BUCKx_CONF bit within the LDOx_CONT/BUCKx_CONT
> registers.
> Setting this bit tells the DA9062 PMIC state machine to keep the
> regulator on in POWERDOWN mode and switch to suspend voltage.
>
> Use case two (get_mode):
> The get_mode callback is used to retrieve the active mode state. Since
> the regulator-setting-A is used for the active state and
> regulator-setting-B for the suspend state there is no need to check
> which regulator setting is active.
>

So I believe you're correct with the above statements. The driver, rather t=
han
enabling/disabling a regulator in system suspend, will instead put the regu=
lator
to a low power state, which is definitely not the desired outcome. Thanks f=
or
rectifying this.

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> Fixes: 4068e5182ada ("regulator: da9062: DA9062 regulator driver")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/regulator/da9062-regulator.c | 118 +++++++++++----------------
>  1 file changed, 47 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/regulator/da9062-regulator.c b/drivers/regulator/da9=
062-
> regulator.c
> index 2ffc64622451..9b2ca472f70c 100644
> --- a/drivers/regulator/da9062-regulator.c
> +++ b/drivers/regulator/da9062-regulator.c
> @@ -136,7 +136,6 @@ static int da9062_buck_set_mode(struct regulator_dev
> *rdev, unsigned mode)
>  static unsigned da9062_buck_get_mode(struct regulator_dev *rdev)
>  {
>  	struct da9062_regulator *regl =3D rdev_get_drvdata(rdev);
> -	struct regmap_field *field;
>  	unsigned int val, mode =3D 0;
>  	int ret;
>
> @@ -158,18 +157,7 @@ static unsigned da9062_buck_get_mode(struct
> regulator_dev *rdev)
>  		return REGULATOR_MODE_NORMAL;
>  	}
>
> -	/* Detect current regulator state */
> -	ret =3D regmap_field_read(regl->suspend, &val);
> -	if (ret < 0)
> -		return 0;
> -
> -	/* Read regulator mode from proper register, depending on state */
> -	if (val)
> -		field =3D regl->suspend_sleep;
> -	else
> -		field =3D regl->sleep;
> -
> -	ret =3D regmap_field_read(field, &val);
> +	ret =3D regmap_field_read(regl->sleep, &val);
>  	if (ret < 0)
>  		return 0;
>
> @@ -208,21 +196,9 @@ static int da9062_ldo_set_mode(struct regulator_dev
> *rdev, unsigned mode)
>  static unsigned da9062_ldo_get_mode(struct regulator_dev *rdev)
>  {
>  	struct da9062_regulator *regl =3D rdev_get_drvdata(rdev);
> -	struct regmap_field *field;
>  	int ret, val;
>
> -	/* Detect current regulator state */
> -	ret =3D regmap_field_read(regl->suspend, &val);
> -	if (ret < 0)
> -		return 0;
> -
> -	/* Read regulator mode from proper register, depending on state */
> -	if (val)
> -		field =3D regl->suspend_sleep;
> -	else
> -		field =3D regl->sleep;
> -
> -	ret =3D regmap_field_read(field, &val);
> +	ret =3D regmap_field_read(regl->sleep, &val);
>  	if (ret < 0)
>  		return 0;
>
> @@ -408,10 +384,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK1_MODE_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_BUCK1_MODE_MASK)) - 1),
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VBUCK1_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_BUCK1_CONT,
> +			__builtin_ffs((int)DA9062AA_BUCK1_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VBUCK1_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_BUCK1_CONF_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9061_ID_BUCK2,
> @@ -444,10 +420,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK3_MODE_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_BUCK3_MODE_MASK)) - 1),
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VBUCK3_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_BUCK3_CONT,
> +			__builtin_ffs((int)DA9062AA_BUCK3_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VBUCK3_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_BUCK3_CONF_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9061_ID_BUCK3,
> @@ -480,10 +456,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK4_MODE_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_BUCK4_MODE_MASK)) - 1),
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VBUCK4_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_BUCK4_CONT,
> +			__builtin_ffs((int)DA9062AA_BUCK4_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VBUCK4_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_BUCK4_CONF_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9061_ID_LDO1,
> @@ -509,10 +485,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_LDO1_SL_B_MASK)) - 1),
>  		.suspend_vsel_reg =3D DA9062AA_VLDO1_B,
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VLDO1_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_LDO1_CONT,
> +			__builtin_ffs((int)DA9062AA_LDO1_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VLDO1_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_LDO1_CONF_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO1_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -542,10 +518,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_LDO2_SL_B_MASK)) - 1),
>  		.suspend_vsel_reg =3D DA9062AA_VLDO2_B,
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VLDO2_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_LDO2_CONT,
> +			__builtin_ffs((int)DA9062AA_LDO2_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VLDO2_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_LDO2_CONF_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO2_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -575,10 +551,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_LDO3_SL_B_MASK)) - 1),
>  		.suspend_vsel_reg =3D DA9062AA_VLDO3_B,
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VLDO3_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_LDO3_CONT,
> +			__builtin_ffs((int)DA9062AA_LDO3_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VLDO3_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_LDO3_CONF_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO3_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -608,10 +584,10 @@ static const struct da9062_regulator_info
> local_da9061_regulator_info[] =3D {
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_LDO4_SL_B_MASK)) - 1),
>  		.suspend_vsel_reg =3D DA9062AA_VLDO4_B,
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VLDO4_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_LDO4_CONT,
> +			__builtin_ffs((int)DA9062AA_LDO4_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VLDO4_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_LDO4_CONF_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO4_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -652,10 +628,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK1_MODE_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_BUCK1_MODE_MASK)) - 1),
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VBUCK1_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_BUCK1_CONT,
> +			__builtin_ffs((int)DA9062AA_BUCK1_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VBUCK1_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_BUCK1_CONF_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9062_ID_BUCK2,
> @@ -688,10 +664,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK2_MODE_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_BUCK2_MODE_MASK)) - 1),
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VBUCK2_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_BUCK2_CONT,
> +			__builtin_ffs((int)DA9062AA_BUCK2_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VBUCK2_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_BUCK2_CONF_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9062_ID_BUCK3,
> @@ -724,10 +700,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK3_MODE_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_BUCK3_MODE_MASK)) - 1),
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VBUCK3_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_BUCK3_CONT,
> +			__builtin_ffs((int)DA9062AA_BUCK3_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VBUCK3_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_BUCK3_CONF_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9062_ID_BUCK4,
> @@ -760,10 +736,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			__builtin_ffs((int)DA9062AA_BUCK4_MODE_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_BUCK4_MODE_MASK)) - 1),
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VBUCK4_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_BUCK4_CONT,
> +			__builtin_ffs((int)DA9062AA_BUCK4_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VBUCK4_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_BUCK4_CONF_MASK) - 1),
>  	},
>  	{
>  		.desc.id =3D DA9062_ID_LDO1,
> @@ -789,10 +765,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_LDO1_SL_B_MASK)) - 1),
>  		.suspend_vsel_reg =3D DA9062AA_VLDO1_B,
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VLDO1_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_LDO1_CONT,
> +			__builtin_ffs((int)DA9062AA_LDO1_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VLDO1_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_LDO1_CONF_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO1_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -822,10 +798,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_LDO2_SL_B_MASK)) - 1),
>  		.suspend_vsel_reg =3D DA9062AA_VLDO2_B,
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VLDO2_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_LDO2_CONT,
> +			__builtin_ffs((int)DA9062AA_LDO2_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VLDO2_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_LDO2_CONF_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO2_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -855,10 +831,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_LDO3_SL_B_MASK)) - 1),
>  		.suspend_vsel_reg =3D DA9062AA_VLDO3_B,
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VLDO3_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_LDO3_CONT,
> +			__builtin_ffs((int)DA9062AA_LDO3_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VLDO3_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_LDO3_CONF_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO3_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> @@ -888,10 +864,10 @@ static const struct da9062_regulator_info
> local_da9062_regulator_info[] =3D {
>  			sizeof(unsigned int) * 8 -
>  			__builtin_clz((DA9062AA_LDO4_SL_B_MASK)) - 1),
>  		.suspend_vsel_reg =3D DA9062AA_VLDO4_B,
> -		.suspend =3D REG_FIELD(DA9062AA_DVC_1,
> -			__builtin_ffs((int)DA9062AA_VLDO4_SEL_MASK) - 1,
> +		.suspend =3D REG_FIELD(DA9062AA_LDO4_CONT,
> +			__builtin_ffs((int)DA9062AA_LDO4_CONF_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> -			__builtin_clz((DA9062AA_VLDO4_SEL_MASK)) - 1),
> +			__builtin_clz(DA9062AA_LDO4_CONF_MASK) - 1),
>  		.oc_event =3D REG_FIELD(DA9062AA_STATUS_D,
>  			__builtin_ffs((int)DA9062AA_LDO4_ILIM_MASK) - 1,
>  			sizeof(unsigned int) * 8 -
> --
> 2.20.1
