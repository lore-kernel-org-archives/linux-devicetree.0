From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 2/3] OLPC: add missing elements to device tree
Date: Sat, 5 Mar 2011 17:19:43 -0700
Message-ID: <20110306001943.GB7467@angua.secretlab.ca>
References: <20110304171235.10C1F9D401D@zog.reactivated.net>
	<20110305045042.GH7579@angua.secretlab.ca>
	<20110305092347.5ac9b1a4@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110305092347.5ac9b1a4@debxo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 05, 2011 at 09:23:47AM -0800, Andres Salomon wrote:
> On Fri, 4 Mar 2011 21:50:42 -0700
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> 
> > > +static void __init prom_alloc_property(struct device_node *node,
> > > +	const char *name, const char *value)
> > > +{
> > > +	struct property *p = prom_early_alloc(sizeof(struct
> > > property));
> > 
> > How early is this running?  If the allocator is set up by now, then
> > this should use kzalloc()...
> 
> It's running at the same time the device tree is created, so no, the
> allocator isn't available yet.
> 
> This isn't strictly a requirement, but it would be good to get
> firmware hacks out of the way as early as possible, and it might as
> well be done at the same time that the DT is created.

Yes, you definitely want to get firmware fiddling done with as soon as
possible.  Certainly before anything starts relying on the device tree
data.

Another option (assuming OFW is still alive) is to as it to create the
missing properties before extracting the tree.  This is what we're
currently doing in PowerPC.

> 
> > 
> > > +
> > > +	p->name = prom_alloc_string(name, NULL);
> > > +	p->value = prom_alloc_string(value, &p->length);
> > 
> > ... which would also mean that kstrdup()/kmemdup() can be used here
> > directly.
> > 
> > > +	prom_add_property(node, p);
> > > +}
> > 
> > This would be useful in common code.  prom_create_property() might
> > be a better name.  It should also accept a length argument for the
> > size of the data.
> > 
> > > +
> > > +/* Add dcon device as child of display */
> > > +static void __init add_dcon_node(struct device_node *display)
> > > +{
> > > +	struct device_node *node = prom_early_alloc(sizeof(struct
> > > device_node));
> > > +	unsigned long flags;
> > > +
> > > +	kref_init(&node->kref);
> > > +	node->name = prom_alloc_string("dcon", NULL);
> > > +	node->full_name = (char *) node->name;
> > > +	node->parent = display;
> > > +
> > > +	write_lock_irqsave(&devtree_lock, flags);
> > > +	node->sibling = node->parent->child;
> > > +	node->allnext = allnodes;
> > > +	node->parent->child = node;
> > > +	allnodes = node;
> > > +	write_unlock_irqrestore(&devtree_lock, flags);
> > > +
> > 
> > This should be using the existing of_attach_node() function to link
> > the node into the tree (in fact I know you've seen it because the
> > above 6 lines are identical).  :-)  Also, there already exists a
> > function "new_node" in  arch/powerpc/platforms/iseries/vio.c that
> > would be useful to move into drivers/of/base.c
> 
> Is there any particular reason why OF_DYNAMIC needs to depend upon
> PPC_OF?

Only historical.  Those functions can probably be brought out from
under the OF_DYNAMIC protection...  Bonus points for making pdt.c and
fdt.c use it for linking nodes to the tree so that all methods are
consistent.  :-)

It would also be useful to make the property linking code common for
fdt.c and pdt.c

g.
