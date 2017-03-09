From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: core: add
 regulator_has_continuous_voltage_range()
Date: Thu, 9 Mar 2017 11:28:19 +0100
Message-ID: <20170309102819.bx5paxtffvmvmuov@sirena.org.uk>
References: <20170308200246.126331-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4h6g4xmperbydgvt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170308200246.126331-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4h6g4xmperbydgvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 08, 2017 at 12:02:45PM -0800, Matthias Kaehlcke wrote:

> The new function allows consumers to determine if a regulator is
> continuous or discrete, and whether the results of

Why?  As we discussed at ELC this is an implementation detail of the
regulator and it's to an extent a taste decision if the regulator is
represented as a linear range or a continuous range (in fact given
improvements in the core we could probably just update all continuous
range regulators to linear ones).

> regulator_count_voltages() and regulator_list_voltage() correspond
> to the regulator itself or its supply.

Why?

> Change-Id: I1198cee9fff60dc747a02860e9652034f4d5da33

Don't include noise like this upstream.

--4h6g4xmperbydgvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljBLkAACgkQJNaLcl1U
h9D8kQf+NquhYo8Hxav4fTFiT+bIpiWuOwoPicrBYUuuk3Q4wbemzaYDbAMr8iY7
L2k47bOyZzJMxlb7GNbvocR8vdkUJ4V0OfSYxErlg/GSrvJ714VjBgfCW49jAMXc
5bBC9xZRXlflzTAE04YAlybiasZQ/HBRf1JEv0rXJHJurz8GcJ78heZR4pZ1lYS2
zKTPc67JhTsZOwuWv8nZ2o2+iYKct6dF2hH+qeVXCYJGFaMpxgUnlzA855lhFwtu
nxWV5qQGe7LDKNA5OXzyMlrSnYN8RdFTrfXu491XEAWvLMVYWLHdUb/SFklPD0kD
EvAvp3WxJ+EiVk6b2wWZPEze+VGi6Q==
=xXj5
-----END PGP SIGNATURE-----

--4h6g4xmperbydgvt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
