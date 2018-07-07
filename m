From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: Re: [PATCH 01/14] dmaengine: dma-jz4780: Avoid hardcoding number of channels
Date: Sat, 7 Jul 2018 13:04:40 +0530
Message-ID: <CANc+2y5wkp2mHb+Z=Rh332uY+ixhUxbM3EM3HEs-fq5efa+msQ@mail.gmail.com>
References: <20180703123214.23090-1-paul@crapouillou.net> <20180703123214.23090-2-paul@crapouillou.net>
 <CANc+2y4ZJDKou4x570zNv82fSAxiOpbZfd3rFNB2M5Ft1C3eiQ@mail.gmail.com> <1530815198.6642.1@smtp.crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530815198.6642.1@smtp.crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On 5 July 2018 at 23:56, Paul Cercueil <paul@crapouillou.net> wrote:
> Hi PrasannaKumar,
>
>
>> Hi Paul,
>>
>> On 3 July 2018 at 18:02, Paul Cercueil <paul@crapouillou.net> wrote:
>>>
>>>  As part of the work to support various other Ingenic JZ47xx SoC
>>> versions,
>>>  which don't feature the same number of DMA channels per core, we now
>>>  deduce the number of DMA channels available from the devicetree
>>>  compatible string.
>>>
>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>  ---
>>>   drivers/dma/dma-jz4780.c | 53 +++++++++++++++++++++++++++++-----------
>>>   1 file changed, 39 insertions(+), 14 deletions(-)
>>>
>>>  diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
>>>  index 85820a2d69d4..b40f491f0367 100644
>>>  --- a/drivers/dma/dma-jz4780.c
>>>  +++ b/drivers/dma/dma-jz4780.c
>>>  @@ -16,6 +16,7 @@
>>>   #include <linux/interrupt.h>
>>>   #include <linux/module.h>
>>>   #include <linux/of.h>
>>>  +#include <linux/of_device.h>
>>>   #include <linux/of_dma.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/slab.h>
>>>  @@ -23,8 +24,6 @@
>>>   #include "dmaengine.h"
>>>   #include "virt-dma.h"
>>>
>>>  -#define JZ_DMA_NR_CHANNELS     32
>>>  -
>>>   /* Global registers. */
>>>   #define JZ_DMA_REG_DMAC                0x1000
>>>   #define JZ_DMA_REG_DIRQP       0x1004
>>>  @@ -135,14 +134,20 @@ struct jz4780_dma_chan {
>>>          unsigned int curr_hwdesc;
>>>   };
>>>
>>>  +enum jz_version {
>>>  +       ID_JZ4780,
>>>  +};
>>>  +
>>>   struct jz4780_dma_dev {
>>>          struct dma_device dma_device;
>>>          void __iomem *base;
>>>          struct clk *clk;
>>>          unsigned int irq;
>>>  +       unsigned int nb_channels;
>>>  +       enum jz_version version;
>>>
>>>          uint32_t chan_reserved;
>>>  -       struct jz4780_dma_chan chan[JZ_DMA_NR_CHANNELS];
>>>  +       struct jz4780_dma_chan chan[];
>>
>>
>> Looks like a variable length array in struct. I think there is some
>> effort to remove the usage of VLA. Can you revisit this? I may be
>> wrong, please feel free to correct.
>
>
> Are you sure? It's the first time I hear about it.
> Could anybody confirm?

Please see [1] for info.

Variable Length Arrays in struct is expressly forbidden in C99, C11.
Clang does not support it. To make kernel compile with Clang few
people are trying to remove/reduce VLAIS usage.

1. https://blog.linuxplumbersconf.org/2013/ocw/system/presentations/1221/original/VLAIS.pdf
