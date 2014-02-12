From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] spi: pl022: attempt to get sspclk by name
Date: Wed, 12 Feb 2014 10:55:42 +0000
Message-ID: <20140212105542.GC28112@sirena.org.uk>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
 <1392118632-11312-5-git-send-email-mark.rutland@arm.com>
 <20140211120645.GH13533@sirena.org.uk>
 <201402111508.06267.arnd@arndb.de>
 <20140212103329.GC21992@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140212103329.GC21992-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2014 at 10:33:29AM +0000, Mark Rutland wrote:

> For new bindings I'd really like to push people to always use named
> clocks as it makes things far more flexible, but I appreciate that here
> there are issues associated with modifying an existing binding.

> Mark, do you have specific issues that named clocks cause that I could
> look into?

None, I actively prefer naming them (though Russell's point about people
picking names poorly pre-DT does make it clear why it makes sense that
we weren't doing that).  I was just grumbling about the fact that
transitioning from unnamed to named is a bit ugly.

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+1MrAAoJELSic+t+oim95tAP/1pvKNFTFZ/PlsoOXUxbTatp
/C4Ct/VE8EY2+5T81FBg4i2UvaKohMAAIzcuMN8ZhhUDxm6bCAxFWkZGUzmbgOnl
/O8PM5M+vctx+uoUPhS7JkBvGDnuzXorZvbxM8EqT3vRsOErrOzeErxzvn3di0eT
xLETM7pxVupHhhxdmZe2PmgavfWZxbOulcuWF3Q3wzvSRUCE1JII9nHksQk/kZkI
XMcPqzSQrw9rQq1HPhX6zQaKRR169z353hjPQvRJ7xBwhnj0nbfyQk8DyzCy6x0v
4se8DklwrRHXx49z+n7IduSx7TRC5EJt2zaJN0aXbqMZKJ6lOKOQrYp5uG8/Fkpy
p05yo3/vLBix/Q6wG7gIjHbUCbVQ5ftqyHqLpoPot4/2MzkJXE3U8pIRkcqQ8mK9
ivTLsbQfHZaOskTM6fCw2Nr4g+bbi2eNmyKeqLk9WEF6VQNNUeMslUeNtGjYSJHb
nxhNHaxczEW6+JbsSgXHTATqFQQXjTEbiGKk4MHnklgG/cNT41JzbTb40CFaeW/a
xLClT7FO+6Gt88TCY4buFBD/DFe+0sgWmuuVtJfYPKr5S61DaJv0jrIqPXVFYeAe
KhJM010oNcR/YllHARkkBKrTNdGlAPo8yufqXMtXfZ+wAyHuf8dMq3/c/Y3HRDwK
g2q2H7cWO+oeHfAFUGpL
=2M6m
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
