From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v11 5/6] dma: mpc512x: add device tree binding document
Date: Fri, 18 Apr 2014 15:29:42 +0400
Message-ID: <CAF0T0X4TqhZ=niKRgArG-s1cD6uRH0UZDqGyTLpde_aHBFTVtw@mail.gmail.com>
References: <1397559250-17680-1-git-send-email-a13xp0p0v88@gmail.com>
	<1397559250-17680-6-git-send-email-a13xp0p0v88@gmail.com>
	<20140416204410.GP3528@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140416204410.GP3528-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks for your reply, Gerhard

2014-04-17 0:44 GMT+04:00 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> On Tue, 2014-04-15 at 14:54 +0400, Alexander Popov wrote:
>>
>> Introduce a device tree binding document for the MPC512x DMA controller
>>
>> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
>> Signed-off-by: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> I'm not certain whether the attribution is right.  Is the S-o-b
> appropriate when the patch is not "from" me? As I've stated
> before, it's OK if you pick up and extend what I provide, but
> please don't pretend that I wrote what you did,
Thanks. I've read the corresponding part of
Documentation/SubmittingPatches once again and now I see
my mistake.

> and don't pretend
> that I ACKed or passed along your submission when I didn't.
I didn't have any malicious intent.

> This binding certainly needs further improvement to become a good
> one.  As I've communicated in the past, I was rather ignorant
> "back then" when I wrote v1 and v2 of the RFC.  We have learned
> something in the meantime.  Though I admit having gone silent
> after several review iterations.  Assumed you would pick up
> information that showed up several times on public lists.
>
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/mpc512x-dma.txt
>> @@ -0,0 +1,51 @@
>> +* Freescale MPC512x and MPC8308 DMA Controller
>> +
>> +The DMA controller in the Freescale MPC512x and MPC8308 SoCs can move
>> +blocks of memory contents between memory and peripherals or
>> +from memory to memory.
>> +
>> +Refer to the "Generic DMA Controller and DMA request bindings" in
>> +the dma/dma.txt file for a more detailed description of binding.
>> +
>> +* DMA controller
>> +
>> +Required properties:
>> +- compatible: Should be one of
>> +     "fsl,mpc5121-dma"
>> +     "fsl,mpc8308-dma", "fsl,mpc5121-dma"
>
> is this a duplicate?  looks funny, needs a fix
>
> or is it a requirement that for MPC8308 you need to provide both
> compatible strings?  that would be wrong, as MPC8308 certainly is
> not an MPC5121
>
> a quick search reveals: the drivers/dma/mpc512x_dma.c Linux
> driver implementation is wrong, it should match on both strings;
> expecting the MPC8308 to disguise as an MPC5121 when it's not is
> inappropriate (and only went unnoticed because of missing
> bindings, I guess)
I can try to fix that and add a new patch to the series.

>> +- reg: Address and size of the DMA controller's register set
>> +- interrupts: Interrupt for the DMA controller. Generic interrupt client node
>> +     is described in interrupt-controller/interrupts.txt
>
> 'interrupts' only works in combinations with 'interrupt-parent',
> that actual .dts files don't have the latter in the nodes is an
> implementation detail but not a binding's requirement
Excuse me, I didn't understand your point.

> and an alternative method of specifying interrupts was introduced
> recently, a reference to the common binding without naming one
> specific property name could be most appropriate
Excuse me, I haven't found such an example.

>> +
>> +Optional properties:
>> +- #dma-cells: The length of the DMA specifier, must be <1> since
>> +     the DMA controller uses a fixed assignment of request lines
>> +     per channel. Refer to dma/dma.txt for the detailed description
>> +     of this property
>
> I'm afraid that a generic/common document does not and cannot
> describe the specific semantics of this provider's cells
Ok, I see.

> this binding should explicitly mention that the number of cells
> needs to be one, and that this one cell is the DMA channel (which
> translates to "peripheral request line"), because these
> assigments are fixed in hardware
Ok.

>> +
>> +Example:
>> +
>> +     dma0: dma@14000 {
>> +             compatible = "fsl,mpc5121-dma";
>> +             reg = <0x14000 0x1800>;
>> +             interrupts = <65 0x8>;
>> +             #dma-cells = <1>;
>> +     };
>> +
>> +* DMA client
>
> the DMA provider's binding probably need not discuss client
> specs, a reference to the common binding should suffice if it's
> appropriate at all
Ok.

Best regards,
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
