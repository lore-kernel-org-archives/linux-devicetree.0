From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: core: add
 regulator_has_continuous_voltage_range()
Date: Fri, 24 Mar 2017 18:43:36 +0000
Message-ID: <20170324184336.um25vo43puzihgh3@sirena.org.uk>
References: <20170308200246.126331-1-mka@chromium.org>
 <20170309102819.bx5paxtffvmvmuov@sirena.org.uk>
 <20170309194054.GA15095@google.com>
 <20170317211547.22jrqud5np4ve2jk@sirena.org.uk>
 <20170318000330.GC50582@google.com>
 <20170320120615.mh3fmcr2cv4dvegf@sirena.org.uk>
 <20170323214016.GA84219@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hnrzgoe7apbs2qbh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170323214016.GA84219-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--hnrzgoe7apbs2qbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 23, 2017 at 02:40:16PM -0700, Matthias Kaehlcke wrote:
> El Mon, Mar 20, 2017 at 12:06:15PM +0000 Mark Brown ha dit:
> > On Fri, Mar 17, 2017 at 05:03:30PM -0700, Matthias Kaehlcke wrote:

> > > You are right that my case is very specialist, however I think it is
> > > a general problem that a consumer can't know whether the results of
> > > _list_voltage(), etc correspond to the regulator itself or to its
> > > supplies. E.g. a consumer might have a continuous reg which is
> > > supplied by a discrete reg, in this case _list_voltage() would return
> > > the steps of the supply reg, which is probably not what most consumers
> > > expect.

> > No, this is doesn't make much sense!  Why should we be reporting
> > properties of the parent regulator when the child regulator is
> > regulating away all visibility of those properties?

> I am confused whether you are confirming that the current behavior
> makes no sense or if you think that what I'm saying is nonsense.

I'm saying that the current behaviour isn't good and that the
incoherence of what you're proposing should make this clear to you.

> > If it helps think of a continuous regulator as a discrete regulator with
> > a base voltage of 0 and steps of 1uV.

> Thanks, I understood that. What I didn't realize initially is that we
> can avoid iterating through all the voltages if the regulator has
> linear steps, which we can determine with regulator_get_linear_step().
> With that in mind I don't see concerns from the vctrl perspective.

OK, good.  I keep meaning to look into retooling all the continuous
regulators to actually be linear regulators to simplify things.

--hnrzgoe7apbs2qbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljVaNcACgkQJNaLcl1U
h9BV/gf/SZzuyrVfhd/Npvi1kegQnFxYIUu5cXta4hqSMquoSlP6phtxnGcQyT/L
L+Z+zvzXF37pgSTaGcA0ImiLidfhgQBhMqY5IGr14jizUyx5idLMcbRC2WABwCyY
OLidvrmo6AOZ4kti3cZ4K8Ea0ZqlRY9JJF46U1oNiBbkj8TjLiXgtE1FK62PZZgE
txtojaHm0oMYQjOMymkTkmJ/6jq7XvKQTtJGqg9vL//VehpigDiuQjuldv7DZkSG
aaE5WnYNSHYuQoLbAXvpZS0m2DLgEZrBNjCtQsIQQk8j1Nn52Q5knyMxax/l7P7K
Ffomg8VRX1/+EJN/zz0VKgLlxK2R8A==
=pFoM
-----END PGP SIGNATURE-----

--hnrzgoe7apbs2qbh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
