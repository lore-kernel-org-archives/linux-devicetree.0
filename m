From: wangfei <w.f@huawei.com>
Subject: Re: [PATCH 4/8] regulator: Hi655x: Add support for Hi655x regulator
Date: Thu, 8 Oct 2015 15:38:01 +0800
Message-ID: <56161D59.1020207@huawei.com>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com> <1443611111-3196-5-git-send-email-w.f@huawei.com> <20150930175857.GK15635@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150930175857.GK15635@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, khilman@linaro.org, sameo@linux.intel.com, lee.jones@linaro.org, lgirdwood@gmail.com, bintian.wang@huawei.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, puck.chen@hisilicon.com, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, z.liuxinliang@hisilicon.com, william.wfei@gmail.com, zhongkaihua@huawei.com
List-Id: devicetree@vger.kernel.org

On 2015/10/1 1:58, Mark Brown wrote:
> On Wed, Sep 30, 2015 at 07:05:07PM +0800, Fei Wang wrote:
>=20
>> +config REGULATOR_HI655X
>> +        tristate "Hisilicon HI655X PMIC regulators support"
>> +        depends on ARCH_HISI
>> +	depends on MFD_HI655X_PMIC && OF
>=20
> You've got some tab/space confusion above.  Also, can't we have an ||
> COMPILE_TEST here?
>=20
OK, i will add it.
>> +#define REG_VALUE_SETBITS(reg_value, pos, bits, bits_value) \
>> +		(reg_value =3D (reg_value & \
>> +		~((((unsigned int)1 << bits) - 1) << pos)) | \
>> +		((unsigned int)(bits_value & \
>> +		(((unsigned int)1 << bits) - 1)) << pos))
>> +
>> +#define REG_VALUE_GETBITS(reg_value, pos, bits) \
>> +			((reg_value >> pos) & (((unsigned int)1 << bits) - 1))
>=20
> These are just really hard to read, sorry, and they appear to duplica=
te
> existing regmap functionality.  If there is a strong reason to add th=
em
> consider doing so in the core and if you can then please at least mak=
e
> them regular inline functions rather than using macros.  It's much sa=
fer
> and more readable.
>=20
i agree with you =EF=BC=8Ci will refactor all the unreadable code=E3=80=
=82
>> +static int hi655x_regulator_pmic_is_enabled(struct regulator_dev *r=
dev)
>> +{
>> +	int ret =3D 0;
>> +	unsigned int value =3D 0;
>> +
>> +	struct hi655x_regulator *sreg =3D rdev_get_drvdata(rdev);
>> +	struct hi655x_regulator_ctrl_regs  *ctrl_regs =3D &(sreg->ctrl_reg=
s);
>> +	struct hi655x_regulator_ctrl_data  *ctrl_data =3D &(sreg->ctrl_dat=
a);
>> +
>> +	/*
>> +	* regulator is all set,but the pmu is only subset.
>> +	* maybe this "buck"/"ldo"/"lvs" is not contrl by a core.
>> +	* and in regulator have a "status" member ("okey" or "disable").
>> +	*/
>=20
> I'm having a hard time parsing the above comment.  Please also use th=
e
> normal kernel comment style (this is a problem throughout the driver)=
=2E
>=20
OK. i will modify all of these=E3=80=82
>> +	regmap_read(rdev->regmap, ctrl_regs->status_reg, &value);
>> +	ret =3D (int)REG_VALUE_GETBITS(value, ctrl_data->shift,
>> +					ctrl_data->mask);
>=20
> This appears to just duplicate regulator core functionality for readi=
ng
> enable state from a bitfield?  Also note that the cast here isn't a
> great advert for the macros above.
>=20
>> +static int hi655x_regulator_pmic_enable(struct regulator_dev *rdev)
>> +{
>> +	int ret =3D 0;
>> +	unsigned char value_u8 =3D 0;
>> +	unsigned int value_u32 =3D 0;
>> +	struct hi655x_regulator *sreg =3D rdev_get_drvdata(rdev);
>> +	struct hi655x_regulator_ctrl_regs  *ctrl_regs =3D &(sreg->ctrl_reg=
s);
>> +	struct hi655x_regulator_ctrl_data  *ctrl_data =3D &(sreg->ctrl_dat=
a);
>> +
>> +	REG_VALUE_SETBITS(value_u32, ctrl_data->shift, ctrl_data->mask, 0x=
1);
>> +	value_u8  =3D (unsigned char)value_u32;
>> +	regmap_write(rdev->regmap, ctrl_regs->enable_reg, value_u8);
>=20
> I'm not *entirely* sure what this is supposed to be doing but it look=
s
> like it's duplicating core functionality in a fashion that's really
> quite hard to read.  Why not just use the core functions for setting
> bits?
>=20
>> +	udelay(sreg->off_on_delay);
>=20
> Use the regualtor core delay functionality please.

OK=EF=BC=8Ci will modify it=E3=80=82
>=20
>> +static int hi655x_regulator_pmic_list_voltage_linear(struct regulat=
or_dev *rdev,
>> +				  unsigned int selector)
>=20
> This is *definitely* duplicating core functionality, I think you want=
 to
> use regulator_list_voltage_linear_range() or possibly just plain
> _linear() and use separate operations for the LVS regulator.
>=20
> We at least need to restructure the code so that the core helper
> functions are used and we don't have regulator type decisions everywh=
ere
> - the whole goal of having per regulator ops is to avoid having to op=
en
> code decisions about which regulator we're dealing with into each op
> function.
>=20
OK=EF=BC=8Ci will modify it=E3=80=82
>> +static unsigned int hi655x_regulator_pmic_get_mode(
>> +			struct regulator_dev *rdev)
>> +{
>> +	return REGULATOR_MODE_NORMAL;
>> +}
>=20
> Don't implement empty functions, remove all these.
>=20
>> +	num_consumer_supplies =3D of_get_property(np,
>> +				"hisilicon,num_consumer_supplies", NULL);
>> +
>> +	if ((NULL =3D=3D num_consumer_supplies) || (0 =3D=3D *num_consumer=
_supplies)) {
>> +		dev_warn(dev, "%s no consumer_supplies\n", __func__);
>> +		return init_data;
>> +	}
>=20
> Obviously the binding is completely undocumented but this is setting =
off
> alarm bells - why is the driver even considering consumers?  Please m=
ake
> sure you are using the core regulator bindings rather than open codin=
g
> something which translates into platform data (which is what this loo=
ks
> like).
>=20
> I'm not going to review any more of the DT code without binding
> documentation.

I will document the dt-binding first=E3=80=82
>=20
>> +	/*
>> +	*initdata mem will release auto;
>> +	*this is kernel 3.10 import.
>> +	*/
>=20
> Remove anything related to your vendor kernel support, this is not
> relevant to upstream.
>=20
Thanks=EF=BC=8CMark=EF=BC=8Ci agree with you and  will modify all of yo=
u mentioned soon=E3=80=82
