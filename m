From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: Start using standard gpios property and
 deprecate some custom properties
Date: Mon, 16 Dec 2013 20:11:02 +0000
Message-ID: <20131216201102.GP3185@sirena.org.uk>
References: <1386965234-26461-1-git-send-email-tony@atomide.com>
 <20131216183615.GK3185@sirena.org.uk>
 <20131216194023.GE26293@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQ3BaAlxDi9XKvis"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131216194023.GE26293-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--uQ3BaAlxDi9XKvis
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2013 at 11:40:23AM -0800, Tony Lindgren wrote:
> * Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> [131216 10:37]:

> > If the issue is typos then I'm not convinced that for singular GPIOs
> > it's going to be helpful, either way is prone to typos.  If the problem
> > is error reporting then that seems like a more important thing to fix.

> Are you serious? A typo here in the binding leads to silent errors where
> nothing happens with the GPIO. That's just totally messed up considering
> we use "gpios" instead of "gpio" everywhere else. So both "gpio" and
> "gpios" should be parsed for sure.

This is the first time anyone's mentioned this so it probably isn't that
serious an issue and bear in mind that the patch was also handling all
the named GPIO specifiers too.

In any case, the thing is that there's a difference between parsing both
and deprecation - deprecation implies an intention to remove the old one
which would just reintroduce the problem the other way around since
people are likely to drop or forget the plural, use old DTs and so on.
Adding a gpios property in parallel with plain gpio is fine and what I
was mostly suggesting.

> > To be honest I'm also struggling to summon up the enthusiasm for the
> > churn in the bindings, especially without going through and updating all
> > the boards (and all the other GPIO properties in various DTs).  It seems
> > like there's stuff missing in the helpers here, if we really wanted to
> > force the properties to have -gpios on the end of their names then we
> > should've had that being added by the helpers.

> Sounds like exposing an infinite number of random *-gpio and *-gpios
> bindings is a topic for another discussion. Anyways it's already totally
> out of control so what do I care.

Exactly, I think it's way more trouble than it's worth to try to change
for named single element lists.  The standard property makes more sense.

The root of the issue is that the GPIO binding originally said that
everything should use a single gpios property for everything but that's
got usability issues.  The attempt to require a -gpios suffix was a
later addition but it was just put into the binding with no real effort
to propagate it through integration with the helpers or whatever.

--uQ3BaAlxDi9XKvis
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSr15SAAoJELSic+t+oim9b8YQAIg3u3RnGmHj1AwQsiIgcgI4
yhd8OAJ1AMvbPJjMVH37Vq3MGlq2QKW6Ck+mtPLw5XQx/AfPjsiFk4b5aO3tab5K
jiOZgfQDZZLJdQQlQ7m5N7e7NepPYq7sfHtx0ulEb9tgIvKXZKowGcrKnxA5XzuF
AeMAdkCFPyMxPADfic654Y6XIHa+XhdNRHi1cfGkxlpxscP21DOFilsuIO1PR3kx
U1riJrjV1A3A7YMtzV4gUwi1dcmmnr1wmPWBF7al1FBKjkEoy8vu+xQRqVE5hNCO
MrlV13odCCaj4ITxyed8hlSKLeuKusUZuMuEV7zdLxvMZqi6ZC7C+meU3MAHAqMP
3i5cwFCdaAqIifayzPqQNtWqaBv1TYrIvz1pypDphHF8ykPjj0FD55XFg0XIkBZ8
Unq7itgWwcNhtPmO851XhumcJW+TOyAQrkdre6NHSB3QjPfb/dFzE5OAmm7arr9v
BTRkfNOrFlDZWvjb4aYBUZkDYyisKRkp6tS18U2os5v1IwYZpmnMkELTFHayrG6Z
jy+MEDx6hG7oX0VwgkFB2H8Oq9vuAXRkasQoDHZz5k7gVupvZhQLr8A3VquD1tk3
aWCboDOoPgW+upYcjwiN8PJM1x9OFWJFDs1FEc6Z6AZAbZ7+H5dtP8ItT5Dr+a0+
LpGuztjAbsLeV9a+WGql
=+Ssi
-----END PGP SIGNATURE-----

--uQ3BaAlxDi9XKvis--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
