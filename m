From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 6/8] Documentation: bindings: add compatible specific
 to legacy SCPI protocol
Date: Fri, 11 Nov 2016 14:19:10 +0000
Message-ID: <4e31f1d9-61b9-53a9-bd0c-dd5e452faece@arm.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
 <1478148731-11712-7-git-send-email-sudeep.holla@arm.com>
 <20161110012249.ed56ik6kdffoikym@rob-hp-laptop>
 <14e563ae-36c5-4bf9-0d51-3b07830de3db@arm.com>
 <CAL_JsqLW4JZHb0ncVUEefnKySA231EDgvCkY3xPdaJGf=uMJYg@mail.gmail.com>
 <7ccc12bc-9a05-47e3-8ab8-d1b0ad31159e@arm.com>
 <CAOesGMj3TYLkvfGbq6BKqr+9i6mjArjRPuqeAN1-rGO2OhoSyw@mail.gmail.com>
 <ed58424e-e538-227a-37b5-b35fbe4f96ba@arm.com>
 <CAL_JsqJ5PxzM_VMP55m+6snkqyWSMSsdCOiUzYWkMTb3LkD5Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ5PxzM_VMP55m+6snkqyWSMSsdCOiUzYWkMTb3LkD5Mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/11/16 13:34, Rob Herring wrote:
> On Fri, Nov 11, 2016 at 1:48 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> On 10/11/16 19:03, Olof Johansson wrote:
>>> On Thu, Nov 10, 2016 at 6:34 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>> wrote:
>
> [...]
>
>>>> E.g. Amlogic follows most of the legacy protocol though it deviates in
>>>> couple of things which we can handle with platform specific compatible
>>>> (in the following patch in the series). When another user(Rockchip ?)
>>>> make use of this legacy protocol, we can start using those platform
>>>> specific compatible for deviations only.
>>>>
>>>> Is that not acceptable ?
>>>
>>>
>>> If there's no shared legacy feature set, then it's probably less
>>> useful to have a shared less precise compatible value.
>>>
>>
>> There is and will be some shared feature set for sure. At the least the
>> standard command set will be shared.
>>
>>> What the main point I was trying to get across was that we shouldn't
>>> expand the generic binding with per-vendor compatible fields, instead
>>> we should have those as extensions on the side.
>>>
>>
>> Yes I get the point. We will have per-vendor compatibles for handle the
>> deviations but generic one to handle the shared set.
>>
>>> I'm also a little apprehensive of using "legacy", it goes in the same
>>> bucket as "misc". At some point 1.0 will be legacy too, etc.
>>>
>>
>> True and I agree, how about "arm,scpi-pre-1.0" instead ?
>
> That's still meaningless. Convince me that multiple implementations
> are identical, then we can have a common property. For example, how
> many releases did ARM make before 1.0.
>

None officially, so I tend to agree with you on this.

But so far we have seen some commonality between Rockchip and Amlogic
implementations, which in fact shares some commonality with early
release of SCPI from ARM (there are based on the same SCP code base,
which is closed source and released to partners only). ARM improved the
specification and the code base before the official release but by then
it was adopted(as usual we were late ;))

IMO, it's might be useful to have more generic say "arm,scpi-pre-1.0"
and platform specific "amlogic,meson-gxbb-scpi"

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
