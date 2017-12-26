From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] dma: fsl-qdma: add devicetree documentation for qDMA driver.
Date: Tue, 26 Dec 2017 11:56:50 -0600
Message-ID: <CAL_JsqLo__2ac6dtjHZV17j57rwkgCmWRO6-5gkYKWN5PO4rGg@mail.gmail.com>
References: <20171219064157.29586-1-wen.he_1@nxp.com> <20171220184304.ywr3nopucgubgxwz@rob-hp-laptop>
 <DBXPR04MB47875F9351B430136E1995CE20D0@DBXPR04MB478.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DBXPR04MB47875F9351B430136E1995CE20D0-obFqC9UnrTsfYwEmCIcpDAfhPeD8jYilXA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jiafei Pan <jiafei.pan-3arQi8VN3Tc@public.gmane.org>, Jiaheng Fan <jiaheng.fan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 1:09 AM, Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org> wrote:
> Hi Rob,
>
>> -----Original Message-----
>> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
>> Sent: 2017年12月21日 2:43
>> To: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH 2/4] dma: fsl-qdma: add devicetree documentation for
>> qDMA driver.
>>
>> On Tue, Dec 19, 2017 at 02:41:57PM +0800, Wen He wrote:
>>
>> Need a commit message.
>>
>
> Got it, Thanks.
>
>> > Signed-off-by: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/dma/fsl-qdma.txt | 42
>> > ++++++++++++++++++++++
>> >  1 file changed, 42 insertions(+)
>> >  create mode 100644
>> Documentation/devicetree/bindings/dma/fsl-qdma.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/dma/fsl-qdma.txt
>> > b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
>> > new file mode 100644
>> > index 000000000000..b076177b4863
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
>> > @@ -0,0 +1,42 @@
>> > +* Freescale queue Direct Memory Access Controller(qDMA) Controller
>> > +
>> > +  The qDMA controller transfers blocks of data between one source and
>> > + one or more
>>
>> Why the indentation?
>>
>
> I did it by referring to Documentation/devicetree/bindings/dma/fsl-edma.txt, is it ok?

No, please change.

>> > +destinations. The blocks of data transferred can be represented in
>> > +memory as contiguous or non-contiguous using scatter/gather table(s).
>> > +Channel virtualization is supported through enqueuing of DMA jobs to,
>> > +or dequeuing DMA jobs from, different work queues.
>> > +
>> > +* qDMA Controller
>> > +Required properties:
>> > +- compatible :
>>
>> Add "Should be one of:"
>>
>> > +   - "fsl,ls1021a-qdma",
>> > +   Or "fsl,ls1043a-qdma" followed by "fsl,ls1021a-qdma",
>>
>> Then remove the "Or" and replace " followed by" with a comma (like dts
>> source).
>>
>
> - compatible : Should be "fsl,ls1021a-qdma" or "fsl,ls1043a-qdma", "fsl,ls1021a-qdma"
> Is that ok?

No, each line should enumerate each valid value of compatible. Like this:

- compatible : Should be one of:
  - "fsl,ls1021a-qdma",
  - "fsl,ls1043a-qdma", "fsl,ls1021a-qdma"

>> > +- reg : Specifies base physical address(s) and size of the qDMA registers.
>> > +   The region is qDMA control register's address and size.
>> > +- interrupts : A list of interrupt-specifiers, one for each entry in
>> > +   interrupt-names.
>> > +- interrupt-names : Should contain:
>> > +   "qdma-error" - the error interrupt
>> > +   "qdma-queue" - the queue interrupt
>> > +- channels : Number of channels supported by the controller
>>
>> dma-channels is the standard name.
>>
>
> Okay, got it.
>
>> > +- queues : Number of queues supported by driver
>>
>> Needs a vendor prefix.
>>
>
> Where do I put the vendor prefix?

"fsl,queues"
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
