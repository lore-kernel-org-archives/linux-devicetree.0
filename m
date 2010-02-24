From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Allow device tree to be modified by additonal device
	tree sections
Date: Wed, 24 Feb 2010 15:42:20 +1100
Message-ID: <20100224044220.GI7187@yookeroo>
References: <20100223192659.11939.42521.stgit@angua>
	<20100224013658.GG7187@yookeroo>
	<fa686aa41002231805q1f5c6179j6fb7f6cd0558972e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41002231805q1f5c6179j6fb7f6cd0558972e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Tue, Feb 23, 2010 at 07:05:53PM -0700, Grant Likely wrote:
> On Tue, Feb 23, 2010 at 6:36 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Tue, Feb 23, 2010 at 12:28:13PM -0700, Grant Likely wrote:
[snip]
> >> @@ -83,7 +84,7 @@ static unsigned long long eval_literal(const char *s=
, int base, int bits);
> >> =A0%%
> >>
> >> =A0sourcefile:
> >> - =A0 =A0 =A0 DT_V1 ';' memreserves devicetree
> >> + =A0 =A0 =A0 DT_V1 ';' memreserves devicetrees
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 the_boot_info =3D build_bo=
ot_info($3, $4,
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 guess_boot_cpuid($4));
> >> @@ -115,6 +116,17 @@ addr:
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> >> =A0 =A0 =A0 =A0 ;
> >>
> >> +devicetrees:
> >> + =A0 =A0 =A0 /* empty */
> >
> > We always want at least one device tree block, so the base case here
> > should be 'devicetree', rather than empty.
> =

> Okay, I'll change this.  I'm unclear however, if a single 'devicetree'
> can get promoted up to a 'devicetrees', then will that cause problems
> with the 'devicetree devicetrees' rule because the stack will contain
> a 'devicetrees' when the rule wants a 'devicetree' first?

As we discussed on IRC, no.  bison is clever enough to figure out the
right reduction to make based on context and lookahead.

> >> + =A0 =A0 printf("Merge node, old_node:%s new_node:%s\n", old_node->na=
me,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 new_node ? new_node->name : "<NULL>" );
> >
> > There already exist some debug() macros in dtc.h for this sort of
> > message.
> =

> I hadn't meant to leave this in.  It's already gone.
> =

> >
> >> + =A0 =A0 if (!new_node)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 return old_node;
> >
> > With the grammar change suggested above, you don't need this.
> =

> Cool.
> =

> >
> >> + =A0 =A0 /* Move the override properties into the old node. =A0If the=
re
> >> + =A0 =A0 =A0* is a collision, replace the old definition with the new=
 */
> >> + =A0 =A0 while (new_node->proplist) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 /* Pop the property off the list */
> >> + =A0 =A0 =A0 =A0 =A0 =A0 new_prop =3D new_node->proplist;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 new_node->proplist =3D new_prop->next;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 new_prop->next =3D NULL;
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 /* Look for a collision, set new value if th=
ere is */
> >> + =A0 =A0 =A0 =A0 =A0 =A0 for_each_property(old_node, old_prop) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (strcmp(old_prop->name, n=
ew_prop->name) =3D=3D 0) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 old_prop->va=
l =3D new_prop->val;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(new_pro=
p);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 new_prop =3D=
 NULL;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> >
> > I guess there should be a data_free() here of the old value. =A0Mind you
> > memory management in dtc is already a bit of a mess. =A0I've considered
> > moving it to talloc() (Tridge's nifty hierarchical pool allocator) or,
> > more controversially, just never bothering to free() anything on the
> > grounds that dtc processes are always shortlived anyway.
> =

> Okay, think about it and let me know what you want me to do here.

Sure.  I guess my point is that I'm not really worried about leaks,
since dtc is always short-lived.

[snip]
> > =A0However, there's also a bigger question here. =A0How precise do
> > we want the nodename matching to be. =A0Should we be using the OF-style
> > matchin where you can omit the unit address when it's unambiguous.
> >
> > i.e. Should we allow:
> >
> > / {
> > =A0 =A0 =A0 =A0...
> > =A0 =A0 =A0 =A0somebus@1234 {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0widget@17 {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> > =A0 =A0 =A0 =A0};
> > };
> >
> > / {
> > =A0 =A0 =A0 =A0...
> > =A0 =A0 =A0 =A0somebus {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0widget {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0new-property;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> > =A0 =A0 =A0 =A0};
> > };
> >
> =

> My opinion: no way.  We're not working with real OF, and none of the
> use cases I see have any need of such a feature.  While we could
> forbid it now and permit it later, we cannot permit it now and forbid
> it later.  I say no until someone comes up with a reasonable use case
> on why it should be implemented.

A sound argument.  Done.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
