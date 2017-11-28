From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 0/4] fix the clock setting for SAR ADC
Date: Tue, 28 Nov 2017 21:11:29 +0800
Message-ID: <15745fd0-1af9-c7c0-8769-063f218a3d28@amlogic.com>
References: <20171107140942.29243-1-yixun.lan@amlogic.com>
 <CAFBinCB=2pb9dZkpSqdVAiumkSCzgaW0oejftjZNP7aYbiQJuw@mail.gmail.com>
 <20171111003737.000038f0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171111003737.000038f0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xingyu Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 11/11/17 08:37, Jonathan Cameron wrote:
> On Tue, 7 Nov 2017 22:36:00 +0100
> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> 
>> Hi Yixun,
>>
>> On Tue, Nov 7, 2017 at 3:09 PM, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> wrote:
>>> patch [1/4]:
>>>   Fix wrong SARADC/SANA clock gate bit in Meson-GXBB/GXL,
>>> the published datasheets[4] also has wrong description about this.
>>>   This patch should be explicitly merged *before* other patches.
>>>
>>> patch [2-4/4]:
>>>   Drop the "sana" clock from SAR ADC module,  
>> I agree with Jerome that patch 2/4 should be applied last.
> 
> Let me know when I should take this.
> 
> Thanks,
> 
> Jonathan
> 
>> when I wrote the driver I couldn't get it to work on my GXBB board
>> (which unfortunately has died since then) because the clocks were
>> disabled (they weren't enabled by the bootloader). people who are
>> using an old .dtb would get the same problem again until the clock
>> driver is merged
>>
>>>   From the hardware perspective, the SAR ADC module doesn't
>>> require "sana" clock to wrok. This should apply to all SoC,
>>> including meson6,8, GXBB, GXL..  
>> thank you for clarifying this!
>>
>>> Note: the whole patchset series has been tested at GXL-P212 board,
>>> we haven't got any meson6,8 board to test, so I would appreciate
>>> if someone (Martin?) could help to confirm it works there.  
>> I can test this on a Meson8b and a Meson8m2 board on the weekend -
>> I'll let you know about the results
>>
>>
>> Regards
>> Martin
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> .
> 

Hi Jonathan Cameron & Kevin Hilman:

 since the clk part patch has been applied[1], can we proceed with others?

to Jonathan:
I think the iio part(patch [2/4]) should be merged via your iio tree?
see [2]

to Kevin:
could you take the DTS part? see [3], and the patch [4/4] has a rework
version, see [4], to separate dt64 vs dt32 device tree.


[1]
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005472.html

[2]
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005264.html

[3]
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005265.html

[4]
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005304.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005305.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005306.html

Yixun

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
