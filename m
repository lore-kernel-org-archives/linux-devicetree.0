From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 0/2] dtc: Dynamic DT support
Date: Tue, 8 Sep 2015 14:00:24 +1000
Message-ID: <20150908040024.GC24774@voom.redhat.com>
References: <1440614674-7055-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440614674-7055-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 09:44:32PM +0300, Pantelis Antoniou wrote:
> Enable the generation of symbol & fixup information for
> use with dynamic DT loading.
>=20
> Changes since v4:
> * Rebase to latest dtc version.
> * Completely redesigned the generation of resolution data.
> Now instead of being generated as part of blob generation
> they are created in the live tree.
> * Consequently the patchset is much smaller.
> * Added -A auto-label alias generation option.
> * Addressed maintainer comments.
> * Added syntactic sugar for overlays in the form of .dtsi
> * Added /dts-v1/ /plugin/ preferred plugin form and deprecate
> the previous form (although still works for backward compatibility)
>=20
> Changes since v3:
> * Rebase to latest dtc version.
>=20
> Changes since v2:
> * Split single patch to a patchset.
> * Updated to dtc mainline.
> * Changed __local_fixups__ format
> * Clean up for better legibility.

Sorry it's taken me so long to get to this.  I was sick after the
conference, and then had backlog of day-job work to do.  I haven't had
time to look at this yet, but I haven't forgotten it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7l1YAAoJEGw4ysog2bOSBOkP/jr0uyS0cmh80ZKigbLwtEhG
V3Av4UgISkCrLPmfo2+7Ply86Xw2pC3p+Zpqt73tFGwyzLbmjYPbuTaI0+ijBYdU
RbZfcZtUtsm36vzjEPx0q3HZf0/jjOUGdKPuJxCqTl55D2Mk6gbF0HZ26DRhSMdq
V6HRGzf5I3Q/9elyIBBLJXJBwNPo/TwMU7U3mP+dPf4YvgRKupwqSm8Pbn9hheom
lvjR4xZTikK274i+n4fuHqKIer9OAzZMYy5ozYMna/nJmqnpnhBshoQsyLWVdTKg
8jZJTMprTyWZ8aIDFC7VpE4U56hU3DsapXSn7tfetrKskKMQtkAnu2YlzX/zh9xV
bf3H75ZabSjLwq8cEt+giUxX9SA9DVzTrtzDWBBnDQfMYivJIOzgn859KRGAq7Re
Hv2HNkiSfskfYstdvU9FyS873b18C2HO2syccJK54qjaM+43JEroAqROkB1tXBwp
4oxM9X4RYNRGzo/yKsu1bn7sXrYTrGIMZaBWFlOqobHLWAsDES8OVYiFHaKND/nN
aNNMUCpkV1ubWHqFGweWCaiD60m/tW4MCrMgFwwN3CV1dE0t9JCmS5jq9V/m0EZu
vHdGVwvUg1HhbnYvRdKfgI6kHc70UBxGGc46XmxnzBbOPVXH2rhsaQP7zKYP9BMt
a/x/CtEkijGa2YDpCG6l
=9NOP
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
