From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Sun, 8 Sep 2013 14:47:25 +0100
Message-ID: <20130908134725.GQ29403@sirena.org.uk>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C885@DBDE04.ent.ti.com>
 <5228369A.9000904@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C907@DBDE04.ent.ti.com>
 <52284F32.2020302@freescale.com>
 <20130905135032.GB3084@sirena.org.uk>
 <20130906023605.GA2292@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WKQ7zUpzoH2KEHMN"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130906023605.GA2292@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <shijie8@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--WKQ7zUpzoH2KEHMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2013 at 10:36:44PM -0400, Huang Shijie wrote:
> On Thu, Sep 05, 2013 at 02:50:32PM +0100, Mark Brown wrote:

> > Looking at the current header there just seem to be defines in there, no
> > abstraction for the chips.  Perhaps that is what is missing?

> we do not need any abstraction for this chip, we only need the SPI NOR=20
> commands, such as Quad read / DDR quad read.

So the abstraction could say what the commands are, or what's supported
if they're standard?

--WKQ7zUpzoH2KEHMN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLH/qAAoJELSic+t+oim9H3sP/1fg/sf49nzGXCDOTVf9HT3x
jyiywkjR+AM7BAbQCuESas5QnRJ6K/+F+zqItQjnePOYWhDPF5PnvVM0ZV3jioGz
68IqqCyks0WYrM3q/lm/1c7Zac6QXE5j2Ctm31BdYlJM/89nvrXz7CkSU+vNNfIg
HokK8j/q6vM8LIxxFDdU4t5rwf4/qQN80zm4c/c/XWfVtawkuUgszTTNPXP34Ar1
o6Acy/DHqd8jS/N6rtGr0VydDrrfe9PrvgiRNq3hZx5PcfKt/aISXWseE/XVXhuR
I6DiMFsibc64jXnzjWqkEaSMBxHInMDl1g4Hl6NbNBf945Nype0ygWH+f2US70lq
rM5+EDHC9+5iFMQW9OYIuOdYjPBK43PjNqaQSHxd2T/duWNzInJgUu5slVRNO4FW
y4AdCWyZrczt2k5AIiA7Zrp4bNXR+st86LU09SIO/zH+UNRZEmT8weY3fl4xslfZ
qTZxDOx39dLGeRQfK8sH35BgvZQGJPZL5yk1RllnnKxMxwfDfJ5cKFxR3gRgmIBn
CFOPE6NGKyON0ZkZUfPu2YjlEnGjV0Z9EcNVsTTGk19z1atoAlZnfBWJr2+3ypgo
K7p6VM/MufzyH0ZvTTjfEH9iTXFvF3GWtflzh0qObcim73itQbomMhoiwe1LqqrS
aTPkSTSymth2y0mfeZCC
=d2N3
-----END PGP SIGNATURE-----

--WKQ7zUpzoH2KEHMN--
