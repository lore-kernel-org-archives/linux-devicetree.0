From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 6/8] Documentation: bindings: add compatible specific
 to legacy SCPI protocol
Date: Fri, 11 Nov 2016 07:34:20 -0600
Message-ID: <CAL_JsqJ5PxzM_VMP55m+6snkqyWSMSsdCOiUzYWkMTb3LkD5Mw@mail.gmail.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
 <1478148731-11712-7-git-send-email-sudeep.holla@arm.com> <20161110012249.ed56ik6kdffoikym@rob-hp-laptop>
 <14e563ae-36c5-4bf9-0d51-3b07830de3db@arm.com> <CAL_JsqLW4JZHb0ncVUEefnKySA231EDgvCkY3xPdaJGf=uMJYg@mail.gmail.com>
 <7ccc12bc-9a05-47e3-8ab8-d1b0ad31159e@arm.com> <CAOesGMj3TYLkvfGbq6BKqr+9i6mjArjRPuqeAN1-rGO2OhoSyw@mail.gmail.com>
 <ed58424e-e538-227a-37b5-b35fbe4f96ba@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ed58424e-e538-227a-37b5-b35fbe4f96ba-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 11, 2016 at 1:48 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> On 10/11/16 19:03, Olof Johansson wrote:
>> On Thu, Nov 10, 2016 at 6:34 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> wrote:

[...]

>>> E.g. Amlogic follows most of the legacy protocol though it deviates in
>>> couple of things which we can handle with platform specific compatible
>>> (in the following patch in the series). When another user(Rockchip ?)
>>> make use of this legacy protocol, we can start using those platform
>>> specific compatible for deviations only.
>>>
>>> Is that not acceptable ?
>>
>>
>> If there's no shared legacy feature set, then it's probably less
>> useful to have a shared less precise compatible value.
>>
>
> There is and will be some shared feature set for sure. At the least the
> standard command set will be shared.
>
>> What the main point I was trying to get across was that we shouldn't
>> expand the generic binding with per-vendor compatible fields, instead
>> we should have those as extensions on the side.
>>
>
> Yes I get the point. We will have per-vendor compatibles for handle the
> deviations but generic one to handle the shared set.
>
>> I'm also a little apprehensive of using "legacy", it goes in the same
>> bucket as "misc". At some point 1.0 will be legacy too, etc.
>>
>
> True and I agree, how about "arm,scpi-pre-1.0" instead ?

That's still meaningless. Convince me that multiple implementations
are identical, then we can have a common property. For example, how
many releases did ARM make before 1.0.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
