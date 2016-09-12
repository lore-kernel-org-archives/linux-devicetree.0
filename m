From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/4] regulator: Add support for a fixed delay after
 voltage increases
Date: Mon, 12 Sep 2016 19:36:24 +0100
Message-ID: <20160912183624.GG27946@sirena.org.uk>
References: <20160906190504.GA79728@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KiOS11rrlPLUJaFM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160906190504.GA79728-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--KiOS11rrlPLUJaFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 06, 2016 at 12:05:04PM -0700, Matthias Kaehlcke wrote:

> the stabilisation time. This change introduces the device tree property
> "regulator-settle-time-up-us" which allows to specify a fixed delay

> We don't add an option of a fixed delay on the way down for now because
> the way down is probably modelled best with a ramp rate, not a fixed
> delay.

Are you sure?  It seems more likely to be highly load dependent if
there's an appreciable variation.  That could be a ramp rate if you've
got a very predictable load and a simple regulator but it seems like
the system is less likely to care if we collapsed down in that case.

--KiOS11rrlPLUJaFM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX1vWnAAoJECTWi3JdVIfQnp8H/itKHcEOl7lqsMdVdwptrViH
nSEynzpCISUutSwKWtSVY+UW4bF9PCTc2ilyzAe2vbIn+/v7Hq606AS9HW6aBR33
brD52CMmSeWse2gkU52ltygdfDP+cO+OIwylMMaJlPpCk3SKUdIWPCIppI0b0afI
oty0DmtoW1PFcIUGMwgM45vO7AsR6eqFAT3DSyBXCNV/m9dImrCR/U8fmJVA4iZk
KX4vcN+sA4OVgMwgzG8G82B1Y1lHl+BMTB7b8h9910vrQth8PE3/7R8lcg3B1ora
AXmouIMhxYPVX4TZt4axpIRRPT6JyKoIYTY6usOr+PmKlTInRy/TeQdlGD/iIu8=
=vtF9
-----END PGP SIGNATURE-----

--KiOS11rrlPLUJaFM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
