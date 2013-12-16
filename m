From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: Start using standard gpios property and
 deprecate some custom properties
Date: Mon, 16 Dec 2013 18:36:15 +0000
Message-ID: <20131216183615.GK3185@sirena.org.uk>
References: <1386965234-26461-1-git-send-email-tony@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0FM4RQAc0jwHekq5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386965234-26461-1-git-send-email-tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--0FM4RQAc0jwHekq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2013 at 12:07:14PM -0800, Tony Lindgren wrote:
> We can start moving regulators to using the standard gpios property instead
> of various custom GPIO related properties. The reason for doing this is that
> at least regulator-fixed can currently cause silent bugs if "gpios" property
> is used instead of "gpio" property.

If the issue is typos then I'm not convinced that for singular GPIOs
it's going to be helpful, either way is prone to typos.  If the problem
is error reporting then that seems like a more important thing to fix.

> Fix the issue by trying to use "gpios" where possible in the drivers that
> can already use it, and if that fails, then try to use the deprecated custom
> property for getting the GPIO.

Please split stuff like this up per driver rather than just sending a
jumbo patch for the subsystem, it makes it much easier to review
especially when they're not all doing exactly the same thing.

> -  - ti,dvs-gpio: GPIO specifier for external DVS pin control of LP872x devices.
> +  - gpios: GPIO specifier for external DVS pin control of LP872x devices.

This is definitely a step backwards, it's changing from a named property
which does a specific thing to a property with no useful semantics in
the name.  That would be a step backwards for both legibility and
extensibility, if support for any other GPIO controlled features is
added then adding them into the sam property is going to be unpleasant
and lead to the usability failures so typical of the older device tree
bindings.  The the binding document says to use a name prefix, not to
call everything just "gpios".

To be honest I'm also struggling to summon up the enthusiasm for the
churn in the bindings, especially without going through and updating all
the boards (and all the other GPIO properties in various DTs).  It seems
like there's stuff missing in the helpers here, if we really wanted to
force the properties to have -gpios on the end of their names then we
should've had that being added by the helpers.

--0FM4RQAc0jwHekq5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSr0gcAAoJELSic+t+oim9VvMQAJG6H7F94orFYZc6q8xuJ0bH
m9HBVVmK22bHlI0CurGigu1husCGGm9x+tS93k556tGy/C9I8AYUfCF0IdTAm/qj
6kL2kHShqbkHUP1Slk+BZ86dMIHIQWdRFmu6YOissdR8hw+teUFjaMnrP3TdFbMi
TCcS1B0Qmf5LbNw5XexysIe7lj7pd/y7DrcsKCgjhV2wolTXElklTxSIxLFLMCGr
swUaZhI0p2BV3EwiU0EajzYlCcgNg7EywwptBZxRmyDfI4vw83CgyoYT9PD40F+m
41UhzKwdf4ow4/EIu3vnLluV++jZ+T5mue/WIPiE3EwLXePC6Od0FNpQD64cTa/F
QfppvpkBEJAVKXKqqa5dsnzH4Rk6BQQBPa1HPzMH7XJ05RNLnN0g6RUFa8+h3xQ2
+F7+Wtkwp2xZtIM1/SyXfEg7KPCWQq333iZj44oIW85tWZDw4lliA1fwwPU4pnUH
fSATbuzhi8WiRGu74+20PrDjoQBGal87sp0pNIwilegRyZDdXnWrIkDEoBp8+KCI
LAOHoFcsoD5YfXAL2rS0ewZps/ofEtG4hcu0dZYOZ/IjXArwL8NMLGQD9RSqLJ4E
Q24Xr4Nv+JL4LjzvIYxDeVEAMd+9pwP5YTY7K31Qr+OYw/ncpAmaGoWJ1W5ih9hX
bcc0PuWrWFpXFi4987nb
=gL4D
-----END PGP SIGNATURE-----

--0FM4RQAc0jwHekq5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
