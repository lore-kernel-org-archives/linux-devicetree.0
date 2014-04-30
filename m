From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4] ARM: perf: save/restore pmu registers in pm notifier
Date: Wed, 30 Apr 2014 14:30:47 +0100
Message-ID: <5360FB07.5030407@arm.com>
References: <1398133596-29170-1-git-send-email-zhangwm@marvell.com> <20140422103642.GF7484@arm.com> <175CCF5F49938B4D99B2E3EF7F558EBE5507A3B59B@SC-VEXCH4.marvell.com> <20140423170821.GJ5649@arm.com> <175CCF5F49938B4D99B2E3EF7F558EBE5507A3C1F1@SC-VEXCH4.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <175CCF5F49938B4D99B2E3EF7F558EBE5507A3C1F1-r8ILAu4/owuq90oVIqnETxL4W9x8LtSr@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Neil,

On 30/04/14 03:21, Neil Zhang wrote:
> 
>> -----Original Message-----
>> From: Will Deacon [mailto:will.deacon-5wv7dgnIgG8@public.gmane.org]

[...]

>>
>> I think we need some input from the device-tree guys to see whether they
>> would object to us solving this locally (in the PMU node) or not.
>> Personally, I'd much prefer a general way to describe the need for pm-notifiers,
>> but if that's not being looked at then we can cook something specifically for
>> our needs.
>>
> 
> No input from device-tree guys :(

The device tree bindings for power domains is under discussion [1]

Regards,
Sudeep

[1] https://lkml.org/lkml/2014/4/23/755

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
