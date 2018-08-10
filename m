From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 2/2] regulator: add QCOM RPMh regulator driver
Date: Fri, 10 Aug 2018 17:29:20 +0100
Message-ID: <20180810162920.GG20971@sirena.org.uk>
References: <cover.1531531808.git.collinsd@codeaurora.org>
 <acfc014f3ae3d7feea30be6beaec3e64d96a2723.1531531808.git.collinsd@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <acfc014f3ae3d7feea30be6beaec3e64d96a2723.1531531808.git.collinsd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, dianders@chromium.org, mka@chromium.org
List-Id: devicetree@vger.kernel.org


--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 13, 2018 at 06:50:59PM -0700, David Collins wrote:

> +	switch (rpmh_mode) {

> +	default:
> +		mode = REGULATOR_MODE_INVALID;
> +	}

I'm not sure why the break statements are being omitted in default
cases, but I do find myself stopping and trying to figure it out?

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlttvV8ACgkQJNaLcl1U
h9AVEAf+PwJei1gP+kqd4Alr2LPAKXL4NorS7ssYny2+0zOCpf8eby40kxVR5SqL
bN5VjqG2U1KnEjE4Ff1ROxIZYsiWTjzfpU0wMO/waNdnLYpz3CE0Hp/CpZ/qJx5A
Oigh6G1M4olEbQEddYU2aPRxIHhn3tdwpgBVkcGml53oq28adakeDeF9Pnxa/eVY
bFc8HZuSq87W3JJVCByyB81qrntgBM//Mnhzm0G0vA3xNtFq1QktAv6kt9X2vb5c
QYH0mWUNsfv1d+ETohJ1HALsrsxUVUbWMThFQ6n3i/GjLiCePyfDI7jqAXpdn/yl
cjyoDf4ctT6qfPb0eRv88rkX0RDIcg==
=1kxy
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
