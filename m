From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/4] arm: zynq: Enable global timer
Date: Thu, 26 Sep 2013 12:14:17 +0200
Message-ID: <524408F9.3090702@linaro.org>
References: <1379530118-22813-1-git-send-email-soren.brinkmann@xilinx.com> <5242FF4B.6050901@linaro.org> <62570dec-da98-42a2-93b9-6ab1f8adb30d@CH1EHSMHS037.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <62570dec-da98-42a2-93b9-6ab1f8adb30d-p/+QeVIcf1AR12DuCexJY7jjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Preeti Murthy <preeti.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/26/2013 10:16 AM, Michal Simek wrote:
> Hi Daniel,
>
> On 09/25/2013 05:20 PM, Daniel Lezcano wrote:
>> On 09/18/2013 08:48 PM, Soren Brinkmann wrote:
>>> Hi all,
>>>
>>> here's a v2. I reused the subject from my v1 submission although th=
e focus of
>>> this series moved a bit towards the timer subsystem.
>>> I replaced Stephen's fix to prevent per cpu devices from becoming
>>> the broadcast device with Thomas' proposal, but I kept the original=
 commit
>>> message. I split the whole approach in small chunks that I found re=
asonable.
>>>
>>> In 4/4, I picked up Grant's comment regarding the DT node name.
>>>
>>> v2:
>>>   - drop 1/2 of the original series
>>>   - implement preventing per cpu devices from becoming broadcast de=
vice according
>>>     to Thomas' proposal
>>>     - introduce new CLOCK_EVT_FEAT_PERCPU flag
>>>     - set the flag for the arm_global_timer
>>>     - filter per cpu devices based on this flag when choosing the b=
roadcast
>>>       device
>>>   - rename DT node to avoid '_'s
>>>
>>>
>>> Soren Brinkmann (4):
>>>    clockchips: Add FEAT_PERCPU clockevent flag
>>>    clocksource/arm_global_timer: Set FEAT_PERCPU flag
>>>    tick: broadcast: Deny per-cpu clockevents from being broadcast s=
ources
>>>    arm: zynq: Enable arm_global_timer
>>>
>>>   arch/arm/boot/dts/zynq-7000.dtsi       | 8 ++++++++
>>>   arch/arm/mach-zynq/Kconfig             | 1 +
>>>   drivers/clocksource/arm_global_timer.c | 3 ++-
>>>   include/linux/clockchips.h             | 1 +
>>>   kernel/time/tick-broadcast.c           | 1 +
>>>   5 files changed, 13 insertions(+), 1 deletion(-)
>>
>> This patches falls under different maintainer's umbrella.
>>
>> I acked-by the patches, so if someone is willing to take the patches=
 I
>> am ok with that. I am ok also to pick them into my tree with the
>> acked-by maintainer. Just let me know ...
>>
>
> Yes, please add also this zynq specific patch through your tree.
>
> Here is my ACK for that.
> Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Thomas do you mind to ack the patches if you agree with it ?

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
