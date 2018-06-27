From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v8 2/2] regulator: add QCOM RPMh regulator driver
Date: Wed, 27 Jun 2018 16:01:26 +0100
Message-ID: <20180627150126.GC5263@sirena.org.uk>
References: <cover.1529712888.git.collinsd@codeaurora.org>
 <35c4ea70cdf5caba560fb6f40e866ee8bc456d93.1529712888.git.collinsd@codeaurora.org>
 <CAD=FV=XVEEPgjBXxR+-46RgxLOq63Xvq-jtruoaCxccmMoKUuA@mail.gmail.com>
 <20180626120733.GD1779@sirena.org.uk>
 <CAD=FV=X1E8Cz=L93G-zJwhM0R=N3YuBBhkvCnLvWuxMU9KJkTw@mail.gmail.com>
 <20180626150203.GG1779@sirena.org.uk>
 <CAD=FV=WC_XWRk-6OELOFFWGnhRq1VeoiiveqXLSy+xqsVb22pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WC_XWRk-6OELOFFWGnhRq1VeoiiveqXLSy+xqsVb22pA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 26, 2018 at 11:15:14AM -0700, Doug Anderson wrote:

> I think he's still planning on re-shuffling his tree a bit.  When he
> does this, do you need him to put the RPMh patches somewhere you can
> merge into your tree?

Well, I *think* there's no actual dependency here since it's a new
driver with a Kconfig dependency.  It really just needs me to get round
to trawling through what's a fairly large patch with a troubled history
now you've reviewed it.

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlszpsUACgkQJNaLcl1U
h9DRXAf/RSwjn9Yep/XR4J9nwQWdsAQuo9Gvn9tJjRoGglOah9oGV4HW8M3S3Jir
RCTOixlFD8QmHXBMRkEoeY/dVPquUjJD1AvRUK54G+8Vi3oeb5G1ZvlY3bc0E7B3
qXp9Gqp9fZ/6hWj/cmfkilgsdnbEiuaY3rWxUUWNKo1g6L8YzyXdLPMOoQ6KN9yv
l+6GgUSct+LzxSXr6Bpas9mp1b/6xVH/3zbf/4+rp5Jod5ZMMOyHdX2YxKg7LwPZ
qUUMFJYufubQIHGMeG8jLLFQG6ZreKG46OptHwSb5MXM46Uw40SrewGw4NMYYrt7
JC3SzS+o9RlMhpmNBdqasAiYDQe2qw==
=uOTE
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
