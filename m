From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Tue, 23 Jan 2018 23:42:32 +1100
Message-ID: <20180123124232.GA14832@umbus>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marek =?utf-8?B?VmHFoXV0?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2018 at 03:01:52PM -0600, Rob Herring wrote:
> On Mon, Jan 22, 2018 at 2:09 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> > Hi All,
> >
> > I've tried to create a decent distribution list, but I'm sure I've miss=
ed
> > someone or some important list.  Please share this with anyone you think
> > will be affected.
> >
> > I have been playing around with some thoughts for some additions to
> > the devicetree FDT aka blob format.
> >
> > I would like to get the affected parties thinking about how additions to
> > the format could improve whichever pieces of FDT related technology you
> > work on or care about.  In my opinion, the FDT format should change
> > very infrequently because of the impact on so many projects that have
> > to work together to create a final solution, plus the many many users
> > of those projects.
>=20
> A few things discussed before:
> - Adding type information Even just tagging phandles would be good.

I'm a bit dubious about this.  It would have to be "hints" only -
there's not really anyway we can put in authoritative type
information, since dtc itself doesn't really know that.  It's also
hard to see how that could be done in a way which wouldn't either a)
require very awkward parallel lookup of the data and type information
or b) not be backwards compatible (even read only).

> - Allow applying overlays by just appending to the blob. The need for
> this is somewhat gone now that libfdt can just fully apply overlays.

I'm not really sure what you want here.  I mean you could easily allow
the format to allow multiple appended overlays, and define that to
mean the overlaid result.  At some point *something* is going to have
to really do the application, so I'm not sure that it really buys you
that much.  It also makes nearly every operation on the tree in libfdt
horrible to implement, at least within the other constraints the
interface was designed around; you'll continually have to scan the
entire tree just in case some other overlay fragment has some bearing
on the thing you're looking at.  It confuses the interface too: what
does "node offset" mean if the same node could be built up from
overlay fragments at multiple offsets.

> - Move to an unflattened format so we don't have to unflatten the
> tree. Or to put it another way, extend FDT enough that the tree can be
> walked and manipulated efficiently. I think this would involve storing
> node offsets for all the nodes. Maybe that could be combined with
> storage for __symbols__?

I don't think this is feasible.  If you want an unflattened tree
you'll have to change things so much that any superficial resemblence
to dtb will just be misleading.  You're likely to increase the size in
nearly all cases (which seems to be a concern to people).  You're also
almost certain to lose the benefits the serialized approach was
written for in the first place: chiefly that you can make edits
locally, using inserts and deletes but without having to adjust
offsets or handles anywhere else in the structure.

Making a portable "libdt" that manages an in-memory unflattened tree
with pointers, and can serialize and deserialze to dtb makes sense,
IMO.  Trying to make the flattened and unflattened trees the *same*
format does not.

Basically, efficient runtime manipulation is out of scope for the dtb
format - that's not what it's for.  If you're doing non-trivial
manipulation you really should be unflattening, then doing your work,
and if necessary re-flattening afterwards.  Unfortunately, I think the
fact you can manipulate while still in flattened format (and libfdt
even makes it pretty easy to write code to do so) has meant a bunch of
projects have postponed going to an unflattening model rather past the
point they should have.

> I also am not happy that labels which were purely source level
> convenience are now part of the ABI with overlays.

Yeah :/.  I keep harping on it, but overlays really are a hack.  I
think fleshing out the "connectors" approach that has been suggested
is really a better approach than trying to make the hack less hacky.

> > So I would like you guys to consider what I send out in a day or so,
> > but I don't want to preempt your creativity by laying out the details
> > of my proposal right now.
> >
> > I have not looked at how this would impact the devicetree compilers,
> > but I have hacked together a tool to convert existing blobs to the
> > new format.  The new format is backward compatible, but transforms
> > the overlay related metadata into separate blocks and removes the
> > metadata from nodes and properties.  My current proposal leaves
> > the fragment subtrees intact - it only transforms __symbols__,
> > __fixups__, and __local_fixups__.
> >
> > Some Advantages and disadvantages of my proposal are:
> >
> > Con:
> >   - New blob version.
> >
> > Pro:
> >   - Backward compatible.  Bootloaders and kernels that can process v17 =
blobs
> >     will continue to work in the same manner with a v18 blob.  They wil=
l not
> >     be able to use the new v18 features.
>=20
> What does libfdt do with a v18 blob? I'd assume it was written to
> treat new versions the same as the last known version.

So, the header includes a "last compatible version".  libfdt will
attempt to work with it as long as that is <=3D 17, regardless of the
version field.  Assuming version >=3D 17 then, yes, libfdt will treat
the blob as if it was v17, the latest one it knows.

If you alter the tree, libfdt will downrev the 'version' field to the
latest one it's aware of (i.e. 17).  Current dtc will do this on any
write operation (unless they don't call fdt_rw_check_header_(), which
would be a bug).  I'd have to check, but I think older versions may
only do it at the time of fdt_open_into(), which is part of the normal
expected flow for read-write operations, but doesn't technically
*have* to be called.

The "in place write" functions (fdt_wip.c) _won't_ downrev the
version, which is arguably a bug.  Most obvious extensions would not
be broken by such in-place writes, but it's not impossible (and
something which stored type data in parallel with the properties could
be an example).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpnLbUACgkQbDjKyiDZ
s5KrNw//dmE+4KwLbK0oKrtzuQzsOjq0uTk5jcZG4gDBfQAOq2FCKSw73ZWL1UIS
tzPO8i5nyqn/2iVoPc5P9N8OOrQRiDT1z2fCR0lO8cDzZcDXlqwmSpzjerGmYnlH
i8G6gPQLovzFIK2ss53+tSP+ULQ7sBUbteEoT6lOIw3dU4ZtGdfebkDVKKq/PeEO
o+cs/VWDef8HvnZ8k4KWNB8SbDQdk3RQ7c35mhQdtMzBCMboIyMPTvenpXLJFQIb
IDEIxVP1V7rqMIA+CUKuwZTWigQFOnfXLBwfxBj1yDy1b6ZBNwxnDmD+30db0XCL
7UPfyz2kh8skdfg8p26I9MsVLp2c3UzzK3sHdID2P1cKl+WcqYywHFv2Ay3NBemo
yJ9HSDFIJbnsf/IvgKoIARJFn4fctjkUULhC29Fxvqs3ErZm175Ptng19oZmG7xO
1krVkX1eGqulBrcoszTznWKDC6torcQqI/UeastD66LRJbZy30x1JW2CY0tKajFH
vzLPXoUm/jReSkPQMdVptRR1WRIFZwznIebGtU8JKZFMEhWu5S2kBxRQpWb+8cNe
4t+FNI/Up3umSi21rAOFNWIzfHogE+A9Qchic/dAd1VswxILTDj9Vcc0TXQ+1qFl
1gXT9vu1RaLrryQnUE3lJiKmzJWOx2+kl7ieZIX+0grm2D3zETs=
=oWU0
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
