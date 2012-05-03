From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Thu, 3 May 2012 16:26:43 +0100
Message-ID: <20120503152643.GM3955@opensource.wolfsonmicro.com>
References: <1336049665-27777-1-git-send-email-peter.ujfalusi@ti.com>
 <1336049665-27777-3-git-send-email-peter.ujfalusi@ti.com>
 <20120503132004.GB14296@sirena.org.uk>
 <4FA2881B.6010902@ti.com>
 <20120503145248.GJ3955@opensource.wolfsonmicro.com>
 <4FA2A08C.5000403@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DheUW4aQn8WJk6WR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FA2A08C.5000403@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org


--DheUW4aQn8WJk6WR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 03, 2012 at 06:13:16PM +0300, Peter Ujfalusi wrote:
> On 05/03/2012 05:52 PM, Mark Brown wrote:
> > Are you sure there aren't any boards out there which rely on the
> > interrupt base (eg, using a GPIO with the IRQ output of a chip)?

> Yes, I'm sure.

Because...?

--DheUW4aQn8WJk6WR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPoqOpAAoJEBus8iNuMP3d1YYQAJYcnymCl3nhQZsdZxXMt3PJ
9xVvNk0D79+MDGu7gLx8szEDG7th7nsbCgQMYR3CD0iF19aGazB8a0bQUF5c7PEI
bT5Q8MOaKEYA9kiWlmdR/kKBIfHeWJQl2QB90Hexfutjn09QP4zHlxS4ZD6VXHqY
mSrB4jPOvdz171eEntzwISmGLAUZjTPrj2oqp6XFGnt6zMQnF2V8v8/HmM/yFVQB
3TUmNyxXh422PpIdXzS6brD5MEkup4TtXouktHnr86gtdrrhMXekztEEIGTHbc1n
XiWKLTu5FFdGvP2ESiFlwfgJyX+STtC8VPmdRPkMmqMy1X3WS80xDcgTO2zdO88O
KFUMrCkZxsOvtN9ZMtsbsubqPZhJS6+2ednPnqb2Q9A+lecJXV3EwKoLl493uI6I
lJJ0e/teJlsN2614A0qbfMOwy57e/dUgTIV2XNFckrcIwD6CoHAcsmBzL5Vjoivu
Hv6oYUrlS+5NNCFi9lbxRvYtIAU24xoHqWVfK4BuUwQ9AnbEbB4e+cK2IOFmEuWt
heQCRiybc1TCo9BECwR6eora6cO2SVQiBtP1rco1Edxd4HUHcc4LzH9keMzmPy0l
4avsdnodJFLoMOSZ9JcWBsKIIrkwF28YINaexGUxUa4Nx7Rlg7an/LaBUx1znW6Q
X3xyB6LlzHZ2qUmxZAgp
=Ip2t
-----END PGP SIGNATURE-----

--DheUW4aQn8WJk6WR--
