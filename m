From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management driver
Date: Tue, 03 Nov 2015 13:42:16 +0100
Message-ID: <4010471.Nu3L6CWPWG@wuerfel>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org> <9016417.z9Hz6MbmvQ@wuerfel> <56383BDD.9090903@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56383BDD.9090903@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 02 November 2015 23:45:17 Sinan Kaya wrote:
> On 11/2/2015 4:30 PM, Arnd Bergmann wrote:
> > On Saturday 31 October 2015 02:51:46 Sinan Kaya wrote:
> >> On 10/30/2015 5:34 AM, Arnd Bergmann wrote:
> >>> On Thursday 29 October 2015 23:08:12 Sinan Kaya wrote:
> >> This will be used by the system admin to monitor/reset the execution
> >> state of the DMA channels. This will be the management interface.
> >> Debugfs is probably not the right choice. I originally had sysfs but
> >> than had some doubts. I'm open to suggestions.
> >
> > User interface design is unfortunately always hard, and I don't have
> > an obvious answer for you.
> >
> > Using debugfs by definition means that you don't expect users to
> > rely on ABI stability, so they should not write any automated scripts
> > against the contents of the files.
> >
> > With sysfs, the opposite is true: you need to maintain compatibility
> > for as long as anyone might rely on the current interface, and it
> > needs to be reviewed properly and documented in Documentation/ABI/.
> >
> > Other options are to use ioctl(), netlink or your own virtual file
> > system, but each of them has the same ABI requirements as sysfs.
> >
> > Regardless of what you pick, you also need to consider how other drivers
> > would use the same interface: If someone else has hardware that does
> > the same thing, we want to be able to use the same tools to access
> > it, so you should avoid having any hardware specific data in it and
> > keep it as generic and extensible as possible. In this particular
> > case, that probably means you should implement the user interfaces in
> > the dmaengine core driver, and let the specific DMA driver provide
> > callback function pointers along with the normal ones to fill that
> > data.
> >
> Thanks, I'll think about this. I'm inclined towards sysfs.

Ok. Documentation/sysfs-rules.txt has a good introduction of how this is done.

> >>> The rest of the probe function does not register any user interface aside from
> >>> the debugging stuff. Can you explain in the changelog how you expect the
> >>> driver to be used in a real system? Is there another driver coming?
> >>
> >> I expect this driver to grow in functionality over time. Right now, it
> >> does the global init for the DMA. After that all channels execute on
> >> their own without depending on each other. Global init has to be done
> >> first before attempting to do any channel initialization.
> >>
> >> There is also implied startup ordering requirements. I was doing this by
> >> using channel driver with the late binding to guarantee that.
> >>
> >> As soon as I use module_platform_driver, the ordering gets reversed for
> >> some reason.
> >
> > For the ordering requirements, it's probably best to export a symbol
> > with the entry point and let the normal driver call into that. Using
> > separate initcall levels is not something you should do in a normal
> > device driver like this.
> >
> I figured this out. If the channel driver starts before the management 
> driver; then channel reset fails. I'm handling this in the channel 
> driver and am returning -EPROBE_DEFER. After that, management driver 
> gets its chance to work. Then, the channel driver again. This change is 
> in the v2 series.

If you change the order in the Makefile, the management driver should
always get probed first if both are built-in. When the driver is a
loadable module, the ordering should work because of the way that the
modules are loaded. Using the deferred probing makes sense here,
so that would just be an optimization to avoid it normally. Things
can still get shuffled around e.g. if the management device is
deferred itself and we end up probing the channel driver first.

> > What is the relation between the device nodes for the two kinds of
> > devices? Does it make sense to model the other one as a child device
> > of this one? That way you would trivially do the ordering by not marking
> > this one as 'compatible="simple-bus"' and triggering the registration
> > of the child from the parent probe function.
> >
> 
> The required order is management driver first, channel drivers next. If 
> the order is reversed, channel init fails. I handle this with deferred 
> probing.
> 
> I tried to keep loose binding between the management driver due to QEMU.
> 
> QEMU auto-generates the devicetree entries. The guest machine just sees 
> one devicetree object for the DMA channel but guest machine device-tree 
> kernel does not have any management driver entity.
> 
> This requires DMA channel driver to work independently in the guest 
> machine without dependencies.

You have a distinct "compatible" string for qemu, right? It sounds like
this is not the same device if the dependencies are different, and
you could just have two ways to probe the same device.

The split between the two drivers still feels a little awkward overall,
it might be good to give it some more thought.

Would it work to describe the combination of the channel and management
registers as a single device with a single driver, but the management
parts being optional? That way, the management registers could be
intergrated better into the dmaengine framework, to provide a consistent
API to user space.

	Arnd
