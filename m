From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: iio: Add max961x
Date: Sat, 25 Feb 2017 16:34:27 +0100
Message-ID: <CAMuHMdUzT5gSoXEyDeaKSdKBaT4jEVCKOSChxdR0bbniaz_qvA@mail.gmail.com>
References: <1487948756-25172-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487948756-25172-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdU9UL9ZyiPJqtTTNS=KOScu6M3c7jQgD1vZ+gTiTCAYMA@mail.gmail.com>
 <64ed3cde-7627-eb60-c507-b68447012502@metafoo.de> <a67f7cf1-b676-5306-9e3d-4768a6e53357@jmondi.org>
 <a0217564-0730-16f2-491f-86ea3561dc2e@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a0217564-0730-16f2-491f-86ea3561dc2e-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, meerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On Sat, Feb 25, 2017 at 4:19 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 24/02/17 15:48, jacopo mondi wrote:
>> On 24/02/2017 16:33, Lars-Peter Clausen wrote:
>>> On 02/24/2017 04:22 PM, Geert Uytterhoeven wrote:
>>>> On Fri, Feb 24, 2017 at 4:05 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/iio/adc/max961x.txt
>>>>> @@ -0,0 +1,27 @@
>>>>> +* Maxim max9611/max9612 current sense amplifier with 12-bits ADC interface
>>>>> +
>>>>> +Maxim max9611/max9612 is an high-side current sense amplifier with integrated
>>>>> +12-bits ADC communicating over I2c bus.
>>>>> +The device node for this driver shall be a child of a I2c controller.
>>>>> +
>>>>> +Required properties
>>>>> +  - compatible: Should be "maxim,max961x"
>>>>> +  - reg: The 7-bits long I2c address of the device
>>>>> +  - shunt-resistor: Resistor value, in uOhm, of the current sense shunt
>>>>> +                   resistor.
>>>>
>>>> shunt-resistor-micro-ohms?
>>>
>>> I'll take this one further:
>>>
>>> maxim,shunt-resistor-micro-ohms?
>>>
>>> Although there is precedence for just 'shunt-resistor' in the ina2xx bindings.
>>>
>>
>> And that's where I took "inspiration" from :)
> Which raises another open question.  Why IIO rather than hwmon like the ina2xx?

Actually we have both drivers/hwmon/ina2xx.c and drivers/iio/adc/ina2xx-adc.c.

> Whether we are better going for the existing binding without units, or
> 'fixing' that is a question for the device tree maintainers.  I guess that
> one snuck through.

ltc4151 uses shunt-resistor-micro-ohms.
sgtl5000 uses micbias-resistor-k-ohms.

So there's precedence for everything ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
