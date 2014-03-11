From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/3] soc: keystone: add QMSS driver
Date: Tue, 11 Mar 2014 09:04:24 -0500
Message-ID: <5EE98053-31B8-4679-AAE2-4F026C61D1D4@codeaurora.org>
References: <1393629520-12713-1-git-send-email-santosh.shilimkar@ti.com>	<1393629520-12713-3-git-send-email-santosh.shilimkar@ti.com> <CAL_Jsq+O660oV9FtthG3gTkVOhL0ku-UHSrkt-ROauu1iNpbaA@mail.gmail.com> <531E2C55.70702@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531E2C55.70702-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Mar 10, 2014, at 4:19 PM, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:

>>> +  -- reg-names         : Names for the above register regions. The name to be
>>> +                         used is as follows:
>>> +                         - "config" : Queue configuration region.
>>> +                         - "status" : Queue status RAM.
>>> +                         - "region" : Descriptor memory setup region.
>>> +                         - "push"   : Queue Management/Queue Proxy region.
>>> +                         - "pop"    : Queue Management/Queue Proxy region.
>>> +                         - "peek"   : Queue Peek region.
>> 
>> reg-names should be optional. Also you have the order different from
>> reg. Be consistent as to what is the correct order.
>> 
> We thought of using reg-names to remove the ordering to index
> the regs. So if we make the reg-names optional, then indexing
> by order will be used. We can do that.

We keep having this conversation, why does reg-names need to be optional for new bindings?

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
