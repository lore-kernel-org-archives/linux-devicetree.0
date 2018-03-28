From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 2/3] dt-bindings: iio: wrapper: add
 io-channel-unit-converter
Date: Wed, 28 Mar 2018 10:29:02 +0800
Message-ID: <69103fe3-c5dd-7987-abf4-8759b2219751@electromag.com.au>
References: <20180319170246.26830-1-peda@axentia.se>
 <20180319170246.26830-3-peda@axentia.se>
 <20180326222326.sxdeawy5x5bjkla4@rob-hp-laptop>
 <986a7404-e157-6a1b-0610-07d1e127465f@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <986a7404-e157-6a1b-0610-07d1e127465f@axentia.se>
Content-Language: en-AU
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/03/2018 16:01, Peter Rosin wrote:
> On 2018-03-27 00:23, Rob Herring wrote:
>> On Mon, Mar 19, 2018 at 06:02:45PM +0100, Peter Rosin wrote:
>>> Allow linear scaling and modification of the type of an io-channel.
>>>
>>> When an ADC channel measures the midpoint of a voltage divider, the
>>> interesting voltage is often the voltage over the full resistance
>>> of the divider. Likewise, measuring the voltage over a resistor is
>>> often a way to get to the current through it.
>>>
>>> This binding allows description of such hardware which is external
>>> to the ADC.
>>>

*snip*

>>> +++ b/Documentation/devicetree/bindings/iio/wrapper/io-channel-unit-converter.txt
>>> @@ -0,0 +1,84 @@
>>> +I/O channel unit converter bindings
>>> +
>>> +Allow linear scaling and modification of the type of an io-channel.
>>> +
>>> +When an ADC channel measures the midpoint of a voltage divider, the
>>> +interesting voltage is often the voltage over the full resistance
>>> +of the divider. Likewise, measuring the voltage over a resistor is
>>> +often a way to get to the current through it.
>>> +
>>> +Required properties:
>>> +- compatible : "io-channel-unit-converter"
>> Would this apply to something besides ADCs?
> Not that I can think of. At the moment.
> 

I like the concept. I can think of use case on my end to set a RADC (digital pot)
to set a threshold voltage. Being able to define the hardware scaling in the dt would be nice.
Which would allow all the hardware definition to be in the dt which would nice.
So this would be voltage -> resistance.

Setting a DAC voltage to set output current is also a distinct possibility.


-- 
Regards
Phil Reid
