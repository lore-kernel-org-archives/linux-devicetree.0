From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/4] checks: Warn on node name unit-addresses with
 '0x' or leading 0s
Date: Tue, 14 Feb 2017 13:07:37 +1100
Message-ID: <20170214020737.GB2169@umbus.fritz.box>
References: <20170210164717.1234-1-robh@kernel.org>
 <20170210164717.1234-4-robh@kernel.org>
 <20170213045241.GY25381@umbus>
 <CAL_JsqL772=td67SVxVmXCHq-vEiX3EsSo4x2EcUxRNkfUK83A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL772=td67SVxVmXCHq-vEiX3EsSo4x2EcUxRNkfUK83A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2017 at 02:11:57PM -0600, Rob Herring wrote:
> On Sun, Feb 12, 2017 at 10:52 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Feb 10, 2017 at 10:47:16AM -0600, Rob Herring wrote:
> >> Node name unit-addresses should never begin with 0x or leading 0s
> >> regardless of whether they have a bus specific address (i.e. one with
> >> commas) or not. Add warnings to check for these cases.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >> v2:
> >> - Split into separate check from unit_address_vs_reg
> >
> > I'm still not thrilled with applying this test unconditionally -
> > especially when 4/4 introduces pretty much exactly the infrastructure
> > to do this better.  If you add a unit name formatter function to the
> > bus_type structure you really can then extend unit_address_vs_reg to
> > verify them against each other, which will cover this as well more
> > subtle mismatches.
> >
> > Obviously it would only do it for known bus types - but adding a
> > "simple-bus" type would cover a lot of the cases, and a few for i2c
> > and spi would cover most of the rest.
>=20
> Sigh. Around in circles we go. As we discussed before, this is simple,
> but common problem check. It is not a complete check of the entire
> unit-address.

Right.. and I'm saying why do that, when you're so close to having a
complete check of the entire unit address.

> It only checks the first number (in case of ',') and
> doesn't validate the number itself. While in theory we can conceive of
> a unit-address that would be a problem for this check, we have not
> identified one. It's not like there's lots of unknown cases here. We
> know the buses that are out there for the most part. We can always
> blacklist any problematic cases or turn off the check by default if
> the need arises.

> As far as bus types, I could easily support simple-bus, but there's no
> way to identify i2c and spi (and others like mdio) buses reliably.
> Maybe go off node names if we got those standardized, but I can't
> check standard node names for the same reason.

Ah, ok, that makes things a bit more problematic.

Alright, I can live with this test if you turn it off for anything
that has a specific bus type identified.  i.e. specific bus types
should always have unit address checks which supersede this quick and
dirty one.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYomZpAAoJEGw4ysog2bOSp5YQAIECgJhdN5ZXCdPQRcg1oH2+
WkNk7CEWSGYQGBG6yDMiofkcMVXiyN/8N504mttpxefyImD9sGn3JJ1YXWeag1X7
z0EUdheTxbNdsW+cC/kTIpcWe0DMvWQgyfBC2g+BFSCJ17CkcX/5T88ew/8+oluY
Fe0mT7RzapTcLeMNlFDChj78VHaUxAqCJAW4YJNo1C7GUFyPMYYvlwF0zwuDFAL4
s5RV4q4w3pPy093iJmL6foXpup3ih8/sJVVbPtk8wsDvmqHGJ0Z2+wTsNrAojT8c
G4UD+3yFXfGgXQlH6XR1/50+azKKpTjvzsRjQU4aq1JRBe84YCPF6os+P7FUkwbE
w+OwGOTkTrZogCG5Qg7RaABRxf/BhDNJQPNadT0uGj7uizXQQOx2+7NeX26+lhbw
+dXtwSRcODAt+OGfWgC9nGg5x2/ih1V2E7AC0QJc33nw0bLQcHEjUpi3lhKq9lNx
LrEiU158ClKf/c8CLT3E7tOnAa2DpCL2B8tTThpHnqYGGlB+ZqmeICZvgv1NbncF
57YVlXHpc6bmKaR1t4N44891GVpkXg/e3nG7C/dBl7y7NM4dbL12lPUlbqPREb/Z
vm7LsNMEy+tPSBPV+VWWntXvaZYPRRBrgF/D18g6383q5YJsGPHw4EGPPud5lKSt
xjf3+MAiZxyeqm+dRrQK
=7aQl
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
