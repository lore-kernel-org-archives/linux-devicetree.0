From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] soc: keystone: add QMSS driver
Date: Tue, 11 Mar 2014 10:14:23 -0500
Message-ID: <CAL_JsqLKoZd4L2jjzD5Z8fFO9Cx1SH7cfE-PnEY_Vx2Sx0FRYA@mail.gmail.com>
References: <1393629520-12713-1-git-send-email-santosh.shilimkar@ti.com>
	<1393629520-12713-3-git-send-email-santosh.shilimkar@ti.com>
	<CAL_Jsq+O660oV9FtthG3gTkVOhL0ku-UHSrkt-ROauu1iNpbaA@mail.gmail.com>
	<531E2C55.70702@ti.com>
	<5EE98053-31B8-4679-AAE2-4F026C61D1D4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5EE98053-31B8-4679-AAE2-4F026C61D1D4-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 11, 2014 at 9:04 AM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> On Mar 10, 2014, at 4:19 PM, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>
>>>> +  -- reg-names         : Names for the above register regions. The name to be
>>>> +                         used is as follows:
>>>> +                         - "config" : Queue configuration region.
>>>> +                         - "status" : Queue status RAM.
>>>> +                         - "region" : Descriptor memory setup region.
>>>> +                         - "push"   : Queue Management/Queue Proxy region.
>>>> +                         - "pop"    : Queue Management/Queue Proxy region.
>>>> +                         - "peek"   : Queue Peek region.
>>>
>>> reg-names should be optional. Also you have the order different from
>>> reg. Be consistent as to what is the correct order.
>>>
>> We thought of using reg-names to remove the ordering to index
>> the regs. So if we make the reg-names optional, then indexing
>> by order will be used. We can do that.
>
> We keep having this conversation, why does reg-names need to be optional for new bindings?

Because order is a fundamental part of the reg and interrupts
properties and has been since the beginning of DT. Adding auxiliary
data does not change that. We just discussed this in our weekly DT
meeting[1]. In many cases defining the order is not a burden. For the
exceptions, the binding needs to spell out why the order can't be
fixed.

Rob

[1] http://irclogs.linaro.org/meeting-logs/devicetree/2014/devicetree.2014-03-11-14.09.log.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
