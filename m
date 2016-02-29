From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6] arm: pxa: support ICP DAS LP-8x4x FPGA irq
Date: Mon, 29 Feb 2016 08:29:47 +0000
Message-ID: <56D4017B.9010106@arm.com>
References: <1450207582-17957-1-git-send-email-ynvich@gmail.com>
 <1456588562-24715-1-git-send-email-ynvich@gmail.com>
 <20160227174100.GG7219@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160227174100.GG7219-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27/02/16 17:41, Jason Cooper wrote:
> Hi Sergei,
> 
> Marc, Rob, please see below.
> 
> On Sat, Feb 27, 2016 at 06:56:01PM +0300, Sergei Ianovich wrote:
>>
> 
> nit: Subject line of the patch should match 'irqchip/lp8841: [A-Z].*'
> 
>> ICP DAS LP-8x4x contains FPGA chip. The chip functions as an interrupt
>> source providing 16 additional interrupts among other things. The
>> interrupt lines are muxed to a GPIO pin of a 2nd level PXA-GPIO
>> interrupt controller. GPIO pins of the 2nd level controller are in turn
>> muxed to a CPU interrupt line.
>>
>> Until pxa is completely converted to device tree, it is impossible
>> to use IRQCHIP_DECLARE() and the irqdomain needs to added manually.
>> Drivers for the on-CPU IRQs and GPIO-IRQs are loaded using
>> postcore_initcall(). We need to have all irq domain drivers loaded prior
>> to DT parsing in order to allow normal initialization of IRQ resources
>> with DT.
>>
>> Signed-off-by: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> nit:  From here, down should be below the '---' so that it isn't a part
> of the commit log.  We add a link to the commit log that points to the
> patch submission in the mailinglist archives.  So curious folks have
> quick access to this info.
> 
>> CC: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> CC: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> CC: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>>
>>    v5..v6
>>    fixes according to Rob Herring review comments:
>>    * drop wildcards in binding and file names
>>    * rename alias 'fpga'->'fpga_irq'
>>
>>    fixes according to Marc Zyngier review comments:
>>    * use writeb/readb not iowrite8/ioread8
>>    * redefine 2nd mask using inversion on 1st
>>    * add comments
>>
>>    v4..v5
>>    * constify struct of_device_id
>>    * drop irq number from handler signature
>>
>>    v3.2..v4
>>    * move DTS binding to a different patch (8/21)
>>
>>    v3.1..v3.2
>>    fixes to apply Linus Walleij's "Reviewed-by":
>>    * add kerneldoc comment for state container struct
>>    * rename irq -> hwirq for clarity
>>    * drop overzealous error checks from the hotpaths
>>
>>    v3..v3.1
>>    fixes according to Linus Walleij review comments:
>>    * update commit message
>>    * use state container instead of global variables
>>    * get hardware irq nums from irq_data, don't calculate them
>>    * use BIT() macro
>>    * add defines for system irq register masks
>>    * replace cycle control variable with break
>>    * use better names for resource variables
>>    * add a linear domain instead of a legacy one
>>    * use irq_create_mapping() instead of irq_alloc_desc()
>>
>>    v2..v3
>>    * no changes (except number 09/16 -> 11/21)
>>
>>    v0..v2
>>    * extract irqchip and move to drivers/irqchip/
>>    * use device tree
>>    * use devm helpers where possible
> 
> 
>> ---
> 
> iow, it should be moved here.
> 
>>  .../interrupt-controller/icpdas-lp8x4x-irq.txt     |  49 ++++
>>  drivers/irqchip/Kconfig                            |   5 +
>>  drivers/irqchip/Makefile                           |   1 +
>>  drivers/irqchip/irq-lp8841.c                       | 246 +++++++++++++++++++++
>>  4 files changed, 301 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt
>>  create mode 100644 drivers/irqchip/irq-lp8841.c
> 
> I don't seem to have the previous versions, and their threads, in my
> email archive.  From the changelog, it looks like Marc and Rob have been
> reviewing this most recently.
> 
> If you guys could give me an Acked-by/Reviewed-by, I'll go ahead and
> queue this up for v4.6.
> 
> I'll fix up the Subject line and the commit log when I bring it in.
> I'll be adding the tags anyway.  No need to resubmit.

Looks OK to me:

Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
