From: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: iio: Add max961x
Date: Fri, 24 Feb 2017 16:50:44 +0100
Message-ID: <a489f2fc-4d15-42cc-fdcc-b41f60b4638a@jmondi.org>
References: <1487948756-25172-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487948756-25172-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWjtRZpjGi8BPkDGKGPr5uBr5jsjLi80COUDruZLuTXfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWjtRZpjGi8BPkDGKGPr5uBr5jsjLi80COUDruZLuTXfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 24/02/2017 16:29, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> [fixed Peter Meerwald's address]
>
> On Fri, Feb 24, 2017 at 4:05 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
>> Add device tree bindings documentation for Maxim max961x current sense
>> amplifier.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/adc/max961x.txt        | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/max961x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/max961x.txt b/Documentation/devicetree/bindings/iio/adc/max961x.txt
>> new file mode 100644
>> index 0000000..abbc6c4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/max961x.txt
>> @@ -0,0 +1,27 @@
>> +* Maxim max9611/max9612 current sense amplifier with 12-bits ADC interface
>> +
>> +Maxim max9611/max9612 is an high-side current sense amplifier with integrated
>> +12-bits ADC communicating over I2c bus.
>> +The device node for this driver shall be a child of a I2c controller.
>> +
>> +Required properties
>> +  - compatible: Should be "maxim,max961x"
>
> I'ts not a good idea to use wildcards in compatible values.
> Ask yourself: is this valid for any (future) value of "x"?
>

I suspect you already know the answer here :)

> Hence please use "maxim,max9611" or "maxim,max9612".
> The only difference between these two is a noninverting vs. inverting
> input-to-output configuration. Does the driver need to care?

No, not right now, as the inverting/non-inverting output is on the 
op-amp/comparator side, which is currently not supported by this driver.

Instead of using one or the other, should we use both, as long as it 
does not makes any difference from driver perspective?

Thanks
   j


>
>> +  - reg: The 7-bits long I2c address of the device
>> +  - shunt-resistor: Resistor value, in uOhm, of the current sense shunt
>> +                   resistor.
>
> shunt-resistor-micro-ohms?
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
>
