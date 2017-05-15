From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 01/21] dt-bindings: i2c: eeprom: Document manufacturer
 used as generic fallback
Date: Mon, 15 May 2017 12:48:03 +0200
Message-ID: <CABxcv=mq7xOKL5WXG+qkhwQCiOuN4J=WWRzKnq0DTx9vxinOpQ@mail.gmail.com>
References: <20170414010445.21727-1-javier@osg.samsung.com>
 <20170414010445.21727-2-javier@osg.samsung.com> <20170419232759.mw6g6fwy4xvjaopv@rob-hp-laptop>
 <CAL_JsqL-DRPBCeeNYzf9YBDijFc9s8ZBVQ-5PNkHxuTSYbHnew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL-DRPBCeeNYzf9YBDijFc9s8ZBVQ-5PNkHxuTSYbHnew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

Thanks for the feedback and sorry for the delayed response (I've been
moving to a new country so didn't have too much time to answer
emails).

On Thu, Apr 20, 2017 at 1:35 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Apr 19, 2017 at 6:27 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Thu, Apr 13, 2017 at 10:04:25PM -0300, Javier Martinez Canillas wrote:

[snip]

>>>
>>>        If there is no specific driver for <manufacturer>, a generic
>>> -      driver based on <type> is selected. Possible types are:
>>> +      driver based on <type> and manufacturer "atmel" is selected.
>>> +      Possible types are:
>>
>> This isn't quite right. What the driver does isn't really relevant to
>> the binding.
>>
>> These types with no vendor are used as the compatible string, so we have
>> to allow them. But it should be clear that no vendor is deprecated.
>> Ironically, it is a lot of Atmel boards that do this.
>>
>> We should also explicitly list what are valid manufacturers. We also
>> have "at" as a vendor prefix which perhaps we should explicitly say is
>> deprecated.
>
> I should perhaps look at the rest of the series before replying..
>
> Based on that, the only comment that applies is listing the
> manufacturers that are valid. From a DT perspective, I should not have
> to know what the OS driver supports. If the device is compatible with
> atmel, then that is required. If not, then the specific manufacturer's
> compatible alone is enough and the OS has to match to that.
>

Got it, I'll re-spin the series probably this week adding that
information to the DT binding doc.

> Rob

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
