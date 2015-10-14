From: "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 DMA driver
Date: Wed, 14 Oct 2015 15:17:14 +0200
Message-ID: <CAOAejn2pcFSn3Hf=j6zgg6Ui6GjJZrtRch6ywByHaVLsTLMk6A@mail.gmail.com>
References: <1444745127-1105-1-git-send-email-cedric.madianga@gmail.com>
	<1444745127-1105-3-git-send-email-cedric.madianga@gmail.com>
	<561D1689.90703@linaro.org>
	<CAOAejn1N=dFZ3nQ_hNznJQX1-fkP3r=vdYuWY4OMH65PrW3xVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOAejn1N=dFZ3nQ_hNznJQX1-fkP3r=vdYuWY4OMH65PrW3xVg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, robh+dt@kernel.org, pawel.moll@arm.com, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@arm.linux.org.uk, Vinod Koul <vinod.koul@intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

>>> +
>>> +static int stm32_dma_remove(struct platform_device *pdev)
>>> +{
>>> +       struct stm32_dma_device *dmadev = platform_get_drvdata(pdev);
>>> +
>>> +       of_dma_controller_free(pdev->dev.of_node);
>>> +
>>> +       dma_async_device_unregister(&dmadev->ddev);
>>> +
>>> +       clk_disable_unprepare(dmadev->clk);
>>
>>
>> What is the purpose of disabling/unpreparing the clock here?
>> stm32_dma_alloc_chan_resources() and stm32_dma_free_chan_resources() should
>> pair up and the clock should already be stopped.

stm32_dma_remove() could be called during an on-going transfer during
module unload.
So in that case, it seems that disabling/unpreparing the clock is needed.

BR,
Cedric
