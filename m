From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Mon, 31 Jul 2017 15:53:16 +1000
Message-ID: <20170731055316.GG2652@umbus.fritz.box>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z>
 <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat>
 <CAL_Jsq+eJNG66D22bNButg6=jj9WQ7Nw4PpxLsPBmGxN9KBnaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A9z/3b/E4MkkD+7G"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+eJNG66D22bNButg6=jj9WQ7Nw4PpxLsPBmGxN9KBnaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--A9z/3b/E4MkkD+7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 09:12:40PM -0500, Rob Herring wrote:
> On Thu, Jul 27, 2017 at 7:51 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > On Thu, Jul 27, 2017 at 06:00:00PM -0500, Rob Herring wrote:
> >> On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> > Hi Frank,
> >> >
> >> > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
> >> >> Hi Pantelis,
> >> >>
> >> >> Keep in mind one of the reasons Linus says he is very direct is to
> >> >> avoid leading a developer on, so that they don't waste a lot of time
> >> >> trying to resolve the maintainer's issues instead of realizing that
> >> >> the maintainer is saying "no". Please read my current answer as bei=
ng
> >> >> "no, not likely to ever be accepted", not "no, not in the current f=
orm".
> >> >>
> >> >> My first reaction is: no, this is not a good idea for the Linux ker=
nel.
> >> >>
> >> >
> >> > This has nothing to do with the kernel. It spits out valid DTBs that=
 the
> >> > kernel (or anything else) may use.
> >>
> >> Let me rephrase Frank's statement: this is not a good idea for the
> >> main repository of dts files.
> >>
> >> But sure, DTS is already not the only source of DTBs. It comes from
> >> firmware on Power systems.
> >
> > Yes, but unless they're generated from something other than a (at the
> > time) normal DTS, that's not a good example, IMHO.
>=20
> They aren't. I'm talking about IBM systems. The firmware has its own
> representation and flattens that to a DTB is how I understand it.

That's correct.  To elaborate a bit, for a partition under PowerVM,
there's a real IEEE1275 Open Firmware which generates a "live" device
tree.  Early boot code in the kernel flattens that to dtb to pass it
to later boot (this was actually the very first use of dtb, before
anyone thought about directly creating them).

Under KVM it's a bit more complicated, there's still an IEEE1275
implementation (SLOF) and a "live" tree, but it builds that tree based
largely on a dtb supplied by qemu.  qemu does build that directly
using libfdt and it's own knowledge of the virtual hardware; there's
no dts.

For bare metal boots the firmware (OPAL) supplies a dtb to the kernel,
I believe.  I suspect that's essentially built from scratch (probably
using libfdt), although it's possible it has some core piece that's
precompiled from dts.

There are other "real" OF machines out there, though they're not that
common.  There are the old (powerpc) Macs, and Sun Sparc servers.  At
least some versions of the OLPC used OF on x86.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--A9z/3b/E4MkkD+7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll+xckACgkQbDjKyiDZ
s5Ig0A/+Iydv+9+DDCq/01UysWgEMagdfHZLu9oZNlHDmnfMuqG9+1McIR69YMUf
Iaf/YRoIsxQYOXkaGMtlIasXBxCzFxM68hghLaj8m6TqYd1N8evRMYIHSWv8PIqu
iJzIcTS6EdZTdTkHLGpb8UeKcRee1MEHa/1Um/pRDTsLWGr57B4nKH+yNGjKZiK6
AORCxbOf8fjl/jXOVSpeNxU5iWJaRqVUKUpWxmfScAFfIUml5rXmR+H9Jtf6yJxm
TPIdy+qbCsU4phuvhj/LkLUU/67YaIZ7D1tpNcRt8KrIe4mI0Dyfnle1h42i0S6t
cZ49CxwDNfko9X+f6yms9UikSVLdyLvGsg1Fi9fChOoAD/FMhbIF2yMlhUponP/E
lfUlgU+CidEY5Wl4+DDBKab3vj6DDCYLdE7W7dZzOaI50F2LCbFcOA7pWzaELHY+
9MD6SBHgNnUar3RdA/+gb7npo1836bGaXJWUCmd8EY1tZPcAouktnnD/2B6ZGgIJ
dC0gUXwnwD4r5/ctAOL9aonbUrjzmeJ9nN2WIk9AWV2qrQgVN0p9HKxozbFrU7zH
UjDWiYRwQXheoZt6c0oFKrONCpLtdqQZMuqc1BvFqIhKHEIqLRQIjCmLq5UePsWc
f4SE1pKha487dQOtAAWZlXAQjHs8KKdiJOX1NugJf7HBeyI3fHo=
=LKWP
-----END PGP SIGNATURE-----

--A9z/3b/E4MkkD+7G--
