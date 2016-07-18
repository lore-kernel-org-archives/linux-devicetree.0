From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Mon, 18 Jul 2016 14:39:31 +1000
Message-ID: <20160718043931.GM16769@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0@gmail.com>
 <20160712143404.GD16355@voom.fritz.box>
 <20160713083803.GD4761@lukather>
 <20160713150745.GG14615@voom.fritz.box>
 <20160713193757.GL4761@lukather>
 <20160714083058.GN14615@voom.fritz.box>
 <CAPhXvM53bMUypbUYSgC6BbAar2=dD8Y=Ktpu3LQzRTGx=yJesQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WuedheRyq6FDfQ9j"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPhXvM53bMUypbUYSgC6BbAar2=dD8Y=Ktpu3LQzRTGx=yJesQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--WuedheRyq6FDfQ9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 10:18:04AM +0100, Phil Elwell wrote:
> On Thu, Jul 14, 2016 at 9:30 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Jul 13, 2016 at 09:37:57PM +0200, Maxime Ripard wrote:
> >> On Thu, Jul 14, 2016 at 01:07:45AM +1000, David Gibson wrote:
> >> > On Wed, Jul 13, 2016 at 10:38:03AM +0200, Maxime Ripard wrote:
> >> > > Hi David,
> >> > >
> >> > > On Wed, Jul 13, 2016 at 12:34:04AM +1000, David Gibson wrote:
> >> > > > On Mon, Jul 11, 2016 at 09:20:44PM +0100, Phil Elwell wrote:
> >> > > > > On 11/07/2016 20:56, Maxime Ripard wrote:
> >> > > > [snip]
> >> > > >
> >> > > > > > +static int overlay_merge(void *fdt, void *fdto)
> >> > > > > > +{
> >> > > > > > +   int fragment;
> >> > > > > > +
> >> > > > > > +   fdt_for_each_subnode(fragment, fdto, 0) {
> >> > > > > > +           int overlay;
> >> > > > > > +           int target;
> >> > > > > > +           int ret;
> >> > > > > > +
> >> > > > > > +           target =3D overlay_get_target(fdt, fdto, fragmen=
t);
> >> > > > > > +           if (target < 0)
> >> > > > > > +                   continue;
> >> > > > > > +
> >> > > > > > +           overlay =3D fdt_subnode_offset(fdto, fragment, "=
__overlay__");
> >> > > > > > +           if (overlay < 0)
> >> > > > > > +                   return overlay;
> >> > > >
> >> > > > > Why does the absence of a target cause a fragment to be ignore=
d but
> >> > > > > the absence of an "__overlay__" property cause the merging to =
be
> >> > > > > abandoned with an error? Can't we just ignore fragments that a=
ren't
> >> > > > > recognised?
> >> > > >
> >> > > > So, I had the same question.  But fragments we can't make sense =
MUST
> >> > > > cause failures, and not be silently ignored.
> >> > > >
> >> > > > An incompletely applied overlay is almost certainly going to cau=
se you
> >> > > > horrible grief at some point, so you absolutely want to know ear=
ly if
> >> > > > your overlay is in a format your tool doesn't understand.
> >> > >
> >> > > I'm not sure how we can achieve that without applying it once, and=
 see
> >> > > if it fails. The obvious things are easy to detect (like a missing
> >> > > __overlay__ node), but some others really aren't (like a poorly
> >> > > formatted phandle, or one that overflows) without applying it
> >> > > entirely. And that seems difficult without malloc.
> >> >
> >> > So, atomically applying either the whole overlay or nothing would be=
 a
> >> > nice property, but it is indeed infeasibly difficult to achieve
> >> > without malloc().  Well.. we sort of could by making apply_overlay()
> >> > take an output buffer separate from the base tree, but that's not wh=
at
> >> > I'm suggesting.
> >> >
> >> > I'm fine with the base tree being trashed with an incomplete
> >> > application when apply_overlay() reports failure.  WHat I'm not ok
> >> > with is *silent* failure.  If you ignore fragments you don't
> >> > understand, then - if the overlay uses features that aren't supported
> >> > by this version of the code - you'll end up with an incompletely
> >> > applied overlay while the apply_overlay() function *reports success*.
> >> > That is a recipe for disaster.
> >>
> >> Ok, that makes sense. I'll return an error if the target is missing as
> >> well then.
> >>
> >> But then, I think we fall back to the discussion you had with
> >> Pantelis: how do you identify an overlay node (that must have a
> >> target) and some other "metadata" node that shouldn't be applied (and
> >> will not have a target). In the first case, we need to report an error
> >> if it's missing. In the second, we should just ignore the node
> >> entirely.
> >
> > Right.  I can see two obvious approaches:
> >
> >      1. All (top-level) nodes named fragment@* are assumed to be
> >         overlay fragments.
> >
> >      2. All top-evel nodes with a subnode named '__overlay__' are
> >         assumed to be overlay fragments
> >
> > (2) differs from looking for target properties because whatever
> > target variants we add in future, they're still likely to want an
> > __overlay__ node.  Or at worst, we can add a dummy __overlay__ node to
> > them.
> >
> >> Would turning that code the other way around, and if it has an
> >> __overlay__ subnode, target or target-path is mandatory, and if not
> >> just ignore the node entirely, work for you?
> >
> > I'd prefer to pick a single defining factor for the overlay fragments,
> > rather than a grab bag of options.
>=20
> I think it's potentially dangerous using the presence of a particular
> property to identify an overlay - what if the property name ("target",
> say) was also the name of a label or property within one of the
> fragments?

Yes, I agree.

> It could then appear in the __symbols__ or __fixups__ node,
> causing it to be treated as a potential overlay, but application will
> then be halted with an error because it has no __overlay__ subnode.

Indeed.

> If we make the presence of the __overlay__ subnode the decision point
> (which is nicer anyway because it is a single test rather than two -
> "target" and "target-path") then we avoid this hazard - __symbols__
> and __fixups__ have no subnodes, and __local_fixups__ only has
> top-level nodes as its subnodes, meaning __overlay__ will always be
> one level further down.

That last point is a little hairier than I'd like, but I think it's an
acceptably low risk in practice.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WuedheRyq6FDfQ9j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXjF2CAAoJEGw4ysog2bOSQfsQAIicXXXYf+IHoeYEZmUkn/ub
mpWx+ujGo+PmZ3r/QqUJEo4d2K5brKIn9VQnACvr6+dJK5ZtAM/SqTQXixwJXdOS
ZgztTQG8xyKTjBH3qUgh0hiTmaClDMJlP8kE47EXitHKeFZVC/ybREFBuDO9v2//
P/437KY32TQMPTcRtufgmwJZS+h6gJksipyjviZHZUYWfhjCLmeMAWQ4akC9rh/C
krh/Jnx66rX/u0B2aCpLdatWXMiphDgNM8fHaqZQOaJ3c8OduZDN7ctbxz6YvxVB
fSeycWrac1TsEVaq55tqhdXlmkK8YEg0W7TcbIq8UFIq5HreVp5d0LjhHx8IhL/m
x8dqjFu/hoLHlILhYVsNtcMyMA6pMA9mvABcpg3stlLV4b+etc8FCLFrsAujQh3S
V+dft8YS/LgDkV4Rwzk7pEG3KtPqBmBeDNkk7rLpX95swWs5esFwqO37QfmcLiqv
1Ai1KKK304KXr4yB8/M8PNWdPycBVjd/xZn/qX4VHzDfnV8ggZ7KT1SRkdPUUPMM
eD2up26nRH0XSdow0P8Xe4Q5ZJ2dj34wxDOLxYkuV//UV6RQK0yjK6F2QKCAtfEu
VSWAlvyL9/51Lc4oMOArQ1jP7Hc15Kie5hUvSB/Wb0R/uqG2NwETvRrPsbBdaAz0
B/lTK1FdyGVNDuesg8Sg
=gCAB
-----END PGP SIGNATURE-----

--WuedheRyq6FDfQ9j--
