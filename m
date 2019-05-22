From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
Date: Wed, 22 May 2019 08:16:38 -0600
Message-ID: <4e5bdf77-3141-bff6-e5b9-a81a5c73b4e4@codeaurora.org>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
 <20190521185054.GD16633@sirena.org.uk>
 <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
 <20190522110107.GB8582@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522110107.GB8582@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, jcrouse@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org

On 5/22/2019 5:01 AM, Mark Brown wrote:
> On Tue, May 21, 2019 at 05:16:06PM -0600, Jeffrey Hugo wrote:
>> On 5/21/2019 12:50 PM, Mark Brown wrote:
> 
>>>> +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
>>>> +					      unsigned selector);
>>>> +
>>>> +static int spmi_regulator_common2_set_voltage(struct regulator_dev *rdev,
>>>> +					      unsigned selector)
> 
>>> Eeew, can we not have better names?
> 
>> I'm open to suggestions.  Apparently there are two register common register
>> schemes - the old one and the new one.  PMIC designs after some random point
>> in time are all the new register scheme per the documentation I see.
> 
>> As far as I an aware, the FT426 design is the first design to be added to
>> this driver to make use of the new scheme, but I expect more to be supported
>> in future, thus I'm reluctant to make these ft426 specific in the name.
> 
> If there's a completely new register map why are these even in the same
> driver?

Its not completely new, its a derivative of the old scheme.  Of the 104 
registers, approximately 5 have been modified, therefore the new scheme 
is 95% compatible with the old one.  Duplicating a 1883 line driver to 
handle a change in 5% of the register space seems less than ideal. 
Particularly considering your previous comments seem to indicate that 
you feel its pretty trivial to handle the quirks associated with the 
changes in this driver.

> 
>>>> +	if (reg == SPMI_COMMON2_MODE_HPM_MASK)
>>>> +		return REGULATOR_MODE_NORMAL;
>>>> +
>>>> +	if (reg == SPMI_COMMON2_MODE_AUTO_MASK)
>>>> +		return REGULATOR_MODE_FAST;
>>>> +
>>>> +	return REGULATOR_MODE_IDLE;
>>>> +}
> 
>>> This looks like you want to write a switch statement.
> 
>> It follows the existing style in the driver, but sure I can make this a
>> switch.
> 
> Please fix the rest of the driver as well then.
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
