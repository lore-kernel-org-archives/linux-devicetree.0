From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] Documentation: dt-bindings: iio: Add max9611 ADC
Date: Sat, 8 Apr 2017 16:59:39 +0100
Message-ID: <e7a53314-2e57-ae3a-af53-0d22ab445f5a@kernel.org>
References: <1491488454-22468-1-git-send-email-jacopo+renesas@jmondi.org>
 <1491488454-22468-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUNWJ2C9b9Xzod5HRU_ZG3mVamN6a-ZdOywODJqv6TxQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUNWJ2C9b9Xzod5HRU_ZG3mVamN6a-ZdOywODJqv6TxQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/04/17 15:43, Geert Uytterhoeven wrote:

> On Thu, Apr 6, 2017 at 4:20 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/max9611.txt
>> @@ -0,0 +1,27 @@
>> +* Maxim max9611/max9612 current sense amplifier with 12-bits ADC interface
>> +
>> +Maxim max9611/max9612 is an high-side current sense amplifier with integrated
>> +12-bits ADC communicating over I2c bus.
>> +The device node for this driver shall be a child of a I2c controller.
>> +
>> +Required properties
>> +  - compatible: Should be "maxim,max9611" or "maxim,max9612"
>> +  - reg: The 7-bits long I2c address of the device
>> +  - shunt-resistor-micro-homs: Value, in micro Ohms, of the current sense shunt
> 
> s/homs/ohms/
I'll fix the title as Rob requested and this.  

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks for your hard work on this one!

Jonathan
> 
>> +                               resistor
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
