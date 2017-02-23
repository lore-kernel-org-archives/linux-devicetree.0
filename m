From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH] of: Mark property::value as const
Date: Thu, 23 Feb 2017 15:23:19 -0800
Message-ID: <58AF6EE7.5050008@gmail.com>
References: <20170214025040.23955-1-stephen.boyd@linaro.org>
 <58AF3E06.4030701@gmail.com> <58AF4D03.7020908@gmail.com>
 <CAL_Jsq+OQgmqvHQ_AWXOqnK0Yh8T3EVyxyiTFk1+0AwNHCf+Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+OQgmqvHQ_AWXOqnK0Yh8T3EVyxyiTFk1+0AwNHCf+Ag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/23/17 14:09, Rob Herring wrote:
> On Thu, Feb 23, 2017 at 2:58 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 02/23/17 11:54, Frank Rowand wrote:
>>> On 02/13/17 18:50, Stephen Boyd wrote:
>>>> The 'blob' we pass into populate_properties() is marked as const,
>>>> but we cast that const away when we assign the result of
>>>> fdt_getprop_by_offset() to pp->value. Let's mark value as const
>>>> instead, so that code can't mistakenly write to the value of the
>>>> property that we've so far advertised as const.
>>>>
>>>> Unfortunately, this exposes a problem with the fdt resolver code,
>>>> where we overwrite the value member of properties of phandles to
>>>> update them with their final value. Add a comment for now to
>>>> indicate where we're potentially writing over const data.
>>>
>>> The resolver should not be over writing anything in the FDT.  I'll
>>> look at what is going on there.
>>>
>>> The FDT we expose to user space should be the FDT we booted with,
>>> not something later modified.
>>
>> It seems that /sys/firmware/fdt is not documented.  I'll look into
>> fixing that.
> 
> That's because the "official" interface is /proc/device-tree/ which is
> now a symlink. IIRC, it is documented to use /proc/device-tree, not
> the sysfs path.
> 
> Rob
> .
> 


Documentation/ABI/testing/sysfs-firmware-ofw describes
/sys/firmware/devicetree/* but not /sys/firmware/fdt


It also describes the /proc/device-tree symlink to
/sys/firmware/devicetree/base as the official
stable ABI, as you mentioned.

So it is just fdt that I have not found the documentation
for.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
