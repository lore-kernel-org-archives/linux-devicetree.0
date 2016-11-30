From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v11 5/7] overlay: Documentation for the overlay sugar
 syntax
Date: Wed, 30 Nov 2016 11:39:00 +1100
Message-ID: <20161130003900.GC19891@umbus>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480349141-14145-6-git-send-email-pantelis.antoniou@konsulko.com>
 <20161129031054.GI13307@umbus.fritz.box>
 <583D05B7.4040109@gmail.com>
 <20161129051042.GO13307@umbus.fritz.box>
 <583DB09C.7060105@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <583DB09C.7060105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 08:45:16AM -0800, Frank Rowand wrote:
> On 11/28/16 21:10, David Gibson wrote:
> > On Mon, Nov 28, 2016 at 08:36:07PM -0800, Frank Rowand wrote:
> >> On 11/28/16 19:10, David Gibson wrote:
> >>> On Mon, Nov 28, 2016 at 06:05:39PM +0200, Pantelis Antoniou wrote:
> >>>> There exists a syntactic sugar version of overlays which
> >>>> make them simpler to write for the trivial case of a single target.
> >>
> >> It also works for multiple targets.  (See the example I provided in
> >> my comment to v10.)
> >>
> >>
> >>>>
> >>>> Document it in the device tree object internals.
> >>>>
> >>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >>>
> >>> I'm with Frank that I think this, rather than being regarded mere
> >>> syntactic sugar, should be considered the primary way of describing
> >>> overlays.
> >>>
> >>> Obviously we need to support the fully written out version as well.
> >>
> >> If we need to support the fully written out version, can we make that
> >> a discouraged, non-preferred method?  Maybe require an option to
> >> enable compiling this style of dts?
> >=20
> > Yeah.  To avoid further proliferation of options, I'm thinking a
> > single "backwards compat" option which would:
> > 	- Use the dtb magic instead of dtb magic
> > 	- Disable checks which would reject explicit creation of
> > 	  __overlay__ / __symbols__ / __fixups__ nodes
> > 	- Anything other special behaviour we need
> > =09
> >> I can imagine some reasons to support the fully written out version,
> >> but can we document what those reasons are?
> >=20
> > I believe the main one is the dts files in this format out in the
> > field.  Mind you, I guess we're already requiring them to tweak how
> > they declare the /plugin/ option.
>=20
> It might be easy to write a program that transforms the expanded
> format to the simple format.  I'll try to make some time to see
> how difficult it is.  The transformation is relatively easy to
> do manually, but I don't know how many dts files would need to
> be converted.

It's not totally trivial, because such a program would basically need
a full dts parser.  But.. if we change the dtc internals to work with
a list of overlays rather than a single tree, there's a relatively
obvious path to it: we can implement parsing a dtbo input into a set
of fragments rather than an assembled overlay and dts output in
fragment form.  Then converting from old-dts to dtb and back to dts
would pretty much do what's needed.  At the cost of losing comments,
though :/.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPh+kAAoJEGw4ysog2bOSH2cQAMyKTnxyY1/4EZ1p2DEIv36W
D9nmB38+zzn3UTPWuEkW8wH2nA/ckaS9akBUbrLnK0tB3EC1I/+ezfNAU4K7FqMj
uatFSa3OXmQylgPCZXm5UabhUvkk1qpnaKNmpzafKhygyo3q0UHky0m+SYUSbWG0
YyHwwSTolTUPqbKr0AmWNpkD9Y5qb3uqtxJpEKfyPFMnaMYsp+tVqKFmRaoybajR
8E+1M0mY+1HQqud8UmoJ/CiAlftKltaoubxMUQh9Etb4N/upHCZsgRBEHUQ/yDKi
PcyH4nepYFQMGBhKmSfeIlUBV/dfg4+OT60DezftkmAqvi9JdOkB3Ex7F4q1r4SR
KA1jEbLQtu4/oQMXfuoAGmD7/YXi9A0AdPQ1djaMKBZCjF0n0w6J6DTlBELV4CXp
rZsCQ2EVZyk4wZLv+im1mneiSWQvWHUJrvIno9hH+Agvi6ra4HrBkzXlMKeZXWM0
ZX2eTihcHWCot87+88Mcr/bon4jhxbc9vK1/U1OWXX3SmSui4B7zXmLFk4r2shZv
yHJMKGv0aD3AZ6X/7UGvOmyRwwf26a7RDct0NvWMxBnFTDGiXfhuqXqOYJJ4sVyW
X+8ZpE93T6GkerKJKuzsYeCxl0Z78guZO8FAi+WQuv7P6RjfF84Mbc0sJ8F7Nj3Y
y8lfIoXssRUChXeXcT5K
=5b4c
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
