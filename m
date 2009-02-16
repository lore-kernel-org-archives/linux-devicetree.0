From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Mon, 16 Feb 2009 14:42:14 +1100
Message-ID: <20090216034214.GB9772@yookeroo.seuss>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<87k57w0x4r.fsf@pike.pond.sub.org>
	<20090213003724.GA8104@yookeroo.seuss>
	<87ab8qr317.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87ab8qr317.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 13, 2009 at 12:26:28PM +0100, Markus Armbruster wrote:
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:
> > On Thu, Feb 12, 2009 at 11:26:12AM +0100, Markus Armbruster wrote:
> >> Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> writes:
[snip]
> > dtc and libfdt is a good place to start, if you haven't yet
> > investigated them:
> > 	git://git.jdl.com/software/dtc.git
> > Note that although they're distributed together as one tree, dtc and
> > libfdt are essentially independent pieces of software.  dtc converts
> > device trees between various formats, dts and dtb in particular.
> >
> > libfdt does a number of the things you mention with flat trees -
> > get/set properties, build trees, traverse etc.  If it doesn't do
> > everything you need, we can probably extend it so that it does: I want
> > libfdt to be *the* library for manipulating trees in the fdt forma.
> > It's designed to be easy to embed in other packages for this reason,
> > although it does have some usage peculiarities because in particular
> > it's possible to integrate into very limited environments like
> > firmwares.
> >
> > [Jon Loeliger is the current maintainer of dtc and libfdt, but I
> > originally wrote both of them - I know as much about them as anyone
> > does]
> 
> Okay, I looked at dtc and libfdt again, a bit more closely.  I'm sure
> there's plenty of ignorance left in me, so please correct me when I'm
> babbling nonsense.

Sure.  So, I realize that there are two different questions here:
	a) Is IEEE1275 a good starting point for the content of a
decorated tree for configuring qemu.

Personally, I suspect the answer to this is yes, but more information
might convince me otherwise.

	b) Is the flattened tree format for representing IEEE1275-like
trees useful for qemu.

Personally, I think this is a "maybe".  More on this below.

Actually, on consideration there's a third question, too:
	c) Are the extensions / simplifications / adjustments we've
made to IEEE1275 conventions in the context of flattened trees also
useful and appropriate for qemu-configuration tree.

I think if the answer to (a) is yes, then the answer to (c) is yes,
too.

> FDT is a "flattened tree", i.e. a tree data structure laid out in a
> block of memory in a clever way to make it compact and easily

That's correct.

> relocatable.  I understand why these are important requirements for
> passing information through bootloader to kernel.  They're irrelevant,
> however, for use as QEMU configuration.

That's probably largely true.

> You can identify an FDT node by node offset or node name.  The node
> offset can change when you add or delete nodes or properties.

Correct.

> You want everyone to use libfdt for manipulating FDTs.  I think that's
> entirely sensible.  What I still don't get is something else: Why use
> FDT for QEMU configuration in the first place?  Let me explain.

Yeah, I see your point, hence my "maybe" to (b) above.  There's no
obvious call for the fdt format in qemu, but I can see a couple of
minor things that might make it worthwhile: First, if qemu ever does
want to record its configuration tree persistently - to be passed
between programs, or between invocations of a program - then it's
probably better to use the established fdt format rather than creating
a new one, even if fdt isn't designed particularly towards qemu's
purposes.  Second, the existing code / tools for working with the fdt
format *might* be sufficiently useful to make it worth using.

[Note also that the fdt tools will mostly work fine even if the tree
content is *not* very IEEE1275-like]

> I think we have two distinct problems: the need for a flexible,
> expressive QEMU machine configuration file and a virtual device
> configuration machinery driven by it, and the need for an FDT to pass to
> a PowerPC kernel.  The two may be related, but they are not identical.
> 
> Let's pretend for a minute the latter need doesn't exist.
> 
> QEMU machine configuration wants to be a decorated tree: a tree of named
> nodes with named properties.
> 
> IEEE 1275 is a standard describing a special kind of decorated tree.
> Other kinds can be created with a binding.  If we create a suitable
> binding, we can surely cast our configuration trees in the IEEE 1275
> framework.

That's not quite what "binding" usually means in the 1275 context, but
I think I the point is right enough.

> But what would that buy us?  This is a honest question, born out of my
> relative ignorance of IEEE 1275.  Mind that we're still busily ignoring
> the need for an FDT to pass to a kernel, so "it makes it easier to
> create an FDT for the kernel" doesn't count here (it counts elsewhere).

I think the idea behind using IEEE1275-like trees is that there is
significant overlap between the device information that IEEE1275
represents, and the device information which is configurable in qemu.
Ultimately whether it buys you enough depends on how large that
overlap is.

> FDTs are a special representation of IEEE 1275 trees in memory, designed
> to be compact and relocatable.  But that comes at a price: nodes move
> around when the tree changes.  The only real node id is the full name.

Or phandle, for those nodes which have one.

> This is not the common representation of decorated trees in C programs,
> and for a reason.  It's simpler to represent edges as C pointers.  Not
> the least advantage of that is notation: "->" beats a function call in
> legibility hands down.

Yes.  If there's enough manipulation of the tree, then you're
generally better off having a "live" format which uses pointers,
whether or not the fdt format is used at some stage in the process.
Both the kernel and dtc (when taking fdt input) convert the flattened
tree into a "live" representation internally.

> Example: the QEMU device data type needs to refer to its device node in
> the configuration tree.  If that tree is coded the plain old way, you
> store a pointer to the node and follow that.  If it is an FDT, then you
> have to store the full node name, and look up the node by name.  I find
> that tedious and verbose.

Um.. I don't really follow your example.  But I think I see your
point.  How problematic the flattened format is for this depends a lot
on exactly what you need to do with it.  Sometimes it's much easier to
avoid the flattened tree altogether, or transcribe it to a live
format.  Other times, the tree manipulation is simple enough that it's
easier to leave it flat (one example, for phases of the program where
the tree is read-only, which could be a lot for a configuration tree,
then node offsets *can* safely be used like pointers).

> My point is: the question how to represent our decorated tree in memory
> is entirely separate from the question of the tree's structure.  Just
> because you want your tree to conform to IEEE 1275 doesn't mean you want
> your tree flat at all times.

Absolutely, yes.


> Now let's examine how QEMU machine configuration and FDT machine
> descriptions for kernels are related.
> 
> In a way, both can be regarded as copies of a complete machine
> description with lots of stuff pruned.  Except the complete machine
> description doesn't exist.  Because there is no use for it.
> 
> FDT routinely prunes stuff like PCI and USB devices, because those are
> better probed.
> 
> QEMU configuration should certainly prune everything that is not
> actually configurable.
> 
> To go from QEMU configuration to FDT we therefore may want to prune
> superflous stuff, to keep it compact,

Not necessarily.  The kernel should be fine to deal with a tree that
has complete information, even if it doesn't need it, since that's
what a real OF implementation provides.

>  and we definitely have to add lots
> of stuff that has no place in configuration.

Yes.  Well.. whether this is a good plan depends critically on how big
that "lots" really is.

>  Compared to that task, a
> change of representation seems trivial.  I figure we want to copy the
> tree anyway, because we need to edit it pretty drastically.
> 
> It's not obvious to me whether it makes sense to create the FDT from the
> QEMU configuration automatically.  If we simulate a specific board, the
> FDT is pretty fixed, isn't it?  Much of the configurable stuff could be
> precisely in those parts that are omitted from FDT: PCI devices and
> such.

Well.. you definitely want to create the FDT passed to the kernel from
the qemu configuration.  But whether that's best done by essentially
transcribing a configuration tree which is in a similar format, or
just using the configuration tree info to poke the changable bits in a
"skeleton" FDT for the relevant machine is not so clear.

Possibly.  I'm not familiar enough with the various qemu supported
machine models to say.

> >> * Provide an example tree describing a bare-bones PC, like the one in my
> >>   prototype: CPU, RAM, BIOS, PIC, APIC, IOAPIC, PIT, DMA, UART, parallel
> >>   port, floppy controller, CMOS & RTC, a20 gate (port 92) and other
> >>   miscellanous I/O ports, i440fx, PIIX3 (ISA bridge, IDE, USB, ACPI),
> >>   Cirrus VGA with BIOS, some PCI NIC.  This gives us all an idea of the
> >>   tree structure.  Morphing that into something suitable for QEMU
> >>   configuration shouldn't be too hard then, just an exercice in
> >>   redecorating the tree.
> >
> > I don't off hand know any trees for a PC system.  There are a bunch of
> > example trees for powerpc systems in arch/powerpc/boot/dts in the
> > kernel tree.  A few of those, such as prep, at least have parts which
> > somewhat resemble a PC.  I believe the OLPC also has OF; that would be
> > an example OF tree for an x86 machine, if not a typical PC.
> 
> Could you point me to a specific file?  I grepped for prep and OLPC, no
> luck.

Oh, sorry, the prep tree hasn't gone into mainline yet.  But I believe
Mitch Bradley supplied a PC tree later in the thread, which would be
better for your purposes, anyway.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
