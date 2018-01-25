From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Thu, 25 Jan 2018 23:29:12 +1100
Message-ID: <20180125122912.GB2099@umbus>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A@mail.gmail.com>
 <e1bec77d-4dac-200b-34be-23573bf738f0@gmail.com>
 <e986435b-481b-2629-7600-10d9e21ac58e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e986435b-481b-2629-7600-10d9e21ac58e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marek =?utf-8?B?VmHFoXV0?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2018 at 04:22:15PM -0800, Frank Rowand wrote:
> On 01/24/18 13:16, Frank Rowand wrote:
> > On 01/24/18 07:47, Rob Herring wrote:
> >> On Tue, Jan 23, 2018 at 3:17 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> >>> On 01/23/18 04:42, David Gibson wrote:
> >>>> On Mon, Jan 22, 2018 at 03:01:52PM -0600, Rob Herring wrote:
> >>>>> On Mon, Jan 22, 2018 at 2:09 AM, Frank Rowand <frowand.list@gmail.c=
om> wrote:
> >>>>>> Hi All,
> >>>>>>
> >>>>>> I've tried to create a decent distribution list, but I'm sure I've=
 missed
> >>>>>> someone or some important list.  Please share this with anyone you=
 think
> >>>>>> will be affected.
> >>>>>>
> >>>>>> I have been playing around with some thoughts for some additions to
> >>>>>> the devicetree FDT aka blob format.
> >>>>>>
> >>>>>> I would like to get the affected parties thinking about how additi=
ons to
> >>>>>> the format could improve whichever pieces of FDT related technolog=
y you
> >>>>>> work on or care about.  In my opinion, the FDT format should change
> >>>>>> very infrequently because of the impact on so many projects that h=
ave
> >>>>>> to work together to create a final solution, plus the many many us=
ers
> >>>>>> of those projects.
> >>>>>
> >>>>> A few things discussed before:
> >>>>> - Adding type information Even just tagging phandles would be good.
> >>>>
> >>>> I'm a bit dubious about this.  It would have to be "hints" only -
> >>>> there's not really anyway we can put in authoritative type
> >>>> information, since dtc itself doesn't really know that.  It's also
> >>>> hard to see how that could be done in a way which wouldn't either a)
> >>>> require very awkward parallel lookup of the data and type information
> >>>> or b) not be backwards compatible (even read only).
> >>
> >> I never said it was possible. :) I'm just trying to enumerate possible
> >> FDT format changes because I don't think we want to continuously
> >> trickle out FDT changes even if they are backwards compatible.
> >=20
> > Yes, I'm trying to capture any pending changes in a single version chan=
ge.
> >=20
> >=20
> >>>>> - Allow applying overlays by just appending to the blob. The need f=
or
> >>>>> this is somewhat gone now that libfdt can just fully apply overlays.
> >>>>
> >>>> I'm not really sure what you want here.  I mean you could easily all=
ow
> >>>> the format to allow multiple appended overlays, and define that to
> >>>> mean the overlaid result.  At some point *something* is going to have
> >>>> to really do the application, so I'm not sure that it really buys you
> >>>> that much.  It also makes nearly every operation on the tree in libf=
dt
> >>>> horrible to implement, at least within the other constraints the
> >>>> interface was designed around; you'll continually have to scan the
> >>>> entire tree just in case some other overlay fragment has some bearing
> >>>> on the thing you're looking at.  It confuses the interface too: what
> >>>> does "node offset" mean if the same node could be built up from
> >>>> overlay fragments at multiple offsets.
> >>
> >> The idea was to avoid applying overlays to flattened trees at all.
> >> You're just passing the problem to the next stage (typically the
> >> kernel). But we have applying overlays to flattened trees now, so
> >> maybe there's no need anymore.
> >>
> >>> Somewhat echoing David's comment, I'm also not sure what you mean.
> >>> And trying to not overly influence this conversation with preconcepti=
ons
> >>> from what I'm going to propose.
> >>>
> >>> My first shot at the new format added a field to the FDT to indicate
> >>> that an overlay FDT was concatenated to the FDT (and the overlay FDT
> >>> in turn could set it's field to concatenate another overlay FDT).
> >>
> >> Yes, something like this is what I meant. This was something Grant had
> >> talked about.
> >>
> >>> But in the end I decided that information belonged outside the FDT,
> >>> and it was sufficient to require that all FDTs be padded out so that
> >>> if an overlay FDT was concatenated to the FDT, the overlay FDT would
> >>> be properly aligned.
> >>
> >> I can't think of why this wouldn't work either.
> >>
> >>> For ease of typing, I'll call this "chaining" or "chained".  For
> >>> Linux, I am envisioning no kernel use of data from a chained FDT
> >>> until after the tree is unflattened.  I haven't done an exhaustive
> >>> search to determine all of the uses of data directly from the
> >>> flattened FDT, but I am optimistic that there will not be any such
> >>> access that would require data from a chained FDT (and we could
> >>> make this a rule).
> >>
> >> This would be a major downside to leaving it up to the kernel because
> >> what can't be touched is hard to enumerate and could change. For
> >> example, we added earlycon and now the uart node can't be modified.
> >=20
> > What you say makes sense.  So I'll reverse myself and say that for
> > Linux, we should update the FDT read code to scan all chained
> > overlay FDT(s) as well as the base FDT.
>=20
> < snip >
>=20
> What I wrote was somewhat ambiguous.  What I meant by "FDT read
> code" was functions that check for existence of nodes in the
> FDT or read property values from the FDT.

Oh.. not just FDT unflattening code.

The trouble with this is that scanning for a specific node or property
in a set of chained overlays is highly nontrivial.  Even if you set
aside the arguably self-imposed design constraints in libfdt, you
can't just do the same lookup in each fragment: along the way you need
to resolve the path at which each fragment applies.  That in itself is
non-trivial.  If you have overlays applying on top of other overlays,
that could involve recursive lookups of things from previous overlays.
It's spectacularly complicated and we have to do it on *every single*
read operation.

Either fully applying the overlay in flattened form, or (even
temporarily) unflattening the tree are better solutions.

> The other way one could read what I wrote was that when Linux
> unflattens the FDT, it would unflatten the FDT and all of the
> chained FDTs.  Obviously also true, but not what I was trying
> to say here.
>=20
> -Frank

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlppzZgACgkQbDjKyiDZ
s5Iiuw//Vywyd7xiHf04W+luKqQX2tk7mPcuoHks+56O5nXM0UKwWMEZSID0q+wC
KEjf3K1vhHRFiyxhVTCfoj66k6x9Hj/bPNe3B7ifemZL9v28mtuKZXXRhGz7ZvQS
92pHaP3E5mfiv8LTu/4k1LzP6UepCad6FKQhottsef9K84z4IQEIUtp5B3tdKjii
c9N/2OVOAlWM+QDIVpQvi1C8nu+5YkYIjdRz3KTmrlw97wjnC6DTHj/3NVAqXSDg
QqSSRIcRQUpsOz4ByHQXxnsq9pYMIuT17PSnpBoTw6fkIw/Vb/BSHl89/0vpiPRS
VxMyz1MLpHApnENrND88yPts5Kgyqkh+eq20IPhy3XCGjsX8+mjhLU+BFfpu2I5o
S+dmHVb8eb/SgrG471GFZQw09GRnHXFko9Y7DXymg2zTUQTeWNJqQP9UUeMbQkcz
1aO7O+7bzU8V0LlwfyC5I7xrsMioxC7IdiWXo8UzNKu9ziq2DzPYbiyUOWm0PkyA
snKL7KBMegnckWy2idPnUbFttTzuBOlz1O60P+50IFcEoBrqH1FjXkpSfdFVzSk6
3BritG00Viaztzo9Ts/wBVS8OQyQquitghonxGYQ8IJPeYTchLIC3f4drtnFZ72K
HYkpx7nh42Y0t38BYB4W1SpalYu60Rxh8Fm4/Jz8h2d8ZJsQM8o=
=Ftk9
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
