From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] DT affinity bindings/representing bus masters with DT
Date: Tue, 16 Apr 2013 16:55:43 +0100
Message-ID: <20130416155518.GA2234@linaro.org>
References: <20130215172102.GF3014@e102568-lin.cambridge.arm.com>
 <20130306215714.GC6740@truffula.fritz.box>
 <20130311170657.GD25250@e102568-lin.cambridge.arm.com>
 <20130318030928.GG9402@truffula.fritz.box>
 <20130318094815.GA30116@e102568-lin.cambridge.arm.com>
 <20130319070734.GX9402@truffula.fritz.box>
 <20130325152038.GC27959@e102568-lin.cambridge.arm.com>
 <20130413222448.CAD953E2249@localhost>
 <20130415134302.GA4568@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130415134302.GA4568-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2013 at 02:43:02PM +0100, Lorenzo Pieralisi wrote:
> Thank you for having a look Grant.
> 
> On Sat, Apr 13, 2013 at 11:24:48PM +0100, Grant Likely wrote:
> > On Mon, 25 Mar 2013 15:20:39 +0000, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> > > On Tue, Mar 19, 2013 at 07:07:34AM +0000, David Gibson wrote:
> > > > On Mon, Mar 18, 2013 at 09:48:16AM +0000, Lorenzo Pieralisi wrote:
> > > > > > > I think we need to post what we have, it is really complex to explain
> > > > > > > the issue without a concrete example. To cut a long story short I
> > > > > > > would not say that the resources sit in different address spaces, it is
> > > > > > > that we need to associate those address ranges with specific bus masters.
> > > > > > > 
> > > > > > > We have to have a way to say:
> > > > > > > 
> > > > > > > "Address range 0x80001000 - 0x80001fff is used to programme the control
> > > > > > > registers associated with the port connected to master X".
> > > > > > > 
> > > > > > > When a CPU wants to programme a control port for a specific master, it
> > > > > > > needs to know what address range should be programmed.
> > > > > > > 
> > > > > > > I mentioned "resources" instead of addresses since the problem we are
> > > > > > > having is the same when it comes to map IRQs to set of CPUS. We need
> > > > > > > to associate a resource (IRQ or address) to a set of cpus (or more in
> > > > > > > general, masters).
> > > > > > 
> > > > > > Hrm.  See, I think I may be misunderstanding the problem again,
> > > > > > because with this description I can see no problem.  It's already up
> > > > > > to the device binding to describe the purpose of each entry in the reg
> > > > > > property.  So what's the problem with it just being part of the
> > > > > > binding to say which reg entry is associated with which master port?
> > > > > 
> > > > > That's exactly what we are trying to do. But to associate the reg
> > > > > property to a master port we need a phandle, how can we pull that off
> > > > > otherwise ?
> > > > 
> > > > Ah, right.  I was meaning that the binding specifies the abstract port
> > > > number that each reg entry is associated with.  I'm fine with adding a
> > > > property to map the port numbers to master devices on the other end.
> > > > I think treating it in two steps like that is better than thinking of
> > > > the master phandles being  directly associated with reg entries,
> > > > because it also handles cases like having a bank of common/global
> > > > registers not associated with any port/master, or cases where the
> > > > ports aren't all identical and some need more resources than others.
> > > 
> > > That's fine by me. Can you provide me with an example of how the bindings
> > > should tie a specific reg property to an abstract port number ? reg properties
> > > ordering (ie index) ? Or port number encoded in the reg property itself ?
> > 
> > I think I agree with David (assuming I understand his argument
> > correctly). Rather than putting the information into the single node, it
> > is more consistent in DT terms to put that information into each of the
> > 'users' of the device; so for each master, put in a property that
> > associates it with a specific port. Something like this (completely off
> > the top of my head; not at all fully thought out):
> > 
> > cpu@0 {
> > 	cci-port = <&cci1 0>;
> > }
> > 
> > cpu@1 {
> > 	cci-port = <&cci1 1>;
> > }
> > 
> > cpu@2 {
> > 	cci-port = <&cci1 2>;
> > }
> > 
> > gpu@c8010000 {
> > 	cci-port = <&cci1 3>;
> > }
> 
> Nitpicking: the node above is not really a "master", it is a device tree
> node representing GPU resources in the CPU address space since, if I got that
> right, the device tree provides the address space view from a CPU perspective.
> 
> I am not saying this is right or wrong, just trying to make up my mind
> myself to understand if this can cause any issues in the future.
> 
> > cci1: cci@c8000000 {
> > 	reg = < ... >;
> > }
> > 
> > An arguement against that would be that it is difficult to determine
> > what all the bus-mastering devices are from looking at the cci node, but
> > in real terms you would have a lookup table in the operating system
> > /anyway/ for matching devices to ports and I would expect that as each
> > device is discovered from the DT data the OS would populate it's lookup
> > table.
> 
> Ok, I am not a big fan of this approach since it does not scale IMHO. I would
> avoid adding a property to a cpu node every given time we need a device
> requiring its resources to be linked to a (possibly set of) cpu(s).

I think that putting the cci-port references in the relevant cluster node
(assuming that we agree to have cluster nodes) would be the logical
analogy.  This also correctly describes the system.  Putting those
properties in the cpu nodes directly makes it harder to describe/figure
out what topoogical level the coherency controls apply to, and that
really matters if we want to abstract this properly.


Most things in DT point in a master->slave direction, so the proposed CCI
binding looks a bit unusual in that its references currently point the
opposite way.  (Some references go the other way: for clocks and power,
we tend to refer backwards -- i.e., from the thing controlled to the
controller, just as in the current CCI proposal.)

I guess we'd need to figure out whether representing things master->slave
would be excessively painful for handling the CCI, and if so, why.

> If we add the property(ies) in the cci node, at least the changes become
> self contained and the mechanism through which we link a resource to a
> "master" becomes standard (phandle). All bits of info become available
> through the cci node, but again, it is a choice to be made, I do not
> know what's the best approach.
> 
> > It may be that Dave Martin's suggestion of using basically a dma-ranges
> > type property with a phandle would be the correct interface. I've not
> > thought enough about it yet to really get my head around it.
> 
> What I really really want to avoid is implementing something for CCI and then
> realize that it does not work for other components with similar requirements.
> With Mark and Dave Martin we tried to come up with a solution that can be
> generalized, that was the main goal.

I still think we don't describe that fact that CCI really is a bus, and
controlling the ports on there is related to attaching and detaching
devices on that bus.

That could allow for a more general abstraction, but I'm still not clear
on how it would be described, and whether it would be a step too far...

Cheers
---Dave

> I will review again Dave Martin's suggestion and take into account your
> suggestion (which is what David Gibson would like us to do if I got it
> right, you formalized his proposal).


> 
> Thx,
> Lorenzo
> 
