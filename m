From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v8 2/2] regulator: add QCOM RPMh regulator driver
Date: Fri, 29 Jun 2018 12:06:41 +0100
Message-ID: <20180629110641.GB6556@sirena.org.uk>
References: <35c4ea70cdf5caba560fb6f40e866ee8bc456d93.1529712888.git.collinsd@codeaurora.org>
 <CAD=FV=XVEEPgjBXxR+-46RgxLOq63Xvq-jtruoaCxccmMoKUuA@mail.gmail.com>
 <20180626120733.GD1779@sirena.org.uk>
 <CAD=FV=X1E8Cz=L93G-zJwhM0R=N3YuBBhkvCnLvWuxMU9KJkTw@mail.gmail.com>
 <20180626150203.GG1779@sirena.org.uk>
 <CAD=FV=WC_XWRk-6OELOFFWGnhRq1VeoiiveqXLSy+xqsVb22pA@mail.gmail.com>
 <20180627150126.GC5263@sirena.org.uk>
 <CAD=FV=WYcCVjAiMpzf4zyAByw5y-oDMnuabip1HXqa-mQFRt2w@mail.gmail.com>
 <20180628101813.GD14040@sirena.org.uk>
 <87cc8c77-7b39-1746-4680-cb26d602e62e@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87cc8c77-7b39-1746-4680-cb26d602e62e@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 28, 2018 at 11:04:17AM -0700, David Collins wrote:

> Do you have any remaining concerns with the qcom-rpmh-regulator binding
> and driver patches that would keep you from applying them (other than the
> dependency patches being applied first)?

To repeat I need to find the time to sit down and go through them
properly, the problems this driver has had mean I feel I need to be
extra careful there.

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAls2EsEACgkQJNaLcl1U
h9Bx1Af7Bz4I6SUQg9lGj8sFvYlmI95U/RkOKKl7qwJ1vL4rDIVYxUnCKptgUZwq
m999vmbzQx/olgopwVBpHjalHCCKSwUFUT3YLsZHOxhg6qT32C98tsWk0fc0ryXp
TxeeeXZyGf9g1hUE5VJvxZyLPvGk/iz62cI6U2vj9zPwrc8D1m5yNrWqos18roZo
oSF41AOVcFDlSU2AIbuelz/T4e15rxvHxygubBMzyMUGjVicYdnIfvLq+XRWOD6i
GVg7h1+rEXX8mAFslOj0E1Y+WruwGlbcQQtF0WmEw4bzoHjhUzwlKU6Iryjwfc2F
3OqeExM3CbmRv90iiRAz87ILL2Kotw==
=rGtf
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
