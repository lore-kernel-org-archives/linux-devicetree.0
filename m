From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2.1 2/4] spi: rockchip: add bindings for rk3399 spi
Date: Thu, 18 Feb 2016 13:57:51 +0000
Message-ID: <20160218135751.GE7129@sirena.org.uk>
References: <1455762983-29980-1-git-send-email-jay.xu@rock-chips.com>
 <1455762983-29980-3-git-send-email-jay.xu@rock-chips.com>
 <20160218094108.GA7129@sirena.org.uk> <2327512.KAqs6H56Km@phil>
 <56C5959D.3030806@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8626422643958836163=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <56C5959D.3030806-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8626422643958836163==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline


--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 18, 2016 at 05:57:49PM +0800, Jianqun Xu wrote:

> I'm a little confuse, I have upstreamed rockchip-i2s, and the i2s driver set
> the compatible like:
> - compatible: should be one of the followings
>    - "rockchip,rk3066-i2s": for rk3066
>    - "rockchip,rk3188-i2s", "rockchip,rk3066-i2s": for rk3188
>    - "rockchip,rk3288-i2s", "rockchip,rk3066-i2s": for rk3288
>    - "rockchip,rk3399-i2s", "rockchip,rk3066-i2s": for rk3399
> and the driver only has
> static const struct of_device_id rockchip_i2s_match[] = {
> 	{ .compatible = "rockchip,rk3066-i2s", },
> 	{},
> };

> The spi of rk3399 as same as rk3066, rk3188, rk3288, like i2s, if they are
> keep different rules ?

No, that's just something that got missed in review and which should be
fixed.

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWxc3eAAoJECTWi3JdVIfQPn0H/1pS4pSP4GUrIc3s5JcMgdb8
A1r+80mR2QyxZ2sjmslLv63Q4zSbMJSqRMC/RVxpPFZ4LirQgduYB+ihu+nFwL6S
i7lANd9ruQZlOek9z7J9WzvhLeu4VMVdo2xI2TdgmQz+98BBUJYno5FdtIWiooWB
csR5iGR3B7fJ9tV6wRI/2/a6sTchYGKK9TTGDPJuY0NNJeLmMhFB9+AWRM+P9a3T
BUtaeKx2dWfd/ze9fh54H7wAlt2LncLMYZgvPbfhmCui++z6PrASjxIcx85rlpPb
TckG56n+Xhx5CkxR9iT+6QxpFDSnmTLw6kD+Umz/cJ2NLshD40xqXiIbWF8tuNk=
=r/QX
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--


--===============8626422643958836163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============8626422643958836163==--
