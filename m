From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 DMA driver
Date: Wed, 14 Oct 2015 16:28:23 +0100
Message-ID: <561E7497.1050105@linaro.org>
References: <1444745127-1105-1-git-send-email-cedric.madianga@gmail.com>
 <1444745127-1105-3-git-send-email-cedric.madianga@gmail.com>
 <561D1689.90703@linaro.org>
 <CAOAejn1N=dFZ3nQ_hNznJQX1-fkP3r=vdYuWY4OMH65PrW3xVg@mail.gmail.com>
 <CAOAejn2pcFSn3Hf=j6zgg6Ui6GjJZrtRch6ywByHaVLsTLMk6A@mail.gmail.com>
 <561E58AC.80207@linaro.org>
 <CAOAejn1XqvZDmCgGr5rmZoz2EzFUyxtmpSm0_atLr81rSJrEcw@mail.gmail.com>
 <561E658D.1070900@linaro.org>
 <CAOAejn1spB+BCRh9+jJtaKxEmaRc04nveF3rQEbT7kLMH0kOkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOAejn1spB+BCRh9+jJtaKxEmaRc04nveF3rQEbT7kLMH0kOkg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, robh+dt@kernel.org, pawel.moll@arm.com, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@arm.linux.org.uk, Vinod Koul <vinod.koul@intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/10/15 16:26, M'boumba Cedric Madianga wrote:
> 2015-10-14 16:24 GMT+02:00 Daniel Thompson <daniel.thompson@linaro.org>:
>>
>> Hmnnn...
>>
>> The dmaengine framework will WARN_ONCE() if an dmaengine is removed whilst
>> it is active and also works hard to ensure dmaengine modules are not removed
>> whilst there are active drivers using the framework.
>>
>> How do we get into this function whilst there is still an active DMA
>> channels?
>
> For example, when a user try "rmmod stm32-dma" in uart console.
> It will enter in stm32_dma_remove while there is potentially still active DMA.

Check dmaengine.c for yourself but I think in this case the dmaengine 
framework will hold references to the module and prevent the remove from 
taking place.


Daniel.
