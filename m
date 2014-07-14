From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] regulator: twl: Re-add clk32kg to get wifi
 working
Date: Mon, 14 Jul 2014 19:13:38 +0100
Message-ID: <20140714181338.GR6800@sirena.org.uk>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
 <1405338655-18415-3-git-send-email-sassmann@kpanic.de>
 <20140714120051.GF6800@sirena.org.uk>
 <53C3C77F.7080208@kpanic.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ep5m4srWGXPl6O+g"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53C3C77F.7080208-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Ep5m4srWGXPl6O+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 14, 2014 at 02:05:19PM +0200, Stefan Assmann wrote:
> On 14.07.2014 14:00, Mark Brown wrote:

> >No, you need to implement clocks using the clock API.  Please read the
> >changelogs for the above commits...

> Yes, that's what I expected. Got any pointers for me how to do this?
> Never done that before, a little help would be appreciated.

There should be plenty of examples in drivers/clk?

--Ep5m4srWGXPl6O+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxB3PAAoJELSic+t+oim92+8P/1l81qiVO2NQnk9au/uIBw58
jAYfVD5heD/JSOQISGcUJmdMHLdfHA/WMZKPNJEmzul2L/tWPARxX03f0X41k+UK
/Yb+lj1lBJ0hS3JLsTo126aL/OtXSH0wVXpsZLZIuLjXQ5w/h/0umhaTcjwvjoZT
7p4P10nJe7i0SVnvRW1j9dYhcw5XWD+b1TFX+xvAbDZKkKzplRgWp4js/GD08wzj
Sesq/OGAQrFFgcIIhuRW8dnuxcPTyFaTHI0MH+WzBaPPqfqWTiT9ihPl0GSAnfce
SHToauSgWL5qkYDN7Mj+5allTAMztCV27Fbod/JZgU4+gnsJwICZSWc9cX8h/Vx+
buj5IAdGCIw2skqd42wssLy9AmrJ9zDuVifywjeqDkqAp3Eao6kA5Oq93aacALYN
Y9YO4HOOOQ/45dibZo3yezemjYM19l26o0F/3MnxL1y1tVAz8kUoPYX5rF/FOQQC
fHkejox0GwOKluEVWpPHT7YpD/9px4LUYSV8fDFrGy+OUYrknpvX2cC2jDxqe3sA
fsMr7bASek5sfD2h3L5p9Pbu70AmLydOeU+xUB6HjP7WXGO4q1dP6bfeuTV/L/hs
UgBvS4/+NoXtxSmNRBd9sg7DuwbabyPklr3XdNjQ7eMPT2svOKIsavAN12qFmKRn
5KkqewKv0cDX/1oo72wN
=vRR3
-----END PGP SIGNATURE-----

--Ep5m4srWGXPl6O+g--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
