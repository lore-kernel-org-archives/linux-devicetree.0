From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree with early buffer allocations and aliased memory
Date: Mon, 15 Nov 2010 23:57:18 -0700
Message-ID: <20101116065718.GD4074@angua.secretlab.ca>
References: <20101027184908.GA7669@dvomlehn-lnx2.corp.sa.net>
	<AANLkTi=OWBbB8vPNapxkBDiVRCoGS-sZ5-CXcKK0n8iv@mail.gmail.com>
	<20101103205037.GA15096@dvomlehn-lnx2.corp.sa.net>
	<20101110042537.GA4110@angua.secretlab.ca>
	<20101115231008.GA468@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101115231008.GA468-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 15, 2010 at 03:10:08PM -0800, David VomLehn wrote:
> On Tue, Nov 09, 2010 at 10:25:37PM -0600, Grant Likely wrote:
> > On Wed, Nov 03, 2010 at 01:50:37PM -0700, David VomLehn wrote:
> ...
> > Further note:  The memory node must only contain memory ranges that
> > will actually be used by the operating system as system RAM.  If it is
> > dedicated to DMA buffers or the like, then you don't want to identify
> > it as a memory node.  You can create a new binding to describe your
> > DMA buffer ranges, but make sure it doesn't specify device_type="memory".
> 
> This one confuses me a bit. Devices using DMA share memory with device
> drivers; does this mean that memory is used by the kernel as system RAM?
> Also, the buffers whose addresses are dynamically assigned have exactly
> the same usage pattern as those whose addresses are statically assigned,
> but there is no way to know where in the memory nodes they should be.
> It is thus not possible to exclude them from memory nodes. This seems
> inconsistent.

I'm not sure I completely follow you.  Any memory described in a
device_type="memory" node will by default be used as system RAM by
Linux.  If some of that region needs to be used for DMA buffers, then
you'll need to make sure that when a driver allocates a buffer, that
the buffer is made valid for DMA operations.  How you do this is
architecture specific.

> > > 	platform-bus {
> > 
> > It *appears* that you're conflating Linux-kernel internal details (the
> > name "platform-bus") with the actual layout of the hardware.  I'd be
> > surprised if your peripheral bus is named "platform-bus" in the
> > hardware documentation.  Name things for what they are, with
> > preference for names in the generic names list from ePAPR.
> 
> It looks like naming this node "soc" would be in accordance with
> convention. Is this better than "stbus", "simple-bus", or "simple-bus@0"?

what does 'stbus' mean?  If it is the hardware name for the bus, then
it is probably a good choice.  'soc' is often used, but I'm not a big
fan of that convention because it doesn't reflect the actual internal
architecture of the chip.

> > > 		compatible = "simple-bus";
> > > 		#address-cells = <1>;
> > > 		#size-cells = <1>;
> > > 		dma-ranges = <0x10000000 0x1000000 0x0fc00000
> > > 			0x20000000 0x10000000 0x0fc00000
> > > 			0x2fc00000 0x2fc00000 0x10400000
> > > 			0x60000000 0x60000000 0x20000000>;
> > 
> > I suspect the length field in the 3rd line is wrong.  Should be
> > 0x400000?  I also suspect the 2nd and 3rd lines could be merged to
> > give:
> > 			0x20000000 0x20000000 0x10000000
> 
> The third line is for memory extending from 0x2fc00000-0x3fffffff, inclusive,
> where the DMA and physical addresses are the same for the entire range. As
> I understand it, the third parameter is the length, i.e. the length of the
> area of memory shared between the device doing DMA and the device driver.
> I don't see anything wrong with this, but would like to know if there is.

Sorry, I believe you're right.  I misread your example.

> Though the third line has an identical mapping between physical and DMA
> addresses, the second line has an offset of 0x10000000 between the two
> addresses. Unless I misunderstand, I can't merge these.

<digress into details of hardware design>
Is a device legally able to DMA into the address range
0x20000000..0x2fbfffff instead of 0x10000000..0x1fbfffff?  What is the
reason for dma'ing to base 0x10000000 for the first 0xfc00000, and to
base 0x20000000 for the second if the two ranges are simple aliases of
each other?

>From your earlier description it sounded like the 0x10000000 alias is
only to provide Linux with RAM to run out of, but the real ram base
address is 0x20000000.  As such, it still sounds like the dma-ranges
should cover the entire physical memory region from
0x20000000..0x3fffffff, and not reference the 0x10000000 alias at all.
</digress>

> > > I'm not sure whether I need to specify all those 1:1 mappings or just
> > > the range starting at 0x20000000 that doesn't map identically to the
> > > physical address range. Assuming this is correct, my DMA mapping issue
> > > is solved.
> > 
> > Unless you *actually* want to perform DMAs to both the real and
> > aliased ranges, then you probably don't want specify both.
> 
> All of the physical addresses can be used with DMA, after translation to their
> corresponding DMA addresses, so it sounds like I need to specify all
> physical addresses.
> 
> > Since this sounds very device specific, doing custom properties are
> > just fine *providing* you document it in the "cisco,device-s" binding.
> 
> Once I get this all nailed down, is there a standard place to publish
> custom bindings?

devicetree.org

> 
> > > Buffers with dynamically assigned addresses must be assigned within
> > > a given range of memory. Using labeled memory nodes could help:
> > > 
> > > 	device-d {
> > > 		compatible = "cisco,device-d";
> > > 		cisco,dynamic-buffers =
> > > 			"device-d-b1",<&node0-lowmem 0x00210000>,
> > > 			"device-d-b2",<&node0-highmem 0x00220000>,
> > > 			"device-d-b3",<&node1-highmem 0x00230000>;
> > 
> > What is the meaning of the second cell in these properties
> > (0x00210000, 0x220000, and 0x230000)?  This doesn't seem to be an
> > optimal binding, although that is probably mainly due to the joint
> > string+cell property values.  Having a phandle to another node is
> > /okay/, but it might just be simpler and better to explicitly specify
> > the address ranges that the device is able to DMA to/from.
> 
> Those second cells are the length of the DMA buffers. The phandles are
> being used to indicate the range within which the beginning and ending
> addresses of the buffers must lie.  I used phandles phandles because
> all of the ranges will be within one of the three memory nodes and
> this seemed like a nice way to simplify things and avoid potentially
> subtle errors in specifying the range. But specifying ranges explicitly
> for each buffer works fine.

I'd just go with the explicit ranges simply because it is simpler.  If
it was a more common use-case, then I might have a different opinion,
but since it is an oddball case I'd stick with familiar patterns for
specifying dma constraints.

g.
