From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Mon, 9 Sep 2013 16:14:50 +0100
Message-ID: <20130909151450.GI29403@sirena.org.uk>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <522D3B79.3060707@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eFXAY4YgtweBABeK"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <522D3B79.3060707@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--eFXAY4YgtweBABeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2013 at 11:07:37AM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8808=E6=97=A5 21:47, Mark Brown =E5=86=99=
=E9=81=93:

> > So the abstraction could say what the commands are, or what's supported

> I have already added the comment for what the commands are, please see
> patch 3 & patch 4.

> > if they're standard?

> In actually, there is no standard for the SPI NOR commands now.

> I added these commands just in the Spansion section now.
> (Of course, other NOR vendors may also uses the same commands.)

So then an abstraction which hides the details of which commands are
needed from the drivers seems sensible?

--eFXAY4YgtweBABeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLeXnAAoJELSic+t+oim9zxgP/09lnbGCGPEJWOCmG8kqR02n
vhyzDSVHwPZxSL315nJx9wO81oP3ZdZPkdm9MDxJkaYqHKL9t9iMbg4wy0d31Nf+
wijAIeE6vPe2lm9ecH1M8Sy2ZivmrzF45rLk/JM+BEh78c/CGSs8wdSsXE+0SbLM
KI5wvHsW/tAfRUwwjGlrcuijY5UsYtxQSkFpavTwOLXMr5g4OEGCi4yR9SLTTMvY
mt+RFHMRrZWAJi+OC/k0t42lESqrpg8RRLnQkfjYfBKmkVnXKMNHN4rDwQsHg6Up
JT4aGeNOp8eVxqXVp93zNixzHTEAW9sfeKKqxjVILu7ev4m3AF911VU4OPSPd3fp
0HiFcDgXIpnJCm36Pl7+iZOUGKragjTk0HqJeqKnwZM18pG6xYhgC1WzmLtKIzOM
I3FRzPISCf+npfq9+7D1u4HmQch2B0qN3H3LC0U8tdDNsc8T6BYLsHnhITScQi0t
MjKsrp4ci/NzQlxL3x+apkU0EJRyK5JX3Ca4MuMTJ1pif/nTCScGg1UqjrgtKvr1
7tbeEn1dnyTMAdbAiRW4pqFzOqQ4dvm7W9f5ibe1djcFOHv7nVNx0X2bJKITMtZ9
A0du/x/rBVRVLXL04/hptmn65TFmJ1UtduNvJW95YGqNDdV+Q902sgWa8ljDqsem
JlC1mzDkTSNuVkZXXzgP
=jYbG
-----END PGP SIGNATURE-----

--eFXAY4YgtweBABeK--
