From: "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Document the STM32 DMA bindings
Date: Thu, 8 Oct 2015 18:01:23 +0200
Message-ID: <CAOAejn0y+6uFbho3iv37xh6=zKevnp_6MxOEw4e9Oc4U2x_csQ@mail.gmail.com>
References: <1444317612-818-1-git-send-email-cedric.madianga@gmail.com>
	<1444317612-818-2-git-send-email-cedric.madianga@gmail.com>
	<13614799.2Hi64P0fJ2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <13614799.2Hi64P0fJ2@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, vinod.koul@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

2015-10-08 17:43 GMT+02:00 Arnd Bergmann <arnd@arndb.de>:
> On Thursday 08 October 2015 17:20:09 M'boumba Cedric Madianga wrote:
>> +Each dmas request consists of 5 cells:
>> +1. A phandle pointing to the STM32 DMA controller
>> +2. The channel id
>> +3. The request line number
>> +4. A 32bit mask specifying the DMA channel configuration
>>
>
> It's fairly unusual to encode the channel id here, rather than
> letting the driver pick one. Is that actually required here?
Yes it is required as in STM32 platform the channel/request DMA
mapping is done by hardware lines.
So, if one client wants to use DMA, he has to choose the correct
channel/request values according to the DMA mapping of his STM32
platform.

>
>         Arnd

 BR,
 Cedric
