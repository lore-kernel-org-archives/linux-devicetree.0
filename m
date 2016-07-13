From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Wed, 13 Jul 2016 14:45:24 +1000
Message-ID: <20160713044523.GF14615@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <ed025e59-ddb3-0309-b2da-f6c2d1fa95d0@gmail.com>
 <20160712143404.GD16355@voom.fritz.box>
 <CAPhXvM5nCbP81ujx3dhy9GvibdoBDy+N8EuArJj2-RFKO3ixfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cpvLTH7QU4gwfq3S"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPhXvM5nCbP81ujx3dhy9GvibdoBDy+N8EuArJj2-RFKO3ixfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cpvLTH7QU4gwfq3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2016 at 04:07:49PM +0100, Phil Elwell wrote:
> On Tue, Jul 12, 2016 at 3:34 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Mon, Jul 11, 2016 at 09:20:44PM +0100, Phil Elwell wrote:
> >> On 11/07/2016 20:56, Maxime Ripard wrote:
> > [snip]
> >
> >> > +static int overlay_merge(void *fdt, void *fdto)
> >> > +{
> >> > +   int fragment;
> >> > +
> >> > +   fdt_for_each_subnode(fragment, fdto, 0) {
> >> > +           int overlay;
> >> > +           int target;
> >> > +           int ret;
> >> > +
> >> > +           target =3D overlay_get_target(fdt, fdto, fragment);
> >> > +           if (target < 0)
> >> > +                   continue;
> >> > +
> >> > +           overlay =3D fdt_subnode_offset(fdto, fragment, "__overla=
y__");
> >> > +           if (overlay < 0)
> >> > +                   return overlay;
> >
> >> Why does the absence of a target cause a fragment to be ignored but
> >> the absence of an "__overlay__" property cause the merging to be
> >> abandoned with an error? Can't we just ignore fragments that aren't
> >> recognised?
> >
> > So, I had the same question.  But fragments we can't make sense MUST
> > cause failures, and not be silently ignored.
> >
> > An incompletely applied overlay is almost certainly going to cause you
> > horrible grief at some point, so you absolutely want to know early if
> > your overlay is in a format your tool doesn't understand.
>=20
> Cards on the table time - at Raspberry Pi we've found it convenient to
> selectively enable or disable fragments within an overlay based on
> user-supplied parameters. The way I've implemented this is by using
> "__dormant__" as an antonym to "__overlay__" (partly chosen because it
> is the same length), and then pre-processing the overlay before
> applying it. This scheme works with the kernel overlay support and our
> firmware loader (obviously).

Ok, if you want that feature, let's invent a mechanism specifically
for conditionally disabling chunks, rather than using a side-effect
which will break horribly as soon as we extend the overlay format.

Alternatively you could just use fdt_del_node() or fdt_nop_node() to
remove the fragments you don't wish to apply.

> Although I could invent a similar scheme that uses antonyms of
> "target" and "target-path", I don't see why this is inherently safer.



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cpvLTH7QU4gwfq3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhcdjAAoJEGw4ysog2bOSWa8P/3ymVWmrnDb/c03nylZnrWFD
SPku1oSYfhCP6YaOroP5ErTKxJfX3fnhTzYiqu+OVhqltDEYEm59uTD5gGgZeSU6
pypMhGBLRbs0FknC/m+Hmq3EoW6/JW1jPbx8fWS4NNd5mZdHUXqGWUWbhfusmwll
AYCknKbH20kZlncuaozBQmcH7uC24V5qOMvfIUjmPFriae/kXqF0WvmhyPRQFfjO
aRi2ZbqY51AcbBtKqxEnJUbUai8lpwKjO2eGqf6HhDpCAFvb7/7oD2mfBx5ZJmIw
CW/fWyX3WK/+m5laZ62K5qKR6E8LEfh7SFqPu2dsrSuc0cmbK5yHoieR5H/XNR0/
Q7vJDgGUlTe8D1cUc4BYHmuCWRToyMGWNQW6zzBbDKL6Oml9I/UH4CTsah9OWl5M
nXjEm7vBm/hURaDkO8HQbSTQ7+3zVQCW3cYWonEcd+AIZdjksHBEbnsylsuQkoqn
Q+u1cfK/e5oLfqMFMxuZWzhWpn+6oavgyIvpJ4k+qZLFmZh08AaVurGPcSj0jxVF
ZEE+nixaVw1Vqaq+rtQLqfcLwLZ+doK9T5FT57pV5UbDjVgm2DPuFXCBmKNvIZ+T
zSzyLViZOr/cLE5uvjTDLI9CNgjlfEd0S/0uJ89O/j9I85co70j61aFnpSnHJoWt
0G0R5wlFykuVIWNvMLqX
=UDIT
-----END PGP SIGNATURE-----

--cpvLTH7QU4gwfq3S--
