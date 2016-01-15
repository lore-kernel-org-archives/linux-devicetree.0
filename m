From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] regulator: add documentation for ACT8945A's
 regulator DT bindings
Date: Fri, 15 Jan 2016 17:59:05 +0000
Message-ID: <20160115175905.GB6588@sirena.org.uk>
References: <1452218938-10621-1-git-send-email-wenyou.yang@atmel.com>
 <1452218938-10621-3-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wXrNoiI3xS2qTXng"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452218938-10621-3-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--wXrNoiI3xS2qTXng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 08, 2016 at 10:08:58AM +0800, Wenyou Yang wrote:

> +Optional properties:
> +- active-semi,vsel-high: Indicates if the VSEL pin is set to logic-high.
> +  If this property is missing, assume the VSEL pin is set to logic-low.

Wouldn't such a pin normally be connected to a GPIO for runtime control
- why is it expected to be tied statically all the time?

--wXrNoiI3xS2qTXng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWmTNpAAoJECTWi3JdVIfQugoH/1ewMCSA6nWPzaH/u+MarT7c
N2s+uQsXf0n8hFK1JP1ekNojNkovKcNs9w/X2k92rxPrNrDm2jw2oCu6idUYGIYo
IQhW1XoxnXR5iiM5kd+C26O0uBp+7ydMPf7z4Momzk7ROVz0wu+fOdaACQAbXoRW
zkOOB7EtZN/gEMOhti3Z+qRcw930cHGVDJu67agDevSZtWeWYHVvAaP60KBUYhJY
Z19RzUMVIg4cSfMvfsnJ//VGbZoWGE4XKqT5avqFf4IFP0YpRY0WxgtpEU4vDPH2
gaLUcAqDru4Aoqz1JNvtJrcEwORp1dmIuhkwIzJvDCnAuzKOSdf9tG9bxinMW9E=
=UmPS
-----END PGP SIGNATURE-----

--wXrNoiI3xS2qTXng--
