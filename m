From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] regulator: fan53555: enable vin supply
Date: Mon, 15 Sep 2014 14:49:48 -0700
Message-ID: <20140915214947.GA7960@sirena.org.uk>
References: <1410722585-13393-1-git-send-email-heiko@sntech.de>
 <1410722585-13393-2-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zDL9gdIhmXu2QQXr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410722585-13393-2-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zDL9gdIhmXu2QQXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 14, 2014 at 09:23:01PM +0200, Heiko Stuebner wrote:
> The regulator can be supplied by a parent regulator through its vin pin,
> so add the supply_name for it.

Applied, thanks.

--zDL9gdIhmXu2QQXr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUF177AAoJECTWi3JdVIfQZWIIAIBiCulwAnfTJIdtnVlGMBcR
R5NjsFiGrqfOkq34aBj7uZ5t1MjxO/3avKvFSzffgh0sfUyiazNlhfQNTnAWpxFg
IyTeKTtfTiIp8ZZgg9c9c4epVm+BcIS5XHOUvJqX1+pfpGJLVzonDa6haTDgk79z
ZwsvOiX+GoqF4cz/4fIRB7iKC/WqyY9VgkQvvWc5wLF24D7zrPD27Kf7QIygmMCC
KjaCcls90BgfZ0UWGEDKgiRbALylN4w+ZSVKcPssFYmYbumIybbhZNjakl4PwPcm
+G00rZF85dkRlmzYwdoeyM+yqEJkb5+L0uDIUa4P4AKfLIgrnMNkwFAh/fT7chg=
=b0sN
-----END PGP SIGNATURE-----

--zDL9gdIhmXu2QQXr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
