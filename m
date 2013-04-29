From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 04/10] util_version: new helper for displaying version info
Date: Mon, 29 Apr 2013 20:55:16 +1000
Message-ID: <20130429105516.GK20202@truffula.fritz.box>
References: <1366078397-14889-1-git-send-email-vapier@gentoo.org>
 <1366078397-14889-5-git-send-email-vapier@gentoo.org>
 <20130419005046.GL16400@truffula.fritz.box>
 <201304221719.42982.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1133229733071458179=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201304221719.42982.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1133229733071458179==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zROEGoKAXsG5UqGB"
Content-Disposition: inline


--zROEGoKAXsG5UqGB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 05:19:41PM -0400, Mike Frysinger wrote:
> On Thursday 18 April 2013 20:50:46 David Gibson wrote:
> > On Mon, Apr 15, 2013 at 10:13:11PM -0400, Mike Frysinger wrote:
> > > This is so all utilities can have this flag and not just dtc.
> > >=20
> > > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > > Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> >=20
> > Please apply these first 4 patches, regardless of the rest of the
> > series.
>=20
> on the subject of the other patches, is there a way i could split them up=
=20
> that'd make things more palatable ?  the usage clean up ones could be mer=
ged=20
> independently of the new fdtdump options.

I don't think there's anything really wrong with the split - it's just
they're a little more involved, and so it's taken me longer to look
through them properly.  In particular I've taken a bid of a sidetrack
working out what is broken for our build on freebsd at the moment and
fixing that to see how these patches affect it.

> clean up series:
> fdtdump: make usage a bit more friendly
> dtc/fdt{get,put}/convert-dtsv0-lexer: convert to new usage helpers
> util: drop "long" from usage helpers
> util: add common ARRAY_SIZE define
>=20
> new functionality series:
> fdtdump: add a --scan option
> fdtdump: add a debug mode

I don't think it makes a big difference, and two series kind of
complicates things.  That order is a bit better than the original, at
least if you pull ARRAY_SIZE out to the front (I'd like to see that go
in right now, actually).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zROEGoKAXsG5UqGB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlF+UZQACgkQaILKxv3ab8ZzYwCgjGm2HxzsHktqbA7JhgqZPvl+
Zy8An0KEMKpkkOWy+jpHk7itL74uYkkz
=yiMF
-----END PGP SIGNATURE-----

--zROEGoKAXsG5UqGB--

--===============1133229733071458179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1133229733071458179==--
