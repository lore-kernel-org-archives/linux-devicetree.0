From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 11:43:05 +1100
Message-ID: <20090213004305.GB8104@yookeroo.seuss>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<20090212040138.GD31142@yookeroo.seuss>
	<87iqng0x3t.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87iqng0x3t.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 12, 2009 at 11:26:46AM +0100, Markus Armbruster wrote:
> David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org> writes:
> 
> > On Wed, Feb 11, 2009 at 12:50:28PM -0600, Hollis Blanchard wrote:
> >> On Wed, 2009-02-11 at 16:40 +0100, Markus Armbruster wrote:
> > [snip]
> >> > I briefly examined the DT source format and the tree structure it
> >> > describes for the purpose of QEMU configuration.  I decided against
> >> > using it in my prototype because I found it awfully low-level and
> >> > verbose for that purpose (I'm sure it serves the purpose it was designed
> >> > for just fine).  Issues include:
> >> > 
> >> > * Since the DT is designed for booting kernels, not configuring QEMU,
> >> >   there's information that has no place in QEMU configuration, and
> >> >   required QEMU configuration isn't there.
> >> 
> >> What's needed is a "binding" in IEEE1275-speak: a document that
> >> describes qemu-specific nodes/properties and how they are to be
> >> interpreted.
> >> 
> >> As an example, you could require that block devices contain properties
> >> named "qemu,path", "qemu,backend", etc.
> >
> > Yes, it shouldn't be hard to annotate an IEEE1275 style tree with
> > extra information for qemu's use.
> 
> I don't feel up to that task, because I'm not really familiar with
> IEEE1275.  Could you help out?

Uh.. up to some level at least.

> >                                    As for the other direction, in some
> > cases it may be appropriate for qemu's device tree code to fill in
> > missing device tree properties, based on what the device emulation
> > code knows about itself.
> 
> Agreed.  Configuration should only contain what is actually
> configurable.  Anything else that is needed by a consumer of the tree
> should be filled in automatically.

Right.  I guess it will depend exactly what the balance is between
configuration and generated information whether we want to use a dts
with annontations in extra properties or a different tree format as
the root source format.  Either way I think we want to use the fdt
format as the format that qemu and the guest firmware work with.

> >> > * Redundancy between node name and its device_type property.
> >
> > Note that "device_type" may not mean what you think.  It describes
> > what methods the device support within the OF client interface.  New
> > device trees that aren't linked to a full OF implementation with
> > client interface should generally omit device_type in most places
> > (there are a few special cases for compatibility with OSes that expect
> > device_type properties in certain places).
> 
> I guess the ignorance I mentioned shows ;)

Heh, well, device_type is very commonly misunderstood for good
reason.  It made sense in the original OF context, but in the context
of flat trees, the name is very misleading.

> >> > * Property "reg", which encodes address ranges, does so in terms of
> >> >   "cells": #address-cells 32-bit words (big endian) for the address,
> >> >   followed by #size-cells words for the size, where #address-cells and
> >> >   #size-cells are properties of the enclosing bus.  If this sounds
> >> >   like gibberish to you, well, that's my point.
> >
> > #address-cells and #size-cells takes a little getting used to, but
> > it's really not that bad.  It's just a way of representing the fact
> > that different busses have different sized address encodings.
> 
> I didn't mean to say they are a bad idea for FDTs, just that they're on
> an awkward level of abstraction for QEMU configuration.  There, I'd
> rather express a PCI address as "02:01.0" than as <0x00000220>.
> Translating text to binary is the machine's job, not the user's.

Ah, I see what you mean.  Hrm, there are several possibilities here,
we'll have to see which works out best for your purposes.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
