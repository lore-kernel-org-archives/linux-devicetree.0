From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: fix '%zx' warning
Date: Wed, 9 Aug 2017 14:06:42 +1000
Message-ID: <20170809040642.GG13670@umbus.fritz.box>
References: <E1da2Z7-0008GG-AV@rmk-PC.armlinux.org.uk>
 <20170726013004.GJ8978@umbus.fritz.box>
 <20170808112818.GC20805@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170808112818.GC20805-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2017 at 12:28:19PM +0100, Russell King - ARM Linux wrote:
> On Wed, Jul 26, 2017 at 11:30:04AM +1000, David Gibson wrote:
> > On Tue, Jul 25, 2017 at 05:20:09PM +0100, Russell King wrote:
> > > dtc uses an incorrect format specifier for printing a uint64_t value.
> > > uint64_t may be either 'unsigned long' or 'unsigned long long' depend=
ing
> > > on the host architecture.
> > >=20
> > > Fix this by using %llx and casting to unsigned long long, which ensur=
es
> > > that we always have a wide enough variable to print 64 bits of hex.
> > >=20
> > >   HOSTCC  scripts/dtc/checks.o
> > > scripts/dtc/checks.c: In function 'check_simple_bus_reg':
> > > scripts/dtc/checks.c:876:2: warning: format '%zx' expects argument of=
 type 'size_t', but argument 4 has type 'uint64_t' [-Wformat=3D]
> > >   snprintf(unit_addr, sizeof(unit_addr), "%zx", reg);
> > >   ^
> > > scripts/dtc/checks.c:876:2: warning: format '%zx' expects argument of=
 type 'size_t', but argument 4 has type 'uint64_t' [-Wformat=3D]
> > >=20
> > > Fixes: 828d4cdd012c ("dtc: check.c fix compile error")
> > > Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> >=20
> > This (embarrassing) error is already fixed in upstream dtc.
>=20
> It remains unfixed in 4.13-rc4.  How do we get this fixed in the
> kernel's dtc?  From what I can see, sending a patch to fix stuff
> doesn't work.

Um.. I don't know.  I haven't been the person doing updates of the
kernel dtc to match upstream dtc for ages.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmKilEACgkQbDjKyiDZ
s5ILlA/+Pkeb8jdWOuwB25rvVnnGn3LzskhHRZGMC5Buz1rubKZ8Ub3/E+URnBWx
U4a3MYcICBKxFOqLq+C453h8BoP+pM7SxG7SPl4ZoQdzWbtiYQmmv16tZ9HeOFbb
Dg4zPHSQgwxnaP0wJL+4KYD92TNnWoeGUFeOp11EXYKWk1L+B6joVl8uDKRzx603
oZkdBe2nbgMyJs7ngxV1SJAJxMuspLqZSrnNQs2bT8cOMgDBZuUeFNj1T92WbDK1
VT/B+GlDIF0W6bodzC6I87QJQoejS4/TZ5TcqAPkpUHAmdqjGCZBhmEUDKN0h5pn
q9qq5Mhiq8t+XvQXzdc1pXSFDDBuUA5YmplGi+KNpRfeCJSu0JP5uw4HtNWperRW
i7qUT2a8w0kT6tpwc9x572bKRJJafty8bBu47tyHJJqc0nvPDvhzozOAuGESwbRV
WAe1yYJrJKDdE3hywZzQj191dnyQdhMHHYC0aZar+TYgik/ldYixPSYRv19cWYUM
u9xeBB7n+MrENGdlwcrbtvUuQHOCpVvRZNsdWc5JhkhaAImcQmNHXSa2oLlKZSmE
moj5XGPAMcmJLozUGf0Hj4PaX46q88HgbDzB8zspwQ0RzpOQiLgX9BPxMTgGMJ8a
GSJB/Wz+nGUyciXlv6kS0m26GXYRLPeZQF6TscX6FVjhB/mH5Vs=
=P3PC
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
