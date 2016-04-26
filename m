From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 10/18] ASoC: sti: Update example to include
 assigned-clocks and mclk-fs
Date: Tue, 26 Apr 2016 16:03:19 +0100
Message-ID: <20160426150319.GY3217@sirena.org.uk>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-11-git-send-email-peter.griffin@linaro.org>
 <20160421154933.GR3217@sirena.org.uk>
 <20160426115210.GB5457@griffinp-ThinkPad-X1-Carbon-2nd>
 <20160426142357.GW3217@sirena.org.uk>
 <20160426145129.GA11946@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V0xe3Ixffhs3jC2z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160426145129.GA11946@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de, ludovic.barre@st.com, arnaud.pouliquen@st.com
List-Id: devicetree@vger.kernel.org


--V0xe3Ixffhs3jC2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 26, 2016 at 03:51:29PM +0100, Peter Griffin wrote:
> On Tue, 26 Apr 2016, Mark Brown wrote:
> > On Tue, Apr 26, 2016 at 12:52:10PM +0100, Peter Griffin wrote:

> > If there are never going to be any new users why bother at all, why
> > would anyone paste it in when all the SoCs that ever use this are
> > already upstream?

> Generally if I come across documentation which is incorrect, I like to fix it.

A lot of this is details of the system integration for this SoC, not
actual errors.

> Currently the DT ASoC documentation doesn't match the driver and the example
> doesn't work, which is not ideal. I could well be the last person who needs
> to read it & use the example, but deliberately leaving it with mistakes in
> seemed like a bad idea.

People might end up trying to use it as an example, it's fairly routine
to have to explain to people that just because some old driver did
something that doesn't mean it's something we want in new drivers.

--V0xe3Ixffhs3jC2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXH4M2AAoJECTWi3JdVIfQWmoH/R9WePY45DuLC5u5T2jRczhf
uLJFM8dLi4V+WmkJAxh9rnb18vj2n/nClb0u7HxD+3J074sL2HRLYhqnWkbqAdMN
UpgWyv3MMijnEFVHRga4AhaYpfpAPWBX4/dJbqYTuH9QxYnluPTKCm3+LjNDJc3n
rH6CKhkLBQ65I4EhAaRRcuRz4mkJ37t19OQHMvDiaOPSMCgg1SwKJA5UKwUpQMY7
1e2jFOhEofXMFN/ADNNDXLg7SjTHCBhTLQkKaQzFUR3SLdLjXhS24kQ21EtrvsyC
XOhrYelGzy0hjk1Th+fboQHBjXQc76JnufaxwVyU9QLfzkb1d+9hgN2GSTIFRXU=
=v0Bz
-----END PGP SIGNATURE-----

--V0xe3Ixffhs3jC2z--
