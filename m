From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] regulator: fan53555: set regulator name from
 constraints name
Date: Mon, 15 Sep 2014 09:59:23 -0700
Message-ID: <20140915165923.GX7960@sirena.org.uk>
References: <1410722585-13393-1-git-send-email-heiko@sntech.de>
 <1410722585-13393-3-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wrIrAujhz1F5gxq3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410722585-13393-3-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wrIrAujhz1F5gxq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 14, 2014 at 09:23:02PM +0200, Heiko Stuebner wrote:
> There is a high potential of more than one of those regulators existing
> on a board, so name the regulator according to the name provided in the
> initdata instead of statically.

No, this is pointless and broken.  The core will already use the
board-specific name to identify the regulator in diagnostics and so on,
the name being supplied here is supposed to describe the regulator
within the device.

--wrIrAujhz1F5gxq3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUFxrqAAoJECTWi3JdVIfQzfwH/2THG1fWlx5WPGsHDi4hXyae
O/ZkOGHFyNPOdGnb+bvR1+bzu4uQAd15eeWbQXkVwdaEsLw/kA18J4NWKLqGwPvC
24+mrd3VV5ezCEjRe2rDc8r9kXHnT1vZfSD6LndynT6v/HusqfyoLk4L26CyeNsA
iPj5uw5PQRc5DRnhrs0EZ8OwGN9Nuk568V/VXE944CkT4v4A2rrlfNPcH5BszTAu
PXVEqGEZInoB6fUv7NFnzYejhn01jCIu6kxKCV0mmNUEf/jIXju1nL6AcmHqMC8O
ZgsiAtp/bBT13TrLcJFEOIzu6A9P5lY8THMBQjHsL3xA4wDClxXJBL+AM/IGSDo=
=A0yt
-----END PGP SIGNATURE-----

--wrIrAujhz1F5gxq3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
