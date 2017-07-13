From: Fenglin Wu <fenglinw@codeaurora.org>
Subject: Re: [PATCH V1 2/3] pinctrl: qcom: spmi-gpio: Add dtest route for
 digital input
Date: Thu, 13 Jul 2017 13:27:02 +0800
Message-ID: <7a958ced-910f-3304-8128-911412df6dfd@codeaurora.org>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-3-fenglinw@codeaurora.org>
 <20170712212454.GK1618@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170712212454.GK1618@tuxbook>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

On 7/13/2017 5:24 AM, Bjorn Andersson wrote:
> On Mon 12 Jun 23:16 PDT 2017, fenglinw@codeaurora.org wrote:
> 
>> From: Fenglin Wu <fenglinw@codeaurora.org>
>>
>> Add property "qcom,dtest-buffer" to specify which dtest rail to feed
>> when the pin is configured as a digital input.
>>
>> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
>> ---
>>   .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 15 ++++++++
>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 45 ++++++++++++++++++++++
>>   include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  6 +++
>>   3 files changed, 66 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>> index 1493c0a..521c783 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>> @@ -195,6 +195,21 @@ to specify in a pin configuration subnode:
>>   		    Valid values are 0-3 corresponding to PMIC_GPIO_AOUT_ATESTx
>>   		    defined in <dt-bindings/pinctrl/qcom,pmic-gpio.h>.
>>   
>> +- qcom,dtest-buffer:
>> +	Usage: optional
>> +	Value type: <u32>
>> +	Definition: Selects DTEST rail to route to GPIO when it's configured
>> +		    as a digital input.
>> +		    For LV/MV GPIO subtypes, the valid values are 0-3
>> +		    corresponding to PMIC_GPIO_DIN_DTESTx defined in
>> +		    <dt-bindings/pinctrl/qcom,pmic-gpio.h>. Only one
>> +		    DTEST rail can be selected at a time.
> 
> As with the analog lines, this is a natural number and I think we should
> encode it as such in the DeviceTree.
> 
>> +		    For 4CH/8CH GPIO subtypes, supported values are 1-15.
>> +		    4 DTEST rails are supported in total and more than 1 DTEST
>> +		    rail can be selected simultaneously. Each bit of the
>> +		    4 LSBs represent one DTEST rail, such as [3:0] = 0101
>> +		    means both DTEST1 and DTEST3 are selected.
> 
> I'm not too keen on encoding this as a bitmask. I would much rather
> encode it as multiple values - although that complicates the
> implementation.
> 
> Or can we just ignore it? (Is the lack of support in the newer chips a
> result of no-one using this?)

I am not quite sure if any real cases would route multiple DTEST line to
single GPIO, but the register mapping uses the bit mask for 4CH/8CH
subtypes and I think we should support it accordingly. Even if I drop
the support, we still have the difference of the register mapping on the
dtest selection between MV/LV subtypes and legacy 4CH/8CH subtypes,
which means we need a place to unify the dtest definition. I put the
complication here in dtsi which the end user would choose the right
value according to the hardware. I am also fine with putting the
complication in C code, but that would drop the supporting of multiple
DTEST lines selection for 4CH/8CH subtype.

> 
>> +
>>   Example:
>>   
>>   	pm8921_gpio: gpio@150 {
>> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> [..]
>> @@ -512,6 +526,13 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>>   				return -EINVAL;
>>   			pad->atest = arg;
>>   			break;
>> +		case PMIC_GPIO_CONF_DTEST_BUFFER:
>> +			if ((pad->lv_mv_type && arg > PMIC_GPIO_DIN_DTEST4)
>> +					|| (!pad->lv_mv_type && arg >
>> +					PMIC_GPIO_DIG_IN_DTEST_SEL_MASK))
>> +				return -EINVAL;
>> +			pad->dtest_buffer = arg;
>> +			break;
>>   		default:
>>   			return -EINVAL;
>>   		}
>> @@ -544,6 +565,17 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>>   			val = PMIC_GPIO_MODE_DIGITAL_OUTPUT;
>>   	}
>>   
> 
> Remember that you're supposed to be able to have two different states
> defines, one with dtest-buffer and one without - and switching between
> them should enable _and_ disable the dtest buffer.
> 
> So you need to detect the absence of qcom,dtest-buffer and you need to
> write the register in this case as well. So before looping over all the
> config parameters, set pad->dtest_buffer to "disabled" and when you get
> here it will either be disabled or have the specified value.
> 

>> +	if (pad->dtest_buffer != INT_MAX) {
>> +		val = pad->dtest_buffer;
>> +		if (pad->lv_mv_type)
>> +			val |= PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN;
>> +
> 
> Instead of representing "disabled" as INT_MAX, you could keep track of
> it in the same representation as the hardware, i.e. 0 would be disabled.
> 
> The additional effort would be in the lv_mv case that you need to mask
> in PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN in the few places where you actually
> enable dtest buffering.
> 

Thanks for your suggestion, I got the issue here. 
PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN need to be unmasked in the case of dtest
disabling.
If we decided to drop the multiple dtest line selection (actually I am 
fine with it) and unify the dtest lines values to 1~4 from dtsi, I am Ok 
with the suggestion of using 0 to represent "disabled".

>> +		ret = pmic_gpio_write(state, pad,
>> +				PMIC_GPIO_REG_DIG_IN_CTL, val);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
> [..]
>> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>> index 85d8809..21738ed 100644
>> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>> @@ -99,6 +99,12 @@
>>   #define PMIC_GPIO_AOUT_ATEST3		2
>>   #define PMIC_GPIO_AOUT_ATEST4		3
>>   
>> +/* DTEST buffer for digital input mode */
>> +#define PMIC_GPIO_DIN_DTEST1		0
>> +#define PMIC_GPIO_DIN_DTEST2		1
>> +#define PMIC_GPIO_DIN_DTEST3		2
>> +#define PMIC_GPIO_DIN_DTEST4		3
>> +
> 
> Please drop these defines.
> 
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
