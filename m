From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 9/9] sunxi_defconfig: add new crypto options
Date: Fri, 13 Sep 2019 14:10:56 +0200
Message-ID: <20190913121056.h2iotti6dzpsp6lx@localhost.localdomain>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-10-clabbe.montjoie@gmail.com>
 <20190907040353.hrz7gmqgzpfpo4xj@flea>
 <20190913081555.GA22538@Red>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ffgt2cjw56vmabzb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190913081555.GA22538@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--ffgt2cjw56vmabzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2019 at 10:15:55AM +0200, Corentin Labbe wrote:
> On Sat, Sep 07, 2019 at 07:03:53AM +0300, Maxime Ripard wrote:
> > On Fri, Sep 06, 2019 at 08:45:51PM +0200, Corentin Labbe wrote:
> > > This patch adds the new allwinner crypto configs to sunxi_defconfig
> > >
> > > Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> > > ---
> > >  arch/arm/configs/sunxi_defconfig | 2 ++
> > >  1 file changed, 2 insertions(+)
> >=20
> > Can you also enable it in arm64's defconfig as a module?
> >=20
>
> Does you prefer adding a Kconfig "DEFAULT m if ARCH_SUNXI" which
> permit to not touch any defconfig ?

It's not the preferred solution, unfortunately

Maxime
--ffgt2cjw56vmabzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXXuHUAAKCRDj7w1vZxhR
xVj6AQCte0LxsckHRmuiUFmI2uusqYR7WoJJUQuHpsZznP2FkQEArHYCXAXLwf4v
eUq+1BJhz/6J08UKnz6F1MN145U+fA4=
=du6r
-----END PGP SIGNATURE-----

--ffgt2cjw56vmabzb--
