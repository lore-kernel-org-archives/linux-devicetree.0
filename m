From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] regulator: add QCOM RPMh regulator driver
Date: Wed, 25 Apr 2018 11:31:36 +0100
Message-ID: <20180425103136.GB24769@sirena.org.uk>
References: <cover.1523673467.git.collinsd@codeaurora.org>
 <4b45f41996ea3344340e44fab2dc9e487572e209.1523673467.git.collinsd@codeaurora.org>
 <CAD=FV=XKYCDtF93RtYi+dokR2BcT-z6Ex3UjgJ0ia_kF=847eA@mail.gmail.com>
 <4e3353fe-ebb5-46bb-aa58-49ad04c4d9db@codeaurora.org>
 <CAD=FV=W28_exRv+H0MJvPnHWGEeUG=SMKr=UqEKpBzkH44Fzmg@mail.gmail.com>
 <132ab845-52d6-6192-4d8c-5a9c95410688@codeaurora.org>
 <20180424174507.GI22073@sirena.org.uk>
 <20a8f736-2687-f14f-eaa1-2b2c06eed629@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20a8f736-2687-f14f-eaa1-2b2c06eed629@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2018 at 02:09:47PM -0700, David Collins wrote:
> On 04/24/2018 10:45 AM, Mark Brown wrote:

> > I think that's probably only OK if we have a specific error code for the
> > regulator being limited in this way otherwise our error handling for I/O
> > problems involves us trying to reconfigure supplies which seems like it
> > would be risky. =20

> Would you be ok with -EAGAIN being used for this purpose?

Using -EAGAIN for "I can't ever read the configuration from this
regulator" doesn't seem right - it's not like any number of retries
will ever manage to read the value back.

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlrgWQgACgkQJNaLcl1U
h9CaXgf/Q/MwyAoaIjFMN2PKQ2kvD4bf+TtknHQxwyTJe8DhZ1KG6bDPRPYu4zSD
wsjpmoC5UcAnCZ9Zq1GIN1A4ZAUfhqC9UOl5S9Tgru9uH3uyblVYeL55mSaWJQqx
Bcx8CYxJvbPMlCSGWtMIPotPEjf1skQE9xk8J7MknVhtD1eTYXSbtbZmGxhkBWwV
OIzTqm5GMHzu2gYM+On/PghyGZA+4HyM7zoToa3OUr3pVwJfg2PYuFo80dctWreQ
LGfubHGSrzrlmNTAmXfVBESqlwuVCizvqiLMiQQTX3jn1Qx3uyNt7L86qPyCn7sT
bTPkBAnji/iVVJ/a+Gfsn/W8ibLXsQ==
=E/2W
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
