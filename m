From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Tue, 10 Nov 2015 17:04:47 +0000
Message-ID: <20151110170447.GI12392@sirena.org.uk>
References: <20151022164724.GZ8232@sirena.org.uk>
 <563A25BE.90609@ti.com>
 <20151105101417.GM1717@sirena.org.uk>
 <563B9A10.4020907@ti.com>
 <20151106104322.GA18409@sirena.org.uk>
 <563CED25.6020405@ti.com>
 <20151106211651.GJ18409@sirena.org.uk>
 <5640DAC0.9080008@ti.com>
 <20151110095719.GC12392@sirena.org.uk>
 <56421FA5.1020103@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7IgncvKP0CVPV/ZZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56421FA5.1020103@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--7IgncvKP0CVPV/ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 10:47:33AM -0600, Andrew F. Davis wrote:
> On 11/10/2015 03:57 AM, Mark Brown wrote:

> >Of course this is a negative review of the binding!  What on earth did
> >you think my feedback meant?  The driver and the binding go together.

> The bindings should be driver/platform/OS agnostic, changing the bindings
> because the Linux regulator subsystem maintainer doesn't like them
> in regulator drivers is then not correct.

> If the binding is accepted then the regulator driver will just have
> to deal with it, so as I said, why not nack the bindings patch, and
> explain your objection where DT maintainers might see it.

If I'm not going to merge the driver because of issues in the DT code it
is vanishingly unlikely that I'm going to merge the regulator bindings
either.  I would have thought it should be clear that my review comments
cover both the manifestation of the bindings in the driver and the
bindings themselves.=20

--7IgncvKP0CVPV/ZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWQiOvAAoJECTWi3JdVIfQmxoH/2QCE8VU8eosw1q1lYin4H8v
6wwOFfiXdBsBvAVqwr+YW8ynDR36Ppp7Qn7nj3B4XYCyTrXWi8Y4EFunMUMaC0BQ
DZVbn/XIRShYfjhNj0I7JKGxXnFyyNJo+J4QQVI7TrxkVRHukII7Rb7VSwgRER+K
eL7Jrp5YXNKAx4Dw1hU8ZFptEQnQBW81m2snNgS4WJbw4oFnFh/2zC2toJcpQo2O
FeOkaIdcXard3gqUVMg9/AP7gDNZXQojpVdYmrijey+KOzEBMsjCU5W9/77fRs8m
N7Nn+tp1UP6Da57SJ9n08KjgtZcp8PDHyDOgnFv+To5AnhoHM+QCrD7GY4aoosg=
=p6R/
-----END PGP SIGNATURE-----

--7IgncvKP0CVPV/ZZ--
