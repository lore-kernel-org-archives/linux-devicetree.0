From: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] pinctrl: qcom: Add ipq8074 pinctrl driver
Date: Thu, 18 May 2017 14:07:34 +0530
Message-ID: <4eff646f-533c-5c85-7431-3c514cd06508@codeaurora.org>
References: <1493898841-20583-1-git-send-email-varada@codeaurora.org>
 <1493898841-20583-2-git-send-email-varada@codeaurora.org>
 <20170510224355.GE45273@Bjorns-MacBook-Pro-2.local>
 <1f4c9974-f6a4-bee7-4f37-ad8795e442a3@codeaurora.org>
 <20170514042307.GE69278@Bjorns-MacBook-Pro-2.local>
 <7afc7191-bcb1-a566-eac5-a4fe1293c773@codeaurora.org>
 <4a39c13b-378d-08b5-a2fc-d3bdb32d106f@codeaurora.org>
 <20170517194733.GG12920@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170517194733.GG12920@tuxbook>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sjaganat-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Manoharan Vijaya Raghavan <mraghava-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 5/18/2017 1:17 AM, Bjorn Andersson wrote:
> On Mon 15 May 04:24 PDT 2017, Varadarajan Narayanan wrote:
> 
>>
>>
>> On 5/15/2017 2:35 PM, Varadarajan Narayanan wrote:
>>> On 5/14/2017 9:53 AM, Bjorn Andersson wrote:
>>>> On Thu 11 May 03:33 PDT 2017, Varadarajan Narayanan wrote:
>>>>
>>>>> On 5/11/2017 4:13 AM, Bjorn Andersson wrote:
>>>>>> On Thu 04 May 04:53 PDT 2017, Varadarajan Narayanan wrote:
>>>>>>
>>>> [..]
>>>>>>> +enum ipq8074_functions {
>>>>>>
>>>>>> Please keep these sorted alphabetically.
>>>>>
>>>>> Ok
>>>>>
>>>>>>> +    msm_mux_gpio,
>>>>>>> +    msm_mux_qpic_pad,
>>>>>>> +    msm_mux_blsp5_i2c,
>>>>>>> +    msm_mux_blsp5_spi,
>>>>>>> +    msm_mux_wci20,
>>>>>>
>>>>>> What does "20" mean here?
>>>>>
>>>>> This is for Wireless Coex Interface. The same functionality can
>>>>> be muxed on
>>>>> to different GPIOs. WCI2, is the 2nd edition of the WCI standard
>>>>> and 0, 1
>>>>> are for the muxing to different GPIOs (alternate muxes).
>>>>>
>>>>
>>>> In other Qualcomm platforms the alternative muxes are denoted by letters
>>>> (a,b,c...). Would you mind picking up this naming scheme, or do you see
>>>> any problems with that? (E.g. wci2a in this case)
>>>
>>> Ok
>>>
>>>> Btw, do you need any additional configuration for selecting alternative
>>>> muxing or is that automagical these days?
>>>
>>> No additional configuration is needed.
>>>
>>>>>>> +    msm_mux_blsp3_spi3,
>>>>>>> +    msm_mux_burn0,
>>>>>>> +    msm_mux_pcm_zsi0,
>>>>>>> +    msm_mux_blsp5_uart,
>>>>>>> +    msm_mux_mac12,
>>>>>>
>>>>>> What does "12" mean here?
>>>>>
>>>>> The SoC has three MAC cores. Each core has two pins for the
>>>>> smart antenna
>>>>> feature. macXY indicates the function select for MAC no. X and
>>>>> smart antenna
>>>>> no. Y.
>>>>>
>>>>
>>>> Ok
>>>>
>>>>>>> +    msm_mux_blsp3_spi0,
>>>>>>> +    msm_mux_burn1,
>>>>>>> +    msm_mux_mac01,
>>>>>>> +    msm_mux_qdss_cti_trig_out_b0,
>>>>>>> +    msm_mux_qdss_cti_trig_in_b0,
>>>>>>> +    msm_mux_qpic_pad4,
>>>>>>
>>>>>> What are qpic_pad and qpic_pad0 through qpic_pad8? Different functions,
>>>>>> alternative muxings...?
>>>>>
>>>>> This is for the NAND and LCD display. The pins listed are the 9
>>>>> data pins.
>>>>>
>>>>
>>>> Then you can describe them all as "qpic_pad" (or simply "qpic"?). (It's
>>>> possible to reference a partial group in the DTS, if that's necessary)
>>>
>>> There are two sets of 9 pins, either of which can go to NAND or LCD.
>>> Will rename qpic_pad as qpic_a and qpic_pad[0-8] as qpic_b.
>>> Is that ok?
>>>
>>>>>>> +    msm_mux_blsp4_uart0,
>>>>>>> +    msm_mux_blsp4_i2c0,
>>>>>>> +    msm_mux_blsp4_spi0,
>>>>>>> +    msm_mux_mac21,
>>>>>>> +    msm_mux_qdss_cti_trig_out_b1,
>>>>>>> +    msm_mux_qpic_pad5,
>>>>>>> +    msm_mux_qdss_cti_trig_in_b1,
>>>>>>> +    msm_mux_qpic_pad6,
>>>>>>> +    msm_mux_qpic_pad7,
>>>>>>> +    msm_mux_cxc0,
>>>>>>> +    msm_mux_mac13,
>>>>>>> +    msm_mux_qdss_cti_trig_in_a1,
>>>>>>> +    msm_mux_qdss_cti_trig_out_a1,
>>>>>>> +    msm_mux_wci22,
>>>>>>> +    msm_mux_qdss_cti_trig_in_a0,
>>>>>>> +    msm_mux_qpic_pad1,
>>>>>>> +    msm_mux_qdss_cti_trig_out_a0,
>>>>>>> +    msm_mux_qpic_pad2,
>>>>>>> +    msm_mux_qpic_pad3,
>>>>>>> +    msm_mux_qdss_traceclk_b,
>>>>>>> +    msm_mux_qpic_pad0,
>>>>>>> +    msm_mux_qdss_tracectl_b,
>>>>>>> +    msm_mux_qpic_pad8,
>>>>>>> +    msm_mux_pcm_zsi1,
>>>>>>> +    msm_mux_qdss_tracedata_b,
>>>>>>> +    msm_mux_led0,
>>>>>>> +    msm_mux_pwm04,
>>>>>>
>>>>>> What does "04" mean here?
>>>>>
>>>>> There are 4 Pulse Width Modulation channels, pwmXY is pwm
>>>>> channel X and pin
>>>>> Y.
>>>>
>>>> So Y is alternative mux? Can we use letters for this as well?
>>>
>>> Ok
>>
>> Sorry, actually they are not alternative muxes. There are 4 different PWM
>> instances. Each PWM instance can handle 'n' different GPIOs (for example,
>> that can be connected to LED etc.).
>>
> 
> So we have 4 PWMs and the output from a single PWM can muxed to drive
> the output of 4 pins?
> 
> Then skip the last digit and just go pwm0, ... pwm3 and include all four
> pins that can be part of each instance. As the pingroup configuration is
> per pin in the TLMM it's possible to configure subsets of the pins in a
> group.

Ok

Thanks
Varada

> Regards,
> Bjorn
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
