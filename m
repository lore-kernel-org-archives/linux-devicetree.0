From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
Date: Tue, 21 May 2019 17:16:06 -0600
Message-ID: <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
 <20190521185054.GD16633@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521185054.GD16633@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, jcrouse@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org

On 5/21/2019 12:50 PM, Mark Brown wrote:
> On Tue, May 21, 2019 at 09:53:15AM -0700, Jeffrey Hugo wrote:
> 
>> -	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);
>> +	/* second common devices don't have VOLTAGE_RANGE register */
>> +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS2) {
>> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_LSB, &lsb, 1);
>> +		spmi_vreg_read(vreg, SPMI_COMMON2_REG_VOLTAGE_MSB, &msb, 1);
>> +
>> +		uV = (((int)msb << 8) | (int)lsb) * 1000;
> 
> This overlaps with some changes that Jorge (CCed) was sending for the
> PMS405.  As I was saying to him rather than shoving special cases for
> different regulator types into the ops (especially ones that don't have
> any of the range stuff) it'd be better to just define separate ops for
> the regulators that look quite different to the existing ones.

Sorry, I hadn't paid attention to that discussion.  Reviewing it now.
> 
>> +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
>> +					      unsigned selector);
>> +
>> +static int spmi_regulator_common2_set_voltage(struct regulator_dev *rdev,
>> +					      unsigned selector)
> 
> Eeew, can we not have better names?

I'm open to suggestions.  Apparently there are two register common 
register schemes - the old one and the new one.  PMIC designs after some 
random point in time are all the new register scheme per the 
documentation I see.

As far as I an aware, the FT426 design is the first design to be added 
to this driver to make use of the new scheme, but I expect more to be 
supported in future, thus I'm reluctant to make these ft426 specific in 
the name.

> 
>> +static unsigned int spmi_regulator_common2_get_mode(struct regulator_dev *rdev)
>> +{
>> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>> +	u8 reg;
>> +
>> +	spmi_vreg_read(vreg, SPMI_COMMON2_REG_MODE, &reg, 1);
>> +
>> +	if (reg == SPMI_COMMON2_MODE_HPM_MASK)
>> +		return REGULATOR_MODE_NORMAL;
>> +
>> +	if (reg == SPMI_COMMON2_MODE_AUTO_MASK)
>> +		return REGULATOR_MODE_FAST;
>> +
>> +	return REGULATOR_MODE_IDLE;
>> +}
> 
> This looks like you want to write a switch statement.

It follows the existing style in the driver, but sure I can make this a 
switch.

> 
>> +spmi_regulator_common2_set_mode(struct regulator_dev *rdev, unsigned int mode)
>> +{
>> +	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>> +	u8 mask = SPMI_COMMON2_MODE_MASK;
>> +	u8 val = SPMI_COMMON2_MODE_LPM_MASK;
>> +
>> +	if (mode == REGULATOR_MODE_NORMAL)
>> +		val = SPMI_COMMON2_MODE_HPM_MASK;
>> +	else if (mode == REGULATOR_MODE_FAST)
>> +		val = SPMI_COMMON2_MODE_AUTO_MASK;
> 
> This needs to be a switch statement, then it can have a default case to
> catch errors too.
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
