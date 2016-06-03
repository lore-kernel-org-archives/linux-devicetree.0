From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] of: add common OF-based component functionality
Date: Fri, 3 Jun 2016 17:44:30 +0200
Message-ID: <20160603154430.GA21013@ulmo.ba.sec>
References: <20160603141548.GC1041@n2100.armlinux.org.uk>
 <E1b8pyR-0005OJ-V3@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1b8pyR-0005OJ-V3-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 03, 2016 at 03:21:19PM +0100, Russell King wrote:
[...]
> diff --git a/drivers/of/of_component.c b/drivers/of/of_component.c
[...]
> +static void component_compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}

The return statement here doesn't match the return value. Didn't GCC
complain about this?

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXUaXcAAoJEN0jrNd/PrOhRu8QAI0dzDVOWc1ex9hferRdPRlj
Uc+Mr0f+tfLw0hCfIGXBdeVk8Uf3g/sBJWVCKVeuOs84ndc5uLQ1UEb47nLc7cZ3
qAlehtQ/q2Co9q0fWamWvI8n2lZWNb1yzlvpXhojcO+MgPdsUE9socX3zKMDsI6D
yBFWmsYNbRRqOBZX7y0L7d3rsJNi9sm4M2Fe/JMB20BVYTrPt9+Hl/sVnHhaJYP5
xC2Gei8o8l69NR2xQwQCydKaBNiqWk4YVu10g8pNQ1BTM3geubrruv3jEa0LnHGx
w3XRGQoh/DBBDWtHLsIiKDnGHcPp6GWehwrfZQufECO6HuCpZ8/G7WELJOfFMAIQ
GkDfEspruuY1KVo78U6bUj+3Iux25Ho1+a63ozvpDMLIl+i9+86vhwfDghn3fjWs
cafiy7wp24Ewtkns6nq9V0NwKhP7gLDQ6Oju0LhIV9E3b11i+lN25hAkfiqSntGr
E1ADci1qNQFzwk9zrTyD39z5k1gairGIcN8c8F2LOQSDydFqlBRdjTCL3Jhco9g7
FMC4djOaDJOdcx3bssDoxAzmdG/6v1SJZm5/DeEV/tFBrV15mE6XlzuObvTg9LPh
KZVYtbwSfll45th881Py+WjEs583K8WKQCf49bmq2O28hAtnhodxvFdZ4Sn42Ao8
CMJ1/iCw9bso4feX2Fn4
=AN5e
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
