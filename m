From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Sun, 20 Oct 2013 23:08:39 +0100
Message-ID: <20131020220839.GT2443@sirena.org.uk>
References: <52644A9E.3060007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IVjrjjcVVZvl1nZf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52644A9E.3060007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--IVjrjjcVVZvl1nZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 20, 2013 at 10:26:54PM +0100, Stephen Warren wrote:

> IIRC (and perhaps I don't; it was really slightly before my active
> involvement in kernel development) Linus triggered the whole ARM DT
> conversion in response to disliking the volume of changes, and
> conflicts, in board files. The idea of DT conversion being that all the
> board-specific details could be moved out of the kernel and into DT
> files, thus causing him not to have to see it.

A large part of this was to do with the needs of distros and their users
- they have a strong need to ship a device neutral kernel and to have a
reasonable ability to have their kernel deploy on hardware unknown to
them.  Allowing the device tree to be delivered with the system rather
than have the board configuration in the kernel helps achieve that goal.

--IVjrjjcVVZvl1nZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZFRjAAoJELSic+t+oim9BL4P/3UHVM2YotuxKU+jR88T09z5
UaC8BYaFkF/5IZzT0aqUFZ/dYcY4fKrdAM7FeSujkNb3wuwLRGImx70gZ0zlg9cX
vycQF2svyPhd8KHZBm4FxpvTbgIUnVxJWaX+K/5z4nR5pFyQbeqRUlJeM8L+ZaM5
M1ZMhw+J1l9fZrNyiG8SjIo5gsGAQOP4+ZdoEYlKZ9pDsKci5dhicZNvJZn+ZsPY
1cwXJaDnLI/zPH2jIMkWHx7nWWWj8q75vvYPu/2K9E5/F4r5reKuxZlfTMy+aZym
JWOBG1w6vWzgvzG8LseQjMx0yFWGiGxyapcaIUg0gZVhkSdAyJ8O7Jc4X41+l1/l
z/Kz5PXNt8CEM3IsXTMYLm0kKJITzaXARLQu3jFbo7SLRIvG1b9VsMPZpWTg1+m0
13qGdEFZ2YMLGiUaJVLyR2nCFlv/cx+859nH/KrszZH1phihATg1iXQmDOuNUin8
Hzr/xmkPNqkhIQ6+s91W8tYARSePw4gxvsWqwpjvkbkNGlBBBnnPZUpMgXucKPYE
jV1ta6OzTIfIRpWwqekTOJHHk36/uMluykCstJwFj12qfLxYrdr9zqcYorT8phQM
apUh5SHPpyTs3h0j2AeGt24CbXsMNwoxP9k60h/SpitlwLOEuAwI0Id29Iky0hhp
ju1FGI1mOtJkwD4pmQk3
=gISj
-----END PGP SIGNATURE-----

--IVjrjjcVVZvl1nZf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
