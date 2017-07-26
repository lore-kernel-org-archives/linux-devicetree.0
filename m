From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Wed, 26 Jul 2017 14:21:42 +1000
Message-ID: <20170726042142.GZ8978@umbus.fritz.box>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
 <5967CAA6.6010801@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2+IDmuKgu0wSQZlt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5967CAA6.6010801-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2+IDmuKgu0wSQZlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 12:31:50PM -0700, Frank Rowand wrote:
> On 07/03/17 02:06, David Gibson wrote:
> > On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
> >> This patch enables an overlay to refer to a previous overlay's
> >> labels by performing a merge of symbol information at application
> >> time.
> >=20
> > This seems to be doing things the hard way.
> >=20
> > You're essentially extending the semantics of overlay application to
> > add the symbol merging.  You've implemented these extended semantics
> > in libfdt, which is all very well, but that's not the only overlay
> > application implementation.
> >=20
> >=20
> > It seems to me a better approach would be to change dtc's -@
> > implementation, so that in /plugin/ mode instead of making a global
> > __symbols__ node, it puts it into the individual fragments.  That way
> > the existing overlay application semantics will update the __symbols__
> > node.
>=20
> If the __symbols__ node was inside a fragment, then the existing
> code would add (or update) a __symbols__ node located at the location
> pointed to by the fragment's target path, instead of updating the
> node /__symbols__.

No, what I meant was that an overlay can update anything, including
__symbols__, so you could have a fragment which made the __symbols__
updates.

But I realised shortly afterwards that doesn't work, because we don't
know the correct resolved target paths.

> It makes sense to me to have only one global __symbols__ node instead
> of several.

Having realized the above, that does make sense.

> If there is a global __symbols__ node then we have a single name
> space for symbols.
>=20
> If there are multiple __symbols__ nodes spread throughout the tree,
> then to me that would imply different name spaces spread throughout
> the tree, where namespaces are determined by fragments.  This sounds
> confusing to me.  Or if the intent is to have a single name space
> then the __symbols__ information would be scattered throughout the
> tree instead of located in a single node.
>=20
> My current patch (under review), targeted for Linux 4.13-rc1, puts
> an overlay's __symbols__ node properties into the overlay's
> changeset, so they get added when the overlay is loaded and
> removed when the overlay is unloaded.

True, but not relevant to what I was proposing.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2+IDmuKgu0wSQZlt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll4GNYACgkQbDjKyiDZ
s5JsaQ/9GMHfa10JDfEJuNGkgU51c4ShaEW3xPolmsEVckZgojhj4lEcf+i/PjIQ
owdx29JgDW051N+hLX13/UMCt2hx+ElTE8XV/NuKcEEbOWDCsrW8GSJet1f+6RP1
FRY3EU72IAisQn9CR3OEUrfErw3N/vpAHVwZX+h0BmHXR0kIDPWh/Qsiealutxgx
C6jj9Uo1mmo+N7frwE08vQXT/dsMKDRa81dNfpy3XlUDVYzKbfP98GLw0aMAi5KF
8Vq5e9LJsyo7hdu5G0RZU8Hf3zViVlN8MaKFOifD6Ispj41raUKOJg1mUWTvN9f6
z2KQ8+QV8iuJdKffV4cZ334/Sz37VYvfbqiOOYe1VPIoggoVmqg7qz4JYqfyszCS
bF7BhQrwJyN4ePlAbqQ6sBsGZGWAFddfg1upC7agJpfLlqXJjUpFgxKvQngnelh2
el+KU2hNDFPtOMhdEFV5RjX9Xm1D/Hag54j/CjKIkx5UcVSdgjBYIGeWPIV08yNp
RJKIsEJEmc+exc4Gs7OLF2z5wBE9oWLQ4whFj7L1gZehty9TXv7foGiWiYxMteIQ
yQS3IxQQ8CF6t3smqMWEFF/5GYcKUv+wXTJz3Fw9nGIHl2HsyZYEetrU639+NvK7
oWZOq/9qQb+Ql7U/ea5QmJNcaqFULqfUY54fWgtI63pls0tzg4c=
=ols0
-----END PGP SIGNATURE-----

--2+IDmuKgu0wSQZlt--
