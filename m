From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Wed, 26 Jul 2017 14:28:08 +1000
Message-ID: <20170726042808.GB8978@umbus.fritz.box>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
 <5967CAA6.6010801@gmail.com>
 <CAPhXvM4NzU61dENLeJ2Xt=arKqYFjXaPBvzrjxAJ7h3Y-gT4Nw@mail.gmail.com>
 <5967D2F7.60303@gmail.com>
 <f06fe24c-7f32-4e7d-c28b-2e5b31c5dbf0@gmail.com>
 <5967E8BC.4090307@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8p/3hdGJBHAENZPK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5967E8BC.4090307-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--8p/3hdGJBHAENZPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 02:40:12PM -0700, Frank Rowand wrote:
> On 07/13/17 14:22, Phil Elwell wrote:
> > On 13/07/2017 21:07, Frank Rowand wrote:
> >> On 07/13/17 12:38, Phil Elwell wrote:
> >>
> >> (I moved Phil's reply to after the email he replied to.)
> >=20
> > Thanks.
> >=20
> >>> On 13 Jul 2017 8:32 pm, "Frank Rowand" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>>
> >>>> On 07/03/17 02:06, David Gibson wrote:
> >>>>> On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
> >>>>>> This patch enables an overlay to refer to a previous overlay's
> >>>>>> labels by performing a merge of symbol information at application
> >>>>>> time.
> >>>>>
> >>>>> This seems to be doing things the hard way.
> >>>>>
> >>>>> You're essentially extending the semantics of overlay application to
> >>>>> add the symbol merging.  You've implemented these extended semantics
> >>>>> in libfdt, which is all very well, but that's not the only overlay
> >>>>> application implementation.
> >>>>>
> >>>>>
> >>>>> It seems to me a better approach would be to change dtc's -@
> >>>>> implementation, so that in /plugin/ mode instead of making a global
> >>>>> __symbols__ node, it puts it into the individual fragments.  That w=
ay
> >>>>> the existing overlay application semantics will update the __symbol=
s__
> >>>>> node.
> >>>>
> >>>> If the __symbols__ node was inside a fragment, then the existing
> >>>> code would add (or update) a __symbols__ node located at the location
> >>>> pointed to by the fragment's target path, instead of updating the
> >>>> node /__symbols__.
> >>>>
> >>>> It makes sense to me to have only one global __symbols__ node instead
> >>>> of several.
> >>>>
> >>>> If there is a global __symbols__ node then we have a single name
> >>>> space for symbols.
> >>>>
> >>>> If there are multiple __symbols__ nodes spread throughout the tree,
> >>>> then to me that would imply different name spaces spread throughout
> >>>> the tree, where namespaces are determined by fragments.  This sounds
> >>>> confusing to me.  Or if the intent is to have a single name space
> >>>> then the __symbols__ information would be scattered throughout the
> >>>> tree instead of located in a single node.
> >>>>
> >>>> My current patch (under review), targeted for Linux 4.13-rc1, puts
> >>>> an overlay's __symbols__ node properties into the overlay's
> >>>> changeset, so they get added when the overlay is loaded and
> >>>> removed when the overlay is unloaded.
> >>
> >>> Can we also consider a mechanism for overlay-local symbols, i.e. symb=
ols
> >>> that are used purely to create links within an overlay - perhaps usin=
g a
> >>> particular naming convention? This would make it easier to instantiat=
e an
> >>> overlay multiple times without having to uniquify all symbols, and it=
 would
> >>> avoid polluting the global namespace without reason.
> >>>
> >>> Phil
> >>
> >> That is essentially the result you get if you compile the overlay dts
> >> without '-@'.  There will be no __symbols__ node created even if there
> >> are symbols within the overlay.
> >=20
> > But (unless something has changed recently) the '-@' switch controls bo=
th
> > symbol and fixup generation, i.e. export and import of symbols. Unless =
one
> > religiously uses 'target-path' to place fragments (thus removing the
> > level of abstraction provided by symbols) overlays are useless without
> > the ability to reference external symbols, but in my experience very few
> > overlays need to add symbols to the global symbol table.
>=20
> For the dtc compiler in Linux 4.11, the '-@' switch is only needed
> to generate the __symbols__ node.  The __fixups__ and __local-fixups__
> nodes are generated whether '-@' is specified or not.
>=20
> The __fixups__ and __local_fixups__ are generated when '/plugin/;'
> is specified in the source file.

Yup, i.e. something *has* changed recently.

Building fixups based on -@ never made any sense.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8p/3hdGJBHAENZPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll4GlgACgkQbDjKyiDZ
s5Kfhw//UIw77atWA6pe/3a4nqBQf2CRhlREcRMBACvSmlRwXu8Ct60N4wBzva4L
Xih0w9KK/jQ4Y6Ld9SkdIYwgKwBT8CvQ5Ri/S7l2Cj+f3NQnEOAfobeG4C+Us+Cd
a7iSAv1n1fnTW/12PWF9rNU1XNJIt+VqciEgz55tsfyBTfpOfK6MTcvK3x9ueXc1
TDZn2V6t2om7M3TFnEFGnZ3GGicD7hU2uHKbFCZGg5/2JWehquBAFHy2Hl+Puzj1
4svXUnc2+rvexo7s/Mke2vCGBVuBMYUD9BGIBTDnh9lm8sH2ViX6fW8IF5rIqaKI
AfN7deo84RPlCl842Wu46Hkea7+EKmnEcUTsPuoO/zMWL4c3QAybOf1nZY4Fp/Rh
vpM0rZHBUFhlhkxtru4Lzo8JdiFTDrZk1DhjdztuvmKO489L16lB5rbNgSZXAAJc
WkpVuVx0eOo2WxT+i7ThsEhiPVkB7206QfadupY5k+rdMwp78q4rW4rvf0uewFO+
fMZATRiTmxQZB+JVraiWqOsMG1PW5Gt0+7uKnMIJHcFVeXBeuinu0kxUtojUHw9e
6ZN4fhAcvlCoh0f8FJFfHvrGRlYQ1jr1ML2OnfZhvvIGFCepFrYzA72kCRpGR+3R
UIq1q9Wz2MUSm43G/P1lUJKrVu7w9T/DpURijGmbgodWDCX73cg=
=N7UA
-----END PGP SIGNATURE-----

--8p/3hdGJBHAENZPK--
