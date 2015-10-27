From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] regulator, dt: add dt support for tps6502x regulator
Date: Tue, 27 Oct 2015 16:26:19 +0900
Message-ID: <20151027072619.GT28319@sirena.org.uk>
References: <1445858717-12707-1-git-send-email-hs@denx.de>
 <20151027021250.GR28319@sirena.org.uk>
 <562F184D.8000907@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fqIB0bRxfTYxTb/F"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <562F184D.8000907-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fqIB0bRxfTYxTb/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2015 at 07:23:09AM +0100, Heiko Schocher wrote:
> Am 27.10.2015 um 03:12 schrieb Mark Brown:

> >Please use subject lines matching the style for the subsystem.

> Would be "regulator: tps6520x:" correct?

Yes.

> >>+	regulators = of_get_child_by_name(np, "regulators");
> >>+	if (!regulators) {
> >>+		dev_err(dev, "regulator node not found\n");
> >>+		return NULL;
> >>+	}

> >Please use the generic support for locating the DT information for
> >regulators using regulators_node and of_match in the regulator_desc
> >rather than open coding this.

> Hmm.. could you point me to a correct example? Seems I overlook sth.

$ grep -l regulators_node drivers/regulator/*.c
drivers/regulator/88pm800.c
drivers/regulator/axp20x-regulator.c
drivers/regulator/da9062-regulator.c
drivers/regulator/isl9305.c
drivers/regulator/max14577.c
drivers/regulator/max77686.c
drivers/regulator/max77693.c
drivers/regulator/max77802.c
drivers/regulator/mt6311-regulator.c
drivers/regulator/of_regulator.c
drivers/regulator/rn5t618-regulator.c
drivers/regulator/rt5033-regulator.c
drivers/regulator/sky81452-regulator.c
drivers/regulator/tps65217-regulator.c

--fqIB0bRxfTYxTb/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWLycYAAoJECTWi3JdVIfQoRQH/2CYAyZzzlMXtAPp7O98aTVK
9e+8OAoC4dLOBxQPzE0Qr74WqEiRSMIIJ2MIKJC7nIKxZRgPKnBVdMMuCB1He41C
8OLMCqQZnT7lsikfssEoCNJ8OCamR206HnVXNCUQWktPg+a4AnLaNHLDbnTmf6lG
oKHdNFJW50Q9B7/1kWfQMo06r3Byc7+sTt5oFaprrgsV+aPTAiOc91MVgExkLZSY
UA0Atay1Uw9NKYWBE9XGmCyjO51jhKzWeQUp8rK5LbJ/oqTQ4LYt/2kl0mibQfkb
JuS4Jwul1uTezWDOMh3UN5+O/GADE0jErNxUI2iGWZKad1yTAym+GsvyBkOPDA4=
=FwsK
-----END PGP SIGNATURE-----

--fqIB0bRxfTYxTb/F--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
