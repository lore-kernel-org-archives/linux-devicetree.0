From: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 12:26:28 +0100
Message-ID: <87ab8qr317.fsf@pike.pond.sub.org>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<87k57w0x4r.fsf@pike.pond.sub.org>
	<20090213003724.GA8104@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090213003724.GA8104-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> (David Gibson's message of
	"Fri\, 13 Feb 2009 11\:37\:24 +1100")
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:

> On Thu, Feb 12, 2009 at 11:26:12AM +0100, Markus Armbruster wrote:
>> Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> writes:
> [snip]
>> > I won't say IEEE1275 is perfect, but IMHO it would be pretty silly to
>> > reinvent all the design and infrastructure for a similar-but-different
>> > device tree.
>> >
>> > [Patch snipped]
>> 
>> I'm not at all opposed to adapting FDT for QEMU use.  My patch is a
>> prototype, and I'm prepared to throw away some or all of it.
>> 
>> To get this thing started, I wanted working code to demonstrate what I'm
>> talking about.  If I had dug deeper into FDTs first, we would not be
>> talking now.
>> 
>> The task I outlined in my memo involves much more than just coming up
>> with a device tree data structure.  That data structure is to me one
>> detail among many, and a much less hairy one than most others.  It
>> certainly was for the prototype.
>> 
>> If I read the comments correctly (all comments, not just this one), the
>> only real issue with my proposal is you'd rather use FDT for the config
>> tree.  I don't mind, except I don't know enough about that stuff to do
>> it all by myself, at least not in a reasonable time frame.  I think I
>> understand the concepts, can read .dts files with some head-scratching,
>> and I could perhaps even write one if I sacrificed a chicken or two.
>> Designing a binding, however, feels well above my level of
>> (in)competence.
>> 
>> So, to make FDT happen, I need help.  Specifically:
>> 
>> * Point me to the FDT code I'm supposed to integrate.  I'm looking for
>>   basic decorated tree stuff: create trees, traverse them, get and put
>>   properties, add and delete nodes, read and write them as plain,
>>   human-readable text.
>
> dtc and libfdt is a good place to start, if you haven't yet
> investigated them:
> 	git://git.jdl.com/software/dtc.git
> Note that although they're distributed together as one tree, dtc and
> libfdt are essentially independent pieces of software.  dtc converts
> device trees between various formats, dts and dtb in particular.
>
> libfdt does a number of the things you mention with flat trees -
> get/set properties, build trees, traverse etc.  If it doesn't do
> everything you need, we can probably extend it so that it does: I want
> libfdt to be *the* library for manipulating trees in the fdt forma.
> It's designed to be easy to embed in other packages for this reason,
> although it does have some usage peculiarities because in particular
> it's possible to integrate into very limited environments like
> firmwares.
>
> [Jon Loeliger is the current maintainer of dtc and libfdt, but I
> originally wrote both of them - I know as much about them as anyone
> does]

Okay, I looked at dtc and libfdt again, a bit more closely.  I'm sure
there's plenty of ignorance left in me, so please correct me when I'm
babbling nonsense.

FDT is a "flattened tree", i.e. a tree data structure laid out in a
block of memory in a clever way to make it compact and easily
relocatable.  I understand why these are important requirements for
passing information through bootloader to kernel.  They're irrelevant,
however, for use as QEMU configuration.

You can identify an FDT node by node offset or node name.  The node
offset can change when you add or delete nodes or properties.

You want everyone to use libfdt for manipulating FDTs.  I think that's
entirely sensible.  What I still don't get is something else: Why use
FDT for QEMU configuration in the first place?  Let me explain.

I think we have two distinct problems: the need for a flexible,
expressive QEMU machine configuration file and a virtual device
configuration machinery driven by it, and the need for an FDT to pass to
a PowerPC kernel.  The two may be related, but they are not identical.

Let's pretend for a minute the latter need doesn't exist.

QEMU machine configuration wants to be a decorated tree: a tree of named
nodes with named properties.

IEEE 1275 is a standard describing a special kind of decorated tree.
Other kinds can be created with a binding.  If we create a suitable
binding, we can surely cast our configuration trees in the IEEE 1275
framework.

But what would that buy us?  This is a honest question, born out of my
relative ignorance of IEEE 1275.  Mind that we're still busily ignoring
the need for an FDT to pass to a kernel, so "it makes it easier to
create an FDT for the kernel" doesn't count here (it counts elsewhere).

FDTs are a special representation of IEEE 1275 trees in memory, designed
to be compact and relocatable.  But that comes at a price: nodes move
around when the tree changes.  The only real node id is the full name.

This is not the common representation of decorated trees in C programs,
and for a reason.  It's simpler to represent edges as C pointers.  Not
the least advantage of that is notation: "->" beats a function call in
legibility hands down.

Example: the QEMU device data type needs to refer to its device node in
the configuration tree.  If that tree is coded the plain old way, you
store a pointer to the node and follow that.  If it is an FDT, then you
have to store the full node name, and look up the node by name.  I find
that tedious and verbose.

My point is: the question how to represent our decorated tree in memory
is entirely separate from the question of the tree's structure.  Just
because you want your tree to conform to IEEE 1275 doesn't mean you want
your tree flat at all times.

Now let's examine how QEMU machine configuration and FDT machine
descriptions for kernels are related.

In a way, both can be regarded as copies of a complete machine
description with lots of stuff pruned.  Except the complete machine
description doesn't exist.  Because there is no use for it.

FDT routinely prunes stuff like PCI and USB devices, because those are
better probed.

QEMU configuration should certainly prune everything that is not
actually configurable.

To go from QEMU configuration to FDT we therefore may want to prune
superflous stuff, to keep it compact, and we definitely have to add lots
of stuff that has no place in configuration.  Compared to that task, a
change of representation seems trivial.  I figure we want to copy the
tree anyway, because we need to edit it pretty drastically.

It's not obvious to me whether it makes sense to create the FDT from the
QEMU configuration automatically.  If we simulate a specific board, the
FDT is pretty fixed, isn't it?  Much of the configurable stuff could be
precisely in those parts that are omitted from FDT: PCI devices and
such.

>> * Provide an example tree describing a bare-bones PC, like the one in my
>>   prototype: CPU, RAM, BIOS, PIC, APIC, IOAPIC, PIT, DMA, UART, parallel
>>   port, floppy controller, CMOS & RTC, a20 gate (port 92) and other
>>   miscellanous I/O ports, i440fx, PIIX3 (ISA bridge, IDE, USB, ACPI),
>>   Cirrus VGA with BIOS, some PCI NIC.  This gives us all an idea of the
>>   tree structure.  Morphing that into something suitable for QEMU
>>   configuration shouldn't be too hard then, just an exercice in
>>   redecorating the tree.
>
> I don't off hand know any trees for a PC system.  There are a bunch of
> example trees for powerpc systems in arch/powerpc/boot/dts in the
> kernel tree.  A few of those, such as prep, at least have parts which
> somewhat resemble a PC.  I believe the OLPC also has OF; that would be
> an example OF tree for an x86 machine, if not a typical PC.

Could you point me to a specific file?  I grepped for prep and OLPC, no
luck.

>> * Advice as we go.
>
> I'll do what I can.

Thanks in advance!
