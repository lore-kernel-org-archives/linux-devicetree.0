From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4] ARM: perf: save/restore pmu registers in pm notifier
Date: Wed, 14 May 2014 10:31:31 +0100
Message-ID: <537337F3.4080300@arm.com>
References: <1398133596-29170-1-git-send-email-zhangwm@marvell.com> <20140422103642.GF7484@arm.com> <175CCF5F49938B4D99B2E3EF7F558EBE5507A3B59B@SC-VEXCH4.marvell.com> <20140423170821.GJ5649@arm.com> <175CCF5F49938B4D99B2E3EF7F558EBE5507A3C1F1@SC-VEXCH4.marvell.com> <5360FB07.5030407@arm.com> <6106CAF835F351419ADA79E4836E6EC71B6A53C826@SC-VEXCH4.marvell.com> <9034CBD80F070943B59700D7F8149ED9A0875730@SC-VEXCH4.marvell.com> <20140513184503.GF16388@arm.com> <9034CBD80F070943B59700D7F8149ED9A087573F@SC-VEXCH4.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9034CBD80F070943B59700D7F8149ED9A087573F-r8ILAu4/owuq90oVIqnETxL4W9x8LtSr@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "'linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org'" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "'linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org'" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "'linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 14/05/14 03:28, Neil Zhang wrote:
>> -----Original Message-----
>> From: Will Deacon [mailto:will.deacon-5wv7dgnIgG8@public.gmane.org]
>> Sent: 2014=E5=B9=B45=E6=9C=8814=E6=97=A5 2:45
>> To: Neil Zhang
>> Cc: Sudeep Holla; 'linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org';
>> 'linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org'; 'linux-kernel-u79uwXL29TaqPxH82wqD4g@public.gmane.org=
g';
>> 'devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'
>> Subject: Re: [PATCH v4] ARM: perf: save/restore pmu registers in pm =
notifier
>>
>> On Mon, May 12, 2014 at 11:22:09AM +0100, Neil Zhang wrote:
>>>>> The device tree bindings for power domains is under discussion [1=
]
>>>>
>>>> Thanks for the information.
>>>> But it currently for device only, core related stuff are not suppo=
rted.
>>>> And is it really good to register power provider for core and let
>>>> vfp / pmu etc to get it?
>>>>
>>>
>>> What's your suggestion about it?
>>> Is it OK that I add it under the PMU node?
>>
>> I don't really mind. I just want to avoid re-inventing the wheel in =
a
>> PMU-specific way and having to maintain that code forever because it=
 ended
>> up in our DT description.
>>
>> Will
>
> I will prepare another patch to add DT description under PMU since th=
ere is
> no generic power domain support for pm notifier if no other concerns.
> We can change the manner if there is generic power domain support for=
 pm notifier later.
> Thanks.

No, please don't add any DT bindings for power domains specific to PMU =
node.
We can't change the DT bindings once added.

As I pointed out the DT bindings for generic power domains are under di=
scussion.
See if you can reuse it, if not help in extending it so that it can be =
used.

Regards,
Sudeep



--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
