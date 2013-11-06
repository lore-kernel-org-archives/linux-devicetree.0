From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/13] ASoC: ux500_pcm: Extend ux500 MSP binding for
 enumeration
Date: Wed, 6 Nov 2013 10:46:58 +0000
Message-ID: <20131106104658.GE11602@sirena.org.uk>
References: <1383732985-18928-1-git-send-email-lee.jones@linaro.org>
 <1383732985-18928-7-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fkwCrey//1f/3EP1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383732985-18928-7-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--fkwCrey//1f/3EP1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2013 at 10:16:18AM +0000, Lee Jones wrote:

> +++ b/Documentation/devicetree/bindings/sound/ux500-msp.txt
> @@ -3,6 +3,7 @@
>  Required properties:
>   - compatible       :"stericsson,ux500-msp-i2s"
>   - reg              : Physical base address and length of the device's registers.
> + - id               : MSP ID - used during component registration

I have no idea what this means or how one would pick the number?  It
looks like something purely internal to the driver...

--fkwCrey//1f/3EP1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSeh4fAAoJELSic+t+oim9IsQQAJCrU2JOLqC8c0KGyJW3FdNT
zGzPCcV1M3aEsC1oJVHSTHCKVQJAr7/3lh+XlCNH25ldHd48zj+jeMYh3zfDGhEP
AtcBMjH30YDqeKw67AIBUPwQFdJcu7JYmrHqlH+3Bv5GykRlPyC7dJq5ZBR+pDbM
R8WtvQ+THBMTXgQlpmTkj6UiPDgsmn/oZMcV5XSNn3po0rJxfkUjwVyS620X3Wbr
P+AP15xdOPj9lZxLKADY+Ior8wyYClHFsRdQmLNxoDSNBMhMC+ZMtuQkHG9Dm0OU
lD3yMQ9gqQYQSF6VFkd25WLFLjlxGvoxEVT9vvT7jTix3X8T+Rd6Kgg4x4QXtU7v
KIzle4oza8aa8Iz67qAI4JWqFEJw6etcfgmnWnTgu/WnA2cWPJ7QWuTuK/MJSx5N
uslPBZxVW9cAuSnXXGZxpgHpTGhuddexkFiWUNatoIudQXPEjFS0MESH8KvkMlB4
nYSEBMA3VrHcs3F5WIe/dLfD+exoq6DiBVcFjMY78uzuluJFzaZSUi+MZrW6puyy
RXlLQAS0siXQv/jyVMVpt5eP+vql7qMbzqp/4jWqDBbqsk54NxE3hgZnIzOrK1ci
9/8ExTmijTRuFeR/GAqtvpgXAVh5HnGe/o9rSZzczc5RS4epWZXRvZnoTPlJbMdA
ZHl7qLh4BM6ohkG5sM98
=2TZH
-----END PGP SIGNATURE-----

--fkwCrey//1f/3EP1--
