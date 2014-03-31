From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] of: Add vendor prefix for Energy Micro
Date: Tue, 1 Apr 2014 01:21:56 +0200
Message-ID: <20140331232156.GA2591@katana>
References: <1395756677-6166-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CAL_Jsq+TVKywqbQ4vePQWjgbZ4Zc_d_CUrx6R33-pHtxVtsAzg@mail.gmail.com>
 <20140325195950.GB15793@pengutronix.de>
 <20140331220334.GB6045@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140331220334.GB6045-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > > "Patches floating around" is not a very convincing argument why
> > > "silabs" should not just be used instead. I have no problem taking
> > > this, but if changing to silabs is possible, we may want to do that.
> > I think energymicro is still the right prefix, because back when efm32
> > was created it was still Energy Micro. Or am I wrong here?

I agree with the "EnergyMicro" reasoning.

> (Wolfram, I just noticed that I failed to fix the binding docs for the
> changed compatible string. Should I send a fixup or a v5?)

Fixup, please.


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTOfiUAAoJEBQN5MwUoCm2r8kP/Az5N51TsNXuDm9WPai3dj2i
dVgP4p3LDGUEDWvBMvfmnC6WXZ44uRpN990Q8yBK95c1LRm0WCtsGlCEDLfw2H40
hg1ibj/pq0r906px82oiPLRqm0Avr6t0OuaD1vMGBxgY+KwyU1maJne6CW3o5QSG
pa3R1fUMB9SnasnhUKe2TjllAChjTU8W4nGbUWT+M6E1hDgoso8KHxJt/2L36lcd
wWMLoXO34+iMgcpUlvXRxHvzuSUz2YcPn6tCsUkJsjR60nyii9Iv71UkFSxCPX7E
OzEUSI7+sz6qsjTQK6DPucT0o9Wsq+EpTqp2blvxgFg6HkCcSgzIJ2TDQ8a9fZab
GQzAq2gPuRvf7GUSSclKAb27Ch9/7MuobPMOjg6uafuBfhuZiRBW1hj3X3UrmsnR
ubILJ523BIqW9nLZuafH+iH3pdAK2MgZL5qTcySkMQnHKSBgE4LPEJ5XByMCPu6W
IcvQCTYGqlsTsV5v7CxkwVZ6Zx9pQWBnI1FR+/nJfmNFj6oI+4Fq1VFeldIl6IkJ
NvOqxXQbsh70Zk250DnBalt8ONC8Q17buBTqYUYNON1Ax3etSkmbeMi7odxrDPX0
4Kz/gITWdunwq5OKp1GY4c4jrjU42HOcZ5MKVM3eZ4HV6eKkmcRaEWAJzJN5Ml1n
BZf2M6kyFMMiM1Cwy0x6
=LTce
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
