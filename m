From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/14] dmaengine: dma-jz4780: Avoid hardcoding number of
 channels
Date: Sat, 07 Jul 2018 13:01:21 +0200
Message-ID: <1530961282.2380.0@smtp.crapouillou.net>
References: <20180703123214.23090-1-paul@crapouillou.net>
        <20180703123214.23090-2-paul@crapouillou.net>
        <CANc+2y4ZJDKou4x570zNv82fSAxiOpbZfd3rFNB2M5Ft1C3eiQ@mail.gmail.com>
        <1530815198.6642.1@smtp.crapouillou.net>
        <CANc+2y5wkp2mHb+Z=Rh332uY+ixhUxbM3EM3HEs-fq5efa+msQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANc+2y5wkp2mHb+Z=Rh332uY+ixhUxbM3EM3HEs-fq5efa+msQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org



Le sam. 7 juil. 2018 =E0 9:34, PrasannaKumar Muralidharan=20
<prasannatsmkumar@gmail.com> a =E9crit :
> On 5 July 2018 at 23:56, Paul Cercueil <paul@crapouillou.net> wrote:
>>  Hi PrasannaKumar,
>>=20
>>=20
>>>  Hi Paul,
>>>=20
>>>  On 3 July 2018 at 18:02, Paul Cercueil <paul@crapouillou.net>=20
>>> wrote:
>>>>=20
>>>>   As part of the work to support various other Ingenic JZ47xx SoC
>>>>  versions,
>>>>   which don't feature the same number of DMA channels per core, we=20
>>>> now
>>>>   deduce the number of DMA channels available from the devicetree
>>>>   compatible string.
>>>>=20
>>>>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>   ---
>>>>    drivers/dma/dma-jz4780.c | 53=20
>>>> +++++++++++++++++++++++++++++-----------
>>>>    1 file changed, 39 insertions(+), 14 deletions(-)
>>>>=20
>>>>   diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
>>>>   index 85820a2d69d4..b40f491f0367 100644
>>>>   --- a/drivers/dma/dma-jz4780.c
>>>>   +++ b/drivers/dma/dma-jz4780.c
>>>>   @@ -16,6 +16,7 @@
>>>>    #include <linux/interrupt.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/of.h>
>>>>   +#include <linux/of_device.h>
>>>>    #include <linux/of_dma.h>
>>>>    #include <linux/platform_device.h>
>>>>    #include <linux/slab.h>
>>>>   @@ -23,8 +24,6 @@
>>>>    #include "dmaengine.h"
>>>>    #include "virt-dma.h"
>>>>=20
>>>>   -#define JZ_DMA_NR_CHANNELS     32
>>>>   -
>>>>    /* Global registers. */
>>>>    #define JZ_DMA_REG_DMAC                0x1000
>>>>    #define JZ_DMA_REG_DIRQP       0x1004
>>>>   @@ -135,14 +134,20 @@ struct jz4780_dma_chan {
>>>>           unsigned int curr_hwdesc;
>>>>    };
>>>>=20
>>>>   +enum jz_version {
>>>>   +       ID_JZ4780,
>>>>   +};
>>>>   +
>>>>    struct jz4780_dma_dev {
>>>>           struct dma_device dma_device;
>>>>           void __iomem *base;
>>>>           struct clk *clk;
>>>>           unsigned int irq;
>>>>   +       unsigned int nb_channels;
>>>>   +       enum jz_version version;
>>>>=20
>>>>           uint32_t chan_reserved;
>>>>   -       struct jz4780_dma_chan chan[JZ_DMA_NR_CHANNELS];
>>>>   +       struct jz4780_dma_chan chan[];
>>>=20
>>>=20
>>>  Looks like a variable length array in struct. I think there is some
>>>  effort to remove the usage of VLA. Can you revisit this? I may be
>>>  wrong, please feel free to correct.
>>=20
>>=20
>>  Are you sure? It's the first time I hear about it.
>>  Could anybody confirm?
>=20
> Please see [1] for info.
>=20
> Variable Length Arrays in struct is expressly forbidden in C99, C11.
> Clang does not support it. To make kernel compile with Clang few
> people are trying to remove/reduce VLAIS usage.
>=20
> 1.=20
> https://blog.linuxplumbersconf.org/2013/ocw/system/presentations/1221/ori=
ginal/VLAIS.pdf

I read it, and my structure is not a VLAIS; my "chan" array is a=20
flexible
array, its sizeof() is 0, so the sizeof() of the structure is constant.

See page 6 of the PDF, about alternatives to VLAIS:
"If possible use a flexible array member and move the array to the end=20
of
the struct"
Which is what I am doing here.

-Paul
=
