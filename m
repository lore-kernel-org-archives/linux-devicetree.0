From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 01/24] spi: mpc512x: cleanup clock API use
Date: Thu, 18 Jul 2013 21:49:56 +0100
Message-ID: <20130718204956.GU22506@sirena.org.uk>
References: <1373914074-20889-1-git-send-email-gsi@denx.de>
 <1374166855-7280-1-git-send-email-gsi@denx.de>
 <1374166855-7280-2-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1522009034397247544=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1374166855-7280-2-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1522009034397247544==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UsIKHTtpqa9hxcvF"
Content-Disposition: inline


--UsIKHTtpqa9hxcvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2013 at 07:00:32PM +0200, Gerhard Sittig wrote:

> +	psc_num = master->bus_num;
> +	snprintf(clk_name, sizeof(clk_name), "psc%d_mclk", psc_num);
> +	mps->clk_mclk = clk_get(dev, clk_name);
> +	if (IS_ERR(mps->clk_mclk))
> +		goto free_irq;

Should be using devm_clk_get().

--UsIKHTtpqa9hxcvF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR6FTxAAoJELSic+t+oim9NNcP/A9TP2KECJIULm9OaazmNXl4
Ckij+jj4rK31RPK+1Hx/2hfRPl/Z+RJ7Q0LStXV/CYMskBTH86L5TWKI9r4bmFuf
2DpClmSuzsHVMZazAigcG0uVqbUST49AWvmPKCrgL4h0RVLxQFvb2A4AMqamZfpN
e6YkKRl0vgg5Zm1wlML9qmU1nBCMwvmxZ49IaWzv1pua+EG6BI1bBqn0FoOpI5rC
0C/b7Z8FDEVjkDl3+fG4d6A6tO18mtEbMXpYLuzwANCkSX8vPHGDA6CxHIOBo0m+
0Dalsm/eLEIXzkYu+2fzGDSiiOZkETVdk0ywJgC3ufi3tvJUX2JLBWzVDuELV5ZD
6apqWKwapVZxBHt3Zdn0LOiSS4GYLl85qKraJMpTjNpVlo5J0wZ32h0ZJ14Q3Npa
5B/A+GZv9d0DS2u5Ef1fu0qztX8reXZqxy3iYVn3edz/Qcgav0GEOnTEZvWQDL4n
FrhOrKP07bOgfg/CbDz80D8S1aReprvfbKE2zsP4iMtWXsezWbeIkSSiuJWmO+80
4cRIea/Ct1JuPKi946Va4uLbgD6rd58NcGJ0cCPzQMLAtQJwa4Libh3xrDB94tsU
5sHZVExmFKVqpv/tAcIbmbMvZH5RWEVow+jQxRD33yu1/+yJIrQvvtZcC5nZOaNp
nl3zY6ZTZnKUfAyeVrLL
=gM5y
-----END PGP SIGNATURE-----

--UsIKHTtpqa9hxcvF--

--===============1522009034397247544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1522009034397247544==--
