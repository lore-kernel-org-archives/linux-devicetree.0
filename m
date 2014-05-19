From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] of/irq: do irq resolution in
 platform_get_irq_byname()
Date: Mon, 19 May 2014 14:57:39 +0200
Message-ID: <20140519125738.GB9466@ulmo>
References: <1400506259-18397-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400506259-18397-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, santosh.shilimkar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2014 at 04:30:59PM +0300, Grygorii Strashko wrote:
[...]
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
[...]
>  /**
> + * of_irq_get_byname - Decode a node's IRQ and return it as a Linux irq number
> + * @dev: pointer to device tree node
> + * @name: zero-based index of the irq

This is a name, not an index.

> + *
> + * Returns Linux irq number on success, or -EPROBE_DEFER if the irq domain
> + * is not yet created, or errorno in case of failure.

s/errorno/error code/? Also EPROBE_DEFER is also an error code, so I'm
not sure if it's worth a special case in the description here.

> + *
> + */
> +int of_irq_get_byname(struct device_node *dev, const char *name)
> +{
> +	const char *name_irq = NULL;
> +	int index = 0;
> +
> +	if (unlikely(!name))
> +		return -EINVAL;
> +
> +	while (!of_property_read_string_index(dev, "interrupt-names",
> +					      index, &name_irq))
> +		if (!strcmp(name, name_irq))
> +			return of_irq_get(dev, index);

Isn't this missing an index++ somewhere? Otherwise it seems like this
would loop infinitely if there was no match on the first entry.

Thierry

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTef/CAAoJEN0jrNd/PrOhfOsP/AskVvB9TFUOcvTLUvXMuMXA
/RSs9f8H23ICbPjPLYThqbvqo4m1pY5Isjk41/Ljnael8q8lkXIm4BiK3X84OQeS
ZOFJtk41y1OBO+iYgY04HBqMdN5tPlm8mGkMFigKdhAGY2JlRXfAYrIlzz70eRE2
uybZy55nm7gamRn1XitiJKvBtpMdDOidJX8Pyp/sTyDRKQlqj4Z1vdNmYP0gtRSm
pTqFy8JBeXdXCTufu1LzfBtkHfAnKNR3QMhXcfOtlFVDfsp0Md9fjNb6ST6bT39J
i2/t9YVBEaxCESr3Zd8D/o+v3tGjUuVM4oyrKQiE0CE7gEcH1icyQzo6HlhLtzvQ
dyCWyNtesn7/QO+52YYCD93vAawa1+h9vjUVzqwRFWzdc3BCv8sGfjSyCNsnsAvx
Yi3XzK6sW1daSdoA5LDeaeedTvxGgiv+q4p7vnVuaIojF5KJNC4Uxmi6S464Uhis
3aXNxltVdO2eLxJfoLzq/dSVsW+CevYoCDqBCNMQ3nWRN7pVL0CR7PK8AOploJm1
PyRz+PmoD2Xng1p6TATjUAl1dxKQSbzDJXyBkTIbGfWATk+5dfyy7IzgGxmPKgWR
Sr//I8HbAXmF6Yr2C48gb/fg4moeloJoV8QECwxkgqLLB6bIXpHlSEK4ou8hVxFL
//+xziHRfUDXq1JCbBRR
=ZWdE
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
