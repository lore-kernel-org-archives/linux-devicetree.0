From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: add phandle with arg property checks
Date: Tue, 29 Aug 2017 17:26:37 +1000
Message-ID: <20170829072637.GK2578@umbus.fritz.box>
References: <20170822230208.20987-1-robh@kernel.org>
 <20170822230208.20987-2-robh@kernel.org>
 <20170824020338.GV5379@umbus.fritz.box>
 <CAL_Jsq+0Njjs_PHBSD-B7W9YFzdfpB2ApBcBD=48+BoXQKv2pw@mail.gmail.com>
 <CAL_Jsq+NVBF6npai2_CRSVchGN_EQBSYnQcw3rHZcNFKpP7pDg@mail.gmail.com>
 <20170825131727.GJ2772@umbus.fritz.box>
 <CAL_JsqKv=0Bu84Q0Mo9W9NhHqHE5VWCH_w38g=YMQ9ZCGqTFHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKv=0Bu84Q0Mo9W9NhHqHE5VWCH_w38g=YMQ9ZCGqTFHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2017 at 10:27:09AM -0500, Rob Herring wrote:
> On Fri, Aug 25, 2017 at 8:17 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Thu, Aug 24, 2017 at 02:19:27PM -0500, Rob Herring wrote:
> > > On Thu, Aug 24, 2017 at 12:23 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > > > On Wed, Aug 23, 2017 at 9:03 PM, David Gibson
> > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >> On Tue, Aug 22, 2017 at 06:02:06PM -0500, Rob Herring wrote:
> > > >>> Many common bindings follow the same pattern of client properties
> > > >>> containing a phandle and N arg cells where N is defined in the pr=
ovider
> > > >>> with a '#<specifier>-cells' property such as:
> > >
> > > [...]
> > >
> > > >>> +             if (prop->val.len < ((cell + cellsize + 1) * sizeof=
(cell_t))) {
> > > >>> +                     FAIL(c, dti, "%s property size (%d) too sma=
ll for cell size %d in %s",
> > > >>> +                          prop->name, prop->val.len, cellsize, n=
ode->fullpath);
> > > >>> +             }
> > > >>
> > > >> How will this cope if the property is really badly formed - e.g. a=
 3
> > > >> byte property, so you can't even grab a whole first phandle?  I th=
ink
> > > >> it will trip the assert() in propval_cell_n() which isn't great.
> > > >
> > > > At least for your example, we'd exit the loop (cell < 3/4). But I n=
eed
> > > > to a check for that because it would be silent currently. I'll add a
> > > > check that the size is a multiple of 4 and greater than 0.
> > > >
> > > > However, the check here is not perfect because we could have
> > > > "<&phandle1 1 2>" when really it should be "<&phandle1 &phandle2
> > > > &phandle3>". We don't fail until we're checking the 2nd phandle.
> > > > That's why I added the "or bad phandle" and the cell # in the messa=
ge
> > > > above. In the opposite case, we'd be silent. One thing that could be
> > > > done is double check things against the markers if they are present.
> > >
> > > Here's what that looks like:
> > >
> > > /* If we have markers, verify the current cell is a phandle */
> > > if (prop->val.markers) {
> > >   struct marker *m =3D prop->val.markers;
> > >   for_each_marker_of_type(m, REF_PHANDLE) {
> > >     if (m->offset =3D=3D (cell * sizeof(cell_t)))
> > >       break;
> > >   }
> > >   if (!m)
> > >   FAIL(c, dti, "Property '%s', cell %d is not a valid phandle in %s",
> > >     prop->name, cell, node->fullpath);
> >
> > The logic seems sound, but I don't like the message.  An integer
> > literal is no less a phandle than a reference, just usually not the
> > best way of entering one.
>=20
> Then what do you propose? There's not really any way I can distinguish
> a mixture. If #whatever-cells was wrong and I'm pointing to an integer
> literal that's not a phandle, it looks no different than if
> #whatever-cells is correct and I'm pointing to an integer literal that
> is a phandle.

Simply s/valid phandle/phandle reference/ would be sufficient.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmlFy0ACgkQbDjKyiDZ
s5K9VRAAvJc5BqUZJcsi21dN/cNSHQdwUH+C+OuuGm9A6U+hNd+Lc8zcusjCwm02
NnKEC+uxGfs//+6v9U3j+a87mkJWee5YpMozBBlaOlBKC9mPa6DcI3JVTVom9jwf
NCH2qwruY4fHU8lyIMdaHOEuzvY5Gta0ukzxJxZTPSBRQ5GmILY3oB1aeYs3tpF8
UYja0QSAmx3D2CH7ry2OIkSWAkGeGfiOXVuyNt7yb9RWTWt8jTm3140vWVUC7k3H
hYh1bN6nTtDV8r2oea4TKbgCcf+xig9sp3Oe5VvYTwq3lS5H1Gji2x8D+nf9A3eh
pI8pG1GAQ2mEhu2tGAq2wj8/edZX6m2GQUmPWqN3Uz/YwNL8KGJ0t/AsRwXU1nNg
y9sL7DF//JyX/Y+066/d94d0kTQVQRfBg+IPMBkibkpWugMmbgJOEYajxV5jedIW
8mbJFENjEE1zGM4zAxiSIPrp/6cQyyhB7Srww5z898/4NDgbKnmwBf+NoJN+4qiE
RXD01zS3ZOw4kdRoCeJXRPrw7ReaEC6IQCNw3KGbSfPWIDQcjTq4onVwx//w0sqJ
1i1s5FxxwFg82DPIhvumxk8BbaaFbfpJHgQ+201coDjZJLC5WBFkZ2xD6es4hX4I
1hn3V9TcLoht5F+egA1TGvSAl+As3tGtw1qsKPkFZhj6xDhcEdA=
=++VZ
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
