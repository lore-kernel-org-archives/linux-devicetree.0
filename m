From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: vadc: Qualcomm SPMI PMIC voltage ADC driver
Date: Tue, 09 Sep 2014 15:49:45 +0300
Message-ID: <540EF769.9080002@mm-sol.com>
References: <1409919274-13419-1-git-send-email-svarbanov@mm-sol.com> <3899885.YaIxR1zelv@wuerfel> <540DCB78.8060206@mm-sol.com> <7045486.CbS74HiY8I@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7045486.CbS74HiY8I@wuerfel>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collins>
List-Id: devicetree@vger.kernel.org

On 09/09/2014 01:32 PM, Arnd Bergmann wrote:
> On Monday 08 September 2014 18:30:00 Stanimir Varbanov wrote:
>>>>> These numbers all look hardware specific, so why put macros into the
>>>>> device tree rather than using them directly?
>>>>
>>>> The idea was to use #defines in DT nodes when we need to overwrite the
>>>> adc channel parameters, see example in 2/2 how it will be used.
>>>
>>> I don't understand. The node in the example has
>>>
>>> +               /* Channel node */
>>> +               usb_id_nopull@39 {
>>> +                       qcom,channel = <VADC_LR_MUX10_USB_ID>;
>>> ...
>>> +               };
>>>
>>>
>>> And VADC_LR_MUX10_USB_ID is defined to 0x39.  How is this helping anything?
>>> You just introduce an artificial dependency on the header file, which makes
>>> it a mess to merge the patches or do updates, and anybody who needs to
>>> make updates to this now has to go through the same pain, to update the
>>> dts files, the driver and the binding document in lockstep.
>>>
>>> Why not remove the qcom,channel property completely and use a 'reg'
>>> property with #address-cells=<1>, #size-cells=<0> and put the number
>>> directly in there, with no need for obfuscation macros?
>>
>> OK thanks for the remarks. I will fix this mess.
>>
>> I hope you are expecting to see this:
>>
>> pmic_vadc: vadc@3100 {
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>>         #io-channel-cells = <1>;
>>         io-channel-ranges;
>>
>>         usb_id_nopull@39 {
>>                 reg = <0x39>;
>>         };
>> };
>>
>> and use the vadc channel from usb device node
>>
>> usb {
>>         ...
>>         io-channels = <&pmic_vadc 0x39>;
>>         io-channel-names = "usbidnopull";
>> };
> 
> The ID stuff looks good now, but I had not noticed the
> "io-channel-names" property before. I think you misunderstood
> the purpose of that, because it is very similar to the name of the
> adc provider (usb_id_nopull@39).
> 
> Like anything else that we refer to by name (interrupt, reg,
> clock, regulator, ...), the name used in the client is supposed
> to be a string that identifies what the connection means to the
> client, not what it means to the provider. This string is
> supposed to be defined in the binding of the client device and
> independent of what other hardware block provides it.

yes of course, my fault. Thanks for clarification.

-- 
regards,
Stan
