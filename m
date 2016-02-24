From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] Warn on node name unit-addresses with '0x' or
 leading 0s
Date: Wed, 24 Feb 2016 11:44:56 +1100
Message-ID: <20160224004456.GB2808@voom.fritz.box>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
 <1455223619-16052-3-git-send-email-robh@kernel.org>
 <20160219050709.GB15224@voom.fritz.box>
 <CAL_JsqLDdyLd4z_Pmsr7+vtnMZsusEpJYZ4tdZmjQFt0PD_Fbw@mail.gmail.com>
 <20160223054746.GT2808@voom.fritz.box>
 <CAL_Jsq+Nr6uzA0xzc=zKG4diZwDrgsbLAKDb80m6ZSq2NXcGgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F0luChD47DWseN9q"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Nr6uzA0xzc=zKG4diZwDrgsbLAKDb80m6ZSq2NXcGgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--F0luChD47DWseN9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 08:35:46AM -0600, Rob Herring wrote:
> On Mon, Feb 22, 2016 at 11:47 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Mon, Feb 22, 2016 at 10:51:46AM -0600, Rob Herring wrote:
> >> On Thu, Feb 18, 2016 at 11:07 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Thu, Feb 11, 2016 at 02:46:59PM -0600, Rob Herring wrote:
> >> >> Node name unit-addresses should never begin with 0x or leading 0s
> >> >> regardless of whether they have a bus specific address (i.e. one wi=
th
> >> >> commas) or not. Add warnings to check for these cases.
> >> >
> >> > Hmm.. I'm pretty sure that's true in practice, but it's not true in
> >> > theory.  A bus could define it's unit address format just about
> >> > however it wants, including with leading 0s.
> >>
> >> Only if it is not reviewed... This whole check is about what best
> >> practices are, not what is possible.
> >
> > Hmm.  dtc checks are really about checking for best practice at the
> > level of individual dts files, though, not bindings.
>=20
> Checking simple-bus specifically would be checking a binding.

Sorry, I wasn't clear.  dtc checking the dts against a binding is
fine, but checking the sanity of the binding itself is beyond its
scope.

> >> > I think a better approach would be to add a test specific to
> >> > simple-bus devices (by looking at compatible on the parent) that ful=
ly
> >> > checks the unit address.
> >> >
> >> > From there we can start adding tests for other bus types.
> >>
> >> simple-bus is easy enough,
> >
> > So, start with that, then tackle the next problem.
> >
> >> but then next up would be I2C and SPI. We
> >> can't generically tell if a node is on I2C or SPI bus.
> >
> > Why not?  Or perhaps.. how generically do you need?  I think having a
> > big list of i2c / spi controllers would be acceptable here, if not
> > ideal.
>=20
> So someone adds a new controller, puts crap in for unit addresses, and
> then no warnings until that compatible string is added to dtc. And I'm
> still left spending my time in reviews telling them to fix this
> trivial crap.
>=20
> That's roughly 60 I2C controllers (families, so multiple compatible
> strings each) plus similar number of SPI controllers, OF-graph
> binding, and random other things where reg gets used.

Ah, I see.

Ok, I guess we do need to have an option for a "fallback" scheme for
unit addresses (i.e. hex) for bus types we don't specifically
recognize.  But I'd still like the logic to be:
      if (known bus type)
           check against format for this bus type
      else
           check against fallback format

Rather than putting the second test in with a hacked up set of
exclusions.

To do this nicely, I think the best way will be to add a bus_type
field to the node structure in dtc, and have it populated (with an
option for "unknown") in an early check pass, that later unit address
tests can references as a prereq.

Pointer to a struct with unit address formatting functions, with NULL
for unknown is the obvious choice to me for bus_type.

> >> If we do have
> >> some bus with wacky addresses, it should definitely have a bus
> >> compatible and then we can simply exclude it from the check.
> >>
> >> Another option would be skipping the test if there are any commas (or
> >> periods, etc.) in the unit address. That's pretty rare to begin with
> >> and a single number is pretty much not a bus specific unit-address.
> >
> > Um.. no.. there are definitely bus types that don't typically use
> > commas.  ISA, for one.
>=20
> All the cases of ISA in the kernel tree at least would pass this test.
> But we could either blacklist ISA or skip if any non-hex characters
> are present.
>=20
> BTW, my next patch is stricter node and property name checks on the
> use of '#', '?', '.', '+', '*', and '_'. So if you don't think these
> kinds to checks belong in dtc, then tell me and suggest how we should
> check for this.

That sounds reasonable on the face of it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--F0luChD47DWseN9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWzP0IAAoJEGw4ysog2bOStAgQAL+vqVGKEAlULaIshA1ZEXlI
L258BuDqId4hF+HRbdl5Suh7ZVaanx8K9WTPkHZQ9fcc2FHo7kQL0sDsOdu5MvJD
l38Jmty+rs+i11wvygRtg7lPXBjuqz744KLKWoD65LpCpzQvhhl8H+21+jA1LXNa
VTpHPsaQ7o7O06guFG6e/h5RWgV5VZQCTjVE7SGF8W3MXDQ5/FT7Hs13NUdUTr96
F4R32NF9dxEE30N2K3pW20hb3qjW3yz/Rh+qG8Qd/UA9WKftkqTQU0ypLICiJ5OE
BuDUr6+oSUIpXhl9ZV8vsYFKL6fWThbr7S5L/dclUzFNwi97YwX5SFNDaFhX5lJQ
gfK/qfJ3T+GCA01KIMVBoLeJ/fzxIfSW90pf59J9Uoxur3SrrpZc0wlaxMP/tvYN
iIvGkBkXojD9PJ63/prFkKVm4m9ziNwSFvfxeoSpGTZa1LBvh5e3POaQuViF3F3D
z1DKcPyd32ob8bcAvhJ7uJHYiBq1pjVTmm0peKn7AEfGCsLmRCgTXYwidoQZiuta
xxChqK6muKIwDY5+Xzh20e5o6shiHyiaBor/iJmnQ0Vqw+FXr5X2Gj4wEmVE+G90
3btRnSHdiWqjc19vqkTDJzDu8VwuM2mSMH7fQFhrzmaYgSbfL7GVMkTCkUHnrOll
ztkpE0PLMOXQSrxIE0x6
=RzPc
-----END PGP SIGNATURE-----

--F0luChD47DWseN9q--
