From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 14/20] regulator: db8500-prcmu: Set 1.8V as a fixed
 voltage for vsmps2
Date: Fri, 21 Mar 2014 17:47:12 +0000
Message-ID: <20140321174712.GD552@sirena.org.uk>
References: <1395404057-27835-1-git-send-email-ulf.hansson@linaro.org>
 <1395404057-27835-15-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395404057-27835-15-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2014 at 01:14:11PM +0100, Ulf Hansson wrote:
> This regulator is used for system IO and is fixed to 1.8V. Let's give
> consumers the option to fetch the voltage level.

Applied, thanks.  If the rest of the series can get applied I can
easily drop this one.=20

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTLHsdAAoJELSic+t+oim90PIP/jpOicixg1g6fRimCVRISnWE
3bwxUTQ4oHIJhAcKjKZrD2AkI4ZM1ST13VHm/CIWFj17JulexnzG67rxLilrEYO7
Qs4npKWAp5azNZHKq+edDJN0jF58A1Rzha76089e5niUg7Cz18j4+UFcGSVeTQCI
dlXdGXrF6FVAM6ezJ9futvuwo4OGgvYblq8dj0qWrezfTiFUqjM2wM7WHQzBImtz
gHBliMy1uMLWJF5KAWblK9W/0XO7nxGcYopjkZsFBlZK6UFWA+yWzZBBw4/UTcm1
/lbMUneuLaMGDlf2RQ1nJQ57QuGIFVjwBLGgFuBuy/uvQDNWhhwCMRyYj8kcUkcr
VIB8Z+z35XmePc/W3vZAxuhPrF8YqbLPmy/itOj72YysJH4OupOh5bwoj+0tC2S2
X8mEc0pasAZv+Eys8Sjishz/I5M+39kwPr1eaUbjrFTrBEp9UH4spMqAgzwkefAT
St/BqE2v5YiNF67hF9nigtZZKTUuP5Vw516LRbk+4obgzS2guECzWFi92Fd2v8Fj
nZYfd6ZRlY1mziJsTEMH64wI2GADstbphfABZmKvrL3PpDy7uN/ielThpnYYouP/
9A/3sjhlwm+o3TNreYrjPZcsizkBOL/BpmerDVq5jd8A1VXq9Avbx0L2eFzLmMBA
i7Ey+VhbLvUlVCwQ3WDV
=h8G0
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
