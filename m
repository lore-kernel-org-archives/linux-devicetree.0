From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v8 2/2] regulator: add QCOM RPMh regulator driver
Date: Thu, 28 Jun 2018 11:18:13 +0100
Message-ID: <20180628101813.GD14040@sirena.org.uk>
References: <cover.1529712888.git.collinsd@codeaurora.org>
 <35c4ea70cdf5caba560fb6f40e866ee8bc456d93.1529712888.git.collinsd@codeaurora.org>
 <CAD=FV=XVEEPgjBXxR+-46RgxLOq63Xvq-jtruoaCxccmMoKUuA@mail.gmail.com>
 <20180626120733.GD1779@sirena.org.uk>
 <CAD=FV=X1E8Cz=L93G-zJwhM0R=N3YuBBhkvCnLvWuxMU9KJkTw@mail.gmail.com>
 <20180626150203.GG1779@sirena.org.uk>
 <CAD=FV=WC_XWRk-6OELOFFWGnhRq1VeoiiveqXLSy+xqsVb22pA@mail.gmail.com>
 <20180627150126.GC5263@sirena.org.uk>
 <CAD=FV=WYcCVjAiMpzf4zyAByw5y-oDMnuabip1HXqa-mQFRt2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WYcCVjAiMpzf4zyAByw5y-oDMnuabip1HXqa-mQFRt2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org


--bajzpZikUji1w+G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 27, 2018 at 09:28:03AM -0700, Doug Anderson wrote:

> OK, great.  I guess I'm confused about the "|| COMPILE_TEST" causing
> problems then?  I was worried that anyone trying to do "COMPILE_TEST"
> on your tree (or linuxnext if RPMh isn't there) would get failures due
> to the lack of header files.  I guess if it's a problem you could just
> gut the "|| COMPILE_TEST" and it could be added back in later?

Ugh, yes - that'll break things.  In that case I can't apply this
without a signed tag from Andy's tree with the dependency stuff in.

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAls0teQACgkQJNaLcl1U
h9B4TAf/ebk6w0cZmO9WqSItIKbXOeN6pTRVfdLR8OW71Ma4XHNP/NrPJgfGThwk
6CBoSUWb5FWtzp6kkgdoRkyV/bO0f+uoZ1JREnJecYAV8SaJ8Jq5lxXyBmYWJ5/J
1E4v/ijMfvEs8xrEJvhpoZfPGt746yt6Kh5ymlb93UaIBJZBj2bxz1sF3n4vU1JX
sQT+XlBPipoD7sV8pb/X7YVm1N2+SWU9eKs6Cm5AUOVqcnnOTAuRhhq5HPNh1nT/
BOVZkOztWcIo0xsA0RICgxlKMXoVevXGHg5t1dmGr6sWGXxu/T5KM7CoZlPzNBU3
4E6tid1s+MOfqXHvu0MltEGP/vTLpQ==
=0TTH
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
