From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] Warn on node name unit-addresses with '0x' or
 leading 0s
Date: Tue, 23 Feb 2016 16:47:46 +1100
Message-ID: <20160223054746.GT2808@voom.fritz.box>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
 <1455223619-16052-3-git-send-email-robh@kernel.org>
 <20160219050709.GB15224@voom.fritz.box>
 <CAL_JsqLDdyLd4z_Pmsr7+vtnMZsusEpJYZ4tdZmjQFt0PD_Fbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rBVNTu5JXDAWzN2S"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLDdyLd4z_Pmsr7+vtnMZsusEpJYZ4tdZmjQFt0PD_Fbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--rBVNTu5JXDAWzN2S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 10:51:46AM -0600, Rob Herring wrote:
> On Thu, Feb 18, 2016 at 11:07 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Feb 11, 2016 at 02:46:59PM -0600, Rob Herring wrote:
> >> Node name unit-addresses should never begin with 0x or leading 0s
> >> regardless of whether they have a bus specific address (i.e. one with
> >> commas) or not. Add warnings to check for these cases.
> >
> > Hmm.. I'm pretty sure that's true in practice, but it's not true in
> > theory.  A bus could define it's unit address format just about
> > however it wants, including with leading 0s.
>=20
> Only if it is not reviewed... This whole check is about what best
> practices are, not what is possible.

Hmm.  dtc checks are really about checking for best practice at the
level of individual dts files, though, not bindings.

> > I think a better approach would be to add a test specific to
> > simple-bus devices (by looking at compatible on the parent) that fully
> > checks the unit address.
> >
> > From there we can start adding tests for other bus types.
>=20
> simple-bus is easy enough,

So, start with that, then tackle the next problem.

> but then next up would be I2C and SPI. We
> can't generically tell if a node is on I2C or SPI bus.

Why not?  Or perhaps.. how generically do you need?  I think having a
big list of i2c / spi controllers would be acceptable here, if not
ideal.

> If we do have
> some bus with wacky addresses, it should definitely have a bus
> compatible and then we can simply exclude it from the check.
>=20
> Another option would be skipping the test if there are any commas (or
> periods, etc.) in the unit address. That's pretty rare to begin with
> and a single number is pretty much not a bus specific unit-address.

Um.. no.. there are definitely bus types that don't typically use
commas.  ISA, for one.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rBVNTu5JXDAWzN2S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWy/KCAAoJEGw4ysog2bOSAMsP/RaVPPt3Yt1QOq2Gl7YEzxTx
0gRdjKSyUGsx/iXnwml5cF0pIsVlVDtOzwSjyFa/SwmqRA5R8Hr/IWeIjGqlEvZ7
VVi6Am6IG7UysOPaCR3DSoaB/jbZ41WVcmJGcBQqwtqAC9OPRy0F9qHuBxqDXSFq
KFwIS1QoLhSrFYf/hF8xqyPUlZNBm0zdeRJ3PaJbwqx76pRy7fYeo/O/575Enl9W
SBzk6Yd3/4LOVpJL3y1aJPDR+7/iK+Uch5/Sstx1uUw5DZ8LMz3aqgYq3xVE2NuP
U4XyENAt7burh+b6lMYO+acloItubvJOsWcIsPTj/nZRk5H3Eg1+5RUeKpmc95lo
mN9M5HRescufvs/BH89lL1e6O5nHl3hVY4wOsw3X/1zFEd4VcCRXoGxisomMyTk3
m1ZQQgB1OQp6Ee/cqwzYfrpuV93Bp/ftyc9s62wLU6cuyv176S01xgu2TQURGbEL
7AI0fqRrkyY87Do66G7rXR3S0+weREh0+vmOXu9HbEKk/AAIJqk0aTAIXYpprp5I
F46p4Wh/70jsWsjxfoA3mN10NwLb7gYBtMeErqaxsaI2J+dHbVXCaVWgo43PokCi
xILHKjePPuwo9mk4Goh51MC1A7FsKvJjFFtGQSpQ4UkHn237f+yWirhBEZvuVE26
xS38VeMigCSfFhEyzcS8
=49e/
-----END PGP SIGNATURE-----

--rBVNTu5JXDAWzN2S--
