From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/5] mfd: add bcm590xx pmu DT binding
Date: Wed, 12 Mar 2014 13:45:04 +0000
Message-ID: <20140312134504.GT28112@sirena.org.uk>
References: <1394580837-8331-1-git-send-email-mporter@linaro.org>
 <1394580837-8331-2-git-send-email-mporter@linaro.org>
 <20140312133339.GC17461@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zEZ/xSI4p+aogqML"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140312133339.GC17461-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zEZ/xSI4p+aogqML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 12, 2014 at 01:33:39PM +0000, Mark Rutland wrote:
> On Tue, Mar 11, 2014 at 11:33:53PM +0000, Matt Porter wrote:

> > +			rfldo_reg: rfldo {
> > +				regulator-min-microvolt = <1200000>;
> > +				regulator-max-microvolt = <3300000>;

> Are any specific properties required on these children?

Regulator nodes can be completely empty (or missing) - for most drivers
there's nothing driver specific, the standard binding covers everything.

--zEZ/xSI4p+aogqML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTIGTcAAoJELSic+t+oim9G/MP+gPBVSG2FiZW4w7xLnc8pz1z
binJKDBIciF2B59ylfrSsJzC6bEaQEMiJWlfk1ZEmiQEVMYwaUbZKT89hJXBJ5j4
1CyBSWXcaObwUd2HQcxmLu/FKGlHnCQo0H/FQzvk3kTu/OhqnGFCzC1vp5AX3e3e
UEsPu06DUTeLKfxMI6lDjzP6gYzo4VskJD/KeNPn3kJNrbq9U5mIJzUlgoTZyn/t
rgzKBU+z9+Rfjq6cGapMCh5q3Vt2BBNyNKFxzBuJ3dyTQevJvVYndml7xjwuBDju
bH81c8KXMn3xBR9rp/rln0mnCd/t3fMP0ujy2brRWL1VwYsO7vYcDXRGuHz2ilRk
OxdJ2YjXa4ssT8VQtJWNfdEhVC7hG7Rgt/n3jPTjRESOQqhZzN2iv423wYZ2pUqn
NPmR7mfYHw49NYcxVc1HYe2QugzboU4c0v7NS7/hK0icV3yr5bQKjWrCN4aF31oD
rxGgtm3FrakBCJF4gTXbA3J8INnBtKxXEVNsHNHldr5noSmFqh6vyDSoziMNfkWh
742DY2XsNbNzApa5QBGkZSq6QXZcH+/UxOOVwWKLlOW48tKNCLaF+ycLkvxXL177
/Q62sCWr4PxJDJyoLn1VNh92rKWsd6IwLEsZCsWEdH6d6nv4yHIy8pNwekOedse5
86p4kx9sX1VvzaH6gHvb
=3OKP
-----END PGP SIGNATURE-----

--zEZ/xSI4p+aogqML--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
