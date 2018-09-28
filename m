Return-Path: <SRS0=qBHb=MK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60790 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbeI1TmA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Sep 2018 15:42:00 -0400
Date: Fri, 28 Sep 2018 14:18:09 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] spi: Add a DT binding for high-impedance turn-around
Message-ID: <20180928131809.GJ20825@sirena.org.uk>
References: <20180925143220.19007-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A/JKaSqKPqQLCbw0"
Content-Disposition: inline
In-Reply-To: <20180925143220.19007-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-spi@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--A/JKaSqKPqQLCbw0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 25, 2018 at 04:32:19PM +0200, Linus Walleij wrote:
> Some 3WIRE SPI devices require the host to insert a
> "high-impedance turn-around" essentially a clock pulse after
> switching the one line from output to input.

> +- spi-3wire-high-impedance-turn-around - Empty property indicating that a
> +		    3wire host need to insert a high-impedance turn-around
> +		    clock cycle after turning the one output line into an
> +		    input line.

Should this not be a flag set through the API rather than a DT property?
It doesn't look like something that's per system configurable but rather
something that the device is always going to need to do so every single
usage of the device is going to need this property.

--A/JKaSqKPqQLCbw0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluuKhEACgkQJNaLcl1U
h9CBXwf/XWmmttZOC1pfDBGxnWPcc+GrDacosUqSRlV6rDoIdzR2+8RK8Wq3wty7
C+moDJs2bbiXZIQue5wLMJy+iix5Gj5B3xLs3K5TPQWAWFE0lxSRndudrpt7sCkr
0tyIRk7UTXWpauxxTcxMZ4+0LoB8+VZCFvrAiq0XNGgqkn5PWTfFNu8J8ulMbRX4
NRV+t0ShrA8nlNdmNgeSmhvRa2rnjdOCN3KPdfpK+rVKZRZTvMrlq7ArL2/Za4zQ
REWnu/EocsVqZufRjj6T8tAh3mMQZA89l/juScezsT9d/s0VASF5C7eYyXHJHW+q
twtwh/oCfUYX2knwcYTTjjiSukwKlQ==
=JmKe
-----END PGP SIGNATURE-----

--A/JKaSqKPqQLCbw0--
