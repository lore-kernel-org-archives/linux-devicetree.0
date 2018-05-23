MIME-Version: 1.0
In-Reply-To: <DB6PR0401MB25031C2EFE66E0D90931C4F6E2950@DB6PR0401MB2503.eurprd04.prod.outlook.com>
References: <20180514120307.15592-1-wen.he_1@nxp.com>
	<20180514120307.15592-3-wen.he_1@nxp.com>
	<20180518212605.GA1119@rob-hp-laptop>
	<DB6PR0401MB25031C2EFE66E0D90931C4F6E2950@DB6PR0401MB2503.eurprd04.prod.outlook.com>
Date: Wed, 23 May 2018 14:59:24 -0500
Message-ID: <CAL_JsqLyDaTqccYq16RHNmyEsRmg2D3rYVZv4K7ooSe9SQF1cw@mail.gmail.com>
Subject: Re: [v4 3/6] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
 controller bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Wen He <wen.he_1@nxp.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Jiaheng Fan <jiaheng.fan@nxp.com>, Vinod <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Updated Vinod's email...

On Mon, May 21, 2018 at 12:52 AM, Wen He <wen.he_1@nxp.com> wrote:
> Hi Rob,
>
> Please see my comments inline.
>
> Best Regards,
> Wen
>
>> -----Original Message-----
>> From: Rob Herring [mailto:robh@kernel.org]
>> Sent: 2018=E5=B9=B45=E6=9C=8819=E6=97=A5 5:26
>> To: Wen He <wen.he_1@nxp.com>
>> Cc: vinod.koul@intel.com; dmaengine@vger.kernel.org;
>> devicetree@vger.kernel.org; Leo Li <leoyang.li@nxp.com>; Jiafei Pan
>> <jiafei.pan@nxp.com>; Jiaheng Fan <jiaheng.fan@nxp.com>
>> Subject: Re: [v4 3/6] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
>> controller bindings
>>
>> On Mon, May 14, 2018 at 08:03:04PM +0800, Wen He wrote:
>> > Document the devicetree bindings for NXP Layerscape qDMA controller
>> > which could be found on NXP QorIQ Layerscape SoCs.
>> >
>> > Signed-off-by: Wen He <wen.he_1@nxp.com>
>> > ---
>> > change in v4:
>> >     - Rewrite the bindings document that follows generic DMA bindings
>> > file
>> >
>> > change in v3:
>> >     - no change
>> >
>> > change in v2:
>> >     - Remove indentation
>> >     - Add "Should be" before 'fsl,ls1021a-qdma'
>> >     - Replace 'channels' by 'dma-channels'
>> >     - Replace 'qdma@8390000' by 'dma-controller@8390000'
>> >
>> >  Documentation/devicetree/bindings/dma/fsl-qdma.txt |   41
>> ++++++++++++++++++++
>> >  1 files changed, 41 insertions(+), 0 deletions(-)  create mode 100644
>> > Documentation/devicetree/bindings/dma/fsl-qdma.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/dma/fsl-qdma.txt
>> > b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
>> > new file mode 100644
>> > index 0000000..368c4e7
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
>> > @@ -0,0 +1,41 @@
>> > +NXP Layerscape SoC qDMA Controller
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +
>> > +This device follows the generic DMA bindings defined in dma/dma.txt.
>> > +
>> > +Required properties:
>> > +
>> > +- compatible:              Must be one of
>> > +                    "fsl,ls1021a-qdma": for LS1021A Board
>> > +                    "fsl,ls1043a-qdma": for ls1043A Board
>> > +                    "fsl,ls1046a-qdma": for ls1046A Board
>> > +- reg:                     Should contain the register's base address=
 and length.
>> > +- interrupts:              Should contain a reference to the interrup=
t used by
>> this
>> > +                   device.
>> > +- interrupt-names: Should contain interrupt names:
>> > +                    "qdma-error": the error interrupt
>> > +                    "qdma-queue": the queue interrupt
>> > +- queues:          Should contain number of queues supported.
>>
>> Needs a vendor prefix.
>>
>
> Does means: The queues filed need a vendor prefix ?
> like 'fsl-queues' ? right?

No, vendor prefixes end with a comma: fsl,queues

Rob
