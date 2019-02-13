From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add DMA properties for ECSPI
Date: Wed, 13 Feb 2019 11:56:42 +0000
Message-ID: <20190213115642.GC7540@sirena.org.uk>
References: <20190107132226.16216-1-stefan@agner.ch>
 <20190107132226.16216-2-stefan@agner.ch>
 <1549573243.3075.72.camel@impinj.com>
 <20190211012305.GA21496@dragon>
 <c8677ded56c2fc7c1d375816f1dd8d66@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c8677ded56c2fc7c1d375816f1dd8d66@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, s.hauer@pengutronix.de, Trent Piepho <tpiepho@impinj.com>, linux-imx@nxp.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, fabio.estevam@nxp.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 12, 2019 at 08:20:46PM +0100, Stefan Agner wrote:

> > I dropped both patches from my tree.

> I think this is the wrong approach to disable DMA on those devices. The
> device tree is supposed to describe the complete hardware. If the driver
> is not ready to support DMA for that particular variant, we should add
> this information in the driver. We have compatible strings for i.MX
> 6UL/i.MX 7 to disable DMA accordingly.

Yes, that seems sensible - it's vanishingly unlikely that there's any
problem in the hardware here, it's software bugs and quirking in the
driver seems better than changing the DT.

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxkBfkACgkQJNaLcl1U
h9AVqwf+JOiZLu406UOLhIQJf6RMKFfrh1E7dVOI4A8MUZhEkZ4t3RHBOPpFJILe
xRdXkUyv12y6dk81ztTLFnZH1eK6jN4J7j9ETei5mfJ6KrJc93PzyHZhD/pQvBk0
Q64HFEg0uE6b4hK0OhEjMl/02xVgRWhEQkENwWoX7JLKL3Zo0ZYOVIg+LJyk3jux
tCgZBq5OPlANasZ6PYXg3iqlVOPyhnPRjggu4ILoUhB83ukKTOIp5ZoKJq7f/kwT
JpS15NDnUVYVp8NDwwqBGXpoZEdTPaHCYxX2Uetm8jPF/6KYlYWvKqjSOqs+Nu5j
iEoDyWU56KtZZ4OhQYdGkuBxYWhDcg==
=bamr
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
