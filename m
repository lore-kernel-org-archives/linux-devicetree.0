From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 19 Apr 2016 11:55:45 +0100
Message-ID: <20160419105545.GT3217@sirena.org.uk>
References: <20160331192227.GU2350@sirena.org.uk>
 <56FD7F07.7010404@nvidia.com>
 <20160331203942.GV2350@sirena.org.uk>
 <56FE2009.4020302@nvidia.com>
 <20160401161121.GZ2350@sirena.org.uk>
 <570370E5.3070901@nvidia.com>
 <20160412010226.GO3351@sirena.org.uk>
 <570CF822.4050002@nvidia.com>
 <20160413065310.GK14664@sirena.org.uk>
 <571601E7.2000901@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AaroDtM9M79Ffl67"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <571601E7.2000901@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--AaroDtM9M79Ffl67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 19, 2016 at 03:31:11PM +0530, Laxman Dewangan wrote:
> On Wednesday 13 April 2016 12:23 PM, Mark Brown wrote:

> >Possibly.  It did also occur to me last night that having a Maxim
> >specific property which lets you specify a raw register value to
> >configure in cases where the board goes out of spec (as opposed to a
> >time which could be left specified as the real value) might solve the
> >problem without being too terrible from an interface point of view,
> >though something that's directly obvious from the schematic would be
> >much better.

You appear to have ignord my suggestion above...

--AaroDtM9M79Ffl67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXFg6wAAoJECTWi3JdVIfQmgoH/jWBq1jQp4mJyjQaEoBz5aUf
zEIFIxHpEuQ4u3k+J3y2BcHHWUZS7Ha4cep9xWpRRLoWs7vjRyemJjsTEzsvRPz/
8QFbAVh4PWm0iGWdzidIGnRcDvcbe3RJ1rSTj45iwvXZ66gcnz12yGiCcmSQUtdL
9PqjkcTXQsfY+oCT1iZ2srCr0Lbwivh4Fv8lDL9Nz+cl1+NaNu060mrb3ET7u3C1
0BLujf8b+Wtp+qh0kh8CUB0aMWCgqx/8WXLA/zDHFyBn1YZGzscKbNsOIliqo0lS
QhVUaYTMnj6xpAXPol7jgxR7gMsAvk4tAW3o3PzeXiokrh0jYXe4jTJtZN5E6YE=
=0Ug3
-----END PGP SIGNATURE-----

--AaroDtM9M79Ffl67--
