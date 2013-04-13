From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] DT affinity bindings/representing bus masters with DT
Date: Sat, 13 Apr 2013 23:24:48 +0100
Message-ID: <20130413222448.CAD953E2249@localhost>
References: <20130215172102.GF3014@e102568-lin.cambridge.arm.com>
 <20130306215714.GC6740@truffula.fritz.box>
 <20130311170657.GD25250@e102568-lin.cambridge.arm.com>
 <20130318030928.GG9402@truffula.fritz.box>
 <20130318094815.GA30116@e102568-lin.cambridge.arm.com>
 <20130319070734.GX9402@truffula.fritz.box>
 <20130325152038.GC27959@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130325152038.GC27959-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Mar 2013 15:20:39 +0000, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> On Tue, Mar 19, 2013 at 07:07:34AM +0000, David Gibson wrote:
> > On Mon, Mar 18, 2013 at 09:48:16AM +0000, Lorenzo Pieralisi wrote:
> > > > > I think we need to post what we have, it is really complex to explain
> > > > > the issue without a concrete example. To cut a long story short I
> > > > > would not say that the resources sit in different address spaces, it is
> > > > > that we need to associate those address ranges with specific bus masters.
> > > > > 
> > > > > We have to have a way to say:
> > > > > 
> > > > > "Address range 0x80001000 - 0x80001fff is used to programme the control
> > > > > registers associated with the port connected to master X".
> > > > > 
> > > > > When a CPU wants to programme a control port for a specific master, it
> > > > > needs to know what address range should be programmed.
> > > > > 
> > > > > I mentioned "resources" instead of addresses since the problem we are
> > > > > having is the same when it comes to map IRQs to set of CPUS. We need
> > > > > to associate a resource (IRQ or address) to a set of cpus (or more in
> > > > > general, masters).
> > > > 
> > > > Hrm.  See, I think I may be misunderstanding the problem again,
> > > > because with this description I can see no problem.  It's already up
> > > > to the device binding to describe the purpose of each entry in the reg
> > > > property.  So what's the problem with it just being part of the
> > > > binding to say which reg entry is associated with which master port?
> > > 
> > > That's exactly what we are trying to do. But to associate the reg
> > > property to a master port we need a phandle, how can we pull that off
> > > otherwise ?
> > 
> > Ah, right.  I was meaning that the binding specifies the abstract port
> > number that each reg entry is associated with.  I'm fine with adding a
> > property to map the port numbers to master devices on the other end.
> > I think treating it in two steps like that is better than thinking of
> > the master phandles being  directly associated with reg entries,
> > because it also handles cases like having a bank of common/global
> > registers not associated with any port/master, or cases where the
> > ports aren't all identical and some need more resources than others.
> 
> That's fine by me. Can you provide me with an example of how the bindings
> should tie a specific reg property to an abstract port number ? reg properties
> ordering (ie index) ? Or port number encoded in the reg property itself ?

I think I agree with David (assuming I understand his argument
correctly). Rather than putting the information into the single node, it
is more consistent in DT terms to put that information into each of the
'users' of the device; so for each master, put in a property that
associates it with a specific port. Something like this (completely off
the top of my head; not at all fully thought out):

cpu@0 {
	cci-port = <&cci1 0>;
}

cpu@1 {
	cci-port = <&cci1 1>;
}

cpu@2 {
	cci-port = <&cci1 2>;
}

gpu@c8010000 {
	cci-port = <&cci1 3>;
}

cci1: cci@c8000000 {
	reg = < ... >;
}

An arguement against that would be that it is difficult to determine
what all the bus-mastering devices are from looking at the cci node, but
in real terms you would have a lookup table in the operating system
/anyway/ for matching devices to ports and I would expect that as each
device is discovered from the DT data the OS would populate it's lookup
table.

It may be that Dave Martin's suggestion of using basically a dma-ranges
type property with a phandle would be the correct interface. I've not
thought enough about it yet to really get my head around it.

g.
