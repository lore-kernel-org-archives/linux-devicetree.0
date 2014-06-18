From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dmaengine: mpc512x: add device tree binding document
Date: Wed, 18 Jun 2014 18:56:07 +0400
Message-ID: <CAF0T0X4=fynr+ou+LK58DwpFnz5rgPiqadykKXf-bsp7N0uaeA@mail.gmail.com>
References: <1403088492-15241-1-git-send-email-a13xp0p0v88@gmail.com>
	<1403088492-15241-2-git-send-email-a13xp0p0v88@gmail.com>
	<20140618133730.GB11895@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140618133730.GB11895@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Mark, thanks for your reply!

2014-06-18 17:37 GMT+04:00 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
> On Wed, Jun 18, 2014 at 11:48:10AM +0100, Alexander Popov wrote:
>> Introduce a device tree binding document for the MPC512x DMA controller
>>
>> Signed-off-by: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/dma/mpc512x-dma.txt        | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/dma/mpc512x-dma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/mpc512x-dma.txt b/Documentation/devicetree/bindings/dma/mpc512x-dma.txt
>> new file mode 100644
>> index 0000000..95e2ca0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/mpc512x-dma.txt
>> @@ -0,0 +1,31 @@
>> +* Freescale MPC512x and MPC8308 DMA Controller
>> +
>> +The DMA controller in Freescale MPC512x and MPC8308 SoCs can move
>> +blocks of memory contents between memory and peripherals or
>> +from memory to memory.
>> +
>> +Refer to "Generic DMA Controller and DMA request bindings" in
>> +the dma/dma.txt file for a more detailed description of binding.
>> +
>> +Required properties:
>> +- compatible: should be "fsl,mpc5121-dma" or "fsl,mpc8308-dma";
>> +- reg: should contain the DMA controller registers location and length;
>> +- interrupt for the DMA controller: syntax of interrupt client node
>> +     is described in interrupt-controller/interrupts.txt file.
>> +
>> +Optional properties:
>> +- #dma-cells: the length of the DMA specifier, must be <1>.
>> +     Each channel of this DMA controller has a peripheral request line,
>> +     the assignment is fixed in hardware. This one cell
>> +     in dmas property of a client device represents the channel number.
>
> Surely this is required to be able to refer to DMA channels on the
> device?

Excuse me, I didn't understand your question.
Do you inquire about the reason of making #dma-cells an optional property?
It's optional because device tree based lookup support is made
optional (part 3/3).

Best regards,
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
