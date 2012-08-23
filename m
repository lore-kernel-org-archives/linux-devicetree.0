From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/7] mfd: add imx syscon driver based on regmap
Date: Thu, 23 Aug 2012 12:06:47 +0100
Message-ID: <20120823110647.GU7995@opensource.wolfsonmicro.com>
References: <1345619928-15446-1-git-send-email-b29396@freescale.com>
 <1345619928-15446-2-git-send-email-b29396@freescale.com>
 <20120822160241.GR7995@opensource.wolfsonmicro.com>
 <20120823072629.GG10057@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7447032118048260948=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120823072629.GG10057-Fb7DQEYuewWctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============7447032118048260948==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zfUJHOO+0QrREfab"
Content-Disposition: inline


--zfUJHOO+0QrREfab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 23, 2012 at 03:26:30PM +0800, Dong Aisheng wrote:
> On Thu, Aug 23, 2012 at 12:02:41AM +0800, Mark Brown wrote:

> > It'd be good to provide a way of retrieving the regmap so that drivers
> > for subsystems with generic regmap code could use the framework features
> > (regulator is one example that I just mentioned in my other mail).

> Do you mean something like:
> regmap = syscon_regmap_dev_lookup(np, "fsl,anatop");
> regmap_write(regmap, reg, val);

> Then drivers can use generic regmap framework features rather than depend
> on what imx-syscon implemented, is that correct?

Yes, this is mainly for cases where the subsystem has helper functions
that can work with regmap.

--zfUJHOO+0QrREfab
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQNg7AAAoJEFJkBDiqVpZ4MMEP/AwOzMlpcS8qIHrRB4k/ELDF
fBzkP3bWtdVqwCyJjc4JU/oEz/g8o15vXwB+VIsGwf0e5Htk7X7U5eza78eXu/V4
2qah5HMSJSi+gu+HjM24665O5wAwr6VqbokXaDtB8VdlXVxICh7Bi7Cib/rr8riI
8FFf6TyvRnoHdF7WswXDSdAN84aVW2Vk6vX8egzZHIh/MIgmBdUd3xuk7/sm+1M+
O/1SejKVo54cygeSg/L73be4evknYs/r0LwGNyHuIc5mKZ5VXqzKSeA2mkvkZAKS
pb9LgsV/6J09BRI0i8xknl5rCbZ56U7C0GYQnwkHTWqsKuHZ8CzZ/k7GZ/1Evq99
0jFe/n6ioKMd+AnN85EhNtpTmO5Z8kJseEyBIFQhrLMf1NX2dAmUKR3lo/YhA0n0
eUdf5BthODvrtiRkizUXhXz1cZ8PfNzWmQLnPX8aBM7V0lTZHA7XJ1E6j8wunW8w
OyRE117Y2+1lsA2R0PUh5/Xl8/VDNWS2gNG7ZHDbxJUDbw2d7dE06J8ibcuLxAN3
Lt5nncusVy8uuvj/qHS7Jnra62qNPP7MwFbG6Y/s6pzBgmfyjQIbLTLLv6F4NRyI
B5t4qu1avPP+MHbnXM/OVZCNxG7W6DgGdO7vK/PYRmnm8QvCGE1SvGBu+3I9nOR4
GpLFT0IPp60aB+eOnRsw
=IvBW
-----END PGP SIGNATURE-----

--zfUJHOO+0QrREfab--

--===============7447032118048260948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7447032118048260948==--
