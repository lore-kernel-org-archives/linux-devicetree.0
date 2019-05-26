Return-Path: <SRS0=tuSm=T2=sirena.org.uk=broonie@kernel.org>
Date: Sun, 26 May 2019 13:18:46 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/5] ASoC: madera: Add common support for Cirrus Logic
 Madera codecs
Message-ID: <20190526121846.GG2456@sirena.org.uk>
References: <20190524104158.30731-1-ckeepax@opensource.cirrus.com>
 <20190524104158.30731-2-ckeepax@opensource.cirrus.com>
 <20190524145603.GE2456@sirena.org.uk>
 <2f4ab4ff-5b1e-8ef5-3ef7-8dfe413b4b95@opensource.cirrus.com>
 <ae5eee88-0b79-1e58-5812-9e46e5bf3b75@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Content-Disposition: inline
In-Reply-To: <ae5eee88-0b79-1e58-5812-9e46e5bf3b75@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2019 at 04:24:10PM +0100, Richard Fitzgerald wrote:
> On 24/05/19 16:21, Richard Fitzgerald wrote:
> > On 24/05/19 15:56, Mark Brown wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.  You've also got some replies inserted at
the wrong quote level.

> > > So we read the register a few times then add a few hundred us of delay
> > > after?=A0 Surely that delay is going to be negligable compared to the=
 time
> > > spent on I/O?

> > The register reads are to create clock cycles in the silicon, not to ge=
nerate delay.

> Sorry, just re-read your comment and realized I'd misread it. It's a hard=
ware requirement
> that after generating the internal clocks there must be a delay. I.e. we =
require a combination
> of a guaranteed number of SYSCLKs followed by a guaranteed minimum delay.

OK, the comment could use a bit of clarification then to say that reads
are explicitly required as opposed to being purely to generate a delay.

> > > This will delay both before and after every power up and power down.
> > > Are you sure that makes sense?

> > I think that's correct but we can re-check with hardware people. It's n=
ot just a delay,
> > it needs to ensure there are always a certain number of SYSCLK cycles i=
n the hardware to
> > avoid leaving certain state machines in limbo.

That sounds like you might want both _POST_PMU and _POST_PMD but do you
really need the _PREs as well?

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzqhCMACgkQJNaLcl1U
h9DOhwgAhDksiW9yjH8yooxPN3hj1N+V0lboEL78jKG6kcbvt/kdfC1BOIZJ0lwe
oDz/Il+ccMgEYmjMAHQvgUZ0hUlcZdQnBth1oCe14DD6O/MaxlYFInfvktbZ2M8N
unIk0xE0C/ltGelh9TkWaf3y/RuWRcvdXiqvRFmeoF/wSjBBWZqPUVoo+bSqjuwA
0tn+vHON5yknqIcNjM02LhHs9nEQCv1MuRvkGcfQCXLV4x4Faek6wrLLtxgFwAMt
sluBoLv3USop5kZReo0OdaVqcIoeTNij61l0F3alt+eoDkn9ov5ioecdlWUoLSti
F4pd242aR/RYEPGyDHfwdPrcDGbPNA==
=5UyU
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
