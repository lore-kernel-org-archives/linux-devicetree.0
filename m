From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: max1586 add device-tree support
Date: Tue, 17 Jun 2014 15:43:23 +0100
Message-ID: <20140617144323.GU5099@sirena.org.uk>
References: <1402757665-15102-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IcaJnnNV5xAPxpBT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402757665-15102-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--IcaJnnNV5xAPxpBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 14, 2014 at 04:54:24PM +0200, Robert Jarzmik wrote:

> +	matched = of_regulator_match(dev, np, rmatch, ARRAY_SIZE(rmatch));
> +	of_node_put(np);
> +	if (matched <= 0)
> +		return matched;

Why is this treating zero as an error?  We should be able to at least
report the current state of regulators even if none are configured in
the device tree.

Otherwise this looks good.

--IcaJnnNV5xAPxpBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJToFQIAAoJELSic+t+oim9RRsP/2hzlXNDuwY6wMSbgdBheJI4
GZP9G56PpI2xk8VKnOLmKDsO8/dam3W14gcAHK/LR9N9fwFQchmlKNcVqWpDlUWE
bGjV6d9Qq3RF2Dd8zShWIL7QUTzqOoCLDBWWp1Ldfg52/p5lPpZLT6ia6f+gqFwT
gNysJ+eP9VojZ3H7nnZHv2Nccj1lL3DwJzvKtfWZIPRmH85lgj5Kpx5h4QFws2y2
ZZzlSdfMd7lopjgkTVldJpWfAQr8BaS0GiEeKU6vXzatrkaru50kL4VrK3E6hLdA
xxJ0Eglq7E/7j+mkeTthmLmptjeGCFgnYkfdBK6tYZv4D0Bxy7Z0fgw8EKv1tQ9D
Zh3NXXy0d5InH077AdUe99HW+h+bdXnfQv3uKzJfqUGelMNUK45NQ0VNISAGJVdP
fWf/Z8RREiUyMs8idbsK90RlOBfKIkXMXnVBHg0LGurIgcAGqa7UgeX/ZjAnmFq/
EolqwUzbWTf+qnEVlK+v8N3OPWf+tISBSvo2ny98/xg8r9xEZujP6BMaPhDgcvnK
1JeQvCnwFVneqF+aWezF6zlgViaVhJTIJeyV6ZsBCV1YKYligiE84iA0wu0w5wAi
wnGsu3FkN0nqun3bmG5m2ZWTflLR5pobJpDCJmof9PEq58E5brq5KaNL4/AH04n8
XssZraXsBupRdOV+zAP2
=oYZV
-----END PGP SIGNATURE-----

--IcaJnnNV5xAPxpBT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
