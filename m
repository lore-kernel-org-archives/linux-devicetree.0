From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 5/8] spi: Add Freescale QuadSpi driver
Date: Wed, 11 Sep 2013 11:39:03 +0100
Message-ID: <20130911103903.GM29403@sirena.org.uk>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <1377828449-18912-6-git-send-email-b32955@freescale.com>
 <20130910180923.GC29403@sirena.org.uk>
 <522FD833.2060801@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4338926043492860581=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <522FD833.2060801@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Huang Shijie <b32955@freescale.com>
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com, b44548@freescale.com, dedekind1@gmail.com, linux-doc@vger.kernel.org, b18965@freescale.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de, lznuaa@gmail.com, shawn.guo@linaro.org, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4338926043492860581==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9B5XEHKwA0ZzBbnj"
Content-Disposition: inline


--9B5XEHKwA0ZzBbnj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2013 at 10:40:51AM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8811=E6=97=A5 02:09, Mark Brown =E5=86=99=
=E9=81=93:

> > For review and merge it would be much easier to send a patch which
> > implements just the basic SPI support for this device then add the
> > support for quad mode separately.

> okay. I can remove the quad-read support in next version.

No need to remove it completely, just split it into another patch - that
way we can hopefully merge the bits that are just a standard SPI driver
first even if the other bits are still in discussion.

--9B5XEHKwA0ZzBbnj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMEhEAAoJELSic+t+oim9RyUP/jNoUEskSOR+YTA3j4GdeXgN
/PIvBHSJ10xDUaXrYr9gIBKWZtVM+75p7EtbczNlNkx3BvtsUGTwvNojU2/527+M
oixENrysHmuI7U67Ren7Jj6J9WsGJzWMNz7uZ0n393WL1PJLagWQQpRwWxDLdRgk
HsFoJlN9V8SKk0tfX2rHEDzEuq1/rQBscjowS1GEFIri1JFODMB0RQKsnWXdQlKy
+MQrBK+Vw52rLAGrehKZL5VGqD929DGVLVThZZz3B/0QMDPmntxlJ8AqPYnkWgf5
Ju/I6/DXrJqhUou4vwlrAtGBWRi6dAv9z7n720x0cQraUC3cPWTUlO1vjexcnkgS
W9tfs5oCVBORBuwqEFbFe6xQxMczapmW4okkmFvFoTPsbjqB/4pqd3rTzdbAkfQa
HE/FCZJnRLaEJAqeehxEjcNOxSM+zfk6ivB8jNdt7y6fyt7WpBl7jj5aaKUV5Dcg
bPVKhWvTZtjW+MAdgs7NUOkaJpsARqYhE0DbxMGz6mGOio+yDnkzmdZe7i9RS6Eo
rwGBBVt0sRQK/k+DMGP3JcM++Y0wm8Zwt//JgEbSP70xf5ikX4M0gaALYv9ed4I4
ZiXGfizNa/lVQEBDkcocmGdxpGyIFV/OR7o596IwiNwDaH/cMgMKHhhdWTBRIBXZ
v9rA0rPICp2uYxXBMQez
=Gi+b
-----END PGP SIGNATURE-----

--9B5XEHKwA0ZzBbnj--


--===============4338926043492860581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4338926043492860581==--
