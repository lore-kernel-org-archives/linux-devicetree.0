From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 11:31:30 -0700
Message-ID: <20160331183130.GR2350@sirena.org.uk>
References: <56E81103.8010903@nvidia.com>
 <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com>
 <56ED0F58.7060005@nvidia.com>
 <56FBD4A3.7080208@nvidia.com>
 <20160330181623.GQ2350@sirena.org.uk>
 <56FCCC60.3080303@nvidia.com>
 <20160331165145.GF2350@sirena.org.uk>
 <56FD5A9F.5050001@nvidia.com>
 <20160331174741.GO2350@sirena.org.uk>
 <56FD62BA.3040406@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fRTiclqxXzPSgD3k"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FD62BA.3040406@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--fRTiclqxXzPSgD3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 31, 2016 at 11:17:38PM +0530, Laxman Dewangan wrote:

> HW and chip team did simulation with tegra and PMIC and found that the board
> needs more capacitance then what Vendor recommended for proper signal
> conditioning on interface. So they put the difference capactitance value and
> this causes deviation in ramp delay from advertised value. In out design, we
> measured the ramp time as 50mv/us when PMIC is configured for 100mV/us.

> So for all settling time, we need to use the ramp as 50mV/us.

> From DT, I will provide regulator-ramp-delay as 50mv/us.

> But I do not have property for saying 100mv/us for PMIC configurations and
> this is what makes need of 2nd property.

So the PMIC actually has a setting for the rate you're seeing but for
some resaon you can't use it?

--fRTiclqxXzPSgD3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/W0BAAoJECTWi3JdVIfQPOgH/RU/m5FDL/10ijWon+Lc0qdA
n20MpIZIC/20bV0Q4HV/UyvBTuOdXo0XJP8GWNRyMzTSY8r2jxpa4o01Ofx56axT
ofS5YUVDS40HbQTGRnHAmhY00PGy3ClQcCgovnyB6Q28GHYrwc6XxEoGi7lwxgC7
fOED8TfjZY59AL2d5cQY/10P9kxXDdnmG7slaCgPEjWGahVK9cio3JhrnvZovpXZ
n7J8I+NC6NyuTBk3pCJiZ4VuaT5dQ8UvYgKqBGhZ0pWv1304BNSLbwDntXoIxLWN
DW4QJNPgyHFIjDKr/DGVH+TeBykD0zw4p2xQ1bDp8hDkyhobWfXxv8sMEayHXCk=
=KNXR
-----END PGP SIGNATURE-----

--fRTiclqxXzPSgD3k--
