From: Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Add support for
 qcom,gpios-disallowed property
Date: Tue, 25 Jul 2017 09:05:22 +0800
Message-ID: <4bb5757c-44b0-c760-2d70-df0e607de0d7@codeaurora.org>
References: <20170719071804.3816-1-fenglinw@codeaurora.org>
 <20170724190949.y45cx4zextmvb4tn@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170724190949.y45cx4zextmvb4tn@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, aghayal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wruan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 7/25/2017 3:09 AM, Rob Herring wrote:
>>   <prop-encoded-array>
>> +	Definition: Array of the GPIO hardware numbers corresponding to GPIOs
>> +		    which the APSS processor is not allowed to configure.
>> +		    The hardware numbers are indexed from 1.
>> +		    The interrupt resources for these GPIOs must not be defined
>> +		    in "interrupts" and "interrupt-names" properties.
>> +		    GPIOs defined in this array won't be registered as pins
>> +		    in the pinctrl device or gpios in the gpio chip.
> Isn't simply not assigning GPIOs to anything in the DT sufficient to not

Thanks for the question, Ron.
Previous implementation assumes all GPIOs are accessible from APSS
processor and it gets the total pin numbers by counting IRQs. It
registers pinctrl devices with the total pin numbers and assumes all the
pin are indexed continuously from hardware.
Current case is, some GPIOs' interrupt are not owned by APSS processor
and there would be errors when creating IRQ mapping for them. Yes, We
can exclude them from the "interrupts" property but the driver won't
shift the GPIO pad index automatically. Such as: PMI8998 has 14 GPIOs
from GPIO1 to GPIO14, and GPIO4/GPIO7/GPIO13 are not accessible from
APPS processor, we can excluded them from the interrupt assignment (in
following sample) and DON'T expect to register pins for them, but the
driver would count the IRQ numbers to 11 and register pins for
GPIO1 ~ GPIO11.
So I am adding this property "qcom,gpios-disallowed"  for these
inaccessible GPIOs then the driver would exclude them and register pins
for the right GPIO pads.

Samples:

interrupts = <0x2 0xc0 0 IRQ_TYPE_NONE>,
                 <0x2 0xc1 0 IRQ_TYPE_NONE>,
                 <0x2 0xc2 0 IRQ_TYPE_NONE>,
                 <0x2 0xc4 0 IRQ_TYPE_NONE>,
                 <0x2 0xc5 0 IRQ_TYPE_NONE>,
                 <0x2 0xc7 0 IRQ_TYPE_NONE>,
                 <0x2 0xc8 0 IRQ_TYPE_NONE>,
                 <0x2 0xc9 0 IRQ_TYPE_NONE>,
                 <0x2 0xca 0 IRQ_TYPE_NONE>,
                 <0x2 0xcb 0 IRQ_TYPE_NONE>,
                 <0x2 0xcd 0 IRQ_TYPE_NONE>;
interrupt-names = "pmi8998_gpio1", "pmi8998_gpio2",
                 "pmi8998_gpio3", "pmi8998_gpio5",
                 "pmi8998_gpio6", "pmi8998_gpio8",
                 "pmi8998_gpio9", "pmi8998_gpio10",
                 "pmi8998_gpio11", "pmi8998_gpio12",
                 "pmi8998_gpio14";
qcom,gpios-disallowed = <4 7 13>;

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
