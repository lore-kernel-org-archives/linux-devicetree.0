From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3 v2] regulator: act8865: add device tree binding doc
Date: Tue, 17 Dec 2013 12:47:50 +0000
Message-ID: <20131217124750.GX3185@sirena.org.uk>
References: <1387258597-21866-1-git-send-email-wenyou.yang@atmel.com>
 <1387258597-21866-3-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4388796746756549799=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1387258597-21866-3-git-send-email-wenyou.yang@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: devicetree@vger.kernel.org, vpalatin@chromium.org, linux-doc@vger.kernel.org, nicolas.ferre@atmel.com, lgirdwood@gmail.com, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, grant.likely@linaro.org, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4388796746756549799==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NZYMWYzz24GaIu3e"
Content-Disposition: inline


--NZYMWYzz24GaIu3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 01:36:36PM +0800, Wenyou Yang wrote:

> +Required properties:
> +- compatible: "active-semi,act8865"
> +- reg: I2C slave address

This needs to also document the regulators property, for example all the
regulator names.

--NZYMWYzz24GaIu3e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsEfzAAoJELSic+t+oim9oKQP/1jh55BVuh2HAFivNeOKsPPe
0h6v+D54tdBnAmV996wIrU+9INNlFPWocWfj+pfK6Q4zCucrbE+6m/oGfzHqfg80
FaQN0aKW6A95dR61NLHIzZ9c3uWKbQ+flffb1ZhzXOmL2O7ACsj8EwM8Js1+M9Ni
9DGQMx9Mwyh93T0QkmX+j9G8uyY9EenpQnOC/Er7vNeteBub6cWLOIvDycQBW2Pi
2xr8grvXpzI/+u4FqIwssblVWb5z9Bpp/N8pghCnRnvDwvCgf6jbNFBGt550HVgJ
XygBj0IHFG5ZTHWaSh39v2u1bhbS0AFKFedLsEuJXMG6y446aAG4eV2oVsfCWJms
08yLyXnVQ5f6tNZYap3RAQKVddgVtbhdEa5aeRGBpTV9dRjIwcTSkOWjBq+x7qEc
xVhKuNzcsdJLVbil18t9d3XO8bMbBoef4Ro9r48Gzfo6g56AgwsaDwOM8Fx9hpSK
xoRznZQHEVQFb8e4uBHU9uR/1RUMDhI/SIMHg0R/XNtPJc7Tn5FQ5lNrtht1q83G
8jxWfMkdQjJBDKx9IhiDAK7nh1sXHVHOIXv8hGd3dVoHTCPerFCtkrxe0vst496o
ySHgfVrB11/20s/wuHiuZG4DVMPu/zWOBOu5LSfuUGSuvpY7mC6g00majWHCi66x
4aZoNvEN05orIkRlSxAU
=/mBm
-----END PGP SIGNATURE-----

--NZYMWYzz24GaIu3e--


--===============4388796746756549799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4388796746756549799==--
