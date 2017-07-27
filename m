From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Thu, 27 Jul 2017 17:25:34 +1000
Message-ID: <20170727072534.GC7970@umbus.fritz.box>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
 <5967CAA6.6010801@gmail.com>
 <CAPhXvM4NzU61dENLeJ2Xt=arKqYFjXaPBvzrjxAJ7h3Y-gT4Nw@mail.gmail.com>
 <20170726042315.GA8978@umbus.fritz.box>
 <20170726150148.GD26163@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170726150148.GD26163@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2017 at 11:01:48AM -0400, Tom Rini wrote:
> On Wed, Jul 26, 2017 at 02:23:15PM +1000, David Gibson wrote:
> > On Thu, Jul 13, 2017 at 08:38:10PM +0100, Phil Elwell wrote:
> > > Can we also consider a mechanism for overlay-local symbols, i.e. symb=
ols
> > > that are used purely to create links within an overlay - perhaps usin=
g a
> > > particular naming convention? This would make it easier to instantiat=
e an
> > > overlay multiple times without having to uniquify all symbols, and it=
 would
> > > avoid polluting the global namespace without reason.
> >=20
> > I'd really prefer not to add yet more features and complexity to the
> > existing shoddily designed overlay mechanism.  I'd prefer for people
> > to focus on a better replacement - which includes considering these
> > sorts of use cases and how to handle them.
>=20
> Can we go for incremental progress over time instead of replacing what
> was finally accepted?  Maybe one or two concrete examples that need
> improvement upon, and go from there?  Thanks!

As a general rule, I'd agree with that approach, but not this time.
Incremental improvements are great if you have a solid base from which
to work, at the moment we don't.  What we have is a half-arsed hack
that become widely deployed enough that we have to live with it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll5lW4ACgkQbDjKyiDZ
s5JJRg/+LxDiNySBuatWu3+H2UGQMAofjzchm/1e2VtbHYGk+cufY+4lLLmgzs8Z
mIrLWpWsZOE2EwH0ueJ3DkJHaT9vvmuqxnD5MpwT+iaTkWJLphZ2D5lPSWMtezYT
Yca1LoBL2AlbLLjBrbdrMzRkmob5njmufwLDliwaboVhTsSCNtfF0Y/H2ZXwKviJ
MrKVlw+dKFzdWJb0nNyUh0aIjIX2Bi2O4RuIVFJzSq+UM7pXVOBVL6DZD02hVXsI
B9vsHodtU2LlZntcZcReHyyKU5N/dtCqRvzBn34RzAH2LANIrVVq7PYjXzGGvxML
ZM/44Qt56BhZryMSR2+gymZWV6cBLTx4Ue6fSfRXU719927RiyK//kJ4NNQuifLc
GYJUjmBIh7y+pPIk6iqIgTCKzoXj73CzUAGTUfSx/TIThI4D6l5MVIunzvNQL/DQ
R6EEYrwNgPEc2IGw1tH87auDii14eyXd8qi9wBUZHpurMAUfR5V6czSu27weztGY
MObc+uZBBJ9VJPSoyWREVitI+H1QvuhhKlF/Hngcv0FJOM/qkQYTOgddz/PPVWa2
gcRXKhWopv5wF5DW7BpO7SQEpYmPITXpZ7YhKII07c6f12aNVv/DUSNpslbvCYba
5jipoPl14U/ts4nNTncyWWi3J6vj5yf935H4k80RWg57cDNfKTA=
=3FM/
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
