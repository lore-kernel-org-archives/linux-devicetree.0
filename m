From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Sat, 16 Oct 2010 02:10:12 -0600
Message-ID: <20101016081012.GH653@angua.secretlab.ca>
References: <20101016010732.4855.52273.stgit@riker>
	<AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
	<1287199277.4535.1423.camel@riker> <20101016064744.GD5036@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101016064744.GD5036@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 16, 2010 at 05:47:44PM +1100, David Gibson wrote:
> On Fri, Oct 15, 2010 at 08:21:17PM -0700, John Bonesio wrote:
> > On Fri, 2010-10-15 at 20:35 -0600, Grant Likely wrote:
> [snip]
> > > > +       | devicetree DT_REMOVENODE DT_REF ';'
> > > > +               {
> > > > +                       struct node *target;
> > > > +
> > > > +                       target = get_node_by_label($1, $3);
> > > > +                       if (target)
> > > > +                               remove_nodes(target);
> > > > +                       else
> > > > +                               yyerror("label, '%s' does not exist in"
> > > > +                                       " node removal", $3);
> > > >        ;
> > > 
> > > This handles the syntax at the top level, but doesn't deal with the
> > > /*-node/ keywords when they are within the overlay tree.
> > > 
> > > Also, I don't know if you'll be able to handle it in the same way when
> > > it comes to handling the new tokens embedded within an overlay tree
> > > because it isn't so easy to resolve the node to be removed.  In order
> > > to handle both cases in the same way, it might be better to set a
> > > 'replace' flag in struct node that defers the actual remove of the
> > > original node until merge_nodes() time.
> > 
> > Ok, so maybe I misunderstood. I thought we had decided that node
> > modifications would only happen at the top level, but now that I'm
> > looking back through your examples earlier today, and I see this isn't
> > true.
> 
> Um.. that part of the discussion got confusing.  I think only allowing
> the operations (and I still don't think the set implemented here are
> quite right, though they're close) at the top-level is a better idea.
> 
> Grant, is there a reason you think we need to have replacement as an
> option within each tree, rather than a "per-overlay-sheet" option.

Yes, because I need the ability to remove/replace a child of a
labelled node.  Not every node that needs to be manipulated will
necessarily have a label.

For example; I could have a labelled spi bus node with child nodes for
each of the spi devices.  I want to be able to remove/replace the
child nodes without having to label them first.

g.
