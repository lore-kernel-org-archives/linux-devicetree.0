From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH] regulator: pwm: fix syntax errors in the examples
Date: Thu, 10 Nov 2016 18:02:14 +0000
Message-ID: <20161110180214.qublcnhczfmg3wsg@sirena.org.uk>
References: <1478773527-10936-1-git-send-email-peda@axentia.se>
 <20161110161801.7462udnohbaik5nr@sirena.org.uk>
 <cb8dbca0-1f7b-d336-4347-1e665d57f060@axentia.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l3weapaiptjom75j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cb8dbca0-1f7b-d336-4347-1e665d57f060-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--l3weapaiptjom75j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 10, 2016 at 06:05:59PM +0100, Peter Rosin wrote:
> On 2016-11-10 17:18, Mark Brown wrote:
> > On Thu, Nov 10, 2016 at 11:25:27AM +0100, Peter Rosin wrote:

> >> While at it, clean up some other things as well.

> > This isn't a useful changelog, it's just saying that there's some
> > random changes for no reason.  Please make proper patches with
> > changelogs that explain them.

> It's a very uninteresting patch, I guess I made a changelog to match.
> But I can't help myself from asking a few qustions...

> Patch*es* and changelog*s*?

> Oh, you want me to split into a series of several patches? One for the
> quotes, one for the "../regultor/" removal, one for the empty
> comment removal and one for the s/pwm_reglator/pwm-regulator/ thing?

> Be careful what you ask for, you might get it...

The above is not a problem for me, indeed it's actually good as it makes
it *much* quicker and simpler for me to read the changes and figure out
if they all make sense and do what was intended.  The less the changelog
says about what the change is supposed to do and the more different
things the change does the more effort is required to work out if it's
sensible and the more chance there is of one of the changes blocking the
other ones.

--l3weapaiptjom75j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYJLYlAAoJECTWi3JdVIfQzscH/3ZnMSIEc/U8ozQOTWQy4JEu
fRcNFW/wSiqbVs84rLLABDzwMirGOW7aE+6kTIgpYE55aiuRbNCvh0qg6TpvMKez
UpfEmY2aDtTVAlQPBStqdnv6coSfDcJXWwNSiCTqsUiXzuULrOPxLKCmHHp8M70G
W3JyXOd4bu+GSF7UCGJ+Q6VvJ/gDDaXCJ1QXWUe5nFxQEz+IljUiomH6jzTSnhV7
ZWZQTyLxOs4lab26tTtipIzcEa/Ai96EiIL+O4+VD4jw+L9L8+64ZgZfOKNSqBAt
euQobXooQvsb816zGlmF8Q89r/EMszGG/H8HwdUGjG8njKmcOceejulrk3PGCws=
=C2jR
-----END PGP SIGNATURE-----

--l3weapaiptjom75j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
