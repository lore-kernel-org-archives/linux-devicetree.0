From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/3] regulator: add support for syr82x to fan53555
Date: Tue, 16 Sep 2014 16:10:12 -0700
Message-ID: <20140916231012.GE7960@sirena.org.uk>
References: <1410895374-18367-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tJbPEdXFtLQcWY9B"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410895374-18367-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tJbPEdXFtLQcWY9B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 16, 2014 at 09:22:51PM +0200, Heiko Stuebner wrote:
> Silergy SYR827 and SYR828 regulators use the completely same i2c interface
> as the fan53555 regulators - only with different voltage ranges.
> They are used in a some Rockchip rk3288 board designs around an act8846.

Applied all, please use appropriate subject lines for the subsystem.

--tJbPEdXFtLQcWY9B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUGMNQAAoJECTWi3JdVIfQWjsH/1FtHPyRoZPpYBXrQs0tgAWY
AKAuuqDMSIJU6d4Ko8kkvwoJP6MYK/4vy9y/YlTyyidqZN/WyJIE8EsoEaFz7CPt
gsOc0t73OrvhZij/UnAYyAmZwLiE5ZQQc0IFnkl8XMmdiLktkCaj3lYICq0K6LgL
o5p+HYIoAa87hzumQGUs2uz40PApKNCo9YFstxJZEpDotPLLCy/BpY0gtwC+QQxB
AM22haInBv4JuEz1HwY8EQnHdvfj5qG+0K/jPmCbslwsbewT3lQzWV+o4RiKmtFj
EhI8D2QBgWFQHEa7Dc2msd7/c50/WlxJ+LLtyDd7cfJKaTOqoXprLku3qDJGfCY=
=Es1U
-----END PGP SIGNATURE-----

--tJbPEdXFtLQcWY9B--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
