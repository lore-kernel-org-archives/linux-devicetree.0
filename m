From: <Andrei.Stefanescu@microchip.com>
Subject: Re: [PATCH 3/3] regulator: mcp16502: add regulator driver for
 MCP16502
Date: Wed, 21 Nov 2018 15:44:31 +0000
Message-ID: <03b902d9-49a8-9acd-6f98-048f117b1e93@microchip.com>
References: <1542108563-10108-1-git-send-email-andrei.stefanescu@microchip.com>
 <1542108563-10108-4-git-send-email-andrei.stefanescu@microchip.com>
 <20181113174539.GB2089@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113174539.GB2089@sirena.org.uk>
Content-Language: en-US
Content-ID: <31C8C535EDB1C846BBC8B1F2AAF4901C@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Mark,

Thank you for your review. While working on the next version I realized tha=
t
the implementation should change a bit. The mcp16502 PMIC has separate=20
registers
for each of its operating modes (Performance, Active, Low-power, Hibernate)=
.
So, it is possible to setup the values for Low-power (Linux standby) and
Hibernate (Linux suspend-to-ram) and these values would not be affected by
changes made during runtime (which are made to the ACTIVE registers).

This means that the calls to suspend_set_* are not necessary to be made eac=
h
time the board suspends. My idea is to add three functions to the=20
regulator_ops
(setup_suspend_standby/mem/max) which would be called after the regulator i=
s
registered and which would set the values found inside the devicetree
in the regulator-state-standby/mem/disk subnodes.

However, I am not sure whether this is in fact a good idea or which is=20
the best
approach.

Other possible suggestions for this setup_suspend* functions:
- Break each function into smaller pieces(set_voltage, set_mode,=20
enable/disable)
- Add support for regmap helpers, which would mean adding reg and mask=20
members
 =A0 to regulator_desc. However, I am not sure which naming scheme you pref=
er
 =A0 (enable_suspend_mem_reg for example seems not to be a great idea).=20
Perhaps use
 =A0 arrays (e.g. enable_suspend[] and index it via PM_SUSPEND_*)?


Best regards,
Andrei

On 13.11.2018 19:45, Mark Brown wrote:
> On Tue, Nov 13, 2018 at 11:29:41AM +0000, Andrei.Stefanescu@microchip.com=
 wrote:
>
>> index 0000000..29c72d3
>> --- /dev/null
>> +++ b/drivers/regulator/mcp16502.c
>> @@ -0,0 +1,524 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MCP16502 PMIC driver
> Please make the entire comment a C++ comment so it looks more
> intentional.
>
>> +/*
>> + * This macro is useful for iterating over all regulators and accessing=
 their
>> + * registers in a generic way or accessing a regulator device by its id=
.
>> + */
>> +#define BASE(i) (((i) + 1) << 4)
> This macro name is likely to run into collisions at some point, a prefix
> would be better.
>
>> +static int mcp16502_update_regulator(struct regulator_dev *rdev,
>> +				     bool hibernate,
>> +				     unsigned int mask, unsigned int val)
>> +{
>> +	struct mcp16502 *mcp =3D rdev_get_drvdata(rdev);
>> +	unsigned int reg =3D BASE(rdev_get_id(rdev));
>> +
>> +	reg +=3D (hibernate) ? OFFSET_MODE_HIB : OFFSET_MODE_A;
> Please write this as a normal if statement to improve legibility.
>
>> +static int mcp16502_read(struct regulator_dev *rdev, bool hibernate,
>> +			 unsigned int mask)
>> +{
>> +	struct mcp16502 *mcp =3D rdev_get_drvdata(rdev);
>> +	unsigned int reg =3D BASE(rdev_get_id(rdev));
>> +	int ret, val;
>> +
>> +	reg +=3D (hibernate) ? OFFSET_MODE_HIB : OFFSET_MODE_A;
>> +
>> +	ret =3D regmap_read(mcp->rmap, reg, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return val & mask;
>> +}
> I'm not convinced that these custom read/write functions are adding much
> compared to just using the standard regmap helpers for things - they're
> adding a bunch of code instead of data.  If you need extra helpers for
> suspend mode just add those, I'm sure they'd be useful for other
> drivers.
>
>> +static unsigned int mcp16502_get_mode(struct regulator_dev *rdev)
>> +{
>> +	int val;
>> +
>> +	val =3D mcp16502_read(rdev, false, MCP16502_MODE_MASK);
>> +	if (val < 0)
>> +		return val;
>> +
>> +	if (val =3D=3D MCP16502_MODE_FPWM)
>> +		return REGULATOR_MODE_NORMAL;
>> +	else if (val =3D=3D MCP16502_MODE_AUTO_PFM)
>> +		return REGULATOR_MODE_IDLE;
>> +
>> +	return REGULATOR_MODE_INVALID;
>> +}
> Please just write a switch statement to improve legibility.
>
>> +/*
>> + * mcp16502_is_enabled - regulator_ops is_enabled
>> + */
>> +static int mcp16502_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	int val;
>> +
>> +	val =3D mcp16502_read(rdev, false, MCP16502_EN_MASK);
>> +	if (val < 0)
>> +		return val;
>> +
>> +	return !!val;
>> +}
> This can use regulator_is_enabled_regmap().
>
>> +	if (mode !=3D REGULATOR_MODE_NORMAL && mode !=3D REGULATOR_MODE_IDLE)
>> +		return -EINVAL;
>> +
>> +	val =3D (mode =3D=3D REGULATOR_MODE_NORMAL) ? MCP16502_MODE_FPWM :
>> +						MCP16502_MODE_AUTO_PFM;
>> +
>> +	return mcp16502_update_regulator(rdev, hibernate, MCP16502_MODE_MASK,
>> +					 val);
> Again a switch statement would be clearer.
>
>> +static int mcp16502_get_status(struct regulator_dev *rdev)
>> +{
>> +	int mode =3D mcp16502_get_mode(rdev);
>> +
>> +	if (!mcp16502_is_enabled(rdev))
>> +		return REGULATOR_STATUS_OFF;
>> +	else if (mode =3D=3D REGULATOR_MODE_NORMAL)
>> +		return REGULATOR_STATUS_NORMAL;
>> +	else if (mode =3D=3D REGULATOR_MODE_IDLE)
>> +		return REGULATOR_STATUS_IDLE;
>> +
>> +	return REGULATOR_STATUS_UNDEFINED;
>> +}
> The _status() function should only be implemented if there's hardware
> support for reading back the actual status from the device, we already
> know what we set through software.
>
>> +#ifdef CONFIG_PM_SLEEP
>> +static int mcp16502_suspend(struct device *dev)
>> +{
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	struct mcp16502 *mcp =3D i2c_get_clientdata(client);
>> +
>> +	mcp16502_gpio_set_mode(mcp, MCP16502_MODE_HIB);
>> +
>> +	return 0;
>> +}
> This will put the regulators into hibernate mode before the system has
> finished suspending which is likely to cause breakage - hibernate mode
> in the PMIC is expected to be triggered by the SoC as it shuts down.
>
>> +static int __init mcp16502_init(void)
>> +{
>> +	return i2c_add_driver(&mcp16502_drv);
>> +}
> module_i2c_driver.
