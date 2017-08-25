From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: add phandle with arg property checks
Date: Fri, 25 Aug 2017 23:17:27 +1000
Message-ID: <20170825131727.GJ2772@umbus.fritz.box>
References: <20170822230208.20987-1-robh@kernel.org>
 <20170822230208.20987-2-robh@kernel.org>
 <20170824020338.GV5379@umbus.fritz.box>
 <CAL_Jsq+0Njjs_PHBSD-B7W9YFzdfpB2ApBcBD=48+BoXQKv2pw@mail.gmail.com>
 <CAL_Jsq+NVBF6npai2_CRSVchGN_EQBSYnQcw3rHZcNFKpP7pDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YZVh52eu0Ophig4D"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+NVBF6npai2_CRSVchGN_EQBSYnQcw3rHZcNFKpP7pDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--YZVh52eu0Ophig4D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2017 at 02:19:27PM -0500, Rob Herring wrote:
> On Thu, Aug 24, 2017 at 12:23 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, Aug 23, 2017 at 9:03 PM, David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> On Tue, Aug 22, 2017 at 06:02:06PM -0500, Rob Herring wrote:
> >>> Many common bindings follow the same pattern of client properties
> >>> containing a phandle and N arg cells where N is defined in the provid=
er
> >>> with a '#<specifier>-cells' property such as:
>=20
> [...]
>=20
> >>> +             if (prop->val.len < ((cell + cellsize + 1) * sizeof(cel=
l_t))) {
> >>> +                     FAIL(c, dti, "%s property size (%d) too small f=
or cell size %d in %s",
> >>> +                          prop->name, prop->val.len, cellsize, node-=
>fullpath);
> >>> +             }
> >>
> >> How will this cope if the property is really badly formed - e.g. a 3
> >> byte property, so you can't even grab a whole first phandle?  I think
> >> it will trip the assert() in propval_cell_n() which isn't great.
> >
> > At least for your example, we'd exit the loop (cell < 3/4). But I need
> > to a check for that because it would be silent currently. I'll add a
> > check that the size is a multiple of 4 and greater than 0.
> >
> > However, the check here is not perfect because we could have
> > "<&phandle1 1 2>" when really it should be "<&phandle1 &phandle2
> > &phandle3>". We don't fail until we're checking the 2nd phandle.
> > That's why I added the "or bad phandle" and the cell # in the message
> > above. In the opposite case, we'd be silent. One thing that could be
> > done is double check things against the markers if they are present.
>=20
> Here's what that looks like:
>=20
> /* If we have markers, verify the current cell is a phandle */
> if (prop->val.markers) {
>   struct marker *m =3D prop->val.markers;
>   for_each_marker_of_type(m, REF_PHANDLE) {
>     if (m->offset =3D=3D (cell * sizeof(cell_t)))
>       break;
>   }
>   if (!m)
>   FAIL(c, dti, "Property '%s', cell %d is not a valid phandle in %s",
>     prop->name, cell, node->fullpath);

The logic seems sound, but I don't like the message.  An integer
literal is no less a phandle than a reference, just usually not the
best way of entering one.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YZVh52eu0Ophig4D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmgI2QACgkQbDjKyiDZ
s5Lf3Q/+NNGYhZhvXM0Vah0IgVJwH6KmBbxPu0u2iAKEyAlCXnb91TemUqzhEh8Y
q+efHd+ogrcGq2ICs6t26SlF8rCAPohfUl8IJMi2AaMpeCXFNo4tE18O15PlQnBd
h9ECgMuJvUSvMExbH39LLFc0lC2marg85yWYu52OzeGXjPzm8bVH5irV9hVVNcwH
tRS59juYjuN8j7v4gmp/i1TQ6AzbpiuR33llVY74V12EY4x0KAzBfFm/5N0YF0+9
DywUcQjYx9bagUQ0cp9FXHGbOGPgLo2Foik8fvqHA7iCQ9ZqCWb25mZp7nsyPP/w
k0KVNN7Mmp/hErLB8G5mzgUDolj7EEVAqxvSYYAyrUHw4r1/LgLH9RI2C2SWgO68
lu7kKFlnDB7IExPWZb4flcD5MCYthBzU0FqSltgbiQlJwzMUNIFaT6hJgTv/ffKi
yMHyh0F2/+UfgdNtwOqAgUHgUGZiocC63NMnATdG7iIZg8ABXyyC/Iu2YOGhCe52
C+h2YU1AYJeHo7ATHcDh6AevBHx/X1dV/YRj2m1AB0GqJeLoP9nE8VCAjpTv3JbK
pNVNOQSXpkVJ3c7jPHkq8uwoFi11LE4HCDDikMwzbysVBXvbwWQJcJjLk3U7MGn0
f6Zs8Osdee+DGpYNRfKAULIlEC2AgOkEFYFIxyGduQLj+74vsTw=
=YiDF
-----END PGP SIGNATURE-----

--YZVh52eu0Ophig4D--
