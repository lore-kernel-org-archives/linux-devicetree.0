Return-Path: <SRS0=x/N+=MJ=sirena.org.uk=broonie@kernel.org>
Date: Thu, 27 Sep 2018 23:38:08 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] spi: make OF helper available for others
Message-ID: <20180927223808.GE20825@sirena.org.uk>
References: <20180925094230.32679-1-m.felsch@pengutronix.de>
 <20180925094230.32679-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8M+gQFKLhTGBxzRu"
Content-Disposition: inline
In-Reply-To: <20180925094230.32679-3-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: dmitry.torokhov@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>


--8M+gQFKLhTGBxzRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 25, 2018 at 11:42:29AM +0200, Marco Felsch wrote:
> The of_find_spi_device_by_node() helper function is useful for other
> modules too. Export the funciton as GPL like all other spi helper
> functions and make it available if CONFIG_OF is enabled, because it isn't
> related to the CONFIG_OF_DYNAMIC context. Finally add a stub if
> CONFIG_OF isn't enabled, so others must not care about it.

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-find-by-node

for you to fetch changes up to 5f143af7501e7c435c56e181a655493edaa92509:

  spi: make OF helper available for others (2018-09-27 23:36:03 +0100)

----------------------------------------------------------------
spi: Export _find_by_node() for users

It's useful for some bindings.

----------------------------------------------------------------
Marco Felsch (1):
      spi: make OF helper available for others

 drivers/spi/spi.c       |  7 +++++--
 include/linux/spi/spi.h | 17 ++++++++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

--8M+gQFKLhTGBxzRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlutW88ACgkQJNaLcl1U
h9Cx1wf+IdY7N8Gs6t2c08JFexCa8yCU5/RVJ1+d9yUhCGlzlCFXBah/FLcRnmhF
JmqRd3uKhvdJM8Ds0AVLooOQti3t/J63bx/xq4M6C9crTwZEC7n7nxoQ3yD677zF
APfTHsSnZChxQ7vMaig3+YmchzaFkj0a+WUTegCw/BhPmJACSpTv4tMkZecinSsQ
l+cBcdWhOz3dWaxnyMh1bzE7a+KmZ6TABd6/4D9+SvAZ7esWiGjMw8cwTB7LL2m1
loj6jPGu2G1HimFaGDTMGCJo84cozbT2S7c50vZRUKJURthjQ8igC5tpOaPCowg4
7+0tJcxln0x3gMnICE9dSBsX9hNGUw==
=4n/e
-----END PGP SIGNATURE-----

--8M+gQFKLhTGBxzRu--
