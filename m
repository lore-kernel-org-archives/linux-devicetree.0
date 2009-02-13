From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 11:37:24 +1100
Message-ID: <20090213003724.GA8104@yookeroo.seuss>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<87k57w0x4r.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87k57w0x4r.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
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

On Thu, Feb 12, 2009 at 11:26:12AM +0100, Markus Armbruster wrote:
> Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> writes:
[snip]
> > I won't say IEEE1275 is perfect, but IMHO it would be pretty silly to
> > reinvent all the design and infrastructure for a similar-but-different
> > device tree.
> >
> > [Patch snipped]
> 
> I'm not at all opposed to adapting FDT for QEMU use.  My patch is a
> prototype, and I'm prepared to throw away some or all of it.
> 
> To get this thing started, I wanted working code to demonstrate what I'm
> talking about.  If I had dug deeper into FDTs first, we would not be
> talking now.
> 
> The task I outlined in my memo involves much more than just coming up
> with a device tree data structure.  That data structure is to me one
> detail among many, and a much less hairy one than most others.  It
> certainly was for the prototype.
> 
> If I read the comments correctly (all comments, not just this one), the
> only real issue with my proposal is you'd rather use FDT for the config
> tree.  I don't mind, except I don't know enough about that stuff to do
> it all by myself, at least not in a reasonable time frame.  I think I
> understand the concepts, can read .dts files with some head-scratching,
> and I could perhaps even write one if I sacrificed a chicken or two.
> Designing a binding, however, feels well above my level of
> (in)competence.
> 
> So, to make FDT happen, I need help.  Specifically:
> 
> * Point me to the FDT code I'm supposed to integrate.  I'm looking for
>   basic decorated tree stuff: create trees, traverse them, get and put
>   properties, add and delete nodes, read and write them as plain,
>   human-readable text.

dtc and libfdt is a good place to start, if you haven't yet
investigated them:
	git://git.jdl.com/software/dtc.git
Note that although they're distributed together as one tree, dtc and
libfdt are essentially independent pieces of software.  dtc converts
device trees between various formats, dts and dtb in particular.

libfdt does a number of the things you mention with flat trees -
get/set properties, build trees, traverse etc.  If it doesn't do
everything you need, we can probably extend it so that it does: I want
libfdt to be *the* library for manipulating trees in the fdt forma.
It's designed to be easy to embed in other packages for this reason,
although it does have some usage peculiarities because in particular
it's possible to integrate into very limited environments like
firmwares.

[Jon Loeliger is the current maintainer of dtc and libfdt, but I
originally wrote both of them - I know as much about them as anyone
does]

> * Provide an example tree describing a bare-bones PC, like the one in my
>   prototype: CPU, RAM, BIOS, PIC, APIC, IOAPIC, PIT, DMA, UART, parallel
>   port, floppy controller, CMOS & RTC, a20 gate (port 92) and other
>   miscellanous I/O ports, i440fx, PIIX3 (ISA bridge, IDE, USB, ACPI),
>   Cirrus VGA with BIOS, some PCI NIC.  This gives us all an idea of the
>   tree structure.  Morphing that into something suitable for QEMU
>   configuration shouldn't be too hard then, just an exercice in
>   redecorating the tree.

I don't off hand know any trees for a PC system.  There are a bunch of
example trees for powerpc systems in arch/powerpc/boot/dts in the
kernel tree.  A few of those, such as prep, at least have parts which
somewhat resemble a PC.  I believe the OLPC also has OF; that would be
an example OF tree for an x86 machine, if not a typical PC.

> * Advice as we go.

I'll do what I can.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
