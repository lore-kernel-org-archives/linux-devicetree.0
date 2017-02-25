From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: iio: Add max961x
Date: Sat, 25 Feb 2017 15:19:20 +0000
Message-ID: <a0217564-0730-16f2-491f-86ea3561dc2e@kernel.org>
References: <1487948756-25172-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487948756-25172-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdU9UL9ZyiPJqtTTNS=KOScu6M3c7jQgD1vZ+gTiTCAYMA@mail.gmail.com>
 <64ed3cde-7627-eb60-c507-b68447012502@metafoo.de>
 <a67f7cf1-b676-5306-9e3d-4768a6e53357@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <a67f7cf1-b676-5306-9e3d-4768a6e53357@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Lars-Peter Clausen <lars@metafoo.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hartmut Knaack <knaack.h@gmx.de>, meerw@pmeerw.net, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 24/02/17 15:48, jacopo mondi wrote:
> Hi Lars-Peter,
> 
> On 24/02/2017 16:33, Lars-Peter Clausen wrote:
>> On 02/24/2017 04:22 PM, Geert Uytterhoeven wrote:
>>> On Fri, Feb 24, 2017 at 4:05 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/iio/adc/max961x.txt
>>>> @@ -0,0 +1,27 @@
>>>> +* Maxim max9611/max9612 current sense amplifier with 12-bits ADC interface
>>>> +
>>>> +Maxim max9611/max9612 is an high-side current sense amplifier with integrated
>>>> +12-bits ADC communicating over I2c bus.
>>>> +The device node for this driver shall be a child of a I2c controller.
>>>> +
>>>> +Required properties
>>>> +  - compatible: Should be "maxim,max961x"
>>>> +  - reg: The 7-bits long I2c address of the device
>>>> +  - shunt-resistor: Resistor value, in uOhm, of the current sense shunt
>>>> +                   resistor.
>>>
>>> shunt-resistor-micro-ohms?
>>
>> I'll take this one further:
>>
>> maxim,shunt-resistor-micro-ohms?
>>
>> Although there is precedence for just 'shunt-resistor' in the ina2xx bindings.
>>
> 
> And that's where I took "inspiration" from :)
Which raises another open question.  Why IIO rather than hwmon like the ina2xx?

cc'd Guenter and hwmon list.

I don't typically have strong opinions on this but best to make sure everyone
is happy.  Always best to layout your thinking on this in the cover letter.

I'll raise it there as well but came to mind when seeing the ina2xx reference
here.

Whether we are better going for the existing binding without units, or
'fixing' that is a question for the device tree maintainers.  I guess that
one snuck through.

Jonathan
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
