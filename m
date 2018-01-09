From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 1/5] bindings: regulator: added support for suspend
 states
Date: Tue, 9 Jan 2018 16:40:52 +0000
Message-ID: <20180109164052.GD11471@sirena.org.uk>
References: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
 <1515050568-23876-2-git-send-email-zhang.chunyan@linaro.org>
 <20180105185328.zmt33idv2cqled62@rob-hp-laptop>
 <20180105191837.GI9076@sirena.org.uk>
 <CAG2=9p-ec1oVe-+O0TGYFF-E5dGrP3FoRZXb1sCyjNScVvGNQg@mail.gmail.com>
 <20180108123533.GE11698@sirena.org.uk>
 <CAG2=9p9D1QHErF22A+aA9OwvnBiuxAOV27iYYCzC_5ZpZzF9eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG2=9p9D1QHErF22A+aA9OwvnBiuxAOV27iYYCzC_5ZpZzF9eQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 09, 2018 at 02:08:45PM +0800, Chunyan Zhang wrote:

> Then, do we need a flag as well to give permission to change
> 'suspend_state->enabled'?

Yes, that's a separate thing which people might want to control even if
the voltage can't be changed.

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpU8JMACgkQJNaLcl1U
h9CtuQf/fgF6WEWtr9flybBFF7M8LNdCqQfuB7EcD/lsyPH07kMNL2jjqcvAEekj
bHnzt5orDJqXMlsvY2NHxVYDkWcC5LG80qDETd/ncEbS7i0mGbznXGxrlt/LgrTY
l6fN6tCEbhJlPPLEpOvQnaiMfi9CX2hHwHDDxyknwC1vyFHrEZqr+b8H/X2jSyAC
C9BlVcc/kIf9Ms0BV9gWpIctbGvV8+wqaupIkc6/RJsIiOKJStuNcwHxgTLD3/CL
iFlmOddDcJKoti2fub+nOPuyf4/xmqS3MEliOi5PKdWBL2wDj/Q9ReTgyyOufbAX
Y0MFmWrT+hD9bZ7OdrxRFHH7e43y5w==
=0wf8
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
