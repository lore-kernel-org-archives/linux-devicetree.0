From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] soc: sprd: Add Spreadtrum multi-channel data
 transfer support
Date: Fri, 19 Apr 2019 15:41:25 +0100
Message-ID: <20190419144125.GQ2803@sirena.org.uk>
References: <f7edc4078b2d6f44ed5ad47c14dd58da5cc50f21.1555670768.git.baolin.wang@linaro.org>
 <64ca5af0373c35590d8ac9f2b62e3c9fa46e3551.1555670768.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KHqYxKoy+XnO4RVf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <64ca5af0373c35590d8ac9f2b62e3c9fa46e3551.1555670768.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--KHqYxKoy+XnO4RVf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2019 at 06:54:32PM +0800, Baolin Wang wrote:
> On Spreadtrum platform, the audio subsystem will use the multi-channel
> data transfer controller to transfer sound stream between audio subsystem
> and other AP/CP subsystem.
>=20
> It can support 10 DAC channel and 10 ADC channel, and each channel has
> 512 bytes depth data fifo. Moreover each channel can be used DMA mode
> or interrupt mode to transfer data.

Acked-by: Mark Brown <broonie@kernel.org>

However if there's no non-audio users of this DSP then it's probably
better to just move the driver into sound/soc.

--KHqYxKoy+XnO4RVf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAly53hQACgkQJNaLcl1U
h9CrfAgAgKhtRYO2+kmMmBkcuQ/s8uuZSLrUMumTD7DYz2Vtma0W2005NnVL4HmS
VlRKRuE2DMY+czRQDuAoCZ8sAupwNKTaNFJoxdxoU10BB9j7Uf9FcWCyBM/wq+1y
WXJi9FnDo+80YMci4EJnmWihO0CBcoRle1mJKgktTn0J0XFvVdLFxh0pTYrIA4KM
rNFkryGnXfwUqRwG0+px1d8nETvQyn4TR+noq5TQZXUQvOuJTMi9aGU8/arwwt2F
bgep8AhfF77ekw2szZKHtAxjSjUfRppqzTV+rIW+Nh9ud5jks92sUlqVZVS/J8Yq
fUwNiz8qRuE2qxDpqZb1Y7wjVsluhA==
=dgnu
-----END PGP SIGNATURE-----

--KHqYxKoy+XnO4RVf--
