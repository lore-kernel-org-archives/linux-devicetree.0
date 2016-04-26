From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 10/18] ASoC: sti: Update example to include
 assigned-clocks and mclk-fs
Date: Tue, 26 Apr 2016 17:41:04 +0100
Message-ID: <20160426164104.GC3217@sirena.org.uk>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-11-git-send-email-peter.griffin@linaro.org>
 <20160421154933.GR3217@sirena.org.uk>
 <20160426115210.GB5457@griffinp-ThinkPad-X1-Carbon-2nd>
 <20160426142357.GW3217@sirena.org.uk>
 <20160426145129.GA11946@griffinp-ThinkPad-X1-Carbon-2nd>
 <20160426150319.GY3217@sirena.org.uk>
 <20160426161432.GA12088@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="79m9KipKW65BQbRT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160426161432.GA12088@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de, ludovic.barre@st.com, arnaud.pouliquen@st.com
List-Id: devicetree@vger.kernel.org


--79m9KipKW65BQbRT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 26, 2016 at 05:14:32PM +0100, Peter Griffin wrote:
> On Tue, 26 Apr 2016, Mark Brown wrote:

> > A lot of this is details of the system integration for this SoC, not
> > actual errors.

> This particular clock patch yes, but the other ASoC dt doc update is fixing
> bindings which haven't progressed in lockstep with the driver code. Presumably
> this happened during the review process when they were changed to being st,
> prefixed in the driver, but the doc wasn't also updated.

The bits where you are correcting the names of the properties are not
details of the system integration and are therefore fine.  The bits
where you're documenting the particular clocking arrangements for the
SoC you happen to be using less so.

> > it's fairly routine
> > to have to explain to people that just because some old driver did
> > something that doesn't mean it's something we want in new drivers.

> I'm sure it is. Although I fail to see why leaving the documentation with
> mistakes in is helpful to anybody.

Fixing actual mistakes is fine.

--79m9KipKW65BQbRT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXH5ofAAoJECTWi3JdVIfQZuYH/RfKp5QmiD+i+RpNev+dSIlp
HBfag+AQCZMN5+wqHZ87r9dEy508WJPtQCViG9Fpglw/k+Otcj2JSt/T+HoCwl8L
KY+5kkYUWAXeA7Ps8tR+a4RjXGsN23EThCheWlMsihqb1gljIDNI/AFFthU6pCD0
Lafx+xRDlSbkYyvChrC8521HQ0NsQU3CVKOlwRIfOy6eG3iHsWRGbEZFzKr7jm+Y
YSdPUKIqBkrMKQPzU66+FJ4f3Q7fH04bBl3/xxFxHD600W7ii4vsej7EnrUvgHKB
fySe1SBxO0n0q9N/r0+Br/sApBd6iGSUBH6ewVPOxf8OcleCdscZb978ClAzPj4=
=OV1p
-----END PGP SIGNATURE-----

--79m9KipKW65BQbRT--
