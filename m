From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] rtc: v3020: Add documentation for DT bindings
Date: Mon, 28 Aug 2017 13:36:21 -0500
Message-ID: <CAL_JsqLgxQ1xKg6mWHQTjq-u3ukOu7n1kwBspVnpF6XDxWpVFw@mail.gmail.com>
References: <b832db93-9885-adfe-39b4-1950851b391d@mothictech.com>
 <660fa006-4f91-2fb5-ef98-ba0482e1ecff@mothictech.com> <20170825215457.qcd5paiw5qtuybxv@rob-hp-laptop>
 <59A0A664.7040904@mothictech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59A0A664.7040904-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 25, 2017 at 5:36 PM, Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org> wrote:
> On 08/25/2017 05:54 PM, Rob Herring wrote:
>>>
>>> +
>>> +Required for MMIO connection:
>>> +  - reg : should contain registers location and length.
>>
>>
>> Looking at the datasheet, there's really no such thing. You'd have to
>> have some specialized h/w to generate the serial waveform.
>
>
> If it's MMIO attached i.e. hooked up to a single data bit on an otherwise
> multi-drop, flat addressed external bus, you do have to specify the memory
> address at which one would access the device.  Length is irrelevant, yes, as
> it has but one externally-accessible "register" in its memory map.
>
> Is there a better way to handle this sort of thing than the typical "reg"
> binding?  It certainly seems to map nicely to ioremap().

Okay, I guess you should keep that.

>>> +
>>> +Required for GPIO connection:
>>> +- emmicro,use-gpio
>>> +- cs-gpios, wr-gpios, rd-gpios, io-gpios : specify gpios connected to
>>> +  corresponding pins of the RTC
>>> +
>>> +Optional properties:
>>> +- emmicro,mmio-left-shift : data bit to which IO line is connected for
>>> MMIO
>>> +  connection (defaults to 0)
>>
>>
>> This has come up several times on RTCs (LP8841, DS1302). This really
>> looks like SPI and could probably use the spi-gpio bitbang driver.
>
>
> Indeed it is perhaps like that.
>
> This was a comparatively blind pass at DT-izing the existing driver without
> other changes.  It does work and has immediate application on a mainline'd
> DT board: Compulab CM-T3517 which is in fact what I'm porting to.
>
> I don't think you could use spi-gpio bitbang if you had it memory-mapped,
> and there are actual platforms that do this.  Some of Compulab's older PXA
> based boards appear to do it, and they are in fact the boards still using
> pdata rather than DT that caused me to keep that around when doing this.

I only meant for the GPIO based connection, that it looks like SPI bitbanging.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
