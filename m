From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: DTS: Fix register map for virt-capable GIC
Date: Wed, 18 Jan 2017 14:23:03 +0100
Message-ID: <20170118132303.zswjourymirskkoc@lukather>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6matwqgemfwtdbib"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King <linux@armlinux.org.uk>, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias
List-Id: devicetree@vger.kernel.org


--6matwqgemfwtdbib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 10:53:31AM +0000, Marc Zyngier wrote:
> Since everybody copied my own mistake from the DT binding example,
> let's address all the offenders in one swift go.
>=20
> Most of them got the CPU interface size wrong (4kB, while it should
> be 8kB), except for both keystone platforms which got the control
> interface wrong (4kB instead of 8kB).
>=20
> In the couple of cases were I knew for sure what implementation
> was used, I've added the "arm,gic-400" compatible string. I'm 99%
> sure that this is what everyong is using, but short of having the
> TRM for all the other SoCs, I've let them alone.
>=20
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6matwqgemfwtdbib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYf2wyAAoJEBx+YmzsjxAggEAP/2pckmHysvJH9rX6b0OLm8F4
tZNJS8Iq5so+BKBrGfFSUdq2Ban1JcRsE8xouQiJBXHtJ3eI2l5+W3qm30nHCZH9
N+rKb+sEkgL1mgIvwZI2XSeULla6NBzagJgf6f0daGAKaVgodF/qlm+fKQoP5D+a
VPpzsk2CxIPuNVGs/bVFmbaQeh6uwq6gnq6vCGA66KrTMZrG8jJQtq8gZMdyMtBw
QFgX4dkRzCnr8cW3tTbcFRGx5X2IqaOwY4invq1nxiKyN6Q0boaiY31uQPRSVVuW
UQvGR8ZqkX5S3HLS8Gi3Xhd61hJ+ycuJ7yK0AZHNKPjb1a5kRmOOfF1JpkXJoGDH
zc0OfVtczr7HgCCOzErkn2aR40QBc4NUn/aGUJ+UfMgGEJYMLTbw9gZotFgiq++K
LQq9+ACdxKgWJNJ2AS9JrbyNy+AlaD2/yalCwSQUcARm0F1BaDFScY14jhGY7zbx
Ehs/2N2Ye7yabzLLjEzxWyns/u/0Rp70rn7Wi6ZmsjQ3R5uCJ2K+doguQrK7rII2
6bCcLx7U5UrS4DHHdT/pvusIcjWBCh3hNntUNcwZ578W5v5njUv+Bpx+XaOOq0go
8ij+r5W/LDL6bVYy6GTMSfu5WgkkJZbsi4hgaNLiTdPqz7WC8aV/d+042rnPRNGI
AqkfYIYezK/bDZqI4Efx
=07zl
-----END PGP SIGNATURE-----

--6matwqgemfwtdbib--
