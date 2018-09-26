Return-Path: <SRS0=MUq0=MI=sirena.org.uk=broonie@kernel.org>
Date: Wed, 26 Sep 2018 13:19:27 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/3] Add GPIO brownout detection support
Message-ID: <20180926121927.GU20825@sirena.org.uk>
References: <20180925094230.32679-1-m.felsch@pengutronix.de>
 <20180925170915.GP20825@sirena.org.uk>
 <20180926081544.z6hg5ap275cp6dh7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oGy11dVowAZA6eXT"
Content-Disposition: inline
In-Reply-To: <20180926081544.z6hg5ap275cp6dh7@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: dmitry.torokhov@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>


--oGy11dVowAZA6eXT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 26, 2018 at 10:15:44AM +0200, Marco Felsch wrote:
> On 18-09-25 10:09, Mark Brown wrote:

> > > Marco Felsch (3):
> > >   spi: switch to SPDX license identifier

> > This seems like a completely unrelated change, why is it part of this
> > series?

> You're right. I saw the old header during my work on this topic. I can
> exclude it as a own patch.

OK, no need to resend or anything here but in general it's a better idea
to do that - it avoids confusion with dependencies or with things
getting tied up in review of the rest of the series when they don't need
to be.

--oGy11dVowAZA6eXT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlureU4ACgkQJNaLcl1U
h9CdSQf/WoveNMS64AiCNHQcewoHL2i1gm/PlFS0FFV67jpUFsj2Yd2rbRg+ABlS
mOVklqt/ig6XzhtQu02mHeT9Eo8Rsf/zXgyo60jFyF0Ka2ynlcUlCcKiARmaJyni
eVjQnLpzA6oFqwEFjkJKLhdanTPW2ElcUJFDTWRZocvi0DPvQ9uywLaF3iOOH2m8
60Hb8PHItMv25ae99WNYL+ewnsgLBtomSkKh3do4thIJ323/chjc7eqWrQf+GMYJ
S7s38tWqGDWw2SQXtwNth1/xigDoCMvNs9HdiNrLhW2y58H0E8HdZv/jiPT8vdho
FkZyl3hNNqNKcdjaYRt0/8Yx4ku3cA==
=/9qT
-----END PGP SIGNATURE-----

--oGy11dVowAZA6eXT--
