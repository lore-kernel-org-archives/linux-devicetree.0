From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 8/9] ARM: at91/dt: add new at91rm9200ek_mmc board
Date: Thu, 21 Nov 2013 09:44:08 +0100
Message-ID: <528DC7D8.6000003@atmel.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com> <1377693456-11133-1-git-send-email-b.brezillon@overkiz.com> <20131120150255.GH14627@ns203013.ovh.net> <528CE3E6.1040802@overkiz.com> <20131120172722.GJ14627@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131120172722.GJ14627-HVbc7XotTAhnXn40ka+A6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20/11/2013 18:27, Jean-Christophe PLAGNIOL-VILLARD :
> On 17:31 Wed 20 Nov     , boris brezillon wrote:
>> On 20/11/2013 16:02, Jean-Christophe PLAGNIOL-VILLARD wrote:
>>> On 14:37 Wed 28 Aug     , Boris BREZILLON wrote:
>>>> Add a new at91rm9200ek_mmc board (based on at91rm9200ek board) which enables
>>>> mmc0/slot0.
>>> no for multiple dts
>>>
>>> this need to handle at user space level
>>
>> You mean, by controlling the regulator using the sysfs interface, or
>> by loading
>> only the appropriate driver ?
> load the partial dts via userspace

Right, but Jean-Christophe, we know that DT fragments are not available 
in mainline yet (even if the effort is ongoing). So what should we do in 
the meantime?

>> What if both drivers are loaded (or not compiled as modules) ?
>> This will lead to one device being unusable (and maybe even worst)...
>>
> this will never be the case

Can you please elaborate? It is a bit frustrating to have to ask you 
again and again to explain more your thoughts...

Bye,

> Best Regards,
> J.
>> Please explain what you had in mind ?
>>
>>>
>>> Best Regards,
>>> J.
>>>> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>>>> ---
>>>>   arch/arm/boot/dts/at91rm9200ek_mmc.dts |   23 +++++++++++++++++++++++
>>>>   1 file changed, 23 insertions(+)
>>>>   create mode 100644 arch/arm/boot/dts/at91rm9200ek_mmc.dts
>>>>
>>>> diff --git a/arch/arm/boot/dts/at91rm9200ek_mmc.dts b/arch/arm/boot/dts/at91rm9200ek_mmc.dts
>>>> new file mode 100644
>>>> index 0000000..c87a861
>>>> --- /dev/null
>>>> +++ b/arch/arm/boot/dts/at91rm9200ek_mmc.dts
>>>> @@ -0,0 +1,23 @@
>>>> +/*
>>>> + * at91rm9200ek.dts - Device Tree file for Atmel AT91RM9200 evaluation kit with
>>>> + *                    an MMC slot
>>>> + *
>>>> + *  Copyright (C) 2013 Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>>>> + *
>>>> + * Licensed under GPLv2 only
>>>> + */
>>>> +/dts-v1/;
>>>> +#include "at91rm9200ek.dts"
>>>> +
>>>> +/ {
>>>> +	model = "Atmel AT91RM9200 evaluation kit with MMC slot";
>>>> +	compatible = "atmel,at91rm9200ek-mmc", "atmel,at91rm9200ek", "atmel,at91rm9200";
>>>> +
>>>> +	ahb {
>>>> +		apb {
>>>> +			mmc0: mmc@fffb4000 {
>>>> +				status = "okay";
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +};
>>>> --
>>>> 1.7.9.5
>>>>
>>
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
