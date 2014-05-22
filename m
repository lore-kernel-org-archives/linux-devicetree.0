From: Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH RESEND 1/2] irqchip: Add generic gic-v1/gic-v2 compat
 strings.
Date: Thu, 22 May 2014 11:26:17 -0400
Message-ID: <537E1719.4050102@codeaurora.org>
References: <1400680085-10430-1-git-send-email-Nikolay.Borisov@arm.com> <1400680085-10430-2-git-send-email-Nikolay.Borisov@arm.com> <CAL_JsqKpgWBQ6qFrDHt13wqRx1afPeapEz5z16enUyUX1fgUJg@mail.gmail.com> <20140522090702.GA23478@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140522090702.GA23478@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 05/22/2014 05:07 AM, Mark Rutland wrote:
> On Wed, May 21, 2014 at 10:27:33PM +0100, Rob Herring wrote:
>> On Wed, May 21, 2014 at 8:48 AM, Nikolay Borisov
>> <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org> wrote:
>>> The current set of GIC compatible strings only contains specific
>>> implementations (e.g. arm,cortex-a9-gic) rather than revisions of the
>>> standard (e.g. arm,gic-v2), so each new implementation must either claim
>>> to be an extension of an existing implementation or have a new string
>>> added to the driver. This may be problematic when workarounds are
>>> required for bugs in particular implementations, as said workaround may
>>> end up targeting a wider set of implementations than intended.
>>>
>>> To prevent these issues, this patch adds compatible strings for the
>>> revisions of the GIC spec which all GIC implementations should be able
>>> to claim conformance to in addition to any particular implementation
>>> specific string, e.g.
>>
>> This just encourages not having specific properties which then also
>> prevents being able to add work-arounds later. SOCs using the a9 or
>> a15 string ONLY that are not an a9 or a15 are wrong. That's what we
>> should fix. Adding more generic strings is not going to help that. Do
>> you have a specific work-around you need to implement?
> 
> AFAIK, we don't have a specific workaround required anywhere that these
> strings would help with. It's just that generic GIC strings had been
> brought up repeatedly with no particular conclusion.
> 
> If we simply ensure that new DTS that feature a GIC have
> implementation-specific strings in addition to those we already support
> (e.g. "arm,cortex-a9-gic"), then I'm fine with that.
> 
>> Given that the GIC specs are obviously meaningless since we now have
>> GICv2 with 16 core support as well as the special exynos gics, I'm not
>> inclined to accept this.
> 
> Arguably neither are "true" GICv2, but your point stands.

I think the generic string (in addition to the specific one) is a good thing,
and I think it should be done for the PMU and any other specified/architected
hardware as well. If we don't allow for them, a shortcut would be to
masquerade hardware as something that's already supported. It seems like this
needs to be discouraged just as much as omitting the specific string.

The current behavior is that the driver will not run without a specific string
present. What if this were preserved (or replaced with a warning) even with
the addition of support for a generic string?

Thanks,
Christopher

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by the Linux Foundation.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
