From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: Allow for asymmetric settling times
Date: Sun, 30 Apr 2017 21:30:01 +0900
Message-ID: <20170430123001.iwauodtjkbnmjmsl@sirena.org.uk>
References: <20170429000643.56407-1-mka@chromium.org>
 <59044881.7090901@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2s45fcmqswk4lfrt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <59044881.7090901-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2s45fcmqswk4lfrt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 29, 2017 at 01:32:09PM +0530, Laxman Dewangan wrote:
> On Saturday 29 April 2017 05:36 AM, Matthias Kaehlcke wrote:

> > -- regulator-settling-time-us: Settling time, in microseconds, for voltage
> > -  change if regulator have the constant time for any level voltage change.
> > -  This is useful when regulator have exponential voltage change.
> > +- regulator-settling-time-up-us: Settling time, in microseconds, for voltage
> > +  increase if the regulator needs a constant time to settle after voltage
> > +  increases of any level. This is useful for regulators with exponential
> > +  voltage changes.
> > +- regulator-settling-time-down-us: Settling time, in microseconds, for voltage
> > +  decrease if the regulator needs a constant time to settle after voltage
> > +  decreases of any level. This is useful for regulators with exponential
> > +  voltage changes.

> Can we have regulator-settling-time-us also so if it is there then up/down
> same.
> If up/down different then separate properties can be used.

Removing the existing binding would also break existing DTs using it
which we obviously don't want.  I don't see any reason to even deprecate
it, like Laxman says it's nice and convenient for people with symmetric
performance.

--2s45fcmqswk4lfrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlkF2MgACgkQJNaLcl1U
h9Db8gf/SngvtBi7pCrJwrJYn9lzJFwYr+mViZKEG6pozYclAoGcl+/r1U4Irpd8
PSBuI7clUcLTLrD1HJA6tdAOhreE7WQuWp/JbTxXmVmqbBdUvF02H97u1LVCWAeN
hHZvKipxeAyXXgIQs3Op9ygwoP4SunlA+G9Jk1BrgKrhyyCtna+Z0prprCmW2VS3
d7Av3QpvfweKbBK9GosbzJGFZ1Igwgw5Tz09LLOthN07N+tsoZWAC7blqTRFNfY9
hHVmSjtG7eO/hR9mN4A218+t5PPIbBzx8u1Is0wwIQnklEw5NynOpsdWGAZIp7Ue
Y1YZIGFt7VYbxEZ/UfrSuNE0+7FHDQ==
=M/DW
-----END PGP SIGNATURE-----

--2s45fcmqswk4lfrt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
