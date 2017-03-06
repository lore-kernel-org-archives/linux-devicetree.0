From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Extending /memreserve/ to allow defining descriptions
Date: Mon, 6 Mar 2017 14:58:56 +1100
Message-ID: <20170306035856.GF12030@umbus.fritz.box>
References: <9c1cb5e8-2afd-e266-72b9-20ca6622956e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9c1cb5e8-2afd-e266-72b9-20ca6622956e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 04, 2017 at 01:40:39PM -0800, Florian Fainelli wrote:
> Hello,
>=20
> I am considering extending the /memreserve node syntax with the ability
> to pass a description string that would be describing what kind of
> memory is being reserved here, e:g:
>=20
> /memreserve/ 0x0 0x10000 type =3D "psci"
>=20
> The rationale would be for a client program to be able to list these
> reserved regions e.g: from /proc/iomem in a way that could be made
> available to other applications.
>=20
> What do you think?

Suggestions like this have come up before, and I think it's a bad
idea.

First of all, note that it's not merely a matter of extending the dtc
syntax - you'd need to add a way of encoding the extra labels into the
flattened format as well.

Second, the reserve list as a separate piece of the flattened tree
exists for one reason: to allow really early boot code to exclude
memory regions it needs to without having to parse the flat tree.
Labels and other additional information doesn't help that purpose.
BenH (who created the flattened tree format) has opined that having
memory reserves as a separate structure (rather than properties within
the tree) was probably a design error.

Most fundamentally, there isn't always a clear 1:1 correspondance
between each memory region and a single specific purpose.  For
example, firmware could reserve a single region which is uses for
several purposes.

What you could do is to add properties within the device tree further
annotating the reservations, with the extra structure essentially just
acting as an easy-to-parse summary of that.  In fact I know that POWER
systems firmware use 'reserved-ranges' and 'reserved-names' properties
for this.  I don't know if anyone else has adopted that though.

I would certainly be willing to look at patches to have dtc verify the
/memreserve/ statements against such properties, or to autogenerate
the reserved table from the properties, instead of from explicit
/memreserve/ statements.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYvN5+AAoJEGw4ysog2bOS2GkP/AxUNP9AL+8/jAQkaXcEgD59
mjP4a4qDzr489V3uaRKT7ApJ1sUmnbXuXRu85bd1Jw8Sk2jj5rWvuWzBCdXwOTvR
3JbZy/XRw5WwImszbeH/mpHLeULIPV5w00DNwYmsaPZXwzcrY+wvudwIrBYoNanK
idXAQ5dR2aIvAbE+ljKd4pqTPnJ/tcw/Q9IooXkmthf/Axd2r+/ufEqfw8ndnDlG
27oQq8UQvpeZUZmLJLlD8z1eMvO3FonjOi1Stb0FTqPtFhiZdDDvRZnHYl/kYjjB
nPd2QHGthQn7Ex258zzvrj8Y8v3ROOHaiVVq/MIBg2b37MmPQdDTdFF/gSfE4Y0i
xGXleVPab1RklIb6cALJ6vjeMCirYq239TSiBf3hZlNUE5VN84piHYFKv4pGwgdH
dNRccoH8bXs/7vutx1bgQwcyylpsdPdSRoczAeQSU3J97XbKIiYvW7R2BN762TWy
uSFlYn5J/LmwO7OfK9TxNTIWuKZ/yQJYfhF/Hs1HcOxmFXep/Y16uVjj1GHWU1jr
U8FEwaBPx/0pH5o7j5pVJdXVKLDlMGKnis2Ln8HKQsrzs2waNAFsoorV6E3teWkA
aPM8x069xWZGPnpQyOL3LjBZpSodi1uP9N7jl6IARP5nwZIoKXppASPjufkCYmuI
Rj8VnakJfjizsyg+5wYo
=n7mR
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
