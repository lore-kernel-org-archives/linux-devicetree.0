From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: mcp23s08: Add option to configure pullups.
Date: Wed, 26 Oct 2016 11:59:14 +0200
Message-ID: <CAFqH_53SSctH9Ms-0Zm5fhEgMtkWq_SP9VChY-QYV-qDLLj_WA@mail.gmail.com>
References: <1477062035-30825-1-git-send-email-enric.balletbo@collabora.com>
 <CACRpkdY15Hv_ydHyOXRM6G0ewVTHkVa1w3Z89AdvSDR=eyi7sQ@mail.gmail.com> <11644726.TmP4uu3h4l@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11644726.TmP4uu3h4l@ws-stein>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

2016-10-24 8:13 GMT+02:00 Alexander Stein
<alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>:
> On Monday 24 October 2016 02:53:31, Linus Walleij wrote:
>> On Fri, Oct 21, 2016 at 5:00 PM, Enric Balletbo i Serra
>>
>> <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>> > Default is without pullups, but if property is specified in DT and the bit
>> > is set, set a pullup on GPIO-n.
>> >
>> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>
>> I don't generally like this.
>>

I tried to use the same approach as used in gpio-twl4030.c because is
what I knew before. Maybe you can point me to a better approach?

>> In device tree it is the consumer that specifies how the line is used,
>> not the producer (gpiochip).
>>
>> We currently only specify polarity, open drain and open source
>> for consumers though.
>>
>> And the entire pin control system came into being *exactly* because
>> Grant didn't like me adding these things to the GPIO drivers.
>>
>> So how many other things does the MCP support? Drive strength?
>> Schmitt trigger? Is there a datasheet?
>
> Some unsupported features (AFAIK):
> * Input polarity (IPOL register)
> * open-drain interrupt pin
> * pullup on pins (proposed patch)
>
> Datasheet is here: http://ww1.microchip.com/downloads/en/DeviceDoc/21919e.pdf
>
> Best regards,
> Alexander
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
