From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: Add Keystone Packet DMA Engine driver
Date: Wed, 12 Mar 2014 21:30:17 +0530
Message-ID: <20140312160017.GY1976@intel.com>
References: <1393628200-12317-1-git-send-email-santosh.shilimkar@ti.com>
 <20140311102357.GR1976@intel.com>
 <531F6908.4010104@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <531F6908.4010104-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 03:50:32AM +0800, Santosh Shilimkar wrote:
> On Tuesday 11 March 2014 06:23 PM, Vinod Koul wrote:
> > On Fri, Feb 28, 2014 at 05:56:40PM -0500, Santosh Shilimkar wrote:
> >> From: Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>
> >>
> >> The Packet DMA driver sets up the dma channels and flows for the
> >> QMSS(Queue Manager SubSystem) who triggers the actual data movements
> >> across clients using destination queues. Every client modules like
> >> NETCP(Network Coprocessor), SRIO(Serial Rapid IO) and CRYPTO
> >> Engines has its own instance of packet dma hardware. QMSS has also
> >> an internal packet DMA module which is used as an infrastructure
> >> DMA with zero copy.
> >>
> >> Patch adds DMAEngine driver for Keystone Packet DMA hardware.
> >> The specifics on the device tree bindings for Packet DMA can be
> >> found in:
> >> 	Documentation/devicetree/bindings/dma/keystone-pktdma.txt
> >>
> >> The driver implements the configuration functions using standard DMAEngine
> >> apis. The data movement is managed by QMSS device driver.
> > Pls use subsystem appropriate name so here would have been dmaengine: ...
> > 
> > So i am still missing stuff like prepare calls, irq, descriptor management to
> > call this a dmaengine driver.
> >
> > I guess you need to explain a bit more why the data movement is handled by some
> > other driver and not by this one
> >
> To expand above statement, Packet DMA hardware blocks on Keystone SOCs
> are DMAEngines. QMSS is centralised subsystem manages multiple functionalities
> including triggering dma transfers, descriptor management and completion
> irqs. There are separate instance of packet DMA hardware block per client
> device. We program the DMA hardware to allocate channels and flows. So
> the packet DMA resouces like dma channels and dma flows are configured
> and managed through the DMAEngine driver. Thats why we implement only
> device_alloc_chan_resources, device_free_chan_resources and device_control
> DMAEngine APIs.
Sorry am bit lost. If its a dmaengine then you still need to program the
transfers, how does that part work?

> >> +#define BITS(x)			(BIT(x) - 1)
> > this might get confusing, perhaps a better name could be given?
> > 
> Would "BIT_MASK" be ok with you ?
something which would imply its x -1, am not really good with name so no
suggestions :)

> >> +
> >> +#define BUILD_CHECK_REGS()						\
> >> +	do {								\
> >> +		BUILD_BUG_ON(sizeof(struct reg_global)   != 32);	\
> >> +		BUILD_BUG_ON(sizeof(struct reg_chan)     != 32);	\
> >> +		BUILD_BUG_ON(sizeof(struct reg_rx_flow)  != 32);	\
> >> +		BUILD_BUG_ON(sizeof(struct reg_tx_sched) !=  4);	\
> >> +	} while (0)
> > why is this required, do you want to use __packed__ to ensure right size?
> >
> This is just to ensure the register sanity. We should use __packed__ as
> well. We can take the BUILD_CHECK_REGS() out if you don't prefer it.
putting packed ensures so no need for this check.

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
