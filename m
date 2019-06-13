From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: regulator: Add labibb regulator
Date: Thu, 13 Jun 2019 17:05:50 +0100
Message-ID: <20190613160550.GM5316@sirena.org.uk>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1rguoi8KZGYj2k4L"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nisha Kumari <nishakumari@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org


--1rguoi8KZGYj2k4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 04:30:49PM +0530, Nisha Kumari wrote:

> +- reg:				Specifies the SPMI address and size for this peripheral.
> +- regulator-name:		A string used to describe the regulator.

Why specifically list regulator-name here?  This is just one of the many
generic regulator properties that could be applied.

--1rguoi8KZGYj2k4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CdF0ACgkQJNaLcl1U
h9Chrgf/X5b1ow0UwfKQUAoQ7UmNNaW+VQnSWNn1sjJedj/BegsNd1myeOJCje7k
2ED26OFMqxwVb41tReWNbjdPpToF8AOicHj1O71JXgTogMs2nbiE3n9EMlpIolMZ
Y2wJMwYOSjorIALXWPqN3Af+YS2tL4Qsn736zF+0N8VukEReuCDZCC9MsNL28MkK
UV45QsVBB1ZOgEGXQUuS9a6/f+XM3PjFDXiOMLdIV1INBh1feoxZPLQs/pKXD58A
EVbSe9/AZWIZufMbNDbSxm8lRleSjlhueHPz0eD5zS2Zz1xEHkvNgOGDUsuOWclo
jGPIFi4yXjnaFzot+CMTsJW8I63e9g==
=oJNP
-----END PGP SIGNATURE-----

--1rguoi8KZGYj2k4L--
