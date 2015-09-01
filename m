From: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC 0/4] of: introduce of_dev_get_platdata()
Date: Tue, 1 Sep 2015 10:23:56 +0900
Message-ID: <55E4FE2C.4040409@ti.com>
References: <1440753128-3288-1-git-send-email-milo.kim@ti.com>
 <CAL_JsqKH2_w2E9zAA=aJ3q+p4zr88Q6KMS1U-sWdw3JUndUnEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKH2_w2E9zAA=aJ3q+p4zr88Q6KMS1U-sWdw3JUndUnEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 8/28/2015 9:59 PM, Rob Herring wrote:
> On Fri, Aug 28, 2015 at 4:12 AM, Milo Kim<milo.kim-l0cyMroinI0@public.gmane.org>  wrote:
>> >New function, 'of_dev_get_platdata()'
>> >  - provides unified handling of getting device platform data
>> >  - supports DT and non-DT(legacy) cases
>> >  - removes duplicated code from each driver
>> >  - keeps driver specific code simple in each driver
> This works in cases where DT data and platform_data are aligned. In
> many cases they are not. A common binding problem is people blindly
> copying platform_data fields to DT properties for things that are not
> h/w properties. I worry that this would encourage this behavior.

OK, got your point. Thanks.

>
> We already have a generalized method for retrieving properties
> independent of DT or ACPI. There's no reason this couldn't be extended
> to retrieve properties out of platform_data using the same interface.
>
> Also, perhaps in some drivers we can remove platform_data now if all
> users are converted to DT.

This work requires two steps.
1) remove platform data configuration from board-*.c
2) if all host/platform support only the DT, then move device platform 
data structure in a header to each driver space.

However, I'm concerning about some use case.
After this cleanup, drivers may not work properly in some platforms 
which do not support the DT. There is no way to configure HW properties.
Drivers should run on any kind of hosts(processors) so I'm thinking 
about the compatibility/dependency issue. Am I missing something?

Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
