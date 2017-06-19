From: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V1 1/3] pinctrl: qcom: spmi-gpio: Add support for GPIO
 LV/MV subtype
Date: Mon, 19 Jun 2017 09:00:55 +0800
Message-ID: <11ad6f89-6805-a09f-eee4-21279b096e8b@codeaurora.org>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-2-fenglinw@codeaurora.org>
 <20170618140456.orzknmxg4fpce4tk@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170618140456.orzknmxg4fpce4tk@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, aghayal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wruan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 6/18/2017 10:04 PM, Rob Herring wrote:
> On Tue, Jun 13, 2017 at 02:16:03PM +0800, fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org wrote:
>> From: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>
>> GPIO LV (low voltage)/MV (medium voltage) subtypes have different
>> features and register mappings than 4CH/8CH subtypes. Add support
>> for LV and MV subtypes.
>>
>> Signed-off-by: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  28 ++-
>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 269 ++++++++++++++++++---
>>   include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   9 +
>>   3 files changed, 264 insertions(+), 42 deletions(-)
> 
> [...]
> 
>> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>> index d33f17c..85d8809 100644
>> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>> @@ -93,15 +93,24 @@
>>   #define PM8994_GPIO_S4			2
>>   #define PM8994_GPIO_L12			3
>>   
>> +/* ATEST MUX selection for analog-pass-through mode */
>> +#define PMIC_GPIO_AOUT_ATEST1		0
>> +#define PMIC_GPIO_AOUT_ATEST2		1
>> +#define PMIC_GPIO_AOUT_ATEST3		2
>> +#define PMIC_GPIO_AOUT_ATEST4		3
>> +
>>   /* To be used with "function" */
>>   #define PMIC_GPIO_FUNC_NORMAL		"normal"
>>   #define PMIC_GPIO_FUNC_PAIRED		"paired"
>>   #define PMIC_GPIO_FUNC_FUNC1		"func1"
>>   #define PMIC_GPIO_FUNC_FUNC2		"func2"
>> +#define PMIC_GPIO_FUNC_FUNC3		"func3"
>> +#define PMIC_GPIO_FUNC_FUNC4		"func4"
>>   #define PMIC_GPIO_FUNC_DTEST1		"dtest1"
>>   #define PMIC_GPIO_FUNC_DTEST2		"dtest2"
>>   #define PMIC_GPIO_FUNC_DTEST3		"dtest3"
>>   #define PMIC_GPIO_FUNC_DTEST4		"dtest4"
>> +#define PMIC_GPIO_FUNC_ANALOG		"analog"
> 
> defines for strings? That's really pointless. I'd prefer you drop using
> them than add more.
> 
Thanks for the suggestion, I will remove these string definitions in 
next patch.
Does other part look good? I would post a new patch if no other comments.

> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\n 
a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
