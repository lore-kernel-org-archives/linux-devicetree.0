From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: RE: [PATCH] usb: dwc3: Enable the USB snooping
Date: Wed, 15 Nov 2017 12:22:35 +0200
Message-ID: <87shdfet90.fsf@linux.intel.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com> <87ineb9b5v.fsf@linux.intel.com> <VI1PR04MB1504776EF3D4D8C374F0C069F1290@VI1PR04MB1504.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <VI1PR04MB1504776EF3D4D8C374F0C069F1290-mr6QIVyDiCF1me2Lu1FvAc9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>, Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,

Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org> writes:
>> Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org> writes:
>> > Add support for USB3 snooping by asserting bits in register
>> > DWC3_GSBUSCFG0 for data and descriptor.
>> 
>> we know *how* to enable a feature :-) It's always the same, you fiddle with
>> some registers and it works. What you failed to tell us is:
>> 
>> a) WHY do you need this?
>> b) WHY do we need another DT property for this?
>> c) WHAT does this mean for PCI devices?
>
> So far I cannot have the answer for you, will get you back after some discussion
> with my colleagues.

IOW, you have no idea why you need this, right? We're not patching
things for the sake of patching things. We need to understand what these
changes mean to the HW before we send out a patch publicly.

Remember that the moment a patch like this is accepted, it has the
potential of changing behavior for *ALL* users.

>> > +	}
>> > +
>> > +	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);
>> 
>> this will *always* read and write GSBUSCFG0 even for those platforms which
>> don't need to change anything on this register. You should just bail out early
>> if !dwc->dma_coherent
>> 
>> Also, I think dma_coherent is likely not the best name for this property.
>> 
>> Another question is: Why wasn't this setup properly during coreConsultant
>> instantiation of the RTL? Do you have devices on the market already that
>> need this or is this some early FPGA model or test-only ASIC?
>
> Yes, you are right. Actually I thought that all dwc3 IP  will have this register, and
> it can be controlled by DTS property. 

they all *have* the register, however, it's sort of expected that RTL
engineer will setup good defaults when instantiating the RTL using SNPS'
coreConsultant tool.

Does your platform work without this patch?

>> > +
>> >  /* Global Debug Queue/FIFO Space Available Register */
>> >  #define DWC3_GDBGFIFOSPACE_NUM(n)	((n) & 0x1f)
>> >  #define DWC3_GDBGFIFOSPACE_TYPE(n)	(((n) << 5) & 0x1e0)
>> > @@ -859,6 +867,7 @@ struct dwc3_scratchpad_array {
>> >   * 	3	- Reserved
>> >   * @imod_interval: set the interrupt moderation interval in 250ns
>> >   *                 increments or 0 to disable.
>> > + * @dma_coherent: set if enable dma-coherent.
>> 
>> you're not enabling dma coherency, you're enabling cache snooping. And
>> this property should describe that. Also, keep in mind that different devices
>> may want different cache types for each of those fields, so your property
>> would have to be a lot more complex. Something like:
>> 
>> 	snps,cache-type = <foobar "cacheable">, <baz "cacheable">, ...
>> 
>> Then driver would have to parse this properly to setup GSBUSCFG0.
>
> Got it, learn a lot, need more time to digest and test, thanks for
> your patiently explanation.

no problem, please figure out the answers to my previous questions,
without which I can't accept your patch.

>> In any
>> case, I still want to know why do you really need this? What's the reason?
>> What happens if you don't fix GSBUSCFG0? What's the value you have there
>> by default? Why isn't that default good enough?
>
> So far the Layerscape SoC (such as LS1088A) has enabled this feature and I
> have tested it. Once we add dma-coherent on DTS without this Patch, dwc3
> will fail on device enumeration as below:
> [   15.124031] xhci-hcd xhci-hcd.0.auto: Error while assigning device slot ID
> [   15.130912] xhci-hcd xhci-hcd.0.auto: Max number of devices this xHCI host supports is 127.
> [   15.139268] usb usb1-port1: couldn't allocate usb_device

okay, so without these changes, your host doesn't work. What is the
default value on your platform without these changes? (revert patch,
boot platform, let it fail, get register output from our regdump in debugfs)

-- 
balbi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
