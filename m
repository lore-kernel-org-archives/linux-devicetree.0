From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 6/8] regulator: hi6421: Describe consumed platform
 device
Date: Wed, 7 Jun 2017 20:25:24 +0100
Message-ID: <20170607192524.ggci4pn47smrduex@sirena.org.uk>
References: <20170607070606.8889-1-guodong.xu@linaro.org>
 <20170607070606.8889-7-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xqdpbk35nl5hewck"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170607070606.8889-7-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jeremy Linton <lintonrjeremy@gmail.com>
List-Id: devicetree@vger.kernel.org


--xqdpbk35nl5hewck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 07, 2017 at 03:06:04PM +0800, Guodong Xu wrote:
> The hi6421-regulator driver consumes a similarly named platform device.
> Adding that to the module device table, allows modprobe to locate this
> driver once the device is created.

You need this in hi6421v530 too.

--xqdpbk35nl5hewck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlk4UyMACgkQJNaLcl1U
h9BtKAf/QQ99sPlyl6lEe9xIlM/wnkOg547b6cZHxmGRwEs/EbPEir5kbgMRnM0b
NwB3EUYbmzzLYMjAnDa24Fq0tZ05FqkBWAExBSiv7L+fal01LEPGnfSGVn+mL9qN
7BJjIo+2npnvnU8+15pVSXCjC/dTJq+gmKv1gPAoxQqkYWGcuZBIkMiY4bTeN9zH
lL4ia1L2PdFKSFHxWlg1ZOSKRXumXRKvHPEtTitZeRB/rVUAzuqpVMyzeJ+wjej6
y320Z5EeotpB0MGyM6ZX9iLu/3HnOhS9TZU+PPRheAsE3135TXuSj/tZIyC0jTg3
d+LsW/kIPjNMDR3GkavzUSuoyYnQQg==
=y/gF
-----END PGP SIGNATURE-----

--xqdpbk35nl5hewck--
