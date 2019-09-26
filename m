From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: asoc: Add ADAU7118
	documentation
Date: Thu, 26 Sep 2019 11:44:02 -0700
Message-ID: <20190926184402.GG2036@sirena.org.uk>
References: <20190926071707.17557-1-nuno.sa@analog.com>
 <20190926071707.17557-2-nuno.sa@analog.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6021427838965693078=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190926071707.17557-2-nuno.sa@analog.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============6021427838965693078==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0TJQK8JvXJ+EbTps"
Content-Disposition: inline


--0TJQK8JvXJ+EbTps
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 09:17:07AM +0200, Nuno S=E1 wrote:

> +required:
> +  - "#sound-dai-cells"
> +  - compatible

The regulators should be listed as required too.

--0TJQK8JvXJ+EbTps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2NBvEACgkQJNaLcl1U
h9Bozgf9G95EmLRFp/BjEK+ieWiSOxCSpfQ8L8hEJCGT8vD8d9yf2e6H/KdCTo6V
b17L8CH24RuXJehCjLgjAkGKyzcGUtiLgqb9IYHzeMchMRMqVK2rbgic9C2uku1K
xKOdX9+oshFQwmPAdXSQIWTazGE6yjSiUgi5MqFQXL29qPLd9ussClxVlIo+us7r
zDB3k4TR5RvSXmbH6qlgh6DXLif5iagV1Wj6eDx8Y1gKa8Rq+IzqXtsHPDjMyjyj
UGPPHWYSSbHKjhHWdh1cxzlO0nI5f87PsuaWtFc5ih0Xq/DZuMhJKn07pYREiyV5
P9kxfSY4g5mLQdX6vQaVeX54HJfUqA==
=DuqT
-----END PGP SIGNATURE-----

--0TJQK8JvXJ+EbTps--

--===============6021427838965693078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6021427838965693078==--
