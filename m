From: "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Document the STM32 DMA bindings
Date: Thu, 8 Oct 2015 22:25:50 +0200
Message-ID: <CAOAejn0x68GaEEfTZbsi5VSJt+Um-bV2Mcmc2pxUwh5QjD=ZYw@mail.gmail.com>
References: <1444317612-818-1-git-send-email-cedric.madianga@gmail.com>
	<13614799.2Hi64P0fJ2@wuerfel>
	<CAOAejn0y+6uFbho3iv37xh6=zKevnp_6MxOEw4e9Oc4U2x_csQ@mail.gmail.com>
	<15651913.U8kb3JZ9vO@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15651913.U8kb3JZ9vO@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@arm.linux.org.uk, vinod.koul@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2015-10-08 21:26 GMT+02:00 Arnd Bergmann <arnd@arndb.de>:
> On Thursday 08 October 2015 18:01:23 M'boumba Cedric Madianga wrote:
>> Hi Arnd,
>>
>> 2015-10-08 17:43 GMT+02:00 Arnd Bergmann <arnd@arndb.de>:
>> > On Thursday 08 October 2015 17:20:09 M'boumba Cedric Madianga wrote:
>> >> +Each dmas request consists of 5 cells:
>> >> +1. A phandle pointing to the STM32 DMA controller
>> >> +2. The channel id
>> >> +3. The request line number
>> >> +4. A 32bit mask specifying the DMA channel configuration
>> >>
>> >
>> > It's fairly unusual to encode the channel id here, rather than
>> > letting the driver pick one. Is that actually required here?
>>
>> Yes it is required as in STM32 platform the channel/request DMA
>> mapping is done by hardware lines.
>> So, if one client wants to use DMA, he has to choose the correct
>> channel/request values according to the DMA mapping of his STM32
>> platform.
>
> Interesting. So you have seven channels ans seven request lines,
> with a random but fixed mapping between them?
We have eight channels and eight request lines with fixed mapping between them
Each peripheral has his channel/request combination to access to the
DMA controller.
>
> How do you know which channels are available for memory-to-memory
> transfers?
For memory-to-memory transfer we don't need any channel/request combination.
We look for any available channel in the channel list to execute our transfer.
So, as often as possible, we expect that a peripheral release his
channel after transfering data.
In that way, we always should have at least one channel available for
that kind of transfer.
>
>         Arnd

BR,
Cedric
