From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 2/5] ARM: davinci: da8xx: Add CFGCHIP syscon platform
 declaration.
Date: Fri, 24 Jun 2016 11:45:05 +0530
Message-ID: <576CCFE9.7020005@ti.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <1462837612-7803-3-git-send-email-david@lechnology.com>
 <7e0373cf-2ae9-e205-2226-0ded6894b709@cogentembedded.com>
 <57320FE6.60003@lechnology.com> <5745893C.5040603@ti.com>
 <576AC5CD.2010107@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <576AC5CD.2010107-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 22 June 2016 10:37 PM, David Lechner wrote:
> On 05/25/2016 06:15 AM, Sekhar Nori wrote:
>> On Tuesday 10 May 2016 10:14 PM, David Lechner wrote:
>>> On 05/10/2016 06:26 AM, Sergei Shtylyov wrote:
>>>> On 5/10/2016 2:46 AM, David Lechner wrote:

[...]

>>>>> +static struct platform_device da8xx_cfgchip_device = {
>>>>> +    .name    = "syscon",
>>>>> +    .id    = 0,
>>>>
>>>>      Again, -1.
>>>>
>>>> [...]
>>>>
>>>> MBR, Sergei
>>>>
>>>
>>> I wish you would have noticed this when I first submitted it. I remember
>>> going back and forth about this. But it has been too long and I can't
>>> remember the reason why I chose to go this way.
>>>
>>> It seems like changing it broke something with either this one or the
>>> phy device and I opted to keep it this way on both to be consistent. For
>>> example, the USB devices both use id = 0 as well even though there are
>>> only one of each type.
>>
>> Agree with Sergei here. Can you confirm what broke exactly? I think the
>> USB needs to be fixed too.
>>
>> Thanks,
>> Sekhar
>>
> 
> I have made the changes from id = 0 to id = -1. I'm not sure what broke
> before, but it is working now.

Thanks!

> 
> Re: USB needing fixed, I'm not sure how to do this and I won't have time
> for at least the next 2 or 3 months to do anything about it. The problem
> is that the MUSB can't detect the ID pin. As a workaround, it is
> detecting the VBUS state and using that to determine the ID pin state.
> So, when you attach a self-powered device, it tells the VBUS to turn
> off, which in turn triggers the workaround to say that the ID pin has
> changed state.

I seem to be missing the original problem report. Can you provide a link
to the discussion?

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
