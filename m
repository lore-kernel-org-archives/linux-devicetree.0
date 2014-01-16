From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [0/10] dtc: Assorted parsing and error reporting cleanups
Date: Thu, 16 Jan 2014 20:54:41 +1100
Message-ID: <20140116095441.GC26769@voom.fritz.box>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
 <E1VzAmD-0001xi-DA@jdl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1VzAmD-0001xi-DA-CYoMK+44s/E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 01:51:25PM -0600, Jon Loeliger wrote:
> > This series consists of a number of small fixes and cleanups, mostly
> > to error reporting in the lexer and parser.  I hit these as minor
> > annoyances while experimenting with improved expression and schema
> > support.
> >=20
> > I'm sending these out for some review, before committing them to the
> > main branch.
> >=20
> > These patches are also in the 'errors' branch on the repository - note
> > that I'm treating that as an experimental branch, and therefore
> > subject to rebasing at whim.
> >=20
>=20
> With one typo correction, s/strong/string/, in patch 07/10's
> commit message, please:
>=20
> Acked-by: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>

Thanks.  I fixed that and one or two similarly trivial errors and
committed the series.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJS16xhAAoJEGw4ysog2bOStEsQALdqDc89FlQWJMdn0KYhuPFR
85ZXC1GWqwnCl+V50F1cZq+q3LPH5FEZXHlEAXS83vJXpr89Igja6DHirM331bDm
QedpdbwC5SeTX+GziiTbISmjXDrrNtQwi/IqmkhOjbS5OgieuWAaVZ0hq28X7wPm
VLNav/9ISFy57kPBMlLRnbDlLghZy87bJjcOz8hiX4kRPKQrs4Xg2nTc34RO8+xS
lpk07pyqabMJVTvZsSVN3tZlLpX/asIBdwpZqf9pWzAJFEGWkQS71xAso8llFFb1
sMh8NyOPZvoetazZQjNDlvdTiAweqO2NUX8PeG2iiZJsHDaa4JeOpSiFOktMI9id
AFHNsSchUheIf9mybsQHvQqD5OA5MUbHqVFKHWDId/j6NaSfLUltLSl3mSG6mUb/
xmmV+haOZ6ZBbSRfZbqdwaKS+DmCGixNYM52ceg/6YdrT4ojWpBcPsGUlwCOsspj
HUrlPozisMTbXWXhnKtvEuhgznUZogcf26bqySlp35K2l1invbQA2qRWyL1ZVr7A
NqAA4fifH3ZWCrRmEUgSS7Vz6ig33KZ5IWsUzvKex2QzCaP4Zosw40fl9vm+twp5
lD4sAcfqjgw8WY819ADRdDkLyvvbDmBylk7+59LgRY4EdOYWy8pmsBbQGqe24BFE
VFo60DRc3TzDMfTqk1Lz
=NE4B
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
