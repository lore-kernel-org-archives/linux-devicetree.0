From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20151222 build: 3 failures 13 warnings (next-20151222)
Date: Wed, 23 Dec 2015 11:37:12 +0000
Message-ID: <20151223113712.GO16023@sirena.org.uk>
References: <E1aBIky-0007nI-7t@optimist>
 <20151222122228.GL5727@sirena.org.uk>
 <20151223034636.GA4569@hector.tx.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PtLnLSExlPr13a2X"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151223034636.GA4569@hector.tx.rr.com>
Sender: linux-next-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>, =?iso-8859-1?Q?Bj=F6rn?= Andersson <bjorn.andersson@sonymobile.com>, Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--PtLnLSExlPr13a2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 22, 2015 at 09:46:36PM -0600, Andy Gross wrote:
> On Tue, Dec 22, 2015 at 12:22:28PM +0000, Mark Brown wrote:

> > which are caused by ab4256cfeab91569 (pinctrl: qcom: pmic-gpio/mpp:
> > of_irq_count() == npins) which adds uses of irq_of_count() but that is
> > not exported so can't be used in modules.  I've just sent a patch adding
> > the export.

> Thanks for fixing that Mark.  I had seen it in the pinctrl builds but hadn't
> gotten the screen time to send in a fix.

It's not fixed, Rob didn't want the export.

--PtLnLSExlPr13a2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWeodoAAoJECTWi3JdVIfQRQIH/isXWGxioH1ShTA4wzVfpWbJ
+VZgfKrNaByPeSVCsT9Of9CpdcRAi5UevnQUFhOYF2wxDdCMS37ElwVf9PKAQPPb
lvGB8ofg+Nr7IOPe7jgkJ2EZ6B8Nb9+Lpg/opmmnph+WTjXpX7MULT1p+LyWP9+S
KsAHBYzXCWy8C691roOGUhTd6Za9lKpASXXS2CqBlSkQ+hinoyEqlOO0v7WCHcbh
69vPDa7PtR7dOtAtHQIaY8T6lUn3av2NjyCMI3LG7ScqMes6UtNPx0lk8MbdUzDM
FG//umNF3N8Yptb3A/39/ur8WrPEKNqFZByuC3WER/8V2vEUmFZ5KQAGPCCBNX4=
=n75E
-----END PGP SIGNATURE-----

--PtLnLSExlPr13a2X--
