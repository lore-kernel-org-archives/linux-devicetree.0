From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Wed, 2 Nov 2016 16:22:53 -0700
Message-ID: <ab5de67d-1e63-53ef-2dbf-1df90262e4ba@redhat.com>
References: <20161031160009.20472-1-michael.scott@linaro.org>
 <20161101235344.GX16026@codeaurora.org>
 <e0bdce76-dcab-36c9-bf39-6c79b1cb2820@linaro.org>
 <20161102183607.GJ16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161102183607.GJ16026-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Scott <michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joonwoo Park <joonwoop-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016-11-02 11:36 AM, Stephen Boyd wrote:
> On 11/01, Michael Scott wrote:
>>
>> On 11/01/2016 04:53 PM, Stephen Boyd wrote:
>>> On 10/31, Michael Scott wrote:
>>>> +
>>>> +static const struct msm_pingroup msm8994_groups[] = {
>>>> +	PINGROUP(0,   blsp_spi1, blsp_uart1, blsp_uim1, NA, NA, NA, NA, NA, NA,
>>>> +		 NA, NA),
>>> I see an hdmi_rcv group here after blsp_uim1. Please add it for
>>> this gpio.
>>
>> Hi Stephen,
>>
>> Thank you for reviewing the data-- this is really tedious stuff.
>>
>> I'd like to make sure that we're both using tech data for msm8994.
>> I don't see the hdmi_rcv function at all in my docs.
>>
>>>
>>>> +	PINGROUP(1,   blsp_spi1, blsp_uart1, blsp_uim1, NA, NA, NA, NA, NA, NA,
>>>> +		 NA, NA),
>>>> +	PINGROUP(2,   blsp_spi1, blsp_uart1, blsp_i2c1, NA, NA, NA, NA, NA, NA,
>>>> +		 NA, NA),
>>>> +	PINGROUP(3,   blsp_spi1, blsp_uart1, blsp_i2c1, NA, NA, NA, NA, NA, NA,
>>>> +		 NA, NA),
>>>> +	PINGROUP(4,   blsp_spi2, blsp_uart2, blsp_uim2, qdss_cti_trig_out_b,
>>>> +		 NA, NA, NA, NA, NA, NA, NA),
>>>> +	PINGROUP(5,   blsp_spi2, blsp_uart2, blsp_uim2, qdss_cti_trig_in_b, NA,
>>> The qdss_cti_* is in function 5 for both of these, not function
>>> 4.
>> These are indeed wrong, but my docs both show as function 7.
>
> Ok. I think your document is for 8994v1, which never got
> commercialized. I certainly see that this function assignment
> changed between v1 and v2 from 7 to 5.
>


This is a case where not having the docs and only downstream code as a
reference is probably a good thing (tm), although the downstream code
may end up hurting more than helping.

-jeremy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
