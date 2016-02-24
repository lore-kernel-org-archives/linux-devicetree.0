From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Warn on node name unit-addresses with '0x' or
 leading 0s
Date: Wed, 24 Feb 2016 09:01:30 -0600
Message-ID: <20160224150130.GA13624@rob-hp-laptop>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
 <1455223619-16052-3-git-send-email-robh@kernel.org>
 <20160219050709.GB15224@voom.fritz.box>
 <CAL_JsqLDdyLd4z_Pmsr7+vtnMZsusEpJYZ4tdZmjQFt0PD_Fbw@mail.gmail.com>
 <20160223054746.GT2808@voom.fritz.box>
 <CAL_Jsq+Nr6uzA0xzc=zKG4diZwDrgsbLAKDb80m6ZSq2NXcGgA@mail.gmail.com>
 <20160224004456.GB2808@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160224004456.GB2808-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2016 at 11:44:56AM +1100, David Gibson wrote:
> On Tue, Feb 23, 2016 at 08:35:46AM -0600, Rob Herring wrote:
> > On Mon, Feb 22, 2016 at 11:47 PM, David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > On Mon, Feb 22, 2016 at 10:51:46AM -0600, Rob Herring wrote:
> > >> On Thu, Feb 18, 2016 at 11:07 PM, David Gibson
> > >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >> > On Thu, Feb 11, 2016 at 02:46:59PM -0600, Rob Herring wrote:
> > >> >> Node name unit-addresses should never begin with 0x or leading 0s
> > >> >> regardless of whether they have a bus specific address (i.e. one with
> > >> >> commas) or not. Add warnings to check for these cases.
> > >> >
> > >> > Hmm.. I'm pretty sure that's true in practice, but it's not true in
> > >> > theory.  A bus could define it's unit address format just about
> > >> > however it wants, including with leading 0s.
> > >>
> > >> Only if it is not reviewed... This whole check is about what best
> > >> practices are, not what is possible.
> > >
> > > Hmm.  dtc checks are really about checking for best practice at the
> > > level of individual dts files, though, not bindings.
> > 
> > Checking simple-bus specifically would be checking a binding.
> 
> Sorry, I wasn't clear.  dtc checking the dts against a binding is
> fine, but checking the sanity of the binding itself is beyond its
> scope.
> 
> > >> > I think a better approach would be to add a test specific to
> > >> > simple-bus devices (by looking at compatible on the parent) that fully
> > >> > checks the unit address.
> > >> >
> > >> > From there we can start adding tests for other bus types.
> > >>
> > >> simple-bus is easy enough,
> > >
> > > So, start with that, then tackle the next problem.
> > >
> > >> but then next up would be I2C and SPI. We
> > >> can't generically tell if a node is on I2C or SPI bus.
> > >
> > > Why not?  Or perhaps.. how generically do you need?  I think having a
> > > big list of i2c / spi controllers would be acceptable here, if not
> > > ideal.
> > 
> > So someone adds a new controller, puts crap in for unit addresses, and
> > then no warnings until that compatible string is added to dtc. And I'm
> > still left spending my time in reviews telling them to fix this
> > trivial crap.
> > 
> > That's roughly 60 I2C controllers (families, so multiple compatible
> > strings each) plus similar number of SPI controllers, OF-graph
> > binding, and random other things where reg gets used.
> 
> Ah, I see.
> 
> Ok, I guess we do need to have an option for a "fallback" scheme for
> unit addresses (i.e. hex) for bus types we don't specifically
> recognize.  But I'd still like the logic to be:
>       if (known bus type)
>            check against format for this bus type
>       else
>            check against fallback format
> 
> Rather than putting the second test in with a hacked up set of
> exclusions.

Okay, makes sense.

Do you think we still need simple-bus as an explicit type given the 
check is the same as the default? Might be useful to have if we want to 
add some checks that address translations work.

> To do this nicely, I think the best way will be to add a bus_type
> field to the node structure in dtc, and have it populated (with an
> option for "unknown") in an early check pass, that later unit address
> tests can references as a prereq.
> 
> Pointer to a struct with unit address formatting functions, with NULL
> for unknown is the obvious choice to me for bus_type.

So, something like this for the first stage:

static bool pci_bus_check_is_type(struct node *node)
{
	struct property *prop;
	
	if (!node || !node->parent)
		return false;

	prop = get_property(node->parent, "device_type");
	if (!prop)
		return false;
		
	if (strcmp(prop->val, "pci") == 0)
		return true;
		
	return false;
}

static void pci_bus_check_unit_address()
{

}

struct bus_type_fns {
	.check_is_type = pci_bus_check_is_type,
	.check_unit_address = pci_bus_check_unit_address,
} pci_bus_fns;

struct bus_type_fns * {
	&pci_bus_fns,
	NULL
} bus_types;

static void fixup_bus_type(struct check *c, struct node *root,
				  struct node *node)
{
	struct bus_type_fns **bus;
	
	for (bus = bus_types; *bus != NULL; bus++) {
		if (!(*bus)->check_is_type(node))
			continue;

		node->bus_type = *bus;
		break;
	}
}
ERROR(bus_type, NULL, NULL, fixup_bus_type, NULL, NULL);


Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
