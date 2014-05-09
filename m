From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv4 1/2] dt/bindings: Add the DT binding documentation for
 endianness
Date: Fri, 9 May 2014 18:02:55 +0100
Message-ID: <20140509170255.GR12304@sirena.org.uk>
References: <1399601073-19278-1-git-send-email-Li.Xiubo@freescale.com>
 <1399601073-19278-2-git-send-email-Li.Xiubo@freescale.com>
 <20140509163243.GD16418@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oZHGAHLZLTxDXFvh"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140509163243.GD16418@e106331-lin.cambridge.arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Xiubo Li <Li.Xiubo@freescale.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--oZHGAHLZLTxDXFvh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 09, 2014 at 05:32:43PM +0100, Mark Rutland wrote:
> On Fri, May 09, 2014 at 03:04:32AM +0100, Xiubo Li wrote:

> > {big,little}-endian{,-*}: these are boolean properties, if absent
> > meaning that the CPU and the Device are in the same endianness mode.

> That's not really true though. A device might usually be little-endian,
> regardless of the endianness of a CPU. Some vendors may integrate it as
> big-endian after a binding is added, and in the absence of a specified
> endianness a driver is likely to assume LE.

The default should be device specific rather than binding specific.

--oZHGAHLZLTxDXFvh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTbQo8AAoJELSic+t+oim9odIP/3214AgwfPCqRju85+0TILfU
N028geissnkpwItxvQCOW5WYK21A6Gkb/YlJ8CmcMcc5CAr7zJYaU2toaKHBhHFx
Kfu9tAgsfE9y9+7DKQeh1vdV2mhS6hMZR8Z6ZxEGwscB+prncQApp7yGLXcwI+tk
8xUfo/lgF3oL6BwMvdRZVqDwCnaXcQFs6Gr8mM43QZvFynzSUtxqVDGnom5X/3hA
Q3Zcu+kD1DZjtXjaWZwDNJ4kg+Vh2nkqfczj0zaWJ1d8HWYHQVFzVVaTWAIQ132S
wQ9ibDo3xBQJJpHpvq0KPzYQs6MN0MSL4Fy6GKZUE+rDcYtEy9n16E6FuAY3idUq
rMyN0+TYUttolnFHvN2PXzi73sAOlEw5u4tAmNdw85rMk2YQOWO0GzLJTCRotIQb
gIyj8kDl039/FURRYrHFQHqaSuue0XECWoLF65aJzhnJ3fnDhdok7mu+pqW1rmue
7Ee6nXOp644A71WORfUhs2e6a6r+vkVFAOPQy4rhqfQbQy2F3WZIzRkYBRq3M+GQ
y+MZepeqWFLQl+nbMFiWvR3YxUt7IablZs6uiBMQ6PHvCgsCNs6I7lu7SBqrpg7K
sVmFv/7gsF2+2B/9OBA7Zx7LUll08d0VlbJiYK3D8W9bMK3siflYzSejMqWzvnvC
jefjZ1n7FLWqkY3wCd7d
=d5oN
-----END PGP SIGNATURE-----

--oZHGAHLZLTxDXFvh--
