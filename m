From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Thu, 27 Jul 2017 07:24:57 -0400
Message-ID: <20170727112457.GY26163@bill-the-cat>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box>
 <5967CAA6.6010801@gmail.com>
 <CAPhXvM4NzU61dENLeJ2Xt=arKqYFjXaPBvzrjxAJ7h3Y-gT4Nw@mail.gmail.com>
 <20170726042315.GA8978@umbus.fritz.box>
 <20170726150148.GD26163@bill-the-cat>
 <20170727072534.GC7970@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZvEfa0iCSfWRSl9d"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170727072534.GC7970-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ZvEfa0iCSfWRSl9d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 05:25:34PM +1000, David Gibson wrote:
> On Wed, Jul 26, 2017 at 11:01:48AM -0400, Tom Rini wrote:
> > On Wed, Jul 26, 2017 at 02:23:15PM +1000, David Gibson wrote:
> > > On Thu, Jul 13, 2017 at 08:38:10PM +0100, Phil Elwell wrote:
> > > > Can we also consider a mechanism for overlay-local symbols, i.e. sy=
mbols
> > > > that are used purely to create links within an overlay - perhaps us=
ing a
> > > > particular naming convention? This would make it easier to instanti=
ate an
> > > > overlay multiple times without having to uniquify all symbols, and =
it would
> > > > avoid polluting the global namespace without reason.
> > >=20
> > > I'd really prefer not to add yet more features and complexity to the
> > > existing shoddily designed overlay mechanism.  I'd prefer for people
> > > to focus on a better replacement - which includes considering these
> > > sorts of use cases and how to handle them.
> >=20
> > Can we go for incremental progress over time instead of replacing what
> > was finally accepted?  Maybe one or two concrete examples that need
> > improvement upon, and go from there?  Thanks!
>=20
> As a general rule, I'd agree with that approach, but not this time.
> Incremental improvements are great if you have a solid base from which
> to work, at the moment we don't.  What we have is a half-arsed hack
> that become widely deployed enough that we have to live with it.

Are you planning to introduce this new design?  I thought the whole
point of finally accepting the current state of overlay support was so
that we could improve it over time, rather than say that we'll have to
re-hash everything all over to add the rest of the functionality that
was expected.

--=20
Tom

--ZvEfa0iCSfWRSl9d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZec2JAAoJEIf59jXTHXZSKhoQAK1zxB7VnHIFrg+GVt4Z82vj
OnFcmtuHLBMPx7WEzKrD6Hi2PBJN6Nc+gugd2X81gripIi8LP2lb4UFadVJC6EJE
sCYuXiHs1TDkRQoKEZW3Y2V1eXP0Kwv7aLiAeMd7i/iFfkJvJLtv3gA3cpMoDKWh
AXVX0CQBQ2uD9Aji2EgZ9lZludHPkY7ape0Hrdb2Wmq/NgE0bjGP/fy6Fd3gHjez
9eqrxJZwoe/v7EcNp4lHnFqSL5KBoLMXb8BuBmeWbRQ8LEGc7gbjZ7EqQdWe4obG
5KzKZR7/xkBrinlxQGjoIl/6P7ao6+30HgLJ8prQ7UYuC3xyaz1YKlxWUaRULgVa
syqC085g6nDyeBHaNjMB83xIZ4Vc/JerFpd8CGUq8kRpiVMIKkr79LENtvJzA20u
XLBVb+SNlrwu46GzA9HEF0DB5tPr2+Y0uhOz1kMh2RWhbqprwVBDmTDzoJqF+aWb
teUaM8gfHsM9weFcnSlKBJ4lo0Hdz6s/gWgj8kf5+wsCOKHR+gBV0Hv+5e6CAhRn
sYV8imqeMEfOWBSsb+IKIDIu7Dj6DW5is5AIh+MxSaqCnl2qW8WDQEpNWU6egs28
2pUlubda21uG2X2rML5xjpaz2s4OVZgO7BHNY205mhbMAEAZoZBnj6/HZox56IeX
lcwAmlmgXDmXjXtuNv+D
=CMW0
-----END PGP SIGNATURE-----

--ZvEfa0iCSfWRSl9d--
