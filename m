From: Fenglin Wu <fenglinw@codeaurora.org>
Subject: Re: [PATCH V1 1/3] pinctrl: qcom: spmi-gpio: Add support for GPIO
 LV/MV subtype
Date: Mon, 19 Jun 2017 10:07:49 +0800
Message-ID: <1748fcd1-b133-c675-0e14-b0e1227fa5f8@codeaurora.org>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-2-fenglinw@codeaurora.org>
 <20170618140456.orzknmxg4fpce4tk@rob-hp-laptop>
 <11ad6f89-6805-a09f-eee4-21279b096e8b@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <11ad6f89-6805-a09f-eee4-21279b096e8b@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 6/19/2017 9:00 AM, Fenglin Wu wrote:
> On 6/18/2017 10:04 PM, Rob Herring wrote:
>> On Tue, Jun 13, 2017 at 02:16:03PM +0800, fenglinw@codeaurora.org wrote:
>>> From: Fenglin Wu <fenglinw@codeaurora.org>
>>>
>>> GPIO LV (low voltage)/MV (medium voltage) subtypes have different
>>> features and register mappings than 4CH/8CH subtypes. Add support
>>> for LV and MV subtypes.
>>>
>>> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
>>> ---
>>>   .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  28 ++-
>>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 269 
>>> ++++++++++++++++++---
>>>   include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   9 +
>>>   3 files changed, 264 insertions(+), 42 deletions(-)
>>
>> [...]
>>
>>> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h 
>>> b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>>> index d33f17c..85d8809 100644
>>> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>>> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>>> @@ -93,15 +93,24 @@
>>>   #define PM8994_GPIO_S4            2
>>>   #define PM8994_GPIO_L12            3
>>> +/* ATEST MUX selection for analog-pass-through mode */
>>> +#define PMIC_GPIO_AOUT_ATEST1        0
>>> +#define PMIC_GPIO_AOUT_ATEST2        1
>>> +#define PMIC_GPIO_AOUT_ATEST3        2
>>> +#define PMIC_GPIO_AOUT_ATEST4        3
>>> +
>>>   /* To be used with "function" */
>>>   #define PMIC_GPIO_FUNC_NORMAL        "normal"
>>>   #define PMIC_GPIO_FUNC_PAIRED        "paired"
>>>   #define PMIC_GPIO_FUNC_FUNC1        "func1"
>>>   #define PMIC_GPIO_FUNC_FUNC2        "func2"
>>> +#define PMIC_GPIO_FUNC_FUNC3        "func3"
>>> +#define PMIC_GPIO_FUNC_FUNC4        "func4"
>>>   #define PMIC_GPIO_FUNC_DTEST1        "dtest1"
>>>   #define PMIC_GPIO_FUNC_DTEST2        "dtest2"
>>>   #define PMIC_GPIO_FUNC_DTEST3        "dtest3"
>>>   #define PMIC_GPIO_FUNC_DTEST4        "dtest4"
>>> +#define PMIC_GPIO_FUNC_ANALOG        "analog"
>>
>> defines for strings? That's really pointless. I'd prefer you drop using
>> them than add more.
>>
> Thanks for the suggestion, I will remove these string definitions in 
> next patch.
> Does other part look good? I would post a new patch if no other comments.
> 
Sorry, I hadn't noticed there are so many definitions depend on them. I 
take my word back and I think it deserves more discussion.

The function names "func1/func2/func3/func4" defined for GPIO hardware 
module are very generic. Each GPIO located in different PMICs would have 
its special function according to different hardware design, such as: 
batt_alarm, keypad_drv, div_clk, etc.

The dt-binding header file defines the PMIC GPIOs' special functions 
which depending on these string definitions (samples list below). This 
gives a good understanding to end user if they requires to set the GPIO 
special function but not having a hardware specification to explain the 
details.

If we remove these string definitions, we would have another place to 
explain these mapping of "funcx" to any GPIOs' special functions in each 
PMICs, would dt-binding document be a good place to have them?


#define PM8038_GPIO1_2_LPG_DRV          PMIC_GPIO_FUNC_FUNC1
#define PM8038_GPIO3_5V_BOOST_EN        PMIC_GPIO_FUNC_FUNC1
#define PM8038_GPIO4_SSBI_ALT_CLK       PMIC_GPIO_FUNC_FUNC1
#define PM8038_GPIO5_6_EXT_REG_EN       PMIC_GPIO_FUNC_FUNC1
#define PM8038_GPIO10_11_EXT_REG_EN     PMIC_GPIO_FUNC_FUNC1
#define PM8038_GPIO6_7_CLK              PMIC_GPIO_FUNC_FUNC1
...


>> Rob
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-arm-msm" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
