From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: iio: Add max961x
Date: Fri, 24 Feb 2017 16:33:16 +0100
Message-ID: <64ed3cde-7627-eb60-c507-b68447012502@metafoo.de>
References: <1487948756-25172-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487948756-25172-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdU9UL9ZyiPJqtTTNS=KOScu6M3c7jQgD1vZ+gTiTCAYMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdU9UL9ZyiPJqtTTNS=KOScu6M3c7jQgD1vZ+gTiTCAYMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, meerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/24/2017 04:22 PM, Geert Uytterhoeven wrote:
> On Fri, Feb 24, 2017 at 4:05 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
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
>> +  - reg: The 7-bits long I2c address of the device
>> +  - shunt-resistor: Resistor value, in uOhm, of the current sense shunt
>> +                   resistor.
> 
> shunt-resistor-micro-ohms?

I'll take this one further:

maxim,shunt-resistor-micro-ohms?

Although there is precedence for just 'shunt-resistor' in the ina2xx bindings.
