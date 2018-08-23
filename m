From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: add DT binding for UniPhier
 MIO DMAC
Date: Thu, 23 Aug 2018 14:18:01 +0900
Message-ID: <CAK7LNAT3MufLZhFB8HDnch09WUdEcLyDCU05dTYroOwWYcx=pQ@mail.gmail.com>
References: <1534843809-4137-1-git-send-email-yamada.masahiro@socionext.com>
 <1534843809-4137-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNASr=rf_foQ7PDTNS440rx3TLuY_TBagfQ-gCHxXpFB2vw@mail.gmail.com> <CAJe_ZhdZbUa2njAvSazGzv+7UgG+QHCTS+-Y-Ckqze+pMf9KQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJe_ZhdZbUa2njAvSazGzv+7UgG+QHCTS+-Y-Ckqze+pMf9KQA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,


2018-08-21 19:44 GMT+09:00 Jassi Brar <jaswinder.singh@linaro.org>:
> On 21 August 2018 at 15:17, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> (+CC Rob, DT, LKML)
>>
>> I forgot to CC this to DT community...
>>
>>
>> 2018-08-21 18:30 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>>> The MIO DMAC (Media IO DMA Controller) is used in UniPhier LD4,
>>> Pro4, and sLD8 SoCs.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> ---
>>>
>>>  .../devicetree/bindings/dma/uniphier-mio-dmac.txt  | 28 ++++++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt b/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
>>> new file mode 100644
>>> index 0000000..a9e969e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
>>> @@ -0,0 +1,28 @@
>>> +UniPhier Media IO DMA controller
>>> +
>>> +This works as an external DMA engine for SD/eMMC controllers etc.
>>> +found in UniPhier LD4, Pro4, sLD8 SoCs.
>>> +
>>> +Required properties:
>>> +- compatible: should be "socionext,uniphier-mio-dmac".
>>> +- reg: offset and length of the register set for the device.
>>> +- interrupts: a list of interrupt specifiers associated with the DMA channels.
>>> +- clocks: a single clock specifier
>>> +- #dma-cells: should be <1>. The single cell represents the channel number.
>>> +- dma-channels: specify the number of the DMA channels. This should match to
>>> +  the number of tuples in the interrupts property.
>>> +
> Can we not infer the number of channels from interrupt tuples? After
> all the driver assumes they are same.


It would be possible to count the number of tuples
in "interrupts".



I know of_irq_count(), but I do not see any driver
in drivers/dma/ that calls it.


I guess the reason is that of_irq_count() is not exported,
so tristate drivers like this cannot use it.


I checked Documentation/devicetree/bindings/dma/,
and some controllers specify _redundant_ dma-channels property.

fsl-mxs-dma.txt
renesas,rcar-dmac.txt
renesas,usb-dmac.txt



I also see counter-implementation.


bcm2835-dma.c hard-codes the number of channels in the driver.
tegra210-adma.c associates nr_channels with compatible string.



I will wait for comments from the maintainers.

If desired, I will export of_irq_count()
and use it from my driver.



Thanks.

-- 
Best Regards
Masahiro Yamada
