From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Thu, 25 Jan 2018 23:22:24 +1100
Message-ID: <20180125122224.GA2099@umbus>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marek =?utf-8?B?VmHFoXV0?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2018 at 09:47:47AM -0600, Rob Herring wrote:
> On Tue, Jan 23, 2018 at 3:17 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> > On 01/23/18 04:42, David Gibson wrote:
> >> On Mon, Jan 22, 2018 at 03:01:52PM -0600, Rob Herring wrote:
> >>> On Mon, Jan 22, 2018 at 2:09 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> >>>> Hi All,
> >>>>
> >>>> I've tried to create a decent distribution list, but I'm sure I've m=
issed
> >>>> someone or some important list.  Please share this with anyone you t=
hink
> >>>> will be affected.
> >>>>
> >>>> I have been playing around with some thoughts for some additions to
> >>>> the devicetree FDT aka blob format.
> >>>>
> >>>> I would like to get the affected parties thinking about how addition=
s to
> >>>> the format could improve whichever pieces of FDT related technology =
you
> >>>> work on or care about.  In my opinion, the FDT format should change
> >>>> very infrequently because of the impact on so many projects that have
> >>>> to work together to create a final solution, plus the many many users
> >>>> of those projects.
> >>>
> >>> A few things discussed before:
> >>> - Adding type information Even just tagging phandles would be good.
> >>
> >> I'm a bit dubious about this.  It would have to be "hints" only -
> >> there's not really anyway we can put in authoritative type
> >> information, since dtc itself doesn't really know that.  It's also
> >> hard to see how that could be done in a way which wouldn't either a)
> >> require very awkward parallel lookup of the data and type information
> >> or b) not be backwards compatible (even read only).
>=20
> I never said it was possible. :) I'm just trying to enumerate possible
> FDT format changes because I don't think we want to continuously
> trickle out FDT changes even if they are backwards compatible.
>=20
> >>> - Allow applying overlays by just appending to the blob. The need for
> >>> this is somewhat gone now that libfdt can just fully apply overlays.
> >>
> >> I'm not really sure what you want here.  I mean you could easily allow
> >> the format to allow multiple appended overlays, and define that to
> >> mean the overlaid result.  At some point *something* is going to have
> >> to really do the application, so I'm not sure that it really buys you
> >> that much.  It also makes nearly every operation on the tree in libfdt
> >> horrible to implement, at least within the other constraints the
> >> interface was designed around; you'll continually have to scan the
> >> entire tree just in case some other overlay fragment has some bearing
> >> on the thing you're looking at.  It confuses the interface too: what
> >> does "node offset" mean if the same node could be built up from
> >> overlay fragments at multiple offsets.
>=20
> The idea was to avoid applying overlays to flattened trees at all.

That's fine if you're basically just passing the flattened tree(s)
through to the next stage.  You can also potentially make changes to
the tree by adding an additional overlay on the end.  But if you want
to read *anything* from a flattened tree in this format, it's
appallingly difficult:

Say you want to do an fdt_getprop() - just about the most basic thing
you can.  You look through the base tree and it's not there.  But you
can't return NOTFOUND yet, because it might be added in an overlay.
Now you have to go through every overlay, and each fragment in each
overlay.  You have to resolve each fragment's target path.  You have
to compare that target path to the one of your current node (which
itself needs an expensive fdt_get_path() to retrieve).  Do some fiddly
string jiggery pokery to work out the right relative path, and finally
scan the overlay node for the property.

None of this can be cached, because libfdt doesn't allocate, and
doesn't have any notion of context or state in which things could be
stored anyway.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlppy/0ACgkQbDjKyiDZ
s5KxYA//T9jZZZ06x9hrQ397L7C5vcCIrXpSejfXGMRqfhFfxSUM4jwF7SoykJo1
6pW88T7yxvOmgxKp1NyvwT6DcPCbwk1XfzwxQlaYt7khBWWv9CHce9HJZYOL8yCz
aWaZLoGTXJGaUAGY1xf1sIhWPQUjMo7NIb09/Smj7KyYWCWa3vPb1YElRMioem/9
rjwGVbhd/ixYUAsOOgk5hK174I6G6R7havUMfthCjbFHpGifMVOey4Eu103D/USQ
kiYDi8FpNg1VXI/IStuZ2i4vkjSBWyH00GljmRvtOJ7nDiC0r62QIBACiGOnHd5t
QVIaOwOD0O55uzjIiQCqVPKQHAY5uNfk0KWEirX5C+TDj6mLvHcc/uLOoz2WxkTG
K9Zk68ffF68v+7WmuEfGOkb0RLQNtYV+3Yexj3xxOx1FiNYXzpCU12zzMEH1YTOu
vYw+HS1YzffArbKqrw1HDBCgzqwWWgEgWk9Kkc1UVIF73y13jDfHu/wAouGTmprE
+flTQLKv5+8YYIEuIyi9Wg63Ly/ooDvdiyvaE9lXL/8nf9gZfqtksmpqUdk5Mrj2
l1dBsCTq0T4Lphysg8HDXeiPwFvC9lDYj45hlwEpMqd3JbkeAN5S+HljKa82Sofh
QePImT7IUvDHBSRZkgM8plPij4eUC5rI8ngu/douzQSLwmY+Eyk=
=Zc6S
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
