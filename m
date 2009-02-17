From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Tue, 17 Feb 2009 14:29:09 +1100
Message-ID: <20090217032909.GA29225@yookeroo.seuss>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<87k57w0x4r.fsf@pike.pond.sub.org>
	<20090213003724.GA8104@yookeroo.seuss>
	<87ab8qr317.fsf@pike.pond.sub.org>
	<20090216034214.GB9772@yookeroo.seuss>
	<87iqnawd2r.fsf@pike.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87iqnawd2r.fsf-A7mx1g9ivIOttUaS3K59qNi2O/JbrIOy@public.gmane.org>
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

On Mon, Feb 16, 2009 at 05:39:40PM +0100, Markus Armbruster wrote:
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:
> > On Fri, Feb 13, 2009 at 12:26:28PM +0100, Markus Armbruster wrote:
[snip]
> > I think the idea behind using IEEE1275-like trees is that there is
> > significant overlap between the device information that IEEE1275
> > represents, and the device information which is configurable in qemu.
> > Ultimately whether it buys you enough depends on how large that
> > overlap is.
> 
> I think that's fair.
> 
> I believe we don't quite know yet whether the overlap will make it
> worthwhile.

Yeah, true enough.

> One way to approach this is to assume it will until proven wrong.  You
> start with an IEEE 1275 description of the machine, and extend or adapt
> it as you go.  My problem with that is that we don't have such
> descriptions for the machines that interest me.  Developing them is a
> big step that pays no immediate benefits, but blocks the little steps
> that do pay.  Moreover, without a *real* user of the description, I'd
> likely develop something that looks like IEEE 1275 to me, but isn't.  If
> it turns out that IEEE 1275 is not worth it, tough, we already paid for
> it.
> 
> Another way to approach this is to admit we don't know enough and punt
> the decision until we do.  Start with the beneficial baby steps.  Limit
> the machine description business to what is required for the baby steps,
> making a best effort to stay close to IEEE 1275 structurally.  If it
> turns out that IEEE 1275 is worth it, we do whatever is left to make the
> descriptions conform to it.
> 
> I'm much more comfortable with the second approach.

That's reasonable.  However, once you've taken enough baby steps you
do want to be careful that you don't end up long term with something
that's similar enough to 1275 to be confusing, but not similar enough
to be useful.  So at some point we do want to take a look ahead and
see how much difference there will be between the qemu-required config
information and the 1275 dectree.

> >> FDTs are a special representation of IEEE 1275 trees in memory, designed
> >> to be compact and relocatable.  But that comes at a price: nodes move
> >> around when the tree changes.  The only real node id is the full name.
> >
> > Or phandle, for those nodes which have one.
> 
> Right, forgot about those.
> 
> >> This is not the common representation of decorated trees in C programs,
> >> and for a reason.  It's simpler to represent edges as C pointers.  Not
> >> the least advantage of that is notation: "->" beats a function call in
> >> legibility hands down.
> >
> > Yes.  If there's enough manipulation of the tree, then you're
> > generally better off having a "live" format which uses pointers,
> > whether or not the fdt format is used at some stage in the process.
> > Both the kernel and dtc (when taking fdt input) convert the flattened
> > tree into a "live" representation internally.
> 
> Not surprising.
> 
> >> Example: the QEMU device data type needs to refer to its device node in
> >> the configuration tree.  If that tree is coded the plain old way, you
> >> store a pointer to the node and follow that.  If it is an FDT, then you
> >> have to store the full node name, and look up the node by name.  I find
> >> that tedious and verbose.
> >
> > Um.. I don't really follow your example.  But I think I see your
> > point.  How problematic the flattened format is for this depends a lot
> > on exactly what you need to do with it.  Sometimes it's much easier to
> > avoid the flattened tree altogether, or transcribe it to a live
> > format.  Other times, the tree manipulation is simple enough that it's
> > easier to leave it flat (one example, for phases of the program where
> > the tree is read-only, which could be a lot for a configuration tree,
> > then node offsets *can* safely be used like pointers).
> 
> The machines I care for come with many optional and configurable parts.
> We select the basic machine type with command line option -M, and
> configure the rest with more command line options.  I figure we want to
> keep supporting these options, at least for a while.
> 
> I believe the best way to deal with that is start with a basic tree
> selected by -M, then modify it according to the other options.  So,
> there's a fair amount of configuration tree mutation.

Yeah, you're probably right.  Although, in some cases the amount of
complex tree mutation can be cut down by thinking about things in the
right order.  For example if you have a bunch of optional devices,
rather than adding them one by one (with all the required properties)
to the skeleton tree, you can instead have the skeleton tree be the
all-bells-and-whistles variant then delete the subtrees that aren't
present.  libfdt even has a function to replace subtrees with nops
instead of eliding them, which means the offsets of other nodes won't
change.

> >> My point is: the question how to represent our decorated tree in memory
> >> is entirely separate from the question of the tree's structure.  Just
> >> because you want your tree to conform to IEEE 1275 doesn't mean you want
> >> your tree flat at all times.
> >
> > Absolutely, yes.
> >
> >> Now let's examine how QEMU machine configuration and FDT machine
> >> descriptions for kernels are related.
> >> 
> >> In a way, both can be regarded as copies of a complete machine
> >> description with lots of stuff pruned.  Except the complete machine
> >> description doesn't exist.  Because there is no use for it.
> >> 
> >> FDT routinely prunes stuff like PCI and USB devices, because those are
> >> better probed.
> >> 
> >> QEMU configuration should certainly prune everything that is not
> >> actually configurable.
> >> 
> >> To go from QEMU configuration to FDT we therefore may want to prune
> >> superflous stuff, to keep it compact,
> >
> > Not necessarily.  The kernel should be fine to deal with a tree that
> > has complete information, even if it doesn't need it, since that's
> > what a real OF implementation provides.
> 
> Well, wasn't compactness one of the reasons to flatten it in the first
> place?

One, since we were aiming at embedded systems, but not nearly a big a
factor as relocatability.  For qemu, I don't think the compactness is
much of an issue.

> >>  and we definitely have to add lots
> >> of stuff that has no place in configuration.
> >
> > Yes.  Well.. whether this is a good plan depends critically on how big
> > that "lots" really is.
> 
> I suspect the only way to find out is to try.

Indeed.

[snip]
> > Oh, sorry, the prep tree hasn't gone into mainline yet.  But I believe
> > Mitch Bradley supplied a PC tree later in the thread, which would be
> > better for your purposes, anyway.
> 
> Got that, haven't digested it yet.

Fair enough.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
