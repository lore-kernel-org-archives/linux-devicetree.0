From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: check for #{size,address}-cells without
 child nodes
Date: Wed, 22 Nov 2017 14:18:55 +1100
Message-ID: <20171122031855.GF2380@umbus.fritz.box>
References: <20171117144515.10870-1-robh@kernel.org>
 <20171117144515.10870-5-robh@kernel.org>
 <20171120001438.GJ19214@umbus.fritz.box>
 <CAL_JsqJoiBvD-QE5bgk5ob3qc65ar371xWxx-1D+fKGh7+P=Zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJoiBvD-QE5bgk5ob3qc65ar371xWxx-1D+fKGh7+P=Zw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2017 at 10:22:53AM -0600, Rob Herring wrote:
> On Sun, Nov 19, 2017 at 6:14 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Nov 17, 2017 at 08:45:14AM -0600, Rob Herring wrote:
> >> nodes with a 'reg' property nor a ranges property.
> >>
> >> An exception may be an overlay that adds nodes, but this case would
> >> need
> >
> > Sentence doesn't seem finished..
>=20
> It was there until I rebased. Since the line started with #, git dropped =
it...
>=20
> "#{size,address}-cells in the overlay to properly compile already."

Ah, right.

> > In any case, I'm not sure this is a good idea.  It's not uncommon to
> > have bus bridge nodes that ought to have a well defined #address and
> > #size cells, but just don't happen to have any plugged devices yet.
> > An overlay that adds nodes is one possibility, but a bus where the
> > children can be probed is another.
>=20
> Wouldn't an overlay without #{size,address}-cells have warnings from
> avoid_default_addr_size?

Well, yes.  The checks are pretty much designed for whole trees and
don't work well on overlays at the moment.  That's a rather more
substantial change to fix.

> As long as there are no child nodes, the check is not run.

Ah!  Sorry, I missed that.  Objection withdrawn in that case.

> So we're
> limited to false positives if we have a mixture of nodes with and
> without unit addresses and only the nodes without unit addresses are
> populated. I have seen this with PCI hosts with an interrupt
> controller child node.

Sounds like an incorrect representation if the intrrupt controller
doesn't have a PCI config space presence.

> In general, I'm struggling with how to have tests that check for
> things that we generally want to avoid, but we still allow exceptions.
> Some of these may be things we want to avoid in new bindings, but
> wouldn't fix for existing cases. Another example is things that
> were/are valid for OF, but not FDT.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloU7J4ACgkQbDjKyiDZ
s5KQGxAArwePTL/DhfQ2jRqcfKu8ypUBVJwCm67ZdXsnBsTI+blWNZzzRsXg4lsp
WnUaOWBW+jpK+pEHX1uiskrClP/oW+449eA1Le5wGAgL2elC8pDE8NFvoSPum616
vhqmP+vwo7sXydKe4Y9cESyCX1rWR4dmmhCn+2CQQOLDxPNrg17ljYYfl5iZSWNu
RZtSoS1TCuYutTFHkSwmaKW4vkO7zxjbxeZ9cY0lLHV8cf7vnXUlu7GO0clw565Z
6HPVHDW2L7aNp9IMekcZgqT96VZPtbIw2qRB14nFxTIHfyySvz69+t3qQJc1RYQX
HGdCKMxTSsuGLb1Qk67sRqz0PP3Rq2d0ezztua7aQhXSY365+0LIpS/PExDkYZOX
MJ094JOAjD9OdfexH8rHk388nbCRsakjbmlG820KsONdfsx4wTyuFuVe0uH69LP/
L0SgDkuDBXeJ+satff5px88lxwblqKv0PFSkdbNGMWCV4HpBpIXp03x0yvz52cIS
dEJMiZ5Y1C+9qpzTzkbYF3m5NY0T3W505cU/hoaGXP1lH9r5q3aB4ygKaMkHmj3G
f8bAsepw/Dy8yE/LExji3ddjjb1mgue9QGUZjU/E6QeAVPEY1zXAjuZj+WkGhE/C
ENr4SmpyxGzJlIDxhgWGVtJ63uvabZVKCKHoXI+tFLmm/Lwuu2w=
=onj2
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
