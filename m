From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 6/6] libfdt: Add overlay application function
Date: Wed, 27 Jul 2016 00:09:14 +1000
Message-ID: <20160726140914.GN17429@voom.fritz.box>
References: <20160720142044.27527-1-maxime.ripard@free-electrons.com>
 <20160720142044.27527-7-maxime.ripard@free-electrons.com>
 <20160724142908.GF24621@voom.fritz.box>
 <20160725182041.GN7419@lukather>
 <20160726001859.GF17429@voom.fritz.box>
 <20160726061659.GT7419@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="95CBLwa+io9O2zXc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160726061659.GT7419@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--95CBLwa+io9O2zXc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 08:16:59AM +0200, Maxime Ripard wrote:
> On Tue, Jul 26, 2016 at 10:18:59AM +1000, David Gibson wrote:
> > > > Again, off-by-one in this test, I think.  Since there are so many
> > > > tricky edge cases here, it might be worth making testcases for them.
> > >=20
> > > What do you want here? That we move the parsing code out of that loop,
> > > make it public and put the prototype in libfdt_internal, or that we
> > > craft some DT that would outline all the possible issues with that
> > > function, and just test the return code of fdt_overlay_apply?
> >=20
> > I was thinking crafted DTs.  But I've realized that doing usefully is
> > pretty tricky, since overruns probably won't cause an immediate
> > problem most of the time.  I guess they'd trip errors under valgrind
> > at least (as long you make sure there's at least one byte's alignment
> > gap until the next tag).
>=20
> Is that a general comment?
>=20
> I'm still not quite sure what you expect from me. Do you want to test
> just that function, or only the fixup parsing function? Should I run
> valgrind, or are you expecting it to be done later?

Sorry, I wasn't very clear.

You don't necessarily need to do anything.  But the fact that we've
been through several iterations with problems in the edge cases of
parsing here suggests that this is tricky and fragile, so tests would
be a good idea if possible.

Because these are for cases with bad input, you wouldn't need to check
for any particular results - just that the functions don't crash or
otherwise do bad things when given the bad input.  It's probably
easier to construct tests which will have bad behaviour that valgrind
can detect than ones which have bad behaviour which is more obvious.

The whole testsuite can be run under valgrind with "make checkm".
It's a good idea to run that every so often - I don't do it routinely
because of course it's much, much slower than running the testsuite
normally.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--95CBLwa+io9O2zXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXl28KAAoJEGw4ysog2bOSfCgP/0dDUyHB//NRH9mSv8kSFw0Q
IYqe1kEEfII5PJTV22qeP845DJNCWQ/oJ0EMuEehHYwP7x+4F9hFlSPi4bGKQfEj
LkjfuLyDVdTIRDsVzWIId3goP+bsOzeJZwtyrerI/Cjx5MGqvkAgzpNRSrIAitud
Chp8igK86pydxFT3lTAyK2ycPCEoMreZUrL/B4w57oCSYHh+nqM6uG38DImeS001
2xhr99Pu8LSvH90hUlG3IWSkvH7rXFwPMSYDRaTIpbLqo0u9/tZ9a/TAFrzYLQF/
N37NxjtB8QpZDVkDStr2pdL6u0KbdbgpobZCYhnLRrEhAP2/2nQ4vi1mjP5kqw+4
Z8Pr3ab1GVzCjicvAh70LFYp+i8O9KYn+pGHzDDiRsenbaXJAMrppLxteBj2D8Lm
hqmBgxOvbM+WrY8bjljJIWAsjT6A3c/ovtgmW7sQ+d/vCnrT+5A+gToZGG/04qA1
X0bE6AiHdaeaiN3EZI0mNiKifsnf8cg2Ue+lJPgXTuNoiAKQ6VcRf4LfWc70Wr0I
L8H/6l2dFaqqrKt1dyP0GE9UyNOTB7ZaSEp3ky4smxAvPPRiyh9qXacjVFv3LGET
r/mFtdlQTTs0gj7dHv61a8C0LU15eI47TbEwrrOVL46IZUBU8jgT9ZGnC8oIGldE
iGTD6QEYzPpKpzBMsn+m
=T0eY
-----END PGP SIGNATURE-----

--95CBLwa+io9O2zXc--
