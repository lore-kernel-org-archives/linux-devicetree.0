From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] hwmon: ltc2978: device tree bindings documentation
Date: Wed, 8 Oct 2014 21:21:17 +0100
Message-ID: <20141008202117.GN4609@sirena.org.uk>
References: <1412275071-6417-1-git-send-email-atull@opensource.altera.com>
 <1412275071-6417-2-git-send-email-atull@opensource.altera.com>
 <20141006172845.GA21902@roeck-us.net>
 <alpine.DEB.2.02.1410081103110.18439@atx-linux-37>
 <20141008201254.GA21065@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AS/cuf48TUvH8DlA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141008201254.GA21065-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, jdelvare-l3A5Bk7waGM@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org


--AS/cuf48TUvH8DlA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 08, 2014 at 01:12:54PM -0700, Guenter Roeck wrote:
> On Wed, Oct 08, 2014 at 11:12:29AM -0500, atull wrote:

> > > if not specified. We'll have to sort out with the regulator core how this should
> > > be handled.

> Followup on this: Since the regulator core considers the property to be
> mandatory (which I guess makes some sense for a presumed regulator),
> you'll have to check in the calling code and ensure that a 'regulators'
> entry is there prior to calling the regulator code.

We could just lower the severity of the message, it's not mandatory at
all but rather there so that users can figure out what's going wrong if
we fail to parse.

--AS/cuf48TUvH8DlA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUNZy8AAoJECTWi3JdVIfQT5EH/j3iZPvZxXMCDdVD8lbUegvx
/DQN/OfQ6ObVZJ/O4449Dcm1N2SowEhR+nJ+pLOaKSmMYfN9OcWBbTbF0WjRvkLD
OxjPfEQOQBhgtSDN9PBa18GM+LSVVV25T5o1qiNcEy+2ZW2kZg6Co5ojsyRS3wrk
LfxGR4XmmeaYFKDYkjfWK4TM2eGAppK+Rc85kbZJ2gvZHSU2DmSmA9UARMxNjm1W
MDy62VrioRJAGdJmvQhzFidY1s8bs0ZxgRgQ+YvsrWNFWxG0+0+2IHhnxKpV6TLw
dvTi8LSVV7qhpE53nHd8KVVLxdcGm4t0WCSTTheV/srxO9G0Sg8w7pY9/ksB5VU=
=jWVj
-----END PGP SIGNATURE-----

--AS/cuf48TUvH8DlA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
