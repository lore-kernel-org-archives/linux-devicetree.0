From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] regulator: add support for user space controlled
 regulators
Date: Fri, 16 Dec 2016 18:10:44 +0000
Message-ID: <20161216181044.75vshyk4cth45vxz@sirena.org.uk>
References: <1481903550-3582-1-git-send-email-bgolaszewski@baylibre.com>
 <1481903550-3582-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nn6ol2kjpti7rrsl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481903550-3582-2-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nn6ol2kjpti7rrsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2016 at 04:52:28PM +0100, Bartosz Golaszewski wrote:

> Add a new flag to struct regulator_desc indicating whether a regulator
> can be controlled from user space and implement a routine in regulator
> core allowing to toggle the regulator state via the sysfs 'state'
> attribute.

No, we've been through this repeatedly before - search the archives.
Write a driver for your hardware which exposes a control for bouncing
the power if that's something that makes sense in your application.
Doing this at the regulator level is just far too likely to result in
poorly integrated systems.

--nn6ol2kjpti7rrsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhULiMACgkQJNaLcl1U
h9BeZAf/eTJpUVBOXzUG3mThA/hLPyOnF8EuIEg0HJfWqia22l+O/iGnAIlXBbZF
0G55mSFN6jisoyF89VSbN6xKjHMWV8Ieugjji/Ku8SyevekiK3IDyvHFPLZEfHWV
1uNAUimE4TOczV63kllIHp6nPOAhd4xu7JEF1ZET3wJ76oTWUJ/nJ8ri+RL6rrlP
uCfME7R5KgSHqmP+n3Bf5SYUcoOdDvA7fw0rUVFm3CbM2i7DQQaPMWxDaTw4UBVj
7Yk53xw9ajwtYdVoXkCySbw/kMNYhreIA4603sNyu7xm501thgR3FEGUdBz6W+6Z
dqev0jV8hebIZzS44k97/fuVhoTQ+g==
=U7oL
-----END PGP SIGNATURE-----

--nn6ol2kjpti7rrsl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
