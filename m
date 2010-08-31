From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Start adding checks for reg property and unit name
Date: Tue, 31 Aug 2010 10:53:35 +1000
Message-ID: <20100831005335.GD5210@yookeroo>
References: <20100830040305.GB5210@yookeroo>
	<20100830131418.47fcd392@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100830131418.47fcd392-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 30, 2010 at 01:14:18PM -0500, Scott Wood wrote:
> On Mon, 30 Aug 2010 14:03:05 +1000
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> 
> > In device trees, the unit name portion of any node (the part after the
> > "@") is supposed to be derived from the value of the node's 'reg'
> > property.  However, this is not enforced by the structure of a dtb
> > file, nor is it checked by dtc.  Checking is non-trivial, because the
> > manned in which the 'reg' property is encoded into a unit address can
> > vary from bus to bus.
> > 
> > This patch starts adding the infrastructure for making such checks to
> > dtc.  At present, it will only check the unit addresses on immediate
> > children of the root bus (which is assumed to have a unit addresses
> > encoded in plain hex) and that any other node has a unit address if
> > and only if it has a 'reg' property.  However, it should be relatively
> > straightforward to add more detailed checking for other sorts of
> > busses from this point.
> 
> Is there any way for a user to disable this check?

Well, it's only a warning, so you can just ignore it.

> First, ePAPR recommends, but does not insist on this for unit addresses,
> except to the extent that a particular bus binding requires it:

Right.. and the unit address checking is already set up to be per-bus
type.

> > The unit-address component of the name is specific to the bus type on which the node sits. It consists
> > of one or more ASCII characters from the set of characters in Table 2-1. The fundamental requirement
> > is that at any level of the device tree the unit-address be unique in order to differentiate nodes with the
> > same name at the same level in the tree. The binding for a particular bus may specify additional, more
> > specific requirements for the format of a unit-address.
> > The unit-address should match the first address specified in the reg property of the node. If the node
> > has no reg property, the unit-address may be omitted if the node name alone differentiates the node
> > from other nodes at the same level in the tree.

Hrm, yeah.  The intent of that was to emphasize the uniqueness
requirement, rather than to remove the unit address requirement.  I
was thinking of "should" in the IETF RFC sense - that is: there may be
some peculiar circumstances in which you need to do something else,
but unless you know you have one of those cases, this is a
requirement.

> That was probably a mistake that should be corrected in the next ePAPR
> revision (keeping bindings implementable on true OF is generally a good
> thing), but until then it would be nice if there were at least some
> mode whereby dtc could accept any valid ePAPR input.

Right.  Well, it will accept it - just with a warning.

> Second, dtc is sometimes used for things that aren't semantically
> device trees, and semantic checks that can't be turned off can
> interfere with that usage.  We use it to compile a configuration tree
> for our hypervisor, for example, and it's also used for a U-Boot image
> format (with incbin).  Both of those currently use unit address syntax
> without reg, and while it may a bad habit, it's not clearly wrong since
> it's a different semantic domain from OF.

Right, the structure of the semantic checking stuff is designed so
that you can still get dtc to produce useful output, even on a
semantically invalid tree.  Warnings produce output anyway, and you
can get output even with errors using -f.

> I guess I should write up a patch that allows individual checks to be
> enabled/disabled from the command line...

I also designed the checking structure to allow that.  Apparently I
never got around to actually implementing the command line option,
but I certainly thought about it, so it should be pretty easy to do:
just scan the checks table for the name and poke the "level" field to
IGNORE.  So, patches welcome :).  If you want to go the whole hog,
make it so you can also upgrade usually ignored checks, and set which
checks are warnings and which errors.

> Eventually a way to explicitly support alternate semantic domains, with
> their own set of checks, would be nice too.

Good idea.  That's more complicated, but still not fundamentally
difficult.  You'll just need a table of semantic domains, each with a
canned set of ignore/warning/error values.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
