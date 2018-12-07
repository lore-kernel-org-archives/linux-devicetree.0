Return-Path: <SRS0=BW64=OQ=mentor.com=Vladimir_Zapolskiy@kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: sc16is7xx: Add alternative
 clock-frequence property
References: <20181205141133.9305-1-andriy.shevchenko@linux.intel.com>
 <ff94d003-6636-169b-7a89-fdc4bf9c39b5@mentor.com>
 <20181207134844.GH10650@smile.fi.intel.com>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <720a0834-c0a5-6fe6-3907-8811b2f0d315@mentor.com>
Date: Fri, 7 Dec 2018 18:05:14 +0200
MIME-Version: 1.0
In-Reply-To: <20181207134844.GH10650@smile.fi.intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, Georgii Staroselskii <georgii.staroselskii@emlid.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12/07/2018 03:48 PM, Andy Shevchenko wrote:
> On Fri, Dec 07, 2018 at 10:18:26AM +0200, Vladimir Zapolskiy wrote:
>> Hi Andy,
>>
>> On 12/05/2018 04:11 PM, Andy Shevchenko wrote:
>>> For the platforms which have no clock provider for the sc16is7xx type of UART,
>>> introduce an alternative clock-frequency property which would be used instead.
>>
>> the subject has a typo in 'clock-frequence', then can you please tell me more,
>> how is it possible that an SC16IS7xx IC has no clock provider connected to it?
> 
> I better ask Grigorii about this, since I have no hardware at my possession.
> 
>> And if there is one, then please just describe it in device tree as well.
> 
> Tell me how to do this for ACPI?
> 

I didn't grasp the connection between your update of IC device tree bindings
and ACPI, please elaborate in the context of updating device tree bindings
documentation and supported properties.

I do care about purity of device tree bindings of SC16IS7xx IC, which is
found on some of my boards with description in DTB, that's why I object to
this series.

>>
>>>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>  Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
>>> index e7921a8e276b..b8cf38a1e43c 100644
>>> --- a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
>>> +++ b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
>>> @@ -12,6 +12,8 @@ Required properties:
>>>  - reg: I2C address of the SC16IS7xx device.
>>>  - interrupts: Should contain the UART interrupt
>>>  - clocks: Reference to the IC source clock.
>>> +	OR
>>> +- clock-frequency: The source clock frequency for the IC.
>>>  
>>
>> I strongly dislike this change, I'm inclined to cast a NAK to the series.
> 
> To be productive, please propose the alternative, otherwise your NAK is nothing
> to do with a real hardware and approach I proposed.

As I've said 'clock-frequency' property is not a hardware property of SC16IS7xx
IC, it is a hardware property of some external hardware component, it may
provide a volatile clock rate, which you miss, and it should be described
separately in DT.

The current approach with 'clocks' property addresses all cases perfectly,
even if your change is an attempt to solve some actual problem, you haven't
managed to describe it in the commit message.

NAK for the added property, which makes obtaining of the clock supplier
frequency equivocal.

>>
>> 1. 'clock-frequency' is a very specific device tree property, in my opinion
>>     its presence is justified on sort of clock provider devices only (like I2C
>>     controllers), unfortunately the property was added to a number of device
>>     tree bindings improperly, mainly it was done before introduction of
>>     "assigned-clocks" and "assigned-clock-parents" properties in CCF, and then
>>     it was blindly copied.
> 
> OK, I will wait for your patch to remove such from, for example, 8250_dw.c
> where same problem had been targeted in the same way.

I'm not interested to fix legacy device tree binding issues added in 2011,
equally I'm not going to close my eyes on right the same issues, when someone
attempts to spread them further today.

>>
>> 2. SC16IS7xx type of UARTs is a regular clock consumer, ICs always have a valid
>>    clock provider connected to XTAL1 (and XTAL2 in case of a connected
>>    crystal oscillator), thus, if needed, the driver can get input clock rate
>>    by calling standard clk_get_rate(), so the presence of the required 'clocks'
>>    property is sufficient.
> 
> So what?
> There is a hardware, there is a clock provider hidden in it. How you would
> describe it? Platform data? Why?
> 

What do you mean by 'hardware'? PCB, SC16IS7xx IC or something else?

What do you mean by 'a clock provider hidden in it'?

Please find the hidden clock provided and describe it in a proper way, for DTS
changes please reference to Documentation/devicetree/bindings/clock contents.

>> 3. In some very specific corner cases it might be needed to add another
>>    "assigned-clocks" and "assigned-clock-parents" properties to a particular
>>    device node on a particular board, but their explicit description in device
>>    tree bindings is not needed.
> 
> Can DT people once in life think outside the box?!
> 

The rhetorical question doesn't sound like a nice supporting argument of
your change.

Please don't slip into arrogance, and please concentrate on technical aspects.

NAK to the change.

--
Best wishes,
Vladimir
