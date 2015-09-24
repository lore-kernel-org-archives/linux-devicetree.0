From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v2 5/9] ARM: dts: Move all Cygnus peripherals into soc bus
Date: Wed, 23 Sep 2015 22:54:40 -0700
Message-ID: <56039020.4060300@broadcom.com>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com>
 <1929872.EmD9YkfFuv@wuerfel> <55FC8C0F.9020308@broadcom.com>
 <1969821.ZhaOpCV2D1@wuerfel> <56031FD6.3070306@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56031FD6.3070306@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org



On 9/23/2015 2:55 PM, Ray Jui wrote:
> 
> 
> On 9/23/2015 2:29 PM, Arnd Bergmann wrote:
>> On Friday 18 September 2015 15:11:27 Ray Jui wrote:
>>> On 9/18/2015 2:34 PM, Arnd Bergmann wrote:
>>>> On Friday 18 September 2015 14:24:10 Ray Jui wrote:
>>>>> +       soc {
>>>>> +               compatible = "simple-bus";
>>>>> +               ranges;
>>>>> +               #address-cells = <1>;
>>>>> +               #size-cells = <1>;
>>>>
>>>>> +               pinctrl: pinctrl@0301d0c8 {
>>>>>
>>>>
>>>> Similarly to the core bus, this seems to have address ranges 0x03xxxxxx and
>>>> 0x18xxxxxx on it, so put those into the ranges.
>>>>
>>>
>>> Okay we have an issue here. For whatever reason, the Cygnus ASIC team
>>> decided to put registers for the same block in random locations. We see
>>> similar issues in all of our other iProc based SoCs. We have
>>> communicated this to our ASIC team, and hopefully they can revert the
>>> trend for the next SoC.
>>>
>>> For example, the gpio_ccm has registers in the following regions:
>>>
>>> gpio_ccm: gpio@1800a000 {
>>>     compatible = "brcm,cygnus-ccm-gpio";
>>>     reg = <0x1800a000 0x50>,
>>>           <0x0301d164 0x20>;
>>>
>>> NAND is worse, it has registers in 3 different separate regions:
>>>
>>> nand: nand@18046000 {
>>>     compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1",
>>>                  "brcm,brcmnand";
>>>     reg = <0x18046000 0x600>, <0xf8105408 0x600>,
>>>           <0x18046f00 0x20>;
>>>
>>> As you can see, this makes it impossible to define a proper address
>>> range for the bus; therefore, I'll have to keep the ranges undefined and
>>> a simple 1:1 mapping under this bus.
>>
>> Hmm, you could still try to list them as non-overlapping with other
>> buses on the root node like
>>
>> 	ranges = <0x03000000 0x03000000 0x01000000>,
>> 		 <0x18000000 0x18000000 0x01000000>,
>> 		 <0xf8000000 0xf8000000 0x01000000>;
>>
>> which clarifies how the bus is wired up in hardware.
>>
>> Alternatively, you could make a more elaborate mapping, if there
>> are in fact multiple hardware ranges, like
>>
>> 	#address-cells = <2>; # space:offset
>> 	ranges = <1 0  0x03000000 0x01000000>,
>> 		 <2 0  0x18000000 0x01000000>,
>> 		 <3 0  0xf8000000 0x01000000>;
>>
>> It really depends on what the hardware designers were thinking. If
>> the AXI bus actually decodes the entire 32-bit address range and devices
>> are just located at random addresses in there, your current scheme is
>> probably closest to reality.
>>
> 
> I see. Let me talk to our ASIC team to get this clarified. If in the end
> the AXI bus decodes the entire 32-bit address space, no change will be
> made. Otherwise, I'll submit another patch to list the actual address
> space that the AXI bus decodes.
> 
> Thanks for the review. It's very helpful!
> 
> Ray
> 

I just got feedback from our ASIC team. The NIC-301 is the main AXI
fabric that decodes the entire 32-bit address space on Cygnus.

I'll keep this as it is for now.

Thanks,

Ray
