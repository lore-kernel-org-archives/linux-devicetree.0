From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Mon, 18 Oct 2010 11:51:32 +1100
Message-ID: <20101018005132.GC4922@yookeroo>
References: <20101016010732.4855.52273.stgit@riker>
	<AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 15, 2010 at 08:35:56PM -0600, Grant Likely wrote:
> Hi John.
> =

> On Fri, Oct 15, 2010 at 7:07 PM, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > This is interesting when the /include/ "<filename>" feature is used. Th=
is way
> > we can create base device tree source files for a family of systems and=
 modify
> > the device tree for a specific system.
> >
> > The current sytem allows an existing node to be extended with new prope=
rties
> > and subnodes.
> >
> > The new features allow an existing node to be replaced completely by th=
e new
> > properties and subnodes. The new features also allow an existing node t=
o be
> > deleted.
> >
> > This patch does not yet provide a way to remove properties.
> >
> > - John
> =

> Also need s-o-b line, and anything that doesn't belong as part of the
> commit message, such as '- John', needs to be below the '---' line so
> that git will ignore it.
> =

> The patch looks pretty good, but I cannot comment fully until the
> keyword handling works when deeper in the tree (see below).

[snip]
> > + =A0 =A0 =A0 struct property *prop;
> > + =A0 =A0 =A0 struct node *child, *parent;
> > +
> > + =A0 =A0 =A0 while (node->proplist) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Pop the property off the list */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D node->proplist;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 node->proplist =3D prop->next;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop->next =3D NULL;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(prop);
> > + =A0 =A0 =A0 }
> =

> It would be useful to have a 'pop_property()' macro so this could be
> simplified to:
> =

> 	while (prop =3D pop_child_node(&node->proplist))
> 		free(prop);
> =

> But then on the other hand, most of the list management is open coded
> in dtc. It would be nice to use the list_head macros like used in the
> kernel, but that is probably work for another day. (if it is even worth
> the effort).

I had a look into this at one point.  The way we build up the tree in
a kinda-sorta functional programming like way in dts parsing actually
makes using the list.h form kind of hard.  At least without a fancier
allocator (maybe I should bite the bullet and do a talloc conversion).

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
