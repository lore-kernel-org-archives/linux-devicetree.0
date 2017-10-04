From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH 8/9 v2] usb: usb251xb: Add max power/current dts property
 support
Date: Wed, 4 Oct 2017 10:12:51 +0200
Message-ID: <53559bc4-5faa-6797-7c12-f635049f1411@skidata.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-9-fancer.lancer@gmail.com>
 <20170920205255.5txbub3y6v6avolh@rob-hp-laptop>
 <20170920212739.GB3547@mobilestation>
 <CAL_Jsq+ftbGSQOOor_1L9NO9h7rjYm9nB26PxNOPgyHU6k3j_A@mail.gmail.com>
 <20170921171022.GA13721@mobilestation>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921171022.GA13721@mobilestation>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Sergey.Semin@t-platforms.ru, Linux USB List <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Leitner <richard.leitner@skidata.com>
List-Id: devicetree@vger.kernel.org


On 09/21/2017 07:10 PM, Serge Semin wrote:
> On Thu, Sep 21, 2017 at 11:26:04AM -0500, Rob Herring <robh@kernel.org> wrote:
>> On Wed, Sep 20, 2017 at 4:27 PM, Serge Semin <fancer.lancer@gmail.com> wrote:

...

>>> These are different parameters of the device. They got different configuration
>>> registers and descriptions:
>>> max_power* - ... This value also includes the power consumption of a
>>> permanently attached peripheral if the hub is configured as a compound
>>> device, and the embedded peripheral reports 0mA in its descriptors.
>>> max_current* - ... This value does NOT include the power consumption of a
>>> permanently attached peripheral if the hub is configured as a compound
>>> device.
>>
>> Then the names here should somehow reflect the above. Perhaps
>> "composite-current" and "hub-current" or something like that.
>>
> 
> I left the naming in accordance with the device datasheet. I thought it would be
> better since the driver user would still need to consult with the device
> documentation to properly set them. I don't really get how the difference is reflected
> with the naming declared there though. So what naming would you prefer then? Might be
> something like:
> {sp,bp}-max-total-current - for so named {sp,bp}-max-power, since it includes all the
> permanently attached peripherals.
> {sp,bp}-max-removable-current - for so named {sp,bp}-max-current, since it doesn't
> include the permanently attached peripherals.
> 
> Or is it better to leave it in compliance with the documentation naming?

I'd prefer the naming to be in accordance with the device datasheet too.
Changing it will IMHO generate avoidable misunderstandings...

But if we should go with Robs proposal please make sure the name from
the device datasheet is mentioned somewhere in the description of the
binding.

> 
>>>
>>> Additionally as you can see, they both are measured in "mA", so it isn't
>>> a real physical power.
>>
>> Well, I can't because there's no units.
>>
> 
> What this line means then?
> - sp-max-{power,current} : ... The value is given in mA in a 0 - 100 range (default is 1mA).
> - bp-max-{power,current} : ... The value is given in mA in a 0 - 510 range (default is 100mA).
> 
> Maybe I don't know something and the description line should state the units somehow
> clearer?

Append the unit to the binding name, just like in "power-on-time-ms". As
there's no "Standard Unit Suffix" for mA stated in the documentation
(Documentation/devicetree/bindings/property-units.txt) I think it should
be "-milliamp"?

regards,
Richard.L
