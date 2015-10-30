From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/19] Documentation: devicetree: fix reference to legacy
 wakeup properties
Date: Fri, 30 Oct 2015 13:29:39 -0500
Message-ID: <CAL_Jsq+uooHoK19SwnhMkm6_e86FZbS0GQPZhQK9A71uWU3S5Q@mail.gmail.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-3-git-send-email-sudeep.holla@arm.com> <CAL_JsqJ+5RNCehN9izgChf1fXhctzf+ShevjdAGnW5jF1GsAXw@mail.gmail.com>
 <563112BD.2050700@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563112BD.2050700-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 28, 2015 at 1:23 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>
> On 21/10/15 23:04, Rob Herring wrote:
>>
>> On Wed, Oct 21, 2015 at 5:09 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> wrote:
>>>
>>> This patch marks all the reference to the legacy wakeup bindings
>>> and replaces them with the standard "wakeup-source" property.
>>>
>>> All these legacy property are also listed under a separate section in
>>> the generic wakeup-source binding document.
>>>
>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>
> Thanks Rob, can you take these couple(first two) of DT binding patches
> via devicetree. I can then push remaining patches via respective trees
> later.

Both applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
