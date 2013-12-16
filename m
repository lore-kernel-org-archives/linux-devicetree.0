From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv3,RESEND] rtc: Add support for Intersil ISL12057 I2C RTC
 chip
Date: Mon, 16 Dec 2013 20:17:43 +0000
Message-ID: <20131216201743.GT3185@sirena.org.uk>
References: <637f26e051b700ca510a0af695dfd84cf2bfd35d.1387222475.git.arno@natisbad.org>
 <20131216201424.GA6639@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o6aug3O60clXg2rj"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131216201424.GA6639@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnaud Ebalard <arno@natisbad.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--o6aug3O60clXg2rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2013 at 12:14:24PM -0800, Guenter Roeck wrote:
> On Mon, Dec 16, 2013 at 08:49:36PM +0100, Arnaud Ebalard wrote:

> > +#ifdef CONFIG_OF
> > +static struct of_device_id isl12057_dt_match[] = {
> > +	{ .compatible = "isl,isl12057" },
> > +	{ },
> > +};
> > +#endif

> Is this needed ? For i2c devices, struct i2c_device_id should be sufficient.

It is required, it's bad practice to omit the vendor specifier.
Different vendors can and do use the same prefix in their device names
leading to collisions - for example both Wondermedia and Wolfson use wm.
Linux happens to accept unprefixed names but that doesn't mean it's a
good idea.

--o6aug3O60clXg2rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSr1/kAAoJELSic+t+oim9f18P/iSapKoldTNAAy59dAezGlV6
nov3+tFq1WeJXys84+G8B2RPSUjDjmM31nqX5FzShHpmp5jwYEDIazUNIaizN/Aj
iuGa15cdUlhN1NPo1xFGVAcYyRDPVwKi5rB9CARvbXPYW0weH74QZsyjjH61S+k8
EtUb/WwhQPYlYw3XJtqa+VPEKvC0CeCpE69h8d6XbscvOZlIp+8nQoEo7VeT1oPG
E9j0XrONGfha15Zc+LeNFY7Qev6yZOXzVZWhW7UKGGFeKAZy976v0TbGYWHs30Oz
BRe1tnq9gsU0ZH62tt9lN2coNT2DiXhYk6x4x0DMw9op2WcfJ9KAuN3YYbAlvuph
HElMQ7GnvCC1k26deFZNBl1aSaSDBKt33PmD/wh06h6xO+aS/ZV2PLUXmJSb5XwM
fqp3qePtx8PdBNZUzruzLdtRUvLNiWGClFLi2skwiU+zbCg7EsOyEdiE59MhxeSk
DVSb0MEKnjA4Aq1/Bjho2Bh63dU0SUeeOBHjKsxLAcT0TWMe82LDTLiwwtjBQHDw
mPnR99leOsd2GVnH/L05FbWkUExkMWqyjePjz8Gsqyxg8nlr5RbDZFBjFs/0LSFC
ffcHF7qqUvOjx9FKV0TbeUudiCwftOwj7u+AMEh4JaecdRdxArojkr2jDkGN3ikG
lxcxCxN9poMyEg1j56Xb
=ChZK
-----END PGP SIGNATURE-----

--o6aug3O60clXg2rj--
