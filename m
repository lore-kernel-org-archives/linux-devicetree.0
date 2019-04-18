From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 3/3] regulator: slg51000: add slg51000 regulator driver
Date: Thu, 18 Apr 2019 11:16:06 +0100
Message-ID: <20190418101606.GC6702@sirena.org.uk>
References: <cover.1555567784.git.eric.jeong.opensource@diasemi.com>
 <2e7559c6ad3fdc3c3b99690ebd7dbb4e35c0d184.1555567784.git.eric.jeong.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2e7559c6ad3fdc3c3b99690ebd7dbb4e35c0d184.1555567784.git.eric.jeong.opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2019 at 03:09:44PM +0900, Eric Jeong wrote:

> I updated regulator_ops structure to use use the helper function=20
> which is regulator_is_enabled_regmap() instead reading status bits
> for is_enabled() operation.

> v2: use regulator helper function for is_enabled()

There's also the get_status() operation which you should be able to
implement using the status bits you were reading before - that lets
the framework know if the regualtor is actually working which can help
with error handling so it's good to do.

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAly4TmYACgkQJNaLcl1U
h9ANEwf/WWzURfos+VWeKjS1bNQaogms1MLqzXWk5S8SHI1/ND+lrwudCVJ4UXJ0
kXg3qPfxyALM2k/7Ex2W1QaZ4WKoN/YbnEQPle9Ag79YTapMM74OMGt75O+hgbK7
+jnsN+QwGYKfW1yUIKlH85OXbVpzvVjeJe83/QIR1hcEG5G0zMEeIRk0zTMILrGq
DqwYKI/Y9eC85JYiEGTnR3ItFKE4ToWz0MOqqaaiGVUZqUGpYQDTHWdVkQXAdtLA
amgNQaw+6NQ1JszQP86G145i9hez0O1tCE5d04yDYWEpP8/nh15ZoOLrmSW7rDG8
ra0PO4F1Gciublx/QZGqV9R+bVLBQQ==
=ZrKl
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
