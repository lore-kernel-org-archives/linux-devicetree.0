From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: Re: [PATCH 3/4] dt/bindings: Introduce the FSL QorIQ DPAA QMan
Date: Fri, 24 Oct 2014 04:53:52 -0500
Message-ID: <544A21B0.9040204@Freescale.com>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
 <1413986972-621-3-git-send-email-Emilian.Medve@Freescale.com>
 <20141022143732.GB4010@leverpostej> <54480DF8.3070604@Freescale.com>
 <20141023112628.GC13690@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141023112628.GC13690@leverpostej>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "scottwood@freescale.com" <scottwood@Freescale.com>, "galak@kernel.crashing.org" <galak@kernel.crashing.org>, "corbet@lwn.net" <corbet@lwn.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Pawel Moll <Pawel.Moll@arm.com>, "Geoff.Thorpe@freescale.com" <Geoff.Thorpe@Freescale.com>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,


On 10/23/2014 06:26 AM, Mark Rutland wrote:
>>>> +- clocks
>>>> +	Usage:		See clock-bindings.txt and qoriq-clock.txt
>>>> +	Value type:	<prop-encoded-array>
>>>> +	Definition:	Half of the platform clock
>>>> +
>>>
>>> I don't understand the description here. What is the clock from the PoV
>>> of the QMan? Which input line on the QMan is this clock attached to?
>>>
>>> Is there only one clock input? Or jsut one that you need to manage at
>>> the moment?
>>
>> As part of the programming model (QoS features specifically) QMan needs
>> to know its clock speed. Prior to the existence of the
>> clock-bindings.txt, a "static" clock-frequency property was/is used
>> convey such information. Using clock-binding.txt to describe the
>> clocking hierarchy in the SoC makes it easier with DFS, power
>> management, etc.
> 
> Ok. My concern is the phrase "Half of the platform clock" is meaingless.
> The property contains a phandle + clock-specifier pair that describe a
> single input clock by reference (some bindings just say "clock
> reference" for that, which is fine). This is not "half" of any
> particular clock.
> 
> The description of the clock should describe what it logically is from
> the PoV of the consumer (i.e. _this_ device) rather than the provider.
> To me "platform clock" sounds like a description of the provider. Is
> there a name for the clock input line on this device?
> 
> Is there only a single clock input? Or just one that you care about at
> the moment?

This is the reference clock for QMan and is the only input clock. It's
derived form the platform PLL/clock and its frequency/speed is half of
the platform PLL. I'll update its description


Cheers,
