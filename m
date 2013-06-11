From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: microblaze device-tree description - pair intc/buses and timers
Date: Tue, 11 Jun 2013 23:22:25 +0100
Message-ID: <20130611222225.9753A3E0D8D@localhost>
References: <51A35E6D.5040706@monstr.eu>
 <20130611130236.D2ACA3E0A90@localhost> <51B72F4B.9030700@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51B72F4B.9030700-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Edgar Iglesias <edgari-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter Crosthwaite <pcrost-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Jun 2013 16:08:11 +0200, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> Hi Grant,
> 
> nice that you have found a time to look at this.
> 
> On 06/11/2013 03:02 PM, Grant Likely wrote:
> > On Mon, 27 May 2013 15:23:57 +0200, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> >> Hi guys,
> >>
> >> we have got a new configurations with iomodule which can be connected to the microblaze
> >> cpu and I would like to have proper description for this system
> >> + more advance configuration below.
> >>
> >> Buses:
> >> Microblaze systems have in standard configuration two buses LMB and AXI(in past PLB).
> >> We didn't generate LMB even there is placed BRAM (block ram)
> >> but Linux expects that there is any writeable memory at 0x0.
> >> Currently because we can use iomodule which is connected to LMB and we need to generate
> >> this bus. I don't expect that there is any problem to have this configuration.
> >>
> >> cpus {
> >> 	...
> >> 	cpu@0 {
> >> 		...
> >> 	}
> >> }
> >> lmb@0 {
> >> 	...
> >> 	iomodule@X {
> >> 		...
> >> 	}
> >> }
> >> axi@X {
> >> 	...
> >> 	nodes
> >> 	...
> >> }
> >>
> >> Block ram:
> >> When we generate lmb make sense to also add there this small bram memory
> >> but I expect that is it ok just to added to bus and do not add it to the root.
> >> Currently we have an option to use "mmio-sram" compatibility string for it.
> >>
> >> Interrupt controller:
> >> Till now Microblaze uses only one interrupt controller on main bus (AXI or PLB)
> >> and we just find compatible string and we said that this is primary interrupt controller.
> >>
> >> Based on DTS in the kernel I see that "interrupt-parent" property
> >> reflects which interrupt controller is master and which one is in cascade.
> > 
> > Mostly correct; it is also possible for an interrupt controller to
> > cascade to two different parent controllers, and in that case there
> > would need to be an interrupt-map somewhere. That case is rare however.
> 
> Any dts in the kernel which uses this?

You can find lots of examples of the interrupt-map property by doing
git grep. Most of them are PCI interrupt controllers which is similar to
what you're asking, but not entirely the same. I have seen examples in
the past, but I cannot remember off the top of my head.

> >> Timer:
> >> System timer was also detected in this way that the first suitable timer was
> >> taken and used. Others were just ignored.
> >>
> >>
> >> Extend system configuration
> >> We have also got an option to add one more CPU and I would like to have
> >> an option to describe it correctly.
> > 
> > Are you doing SMP in this case? I assume that you are not because we're
> > talking about microblaze here. Separate OSes on each CPU?
> 
> As you know on fpga we can do a lot of things. I am not talking about SMP
> case here because it should also cover non SMP cases.
> But yeah, Microblaze can also do SMP.

Nice! I didn't expect that. I assumed that cache coherency would have
been too expensive to be worth it on an FPGA soft core.

> btw: is there any problem if there is no interrupt controller in the system at all?
> I think we can setup system just with one timer which should be possible
> to describe and run Linux on it.
> Is this any requirement from Linux point of view?

It would mean every device driver needs to be polled. As long as the
polling frequency is high enough for the work load then it should be
okay. I don't see a problem with there being no interrupt controller,
unless there needs to be a dummy one just to keep the kernel happy.

g.
